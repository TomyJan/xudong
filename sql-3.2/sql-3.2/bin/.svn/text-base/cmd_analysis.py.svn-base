#!/bin/python3
import multiprocessing
import os.path
import sys
import getopt
from matplotlib import pyplot as plt
from matplotlib import dates as mdates
import datetime
from fnmatch import fnmatch
import numpy as np
import pandas as pd
from multiprocessing import pool, Manager


def usage():
    print()
    print("cmd_time.py [<options>] [<args>]")
    print(
        "-i, --input <file_path>\n\tThe cmd log file to be analysed. Support wildcard matching. Separated by semicolon.\n\tExample: gameserver.cmd*.log;gameserver0.cmd.log.")
    print("-r, --recursive\n\tRecursive search the cmd log file.")
    print("-j <parallel ratio>\n\tParallel deal with muliple files.")
    print("-c, --cmd_name <cmd_name>\n\tThe cmd name to be analysed.")
    print("--real_time <time_interval>\n\tThe real time range to be analysed, example: --real_time [12:00:00,14:00:00].")
    print(
        "-p, --process_time <time_interval>\n\tThe process time range to be analysed, example: --process_time [10,50];[100,] means 10 <= time < 50 || time >= 100 will be analysed.")
    print("-b, --bar <time divide list>\n\tOutput the bar graph, example: --bar 10,30,50,70,100")
    print("--bar_graph_name <graph_name>\n\tSpecify the output name of the bar graph")
    print("-l, --line\n\tOutput the line chart.")
    print("--line_graph_name <graph_name>\n\tSpecify the output name of the line chart")
    print("--db_index <db_index>\n\tSpecify the db_index to be analysed. Use the formula: (uid/10)%40")
    print("--no_ignore_zero\n\tDo not ignore the zero data in line chart.")
    print("-h, --help\n\tPrint usage")


def calc_time_from_date(date):
    return (date.hour * 60 + date.minute) * 60 + date.second


def calc_time_from_str(time):
    print(time)
    time_list = list(map(int, time.split(':')))
    return (time_list[0] * 60 + time_list[1]) * 60 + time_list[2]


def calc_time_to_str(time):
    second = time % 60
    time //= 60
    minute = time % 60
    time //= 60
    return str(time) + ":" + str(minute) + ":" + str(second)


def calc_time_to_date(time):
    second = time % 60
    time //= 60
    minute = time % 60
    time //= 60
    return datetime.datetime(hour=time, minute=minute, second=second)


def calc_x_asix_date(start, end, num):
    delta = (start - end) / num


class Params:
    class BarGraphParams:
        is_gen_bar_graph = False
        bar_graph_name = "bar_chart"
        time_divide = []

    class LineGraphParams:
        is_gen_line_graph = False
        line_graph_name = "line_chart"
        ignore_zero = True

    file_name = []
    recursive_path = "./"
    cmd_name = ""
    real_time = (0, 86400)
    process_time = []
    db_index = -1
    parallel = 3
    bar_graph_params = BarGraphParams()
    line_graph_params = LineGraphParams()

    def match_file_name(self, file_name):
        for match_name in self.file_name:
            if fnmatch(file_name, match_name):
                return True
        return False


class LogInfo:
    date = pd.Timestamp(2001, 1, 5)
    uid = 0
    cmd_id = 0
    cmd_name = ""
    ret_code = 0
    ret_code_name = ""
    timecost = 0
    queue_size = -1

    def __init__(self, log_line):
        log_list, log_list_suffix = log_line.split('|', 1)
        log_list = log_list.split()
        log_list_suffix = log_list_suffix.split('|')
        self.date = pd.to_datetime(log_list[1] + ' ' + log_list[2] + ' ' + log_list[3], format='%Y-%m-%d %H:%M:%S %f')
        self.uid = int(log_list_suffix[1])
        self.cmd_id = int(log_list_suffix[2])
        self.cmd_name = log_list_suffix[3]
        self.ret_code = log_list_suffix[4]
        self.ret_code_name = log_list_suffix[5]
        self.timecost = int(log_list_suffix[6])
        if len(log_list_suffix) > 7:
            self.queue_size = log_list_suffix[7]
        else:
            self.queue_size = -1


