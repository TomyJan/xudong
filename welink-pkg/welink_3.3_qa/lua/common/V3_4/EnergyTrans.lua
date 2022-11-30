--ServerUploadTool Save to [/root/env/data/lua/common/V3_4]
--======================================================================================================================
--||   Filename      ||    EnergyTrans
--||   RelVersion    ||    V3_4
--||   Owner         ||    chao-jin
--||   Description   ||    3.4能量传输玩法白盒
--||   LogName       ||    ##[EnergyTrans]
--||   Protection    ||    
--======================================================================================================================
local DIR = {
	Up = 0,
	Right = 1,
	Down = 2,
	Left = 3,
	None = 4,
}

local OPTION = {
	ROTATE = 31,
	START = 7,
	STOP = 72,
	PUSH = 193,
}
local _G_pipe_route = {} --电路的流向合集
local _G_pipe_state= {}
local _G_recur_counter = 0 --递归计数器
local _G_cvt_graph = {} --在递归时建立的临时表，减少遍历次数

--Defs & Miscs
local defs = {
	pointarray_id = 110200018, --点阵ID
	len_x = 7, --长度
	len_z = 7, --高度
}

--0 断路
--1 停留节点
--2 电线
--3 输入端
--4 输出端
local connected_graph = {
[7] = { 4, 2, 1, 0, 0, 0, 0},
[6] = { 2, 0, 2, 0, 0, 0, 0},
[5] = { 1, 2, 1, 2, 1, 0, 1},
[4] = { 2, 0, 0, 0, 2, 0, 2},
[3] = { 1, 0, 1, 2, 1, 2, 1},
[2] = { 0, 0, 2, 0, 0, 0, 2},
[1] = { 3, 2, 1, 2, 1, 0, 3},
}
--与节点图一一对应，点阵中点的位置
local waypoint_graph = {
[7] = { 0, 0,10, 0, 0, 0, 0},
[6] = { 0, 0, 0, 0, 0, 0, 0},
[5] = {13, 0, 9, 0, 6, 0, 3},
[4] = { 0, 0, 0, 0, 0, 0, 0},
[3] = {12, 0, 8, 0, 5, 0, 2},
[2] = { 0, 0, 0, 0, 0, 0, 0},
[1] = { 0, 0, 7, 0, 4, 0, 1},
}
--将连接图中所有的电线替换为对应的ConfigID
local pipe_graph ={
[7] = { 65020, 65014, 1, 0, 0, 0, 0},
[6] = { 65011, 0, 65009, 0, 0, 0, 0},
[5] = { 1, 65013, 1, 65010, 1, 0, 1},
[4] = { 65012, 0, 0, 0, 65005, 0, 65002},
[3] = { 1, 0, 1, 65006, 1, 65003, 1},
[2] = { 0, 0, 65004, 0, 0, 0, 65001},
[1] = { 65021, 65008, 1, 65007, 1, 0, 65019},
}


--电桩对应的初始位置和朝向
local converter_init_pos = {
	[65015] = { z = 5, x = 7, dir = DIR.Up},
	[65016] = { z = 1, x = 3, dir = DIR.Up},
	[65017] = { z = 3, x = 1, dir = DIR.Up},
	[65018] = { z = 7, x = 3, dir = DIR.Up},
}

--发射器和接收器的位置以及朝向
local emitter_infos = { 
	[65019] = {z = 1, x = 7, dir = DIR.Up}, 
	[65021] = {z = 1, x = 1, dir = DIR.Right}, 
}
local receiver_infos = { 
	[65020] = {z = 7, x = 1, dir = DIR.None},
}

--定义左下角原点和Z轴正方向的点
local axis_O = {x = 1290, z = -1765}
local axis_Z = {x = 1290, z = -1750}
local axis_X = {x = 1305, z = -1765}

