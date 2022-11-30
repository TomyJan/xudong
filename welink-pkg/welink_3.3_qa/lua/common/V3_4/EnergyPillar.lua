--ServerUploadTool Save to [/root/env/data/lua/common/V3_4]
--======================================================================================================================
--||   Filename      ||    EnergyPillar
--||   RelVersion    ||    V3_4
--||   Owner         ||    chao-jin
--||   Description   ||    
--||   LogName       ||    ##[EnergyPillar]
--||   Protection    ||    
--======================================================================================================================
--Defs & Miscs
local defs = {
	pillar_top = 90003,
	pillar_mid = 90002,
	pillar_bot = 90001,
	operator = 90004,
}

local OPTION = {
	TOP = 89,
	MID = 52,
	BOT = 90,
}

local EP_Triggers = {
	{ name = "group_load", config_id = 8000101, event = EventType.EVENT_GROUP_LOAD, source = "", condition = "", action = "action_group_load", trigger_count = 0 },
	{ name = "select_option", config_id = 8000102, event = EventType.EVENT_SELECT_OPTION, source = "", condition = "", action = "action_select_option", trigger_count = 0 },
}
--======================================================================================================================
--Events
function action_group_load(context, evt)
	ScriptLib.SetWorktopOptionsByGroupId(context, base_info.group_id, defs.operator, {OPTION.TOP, OPTION.MID, OPTION.BOT})
	return 0 
end


function action_select_option(context, evt) 
	--处理电源的开关
	if evt.param2 == OPTION.TOP then 
		LF_TurnPillar(context, defs.pillar_top)
	end
	if evt.param2 == OPTION.MID then 
		LF_TurnPillar(context, defs.pillar_mid)
	end
	if evt.param2 == OPTION.BOT then 
		LF_TurnPillar(context, defs.pillar_bot)
	end
	return 0
end

--======================================================================================================================
--LevelFunctions
function LF_TurnPillar(context, pillar_id)
	local gadget_state = ScriptLib.GetGadgetStateByConfigId(context, base_info.group_id, pillar_id)
	if gadget_state == 0 then 
		ScriptLib.SetGadgetStateByConfigId(context, pillar_id, 201)
		return 0
	end
	if gadget_state == 201 then 
		ScriptLib.SetGadgetStateByConfigId(context, pillar_id, 202)
		return 0
	end
	if gadget_state == 202 then 
		ScriptLib.SetGadgetStateByConfigId(context, pillar_id, 203)
		return 0
	end
	if gadget_state == 203 then 
		ScriptLib.SetGadgetStateByConfigId(context, pillar_id, 0)
		return 0
	end
end

--初始化
function EP_Initialize()
	for k,v in pairs(EP_Triggers) do
		table.insert(triggers, v)
		table.insert(suites[1].triggers, v.name)
	end
end

EP_Initialize()