def args_solve(params):
    try:
        opts, args = getopt.getopt(sys.argv[1:], "i:c:j:b:lp:e:r:h",
                                   ["input=", "cmd_name=", "recursive=", "real_time=", "process_time=", "bar=",
                                    "bar_graph_name=", "line", "line_graph_name=", "no_ignore_zero",
                                    "db_index=", "help"])
    except getopt.GetoptError as err:
        print(err)
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-i", "--input"):
            params.file_name = arg.split(';')
        elif opt in ("-r", "--recursive"):
            if arg != "":
                params.recursive_path = os.path.join(arg)
        elif opt in ("-j"):
            params.parallel = max(params.parallel, int(arg))
        elif opt in ("-b", "--bar"):
            params.bar_graph_params.is_gen_bar_graph = True
            params.bar_graph_params.time_divide = list(map(int, arg.split(',')))
        elif opt in ("--bar_graph_name"):
            params.bar_graph_params.bar_graph_name = opt
        elif opt in ("-l", "--line"):
            params.line_graph_params.is_gen_line_graph = True
        elif opt in ("--line_graph_name"):
            params.line_graph_params.line_graph_name = arg
        elif opt in ("--no_ignore_zero"):
            params.line_graph_params.ignore_zero = False
        elif opt in ("-c", "--cmd_name"):
            params.cmd_name = arg
        elif opt in ("--real_time"):
            arg = arg[1:-1].split(',')
            print(arg)
            params.real_time = (calc_time_from_str(arg[0]), calc_time_from_str(arg[1]))
        elif opt in ("-p", "--process_time"):
            for process_time in arg.split(';'):
                t = process_time[1:-1].split(',')
                process_time_interval = [-1, -1]
                if t[0] != "":
                    process_time_interval[0] = int(t[0])
                if t[1] != "":
                    process_time_interval[1] = int(t[1])
                params.process_time.append(tuple(process_time_interval))
        elif opt in ("--db_index"):
            params.db_index = int(arg)
        else:
            usage()
            exit(0)