--======================================================================================================================
--Events
local ET_Triggers = {
	{ name = "group_load", config_id = 8000101, event = EventType.EVENT_GROUP_LOAD, source = "", condition = "", action = "action_group_load", trigger_count = 0 },
	{ name = "select_option", config_id = 8000102, event = EventType.EVENT_SELECT_OPTION, source = "", condition = "", action = "action_select_option", trigger_count = 0 },
	{ name = "time_axis_pass", config_id = 8000103, event = EventType.EVENT_TIME_AXIS_PASS, source = "", condition = "", action = "action_time_axis_pass", trigger_count = 0 },
	{ name = "platform_reach",config_id = 8000104, event = EventType.EVENT_PLATFORM_ARRIVAL, source = "", condition = "", action = "action_platform_arrival", trigger_count = 0 },
}

--初始化
function ET_Initialize()
	for k,v in pairs(ET_Triggers) do
		table.insert(triggers, v)
		table.insert(suites[1].triggers, v.name)
	end
end

function action_group_load(context, evt) 
	ScriptLib.PrintContextLog(context, "##[EnergyTrans]:Group 加载完毕")
	LF_InitConverters(context)
	return 0
end

function action_select_option(context, evt) 
	--处理电源的开关
	if emitter_infos[evt.param1] ~= nil and evt.param2 == OPTION.START then 
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:打开电源")
		ScriptLib.SetEntityServerGlobalValueByConfigId(context, evt.param1, "SGV_PowerOn", 1)
		ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, evt.param1, {OPTION.STOP})
		ScriptLib.SetGadgetStateByConfigId(context, evt.param1, 201)
		LF_CheckConnection(context)
	end
	if emitter_infos[evt.param1] ~= nil and evt.param2 == OPTION.STOP then 
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:关闭电源")
		ScriptLib.SetEntityServerGlobalValueByConfigId(context, evt.param1, "SGV_PowerOn", 0)
		ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, evt.param1, {OPTION.START})
		ScriptLib.SetGadgetStateByConfigId(context, evt.param1, 0)
		LF_CheckConnection(context)
	end
	--处理中继器的旋转
	if converter_init_pos[evt.param1] ~= nil and evt.param2 == OPTION.ROTATE then 
		local rotate_state = ScriptLib.GetGadgetStateByConfigId(context, base_info.group_id, evt.param1)
		if rotate_state == 3 then 
			rotate_state = 0
		else
			rotate_state = rotate_state + 1
		end
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:旋转中继器,更新方向")
		--更新当前电桩的朝向
		ScriptLib.SetGadgetStateByConfigId(context, evt.param1, rotate_state)
		ScriptLib.SetGroupTempValue(context, tostring(evt.param1).."_dir", rotate_state, {})
		LF_LockConverterOperations(context, true)
		ScriptLib.InitTimeAxis(context, tostring(evt.param1), {1}, false)
		
	end
	--处理推动电桩
	if converter_init_pos[evt.param1] ~= nil and evt.param2 == OPTION.PUSH then 
		if 202 == ScriptLib.GetGadgetStateByConfigId(context, base_info.group_id, evt.param1) then 
			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:电桩结晶化了，不能移动")
			ScriptLib.ShowReminder(context, 400095)
		end
		--按照玩家和电桩的相对位置推动电桩
		local push_dir = LF_CalcDirection(context, context.uid, evt.param1)
		local path = LF_GetWaypoint(context, evt.param1, push_dir)
		if path ~= 0 then
			ScriptLib.SetPlatformPointArray(context, evt.param1, defs.pointarray_id, path, { route_type = 0})
		else
			ScriptLib.ShowReminder(context, 400095)
		end
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:推动中继器")

		LF_LockConverterOperations(context, true)
		ScriptLib.InitTimeAxis(context, tostring(evt.param1), {1}, false)
	end
	return 0
end

--电桩到位，恢复操作
function action_time_axis_pass(context, evt) 
	LF_CheckConnection(context)
	LF_LockConverterOperations(context, false)
	return 0
end


function action_platform_arrival( context, evt)
	--确认是组里的柱子到了位置
	local cvt_id = evt.param1
	--到达的柱子是这组Group里的
	local point_id = evt.param3
	if nil == converter_init_pos[cvt_id] then
		return -1
	end
	--到的不是目标点
	local pos = LF_GetWaypointPos(point_id)
	ScriptLib.SetGroupTempValue(context, tostring(cvt_id).."_x", pos[2], {})
	ScriptLib.SetGroupTempValue(context, tostring(cvt_id).."_z", pos[1], {})

	return 0
