{
  inode {
    org e303e78dc685,
    id cmdb_workflow-gvuhmrkrks50,
    schema_id cmdb_schema_workflow-0,
    name [cb2test]一锅发布conf和program,
    namespace ,
    descr ,
    ctime 1574337874,
    mtime 1574947593,
    creator cmdb_account-v1wangzhengdong,
    last_editor cmdb_account-3onu8wp84st9o,
    archived false,
    lock 
  },
  data {
    edges [
      {
        from __START__,
        to 获取配置的时间变量
      },
      {
        from 获取配置的时间变量,
        to 计算主机
      },
      {
        from 计算主机,
        to 计算进程
      },
      {
        from 计算进程,
        to 判断主机和进程是否为空
      },
      {
        from 判断主机和进程是否为空,
        to 判断主机和进程列表是否为空-成功
      },
      {
        from 判断主机和进程是否为空,
        to 判断主机和进程列表是否为空-失败
      },
      {
        from 判断主机和进程列表是否为空-成功,
        to 在qa-op01上执行buildconf_buildsql
      },
      {
        from 在qa-op01上执行buildconf_buildsql,
        to 在qa-op01上执行buildconf_buildsql-成功
      },
      {
        from 在qa-op01上执行buildconf_buildsql,
        to 在qa-op01上执行buildconf_buildsql-失败
      },
      {
        from 在qa-op01上执行buildconf_buildsql-成功,
        to 下载配置
      },
      {
        from 下载配置,
        to 下载配置-成功
      },
      {
        from 下载配置-成功,
        to 下载程序
      },
      {
        from 下载程序,
        to 下载程序-成功
      },
      {
        from 下载程序-成功,
        to 停止gateserver
      },
      {
        from 发布配置,
        to 发布配置-成功
      },
      {
        from 发布配置-成功,
        to 发布程序
      },
      {
        from 发布程序,
        to 发布程序-成功
      },
      {
        from 发布程序-成功,
        to 启动nodeserver
      },
      {
        from 停止gateserver,
        to 停止gateserver-成功
      },
      {
        from 停止gateserver-成功,
        to 停止pathfindingserver
      },
      {
        from 停止pathfindingserver,
        to 停止pathfindingserver-成功
      },
      {
        from 停止pathfindingserver-成功,
        to 停止gameserver
      },
      {
        from 停止gameserver,
        to 停止gameserver-成功
      },
      {
        from 停止gameserver-成功,
        to 停止multiserver
      },
      {
        from 停止multiserver,
        to 停止multiserver-成功
      },
      {
        from 停止multiserver-成功,
        to 停止muipserver
      },
      {
        from 停止dbgate,
        to 停止dbgate-成功
      },
      {
        from 停止dbgate-成功,
        to 停止nodeserver
      },
      {
        from 停止nodeserver,
        to 停止nodeserver-成功
      },
      {
        from 停止nodeserver-成功,
        to 停止dispatch
      },
      {
        from 停止dispatch,
        to 停止dispatch-成功
      },
      {
        from 停止dispatch-成功,
        to 停止httpproxy
      },
      {
        from 停止muipserver,
        to 停止muipserver-成功
      },
      {
        from 停止muipserver-成功,
        to 停止dbgate
      },
      {
        from 停止httpproxy,
        to 停止httpproxy-成功
      },
      {
        from 停止httpproxy-成功,
        to 发布配置
      },
      {
        from 启动nodeserver,
        to 启动nodeserver-成功
      },
      {
        from 启动nodeserver-成功,
        to 启动dbgate
      },
      {
        from 启动dbgate,
        to 启动dbgate-成功
      },
      {
        from 启动dbgate-成功,
        to 启动muipserver
      },
      {
        from 启动muipserver,
        to 启动muipserver-成功
      },
      {
        from 启动muipserver-成功,
        to 启动multiserver
      },
      {
        from 启动multiserver,
        to 启动multiserver-成功
      },
      {
        from 启动multiserver-成功,
        to 启动gameserver
      },
      {
        from 启动gameserver,
        to 启动gameserver-成功
      },
      {
        from 启动gameserver-成功,
        to 启动gateserver
      },
      {
        from 启动gateserver,
        to 启动gateserver-成功
      },
      {
        from 启动gateserver-成功,
        to 启动pathfindingserver
      },
      {
        from 启动pathfindingserver,
        to 启动pathfindingserver-成功
      },
      {
        from 启动pathfindingserver-成功,
        to 启动dispatch
      },
      {
        from 启动dispatch,
        to 启动dispatch-成功
      },
      {
        from 启动dispatch-成功,
        to 启动httpproxy
      },
      {
        from 启动httpproxy,
        to 启动httpproxy-成功
      },
      {
        from 启动httpproxy-成功,
        to __END__
      }
    ],
    icon ,
    nodes [
      {
        auto_run true,
        component cmdb_component-vars,
        config {
          schema {typeobject,properties{region{typestring,title区服名称},program_br{typestring,title程序分支名},program_version{typestring,title程序的版本},process_list{typearray,items{typestring},title发布进程列表}},required[process_list,program_version]}
        },
        descr 自定义表单,
        inputs {
           {
            process_list [
              nodeserver,
              gameserver,
              dbgate,
              dispatch,
              muipserver,
              multiserver,
              pathfindingserver,
              gateserver
            ],
            program_br trunk,
            program_version 589621,
            region qa03
          }
        },
        name __START__,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-vars,
        config {
          schema {typeobject,properties{success{typestring,title成功与否}},required[]}
        },
        descr 自定义表单,
        inputs {
          启动httpproxy-成功 {
            success {var启动httpproxy.output.success}
          }
        },
        name __END__,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-interpreter_ecmascript,
        config {
          script n生成配置的变量 2019-1103-1020(以分钟为单位) nn n1. 生成配置，在机器上执行buildconf, buildsql, n临时存放地点 tmpbuildconf2019-1103-1020noss上存放地点 XXXbuildconf2019-1103-1020nn2. 发送配置文件到机器n
        },
        descr ES2015 解析组件,
        name 逻辑,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-interpreter_ecmascript,
        config {
          output_schema {typeobject,titleroot,properties{time{typestring,title当前时间变量}},required[time]},
          script  WorkflowRuntimeContext 类型对象暴露 workflow 运行时方法nvar ctx = new WorkflowRuntimeContext()nvar input = ctx.input()  获取input数据n ctx.output({xxxx}) 输出nnvar cur_date = new Date()nvar year = cur_date.getFullYear()nvar month = cur_date.getMonth() + 1nmonth = month = 10 month 0 + monthnvar date = cur_date.getDate()ndate = date = 10 date  0 + datenvar hour = cur_date.getHours()nhour = hour = 10 hour  0 + hournvar minute = cur_date.getMinutes()nminute = minute = 10 minute  0 + minutennvar time = year + '-' + month + date + '-' + hour + minutennctx.output({time time})
        },
        descr ES2015 解析组件,
        name 获取配置的时间变量,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-task,
        config {},
        descr 远程任务执行,
        inputs {
           {
            body_type shell,
            target {objects[],conditions[{fieldinode.schema_id,op=,valuecmdb_schema_server-0}],sorts[],offset0,limit50,selects[.inode.name,.inode.schema_id,.inode.creator,.inode.last_editor,.inode.ctime,.inode.mtime],multifalse,comment}
          },
          判断主机和进程列表是否为空-成功 {
            body #!binbashrnrnsu - work 'EOF'rnrnanynowtime=date +'%Y-%m-%d %H%M%S'rnNOW=echo [`$anynowtime`][PID$$]rnrn##### 可在脚本开始运行时调用，打印当时的时间戳及PID。rnfunction job_startrn{rn    echo `eval $NOW` job_startrn}rnrn##### 可在脚本执行成功的逻辑分支处调用，打印当时的时间戳及PID。 rnfunction job_successrn{rn    MSG=$rn    echo `eval $NOW` job_success[$MSG]rn    exit 0rn}rnrn##### 可在脚本执行失败的逻辑分支处调用，打印当时的时间戳及PID。rnfunction job_failrn{rn    MSG=$rn    echo `eval $NOW` job_fail[$MSG]rn    exit 1rn}rnrnjob_startrnrn# 为0脚本运行状态为手工运行, 为1在opsmind上运行rnRUN_ON_OPSMIND=1rnrnif [ $RUN_ON_OPSMIND -eq 0 ];thenrn    # 手工运行rn    if [ $# -lt 2 ]; thenrn        job_fail 'USAGE REGION_NAME PROGRAM_BR TIME'rn    firn    rn    REGION_NAME=$1rn    PROGRAM_BR=$2rn    TIME=`date '+%Y-%m%d-%H%M'`rn    ####rnelif [ $RUN_ON_OPSMIND -eq 1 ];thenrn    # 在上opsmind运行时加载的变量rn    REGION_NAME={var__START__.output.region}rn    PROGRAM_BR={var__START__.output.program_br}rn    TIME={var获取配置的时间变量.output.time}rnfirnrnif [ -z ${REGION_NAME} ];thenrntjob_fail REGION_NAME变量不能为空rnfirnrnREGION_BUILD_PATH=tmpnew_region${REGION_NAME}rnrnrnmkdir -p ${REGION_BUILD_PATH}rncd ${REGION_BUILD_PATH}  exitrnrm -rf op_toolsrnrm -rf configrnrm -rf init.sqlrnsvn export http116.228.211.917777svnmiHoYordTeamserverCodeapphk4e${PROGRAM_BR}toolsop_toolsrncd ${REGION_BUILD_PATH}op_tools job_fail 切换目录失败#1rnecho -e Yn${REGION_BUILD_PATH}op_toolsbinbuild_conf.py ${REGION_NAME} .config  job_fail build conf失败rnrnrnOSS_PATH=osshk4e-config${REGION_NAME}$TIMErnrn#上传目录到ossrncp ${REGION_BUILD_PATH}op_toolsbinrun .config  job_fail copy run到配置目录失败rnchmod +x .configrun  job_fail 给run文件添加执行权限失败rncd config  job_fail 切换目录失败#2rntar zcf ${REGION_BUILD_PATH}op_toolsconfig-$TIME.tgz rncd ..  job_fail 切换目录失败#3rnossutil cp -f config-$TIME.tgz $OSS_PATH  exit 1rnrnrnEOF,
            body_type shell,
            target cmdb_server-3r5nzmxiqe0c
          },
          未命名节点-10 {
            body_type shell,
            target {objects[],conditions[{fieldinode.schema_id,op=,valuecmdb_schema_server-0}],sorts[],offset0,limit50,selects[.inode.name,.inode.schema_id,.inode.creator,.inode.last_editor,.inode.ctime,.inode.mtime],multifalse,comment}
          }
        },
        name 在qa-op01上执行buildconf_buildsql,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-interpreter_ecmascript,
        config {
          input_schema {typeobject,titleroot,properties{update_service_list{typearray,items{typestring}},region_value{typestring}},required[update_service_list,region_value]},
          output_schema {typeobject,titleroot,properties{result{typeobject,properties{all_process_list{typearray,items{typestring}},nodeserver_list{typearray,items{typestring},titlenodeserver列表},gameserver_list{typearray,items{typestring}},dbgate_list{typearray,items{typestring}},dispatch_list{typearray,items{typestring}},muipserver_list{typearray,items{typestring}},multiserver_list{typearray,items{typestring}},gateserver_list{typearray,items{typestring}},httpproxy_list{typearray,items{typestring}},pathfindingserver_list{typearray,items{typestring}}},required[]}},required[server_list,ns_list,gs_list,process_list,db_list,dp_list,muip_list,multi_list,gate_list,result]},
          script  计算进程信息nvar ctx = new WorkflowRuntimeContext()nvar input = ctx.input()  获取input数据nvar ecu = ctx.getECU()n ctx.output({xxxx}) 输出nn 需要更新的服务列表nvar update_service_list = input.update_service_listnvar region_value = input.region_valuenn var start_service_list = [nodeserver, n                           dbgate,n                           muipserver,n                           multiserver,n                           gameserver,n                           gateserver,n                           dispatch]nnvar output = {n  result {n    all_process_list[],n    nodeserver_list[],n    gameserver_list[],n    dbgate_list[],n    dispatch_list[],n    muipserver_list[],n    multiserver_list[],n    gateserver_list[],n    pathfindingserver_list[],n    httpproxy_list[]n  },n  debug {},n  error {},n  success falsen}nnservice_list = [nodeserver, n                dbgate,n                muipserver,n                multiserver,n                gameserver,n                gateserver,n                pathfindingserver,n                dispatch]nnis_success = truenservice_list.forEach(function(item){n  if (update_service_list.indexOf(item) = 0){n     根据区服名 服务名两个条件查询出进程, 导入相应的列表中n    var query = {n      objects [$conditions],n      conditions [n      {n        field inode.schema_id,n        op=,n        value cmdb_schema_x-2xmz0wfx00p3d  进程n      },          n      {n        field .indexes.cmdb_index-1ojgkr5s9jluq,n        op=-,n        value { n                conditions [n                {n                    field .inode.schema_id,n                    op =,n                    value cmdb_schema_x-xrbjlqi40bign                },                n                {n                    field .indexes.cmdb_index-t9ul38dhptn3,n                    op=,n                    value region_valuen                },n            ],n            objects [$conditions],n            multi falsen        },n      },          n      {n        field .indexes.cmdb_index-2vj4ybu227zju,n        op=-,n        value { n              conditions [n              {n                  field .inode.schema_id,n                  op =,n                  value cmdb_schema_x-lk22lxvs31sdn              },                n              {n                  field .indexes.cmdb_index-2ftsii172v5gm,n                  op=-,n                  value { n                      conditions [n                      {n                          field .inode.schema_id,n                          op =,n                          value cmdb_schema_x-1x6pi7ibv15vvn                      },                n                      {n                          field .inode.name,n                          op=,n                          value itemn                      }n                  ],n                  objects [$conditions],n                  multi falsen                }n              },n            ],n            objects [$conditions],n            multi falsen          }  所属服务编排n      }],n      selects ['.inode.id']n    }n    var ret = ecu.queryObjects(query)n    if(ret.objects.length === 0){n      is_success = falsen    }n    ret.objects.forEach(function(process_item){n      output.result[item + _list].push(process_item.inode.id)n    })nn     同样把进程启动列表复制一份给all_process_listn    output.result.all_process_list = output.result.all_process_list.concat(output.result[item + _list])n  }nn})    nnoutput.success = is_successnnctx.output(output)
        },
        descr ES2015 解析组件,
        inputs {
          计算主机 {
            region_value {var__START__.output.region},
            update_service_list {var__START__.output.process_list}
          }
        },
        name 计算进程,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-interpreter_ecmascript,
        config {
          input_schema {typeobject,titleroot,properties{region_value{typestring}},required[region_value]},
          output_schema {typeobject,titleroot,properties{result{typearray,items{typestring}}},required[result]},
          script  WorkflowRuntimeContext 类型对象暴露 workflow 运行时方法nvar ctx = new WorkflowRuntimeContext()nvar input = ctx.input()  获取input数据nvar ecu = ctx.getECU()nvar time = new Date().getTime()nvar region_value = input.region_valuennvar output = {n    result [],n    debug {},n    error {},n    success falsen}nnfunction main() {n   1. 根据业务子系统，查找服务器n  var query = {n    conditions [n      {n        field inode.schema_id,n        op =,n        value cmdb_schema_infra_server-0n      },n      {n        field indexes.cmdb_index-1ojgkr5s9jluq,n        op =-,n        value { n                conditions [n                {n                    field .inode.schema_id,n                    op =,n                    value cmdb_schema_x-xrbjlqi40bign                },                n                {n                    field .indexes.cmdb_index-t9ul38dhptn3,n                    op=,n                    value region_valuen                },n            ],n            objects [$conditions],n            multi falsen        }n      }n    ],n    objects[$conditions],n    selects [.inode.id],n  }n  ret = ecu.queryObjects(query)n  output.debug['query'] = queryn  output.debug['ret'] = retnn  ret.objects.forEach(function(item) {n     TODO 判断agent是否存在n     if (item.indexes['cmdb_index-system_server'] && item.indexes['cmdb_index-system_server'].inode.id) {n     }n    output.result.push(item.inode.id)n  })nn  if(output.result.length  0){n      output.success = truen  }n}nntry {n  main()n} catch(e) {n  output.error = en}nctx.output(output)n
        },
        descr ES2015 解析组件,
        inputs {
          获取配置的时间变量 {
            region_value {var__START__.output.region}
          }
        },
        name 计算主机,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-interpreter_ecmascript,
        config {
          input_schema {typeobject,titleroot,properties{server_list{typearray,items{typestring}},process_list{typearray,items{typestring}}},required[server_list,process_list]},
          output_schema {typeobject,titleroot,properties{success{typeboolean}},required[success]},
          script  WorkflowRuntimeContext 类型对象暴露 workflow 运行时方法nvar ctx = new WorkflowRuntimeContext()nvar input = ctx.input()  获取input数据n ctx.output({xxxx}) 输出nnvar output = {n  result {n    msg n  },n  debug {},n  error {},n  success falsen}nnvar process_list = input.process_listnvar server_list = input.server_listnnvar is_success = truenvar msg = nif (typeof(process_list) && process_list.length === 0){n  msg += 进程列表为空 n  is_success = falsen}nnif (typeof(server_list) && server_list.length === 0){n  msg += 服务器列表为空 n  is_success = falsen}nnoutput.success = is_successnnctx.output(output)
        },
        descr ES2015 解析组件,
        inputs {
          计算进程 {
            process_list {var计算进程.output.result.all_process_list},
            server_list {var计算主机.output.result}
          }
        },
        name 判断主机和进程是否为空,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-3jnuw0ex9lcwm
        },
        descr 派生 Workflow,
        inputs {
           {
            server_list {conditions[{field.inode.schema_id,op=-,value{conditions[{field.inode.schema_id,op=-,value[cmdb_schema_schema_x-0]}],objects[cmdb_schema_infra_server-0],sorts[],limit50,offset0,multitrue,selects[.inode.name,.inode.schema_id,.inode.lock,.inode.mtime,.inode.last_editor],comment,functiondb,vars{}}},{field.inode.name,op=~,valueqa03}],objects[cmdb_infra_server-nucp9wm7hv2d],sorts[],limit50,offset0,multitrue,selects[.inode.name,.inode.schema_id,.inode.lock,.inode.mtime,.inode.last_editor],comment,functiondb,vars{}}
          },
          在qa-op01上执行buildconf_buildsql-成功 {
            program_branch {var__START__.output.program_br},
            region_name {var__START__.output.region},
            server_list {var计算主机.output.result},
            time_str {var获取配置的时间变量.output.time}
          },
          未命名节点-16 {
            server_list {conditions[{field.inode.schema_id,op=-,value{conditions[{field.inode.schema_id,op=-,value[cmdb_schema_schema_x-0]}],objects[cmdb_schema_infra_server-0],sorts[],limit50,offset0,multitrue,selects[.inode.name,.inode.schema_id,.inode.lock,.inode.mtime,.inode.last_editor],comment,functiondb,vars{}}},{field.inode.name,op=~,valueqa03}],objects[cmdb_infra_server-nucp9wm7hv2d],sorts[],limit50,offset0,multitrue,selects[.inode.name,.inode.schema_id,.inode.lock,.inode.mtime,.inode.last_editor],comment,functiondb,vars{}}
          }
        },
        name 下载配置,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-3fqwj0j4rhalf
        },
        descr 派生 Workflow,
        inputs {
           {
            server_list {conditions[{field.inode.schema_id,op=-,value{conditions[{field.inode.schema_id,op=-,value[cmdb_schema_schema_x-0]}],objects[cmdb_schema_infra_server-0],sorts[],limit50,offset0,multitrue,selects[.inode.name,.inode.schema_id,.inode.lock,.inode.mtime,.inode.last_editor],comment,functiondb,vars{}}},{field.inode.name,op=~,valueqa03}],objects[cmdb_infra_server-nucp9wm7hv2d],sorts[],limit50,offset0,multitrue,selects[.inode.name,.inode.schema_id,.inode.lock,.inode.mtime,.inode.last_editor],comment,functiondb,vars{}}
          },
          下载配置-成功 {
            program_branch {var__START__.output.program_br},
            server_list {var计算主机.output.result},
            version {var__START__.output.program_version}
          }
        },
        name 下载程序,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-37wnx5zc68ibt
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止httpproxy-成功 {
            process_list {var计算进程.output.result.all_process_list},
            time_str {var获取配置的时间变量.output.time}
          }
        },
        name 发布配置,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-vbj0glo7mjv2
        },
        descr 派生 Workflow,
        inputs {
           {},
          发布配置-成功 {
            process_list {var计算进程.output.result.all_process_list},
            version {var__START__.output.program_version}
          }
        },
        name 发布程序,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          判断主机和进程是否为空 {
            target true,
            value {var判断主机和进程是否为空.output.success}
          }
        },
        name 判断主机和进程列表是否为空-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 数值-相等
        },
        descr 条件判断,
        inputs {
           {},
          在qa-op01上执行buildconf_buildsql {
            target 0,
            value {var在qa-op01上执行buildconf_buildsql.output.exit_code}
          }
        },
        name 在qa-op01上执行buildconf_buildsql-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          判断主机和进程是否为空 {}
        },
        name 判断主机和进程列表是否为空-失败,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          在qa-op01上执行buildconf_buildsql {}
        },
        name 在qa-op01上执行buildconf_buildsql-失败,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止dbgate-成功 {
            process_list {var计算进程.output.result.nodeserver_list}
          }
        },
        name 停止nodeserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止muipserver-成功 {
            process_list {var计算进程.output.result.dbgate_list}
          }
        },
        name 停止dbgate,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止multiserver-成功 {
            process_list {var计算进程.output.result.muipserver_list}
          }
        },
        name 停止muipserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止gameserver-成功 {
            process_list {var计算进程.output.result.multiserver_list}
          }
        },
        name 停止multiserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止pathfinding {},
          停止pathfindingserver-成功 {
            process_list {var计算进程.output.result.gameserver_list}
          }
        },
        name 停止gameserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          下载程序-成功 {
            process_list {var计算进程.output.result.gateserver_list}
          }
        },
        name 停止gateserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止nodeserver-成功 {
            process_list {var计算进程.output.result.dispatch_list}
          }
        },
        name 停止dispatch,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止dispatch-成功 {
            process_list {var计算进程.output.result.httpproxy_list}
          }
        },
        name 停止httpproxy,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          发布程序-成功 {
            process_list {var计算进程.output.result.nodeserver_list}
          }
        },
        name 启动nodeserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          启动nodeserver-成功 {
            process_list {var计算进程.output.result.dbgate_list}
          }
        },
        name 启动dbgate,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          启动dbgate-成功 {
            process_list {var计算进程.output.result.muipserver_list}
          }
        },
        name 启动muipserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          启动muipserver-成功 {
            process_list {var计算进程.output.result.multiserver_list}
          }
        },
        name 启动multiserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          启动multiserver-成功 {
            process_list {var计算进程.output.result.gameserver_list}
          }
        },
        name 启动gameserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          启动gameserver-成功 {
            process_list {var计算进程.output.result.gateserver_list}
          }
        },
        name 启动gateserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          启动gateserver-成功 {
            process_list {var计算进程.output.result.pathfindingserver_list}
          }
        },
        name 启动pathfindingserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          启动pathfindingserver-成功 {
            process_list {var计算进程.output.result.dispatch_list}
          }
        },
        name 启动dispatch,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-mcrqu0po2sjm
        },
        descr 派生 Workflow,
        inputs {
           {},
          启动dispatch-成功 {
            process_list {var计算进程.output.result.httpproxy_list}
          }
        },
        name 启动httpproxy,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-workflow,
        config {
          id cmdb_workflow-1e13jpxk89y7b
        },
        descr 派生 Workflow,
        inputs {
           {},
          停止gateserver-成功 {
            process_list {var计算进程.output.result.pathfindingserver_list}
          }
        },
        name 停止pathfindingserver,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          下载配置 {
            target true,
            value {var下载配置.output.success}
          }
        },
        name 下载配置-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          下载程序 {
            target true,
            value {var下载程序.output.success}
          }
        },
        name 下载程序-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {
            target true
          },
          发布配置 {
            target true,
            value {var发布配置.output.success}
          }
        },
        name 发布配置-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          发布程序 {
            target true,
            value {var发布程序.output.success}
          }
        },
        name 发布程序-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {
            target true
          },
          停止gateserver {
            target true,
            value {var停止gateserver.output.success}
          }
        },
        name 停止gateserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          停止pathfindingserver {
            target true,
            value {var停止pathfindingserver.output.success}
          }
        },
        name 停止pathfindingserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          停止gameserver {
            target true,
            value {var停止gameserver.output.success}
          }
        },
        name 停止gameserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          停止multiserver {
            target true,
            value {var停止multiserver.output.success}
          }
        },
        name 停止multiserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          停止muipserver {
            target true,
            value {var停止muipserver.output.success}
          }
        },
        name 停止muipserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          停止dbgate {
            target true,
            value {var停止dbgate.output.success}
          }
        },
        name 停止dbgate-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          停止nodeserver {
            target true,
            value {var停止nodeserver.output.success}
          }
        },
        name 停止nodeserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          停止dispatch {
            target true,
            value {var停止dispatch.output.success}
          }
        },
        name 停止dispatch-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          停止httpproxy {
            target true,
            value {var停止httpproxy.output.success}
          }
        },
        name 停止httpproxy-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动nodeserver {
            target true,
            value {var启动nodeserver.output.success}
          }
        },
        name 启动nodeserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动dbgate {
            target true,
            value {var启动dbgate.output.success}
          }
        },
        name 启动dbgate-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动muipserver {
            target true,
            value {var启动muipserver.output.success}
          }
        },
        name 启动muipserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动multiserver {
            target true,
            value {var启动multiserver.output.success}
          }
        },
        name 启动multiserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动gameserver {
            target true,
            value {var启动gameserver.output.success}
          }
        },
        name 启动gameserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动gateserver {
            target true,
            value {var启动gateserver.output.success}
          }
        },
        name 启动gateserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动pathfindingserver {
            target true,
            value {var启动pathfindingserver.output.success}
          }
        },
        name 启动pathfindingserver-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动dispatch {
            target true,
            value {var启动dispatch.output.success}
          }
        },
        name 启动dispatch-成功,
        settings {}
      },
      {
        auto_run true,
        component cmdb_component-condition,
        config {
          array false,
          op 字符串-相等
        },
        descr 条件判断,
        inputs {
           {},
          启动httpproxy {
            target true,
            value {var启动httpproxy.output.success}
          }
        },
        name 启动httpproxy-成功,
        settings {}
      }
    ]
  },
  indexes {}
}