def log_filter_file(params, file_path, log_list):
    file = open(file_path)
    tmp_list = []
    for line in file:
        try:
            log_info = LogInfo(line)
        except ValueError:
            continue
        if log_info.cmd_name != params.cmd_name:
            continue
        log_real_time = calc_time_from_date(log_info.date)
        if params.real_time[0] > log_real_time:
            continue
        if log_real_time > params.real_time[1]:
            break
        if params.db_index != -1 and (log_info.uid // 10) % 40 != params.db_index:
            continue

        judge = False
        if not params.process_time:
            judge = True
        for process_time_pair in params.process_time:
            if (process_time_pair[0] == -1 or process_time_pair[0] <= log_info.timecost) \
                    and (process_time_pair[1] == -1 or log_info.timecost <= process_time_pair[1]):
                judge = True
                break
        if not judge:
            continue
        tmp_list.append(log_info)
    log_list += tmp_list
    close(file)


def log_filter(params):
    manager = Manager()
    log_list = manager.list()
    pool = multiprocessing.Pool(processes=params.parallel)
    for root, dirs, files in os.walk(params.recursive_path):
        for file_name in files:
            if not params.match_file_name(file_name):
                continue
            file_path = os.path.join(root, file_name)
            print("processing file: " + os.path.join(root, file_name))
            pool.apply_async(log_filter_file, (params, file_path, log_list,))
    pool.close()
    pool.join()
    print(len(log_list))
    return log_list


def basic_info_solve(timecost_array):
    print("processing basic info")
    print("平均耗时:\t" + str(np.mean(timecost_array)))
    print("方差:\t\t" + str(np.var(timecost_array)))
    print("最大耗时:\t" + str(np.amax(timecost_array)))
    print("最小耗时:\t" + str(np.amin(timecost_array)))
    print("最小耗时:\t" + str(np.amin(timecost_array)))


def bar_graph_solve(bar_graph_params, timecost_array):
    if not bar_graph_params.is_gen_bar_graph:
        return
    np.sort(timecost_array)
    idx = 0
    x = []
    y = [0]
    for timecost in np.nditer(timecost_array):
        while idx < len(bar_graph_params.time_divide) and timecost >= bar_graph_params.time_divide[idx]:
            y.append(0)
            idx += 1
        y[idx] += 1
    for i in range(len(bar_graph_params.time_divide)):
        if i != 0:
            x.append(str(bar_graph_params.time_divide[i - 1]) + "~" + str(bar_graph_params.time_divide[i]))
        if i == 0:
            x.append("0~" + str(bar_graph_params.time_divide[i]))
        if i + 1 == len(bar_graph_params.time_divide):
            x.append(str(bar_graph_params.time_divide[i]) + "~ INF")
    plt.tick_params(labelsize=30)
    plt.figure(figsize=(64, 48))
    plt.bar = plt.bar(x, y)
    plt.xlabel('time', fontsize=30)
    plt.ylabel('costtime', fontsize=30)
    plt.savefig(bar_graph_params.bar_graph_name)
    plt.close()




def line_graph_solve(line_graph_params, log_list):
    if not line_graph_params.is_gen_line_graph:
        return
    time_dict = dict()
    for log_info in log_list:
        date = log_info.date.replace(microsecond=0)
        if date not in time_dict:
            time_dict[date] = [0, 0]
        time_dict[date][0] += log_info.timecost
        time_dict[date][1] += 1
    x = []
    timecost_y = []
    freq_y = []
    min_time = min(time_dict)
    max_time = max(time_dict) + pd.Timedelta(seconds=1)
    time = min_time

    if line_graph_params.ignore_zero:
        x = sorted(time_dict.keys())
        timecost_y = [time_dict[k][0] / time_dict[k][1] for k in x]
        freq_y = [time_dict[k][1] for k in x]
    else:
        while time != max_time:
            time += pd.Timedelta(seconds=1)
            x.append(time)
            if time in time_dict:
                timecost_y.append(time_dict[time][0] / time_dict[time][1])
                freq_y.append(time_dict[time][1])
            else:
                timecost_y.append(0)
                freq_y.append(0)

    t = np.linspace(x[0].value, x[len(x) - 1].value, 10)
    t = pd.to_datetime(t)

    def plt_params_set():
        ax = plt.gca()
        ax.xaxis.set_major_formatter(mdates.DateFormatter('%H:%M:%S'))
        plt.grid(True)
        plt.tick_params(labelsize=40)
        plt.tight_layout()


    plt.figure(figsize=(64, 48))
    plt.plot(x, timecost_y)
    plt.xticks(t)
    plt.xlabel('time', fontsize=50)
    plt.ylabel('costtime', fontsize=50)
    plt_params_set()
    plt.savefig(line_graph_params.line_graph_name + "_costtime", bbox_inches='tight')

    plt.figure(figsize=(64, 48))
    plt.plot(x, freq_y)
    plt.xticks(t)
    plt.xlabel('time', fontsize=50)
    plt.ylabel('frequency', fontsize=50)
    plt_params_set()
    plt.savefig(line_graph_params.line_graph_name + "_freq", bbox_inches='tight')

    plt.close()


def map_fun(x):
    return x.timecost


if __name__ == '__main__':
    params = Params()
    args_solve(params)
    log_list = log_filter(params)
    print("read files finish")
    tmp = map(lambda x: x.timecost, log_list)
    with multiprocessing.Pool(processes=params.parallel) as pool:
        timecost_list = list(pool.map(map_fun, log_list))
    print("mapper finish")
    timecost_array = np.asarray(timecost_list).astype(np.int32)
    print("numpy array generate finish")
    basic_info_solve(timecost_array)
    bar_graph_solve(params.bar_graph_params, timecost_array)
    line_graph_solve(params.line_graph_params, log_list)