end

--======================================================================================================================
--LevelFunctions

--初始化所有电桩的信息
function LF_InitConverters(context) 
	for cfg_id,pos in pairs(converter_init_pos) do
		ScriptLib.SetGroupTempValue(context, tostring(cfg_id).."_x", pos.x, {})
		ScriptLib.SetGroupTempValue(context, tostring(cfg_id).."_z", pos.z, {})
		ScriptLib.SetGroupTempValue(context, tostring(cfg_id).."_dir", pos.dir, {})
	end
	LF_LockConverterOperations(context, false)

	for emt_id,v in pairs(emitter_infos) do
		ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, emt_id, {OPTION.START})
	end
	
	ScriptLib.SetGroupTempValue(context,"EC_DIR", DIR.Up, {})
end

--建立一个当前所有电桩位置和朝向的表
function LF_GetConvertersPos(context)
	local converters_cur_pos = {}
	for cfg_id,v in pairs(converter_init_pos) do
		converters_cur_pos[cfg_id] = { 
			z = ScriptLib.GetGroupTempValue(context, tostring(cfg_id).."_z", {}),
			x = ScriptLib.GetGroupTempValue(context, tostring(cfg_id).."_x", {}), 
			dir = ScriptLib.GetGroupTempValue(context, tostring(cfg_id).."_dir", {})
		}
	end
	return converters_cur_pos
end

--全量检查当前电路的连接情况
function LF_CheckConnection(context)
	--每个电源都走一个递归检测逻辑
	_G_recur_counter = 0
	_G_cvt_graph = LF_GetConvertersPos(context)
	--建立一个每个电线的状态表
	for z = 1, defs.len_z do
		_G_pipe_state[z] = {}
		for x = 1, defs.len_x do
			_G_pipe_state[z][x] = 0
		end
	end

	for emt_id,emt_pos in pairs(emitter_infos) do
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电路]检查电路连通")
		ScriptLib.SetGroupTempValue(context, "EC_DIR", emt_pos.dir, {})
		--检测一下电源的状态，
		if 0 == ScriptLib.GetGadgetStateByConfigId(context, base_info.group_id, emt_id) then 
			LF_RunEC(context, emt_pos, false)
			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电路]关闭对应电线")
		else
			LF_RunEC(context, emt_pos, true)
			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电路]打开对应电线")
		end
	end

	--刷新所有电线状态
	for z=1,defs.len_z do
		for x=1,defs.len_x do
			if pipe_graph[z][x] > 10 and connected_graph[z][x] == 2 then
				if _G_pipe_state[z][x] > 0 then 
					ScriptLib.SetGadgetStateByConfigId(context, pipe_graph[z][x], 201)
				else
					ScriptLib.SetGadgetStateByConfigId(context, pipe_graph[z][x], 0)
				end
			end
		end
	end
end

--从一个点出发，更新电流信息,递归处理
function LF_RunEC(context, ec_pos, is_on) 
	--获取当前电流的方向
	local ec_dir = ScriptLib.GetGroupTempValue(context, "EC_DIR", {})
	_G_recur_counter = _G_recur_counter + 1
	if _G_recur_counter >= defs.len_x*defs.len_z then 
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]递归超限，返回")
		return false
	end 
	for cfg_id,cvt_pos in pairs(_G_cvt_graph) do
		--找有没有对应的转接器
		if cvt_pos.x == ec_pos.x and cvt_pos.z == ec_pos.z then
			--更新一下电流方向
			ec_dir = cvt_pos.dir
