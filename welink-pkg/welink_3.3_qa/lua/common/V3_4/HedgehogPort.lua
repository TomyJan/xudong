--ServerUploadTool Save to [/root/env/data/lua/common/V3_4]
--======================================================================================================================
--||   Filename      ||    HedgehogPort
--||   RelVersion    ||    V3_4
--||   Owner         ||    chao-jin
--||   Description   ||    3.4 刺猬车车相关Lua,处理快速移动
--||   LogName       ||    ##[HedgehogPort]
--||   Protection    ||    
--======================================================================================================================
--Defs & Miscs
local defs = {
	point_array = 110200019,
}

local port_graph = {
	[76001] = {port_in = 76001, default_target = 76002, target_pool = {76002,76003,76004}, mark = 76006, array_point_list = {1,2,3,4}},
	[76002] = {port_in = 76002, default_target = 76003, target_pool = {76001,76003,76004}, mark = 76005, array_point_list = {10,9,8,7,6}},
	[76003] = {port_in = 76003, default_target = 76004, target_pool = {76001,76002,76004}, mark = 76007, array_point_list = {11,12,13,14,15}},
	[76004] = {port_in = 76004, default_target = 76001, target_pool = {76001,76002,76003}, mark = 76008, array_point_list = {16,17,18,19,20,21,22}},
}

local region_to_port = {
	[76009] = 76001,
	[76010] = 76002,
	[76011] = 76003,
	[76012] = 76004,
}

local connect_point = 5

local OPTION = {
	CHANGE_TARGET = 806,
	START_MOVE = 807,
	SUMMON_CAR = 808,
}
--======================================================================================================================
--Events
local Hedgehog_Triggers = {
    [1] = { name = "group_load", config_id = 8000001, event = EventType.EVENT_GROUP_LOAD, source = "", condition = "", action = "action_group_load", trigger_count = 0},
    [2] = { name = "select_option", config_id = 8000002, event = EventType.EVENT_SELECT_OPTION, source = "", condition = "", action = "action_select_option", trigger_count = 0},
	[3] = { name = "gadget_create", config_id = 8000003, event = EventType.EVENT_GADGET_CREATE, source = "", condition = "", action = "action_gadget_create", trigger_count = 0},
}

function Hedgehog_Initialize()
	for k,v in pairs(Hedgehog_Triggers) do
		table.insert(triggers, v)
		table.insert(suites[1].triggers, v.name)
	end
end

Hedgehog_Initialize()

--group初始化操作
function action_group_load(context, evt)
	ScriptLib.PrintContextLog(context, "##[HedgehogPort]: Group初始化")
	LF_InitDefaultTarget(context)
	LF_InitCarport(context)
	return 0
end

--

function action_gadget_create(context, evt) 

	return 0
end

--处理选择对应的目的地
function action_select_option(context, evt) 
	local start_point = evt.param1

	--有人叫车
	if evt.param2 == OPTION.SUMMON_CAR then 
		ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 有人叫车，切换状态")
		LF_ShowCurTarget(context, start_point)
		ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, start_point, {OPTION.CHANGE_TARGET, OPTION.START_MOVE})
	end

	--选择目标点
	if evt.param2 == OPTION.CHANGE_TARGET then 
		ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 选择目的地")
		LF_ChangeTarget(context, start_point)
		ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, start_point, {OPTION.CHANGE_TARGET, OPTION.START_MOVE})
	end

	--开始移动
	if evt.param2 == OPTION.START_MOVE then 
		ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 开车！")
		LF_StartMove(context, start_point) 
	end

	return 0
end



--======================================================================================================================
--LevelFunctions
function LF_CalcPointArray(context, start_point, end_point)
	ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 生成对应的点阵路线")
	if start_point == end_point then
		return false
	end
	local move_point_array = {}
	local start_point_list = port_graph[start_point].array_point_list
	local end_point_list = port_graph[end_point].array_point_list
	for i=1,#start_point_list do
		table.insert(move_point_array, start_point_list[i])
	end
	table.insert(move_point_array, connect_point)
	for i=#end_point_list,1,-1 do
		table.insert(move_point_array, end_point_list[i])
	end
	return move_point_array
end

--初始化每个点的默认出发点
function LF_InitDefaultTarget(context)
	ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 初始化每个点的默认目的地")
	for k,v in pairs(port_graph) do
		ScriptLib.SetGroupTempValue(context, "TargetPoint"..k, v.default_target, {})
	end
end

--每次玩家切换目标点时，寻找对应的目标点
function LF_ChangeTarget(context, start_point)
 	ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 开始切换对应的目标点")
	local cur_target = ScriptLib.GetGroupTempValue(context, "TargetPoint"..start_point, {})
	local target_pool = port_graph[start_point].target_pool
	local next_target = 0
	for i=1,#target_pool do
		if target_pool[i] == cur_target then 
			if i+1 > #target_pool then 
				next_target = target_pool[1]
			else
				next_target = target_pool[i+1]
			end
		end
	end
	ScriptLib.SetGroupTempValue(context, "TargetPoint"..start_point, next_target, {})
--	ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, start_point, {OPTION.CHANGE_TARGET, OPTION.START_MOVE})
	LF_ShowCurTarget(context, start_point)
end

--更新显示当前的目标位置
function LF_ShowCurTarget(context, start_point)
	ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 显示当前的目标位置")
	local cur_target = ScriptLib.GetGroupTempValue(context, "TargetPoint"..start_point, {})
	local target_pool = port_graph[start_point].target_pool
	local mark_id = port_graph[cur_target].mark
	--移除其他目标点的指示物
	for i=1,#target_pool do
		if 0 ~= ScriptLib.GetEntityIdByConfigId(context, target_pool[i]) and target_pool[i] ~= cur_target then
			ScriptLib.RemoveEntityByConfigId(context, base_info.group_id, EntityType.GADGET, port_graph[target_pool[i]].mark)
		end
	end
	--创建当前目标点的指示物
	if 0 == ScriptLib.GetEntityIdByConfigId(context, port_graph[cur_target].mark) then
		ScriptLib.CreateGadget(context, {config_id = port_graph[cur_target].mark})
	end
end

--开车
function LF_StartMove(context, start_point) 
	ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 开始移动")
	local end_point = ScriptLib.GetGroupTempValue(context, "TargetPoint"..start_point, {})
	local move_array = LF_CalcPointArray(context, start_point, end_point)
	local target_pool = port_graph[start_point].target_pool
	for i=1,#target_pool do
		if 0 ~= ScriptLib.GetEntityIdByConfigId(context, target_pool[i]) then
			ScriptLib.RemoveEntityByConfigId(context, base_info.group_id, EntityType.GADGET, port_graph[target_pool[i]].mark)
		end
	end
	ScriptLib.MoveAvatarByPointArray(context, context.uid, defs.point_array, move_array, {speed = 6}, "{\"MarkType\":1}")
	LF_InitCarport(context)
end

--处理每个SelectOption显示
function LF_InitCarport(context)
	ScriptLib.PrintContextLog(context, "##[HedgehogPort]: 车位回到叫车状态")
	for port_id,content in pairs(port_graph) do
		ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, port_id, {OPTION.SUMMON_CAR})
	end
end