--			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]更新方向"..ec_dir)
			ScriptLib.SetGroupTempValue(context, "EC_DIR", ec_dir, {})
			--更新电桩状态
			if is_on then
				ScriptLib.SetEntityServerGlobalValueByConfigId(context, cfg_id, "SGV_PowerOn", 1)
			else
				ScriptLib.SetEntityServerGlobalValueByConfigId(context, cfg_id, "SGV_PowerOn", 0)
			end
		end
	end
	--获取电流的所在节点
	local pos_x = ec_pos.x
	local pos_z = ec_pos.z
	--根据方向流动电流
	if ec_dir == DIR.Up then 
		pos_z = pos_z + 1
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]向上移动")
	end
	if ec_dir == DIR.Down then 
		pos_z = pos_z - 1
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]向下移动")
	end
	if ec_dir == DIR.Left then 
		pos_x = pos_x - 1
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]向左移动")
	end
	if ec_dir == DIR.Right then 
		pos_x = pos_x + 1
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]向右移动")
	end
	--检查是否越界,越界则直接返回
	if pos_z < 1 or pos_z > defs.len_z then 
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]Z坐标越界")
		return false
	end
	if pos_x < 1 or pos_x > defs.len_x then
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]X坐标越界")
		return false
	end
	--找到下一个去的点信息
	local next_pos = { z = pos_z,x = pos_x}
	if connected_graph[pos_z][pos_x] == 0 or connected_graph[pos_z][pos_x] == 3 then 
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]没有下一个可以去的点")
		return false
	end
	if connected_graph[pos_z][pos_x] == 1 or connected_graph[pos_z][pos_x] == 2 then 
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]移动到下一个点")
		--存电桩和电路节点
		--table.insert(_G_pipe_route, next_pos)
		--如果是打开，就给这个位置的标记+1
		if is_on then 
			_G_pipe_state[pos_z][pos_x] = _G_pipe_state[pos_z][pos_x] + 1 
		end
		return LF_RunEC(context, next_pos, is_on)
	end
	if connected_graph[pos_z][pos_x] == 4 then 
--		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电流]到达终点")
--		ScriptLib.SetEntityServerGlobalValueByConfigId(context, defs.receiver_id, "SGV_PowerOn", 1)
		if is_on then
			ScriptLib.SetEntityServerGlobalValueByConfigId(context, pipe_graph[pos_z][pos_x], "SGV_PowerOn", 1)
		else
			ScriptLib.SetEntityServerGlobalValueByConfigId(context, pipe_graph[pos_z][pos_x], "SGV_PowerOn", 0)
		end
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电路]连接成功")
		return true
	end
end

--获取电桩的移动路点
function LF_GetWaypoint(context, cvt_id, push_dir) 
	local converters_cur_pos = LF_GetConvertersPos(context)
	local pos_z = converters_cur_pos[cvt_id].z
	local pos_x = converters_cur_pos[cvt_id].x
	local cur_point = waypoint_graph[pos_z][pos_x]
	--走两步，看能否走通
	for i=1,defs.len_x do
		if push_dir == DIR.Up then
			pos_z = pos_z + 1
		end
		if push_dir == DIR.Down then
			pos_z = pos_z - 1
		end
		if push_dir == DIR.Left then
			pos_x = pos_x - 1
		end
		if push_dir == DIR.Right then
			pos_x = pos_x + 1
		end
			--检查是否越界,越界则直接返回
		if pos_z < 1 or pos_z > defs.len_z then 
--			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电桩]Z坐标越界")
			return 0
		end
		if pos_x < 1 or pos_x > defs.len_x then
--			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电桩]X坐标越界")
			return 0
		end
		--找到下一个去的点信息
		if connected_graph[pos_z][pos_x] == 0 or connected_graph[pos_z][pos_x] == 3 or connected_graph[pos_z][pos_x] == 4 then 
--			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电桩]前方是短路/终点/起点,停止检查")
			return 0
		end
		if connected_graph[pos_z][pos_x] == 2 then 
--			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电桩]可以移动到中间点".."Z_"..pos_z.."X_"..pos_x)
		end
		if connected_graph[pos_z][pos_x] == 1 then 
--			ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电桩]可以移动到停留点".."Z_"..pos_z.."X_"..pos_x)
			for k,v in pairs(converters_cur_pos) do
				if v.z == pos_z and v.x == pos_x then 
--					ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电桩]目标点有一个电桩了，不移动")
					return 0
				end
			end
			return {cur_point, waypoint_graph[pos_z][pos_x]}
		end
	end

end

--开关全部的电桩选项
function LF_LockConverterOperations(context, is_lock)
	if is_lock then
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电桩]关闭电桩操作")
		for cvt_id,v in pairs(converter_init_pos) do
			ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, cvt_id, {})
		end
	else
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:[电桩]打开电桩操作")
		for cvt_id,v in pairs(converter_init_pos) do
			ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, cvt_id, {OPTION.ROTATE, OPTION.PUSH})
		end
	end
end

--根据点的位置获取xz坐标
function LF_GetWaypointPos(point_id)
	for z = 1,defs.len_z do
		for x = 1,defs.len_x do
			if waypoint_graph[z][x] == point_id then 
				return {z,x}
			end
		end
	end
end

--根据玩家和电桩的坐标获取对应的夹角，计算出电桩移动的位置
function LF_CalcDirection(context, uid, cvt_id)
	local avatar_pos = LF_GetEntityPos(context, context.uid, 0)
	local conver_pos = LF_GetEntityPos(context, 0, cvt_id)
	local vec_axis_OZ = {x = (axis_Z.x - axis_O.x), z = (axis_Z.z - axis_O.z)}
	local vec_axis_OX = {x = (axis_X.x - axis_O.x), z = (axis_X.z - axis_O.z)}
	local vec_cvt2avt = {x = (avatar_pos.x - conver_pos.x), z = (avatar_pos.z - conver_pos.z)}
	local deg_avt2OZ = LF_ClacAngle(vec_axis_OZ, vec_cvt2avt)
	local deg_avt2OX = LF_ClacAngle(vec_axis_OX, vec_cvt2avt)
	if 0 <= deg_avt2OZ and deg_avt2OZ <= 45 then 
		return DIR.Down
	end
	if 45 < deg_avt2OZ and  deg_avt2OZ < 135 then 
		if 0 <= deg_avt2OX and deg_avt2OX <= 45 then 
			return DIR.Left
		end 
		if 135 <= deg_avt2OX and deg_avt2OX <= 180 then 
			return DIR.Right
		end 
	end
	if 135 <= deg_avt2OZ and deg_avt2OZ <= 180 then 
		return DIR.Up
	end
end

function LF_ClacAngle(vec1, vec2)
	local vec_cos = (vec1.x*vec2.x + vec1.z*vec2.z)/(math.sqrt( vec1.x^2 + vec1.z^2 )*math.sqrt( vec2.x^2 + vec2.z^2))
	return (math.acos(vec_cos)/math.pi*180)
end

function LF_GetEntityPos(context, uid, cid)
	ScriptLib.PrintContextLog(context,  "##[EnergyTrans]:获取坐标")
	local _eid = 0
	--转译entityId
	if uid ~= 0 then
		_eid = ScriptLib.GetAvatarEntityIdByUid(context, uid)
	elseif cid ~= 0 then
		_eid = ScriptLib.GetEntityIdByConfigId(context, cid)
	end
	--返回安全值,印象中直接返回_array时table里不干净
	local _array = ScriptLib.GetPosByEntityId(context, _eid)
	local _res = {}
	if _array.x == 0 and _array.y == 0 and _array.z == 0 then
		ScriptLib.PrintContextLog(context, "##[EnergyTrans]:获取坐标失败，报错")
		_res.error = 1
		return _res
	end
	_res.x = _array.x
	_res.y = _array.y
	_res.z = _array.z
	return _res
end


--电桩从结晶化恢复时，从Group的存档里拿状态
function SLC_CVTRelieveCrystallize(context) 
	local cvt_cfg_id = ScriptLib.GetGadgetConfigId(context, {gadget_eid = context.source_entity_id})
	local state_saved = ScriptLib.GetGroupVariableValue(context, "ConverterState"..cvt_cfg_id)
	ScriptLib.SetGadgetStateByConfigId(context, cvt_cfg_id, state_saved)
	return 0
end

function SLC_CVTCrystallize(context) 

	return 0
end


ET_Initialize()