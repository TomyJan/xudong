
--[[======================================
||	filename:	SandwormchallengeControl
||	owner: 		luyao.huang
||	description:	
||	LogName:	SandwormchallengeControl
||	Protection:	
=======================================]]--



local business_type = "challenge"
local priority = 2

local local_defs = 
{
    sandworm_manager_group = 133314001,

    challenge_option = 177,
    time_axis_name = "challenge_sandworm_tick_axis"
}



local challenge_Tri = {
    [1] = { name = "select_option_challenge_sandworm", config_id = 100010001, event = EventType.EVENT_SELECT_OPTION, source = "", condition = "", action = "action_select_option_challenge_sandworm", trigger_count = 0},
    [2] = { name = "challenge_success_challenge_sandworm", config_id = 100010002, event = EventType.EVENT_CHALLENGE_SUCCESS, source = "", condition = "", action = "action_challenge_success_challenge_sandworm", trigger_count = 0},
    [3] = { name = "challenge_fail_challenge_sandworm", config_id = 100010003, event = EventType.EVENT_CHALLENGE_FAIL, source = "", condition = "", action = "action_challenge_fail_challenge_sandworm", trigger_count = 0},


    [10] = { name = "enter_region_challenge_sandworm", config_id = 100010011, event = EventType.EVENT_ENTER_REGION, source = "", condition = "", action = "action_enter_region_challenge_sandworm", trigger_count = 0},
    [11] = { name = "leave_region_challenge_sandworm", config_id = 100010012, event = EventType.EVENT_LEAVE_REGION, source = "", condition = "", action = "action_leave_region_challenge_sandworm", trigger_count = 0},
    [12] = { name = "time_axis_pass_challenge_sandworm", config_id = 100010013, event = EventType.EVENT_TIME_AXIS_PASS, source = "", condition = "", action = "action_time_axis_pass_challenge_sandworm", trigger_count = 0},
    [13] = { name = "group_will_unload_challenge_sandworm", config_id = 100010014, event = EventType.EVENT_GROUP_WILL_UNLOAD, source = "", condition = "", action = "action_group_will_unload_challenge_sandworm", trigger_count = 0},

    [20] = { name = "variable_change_challenge_sandworm", config_id = 100010021, event = EventType.EVENT_VARIABLE_CHANGE, source = "attack_count", condition = "condition_variable_change_challenge_sandworm", action = "action_variable_change_challenge_sandworm", trigger_count = 0,tag = "1"},

}

function challenge_Initialize()
    for k,v in pairs(challenge_Tri) do
		table.insert(triggers, v)
		table.insert(suites[1].triggers, v.name)
	end
    --????????????????????????????????????????????????????????????
    table.insert(variables,{ config_id = 100010001,  name = "is_attack_count", value = 0})
    --????????????????????????
    table.insert(variables,{ config_id = 100010002,  name = "attack_count", value = 0})
end

--[[-----------------------------------------------------------------
||                                                                 ||
||                      ???????????????                                  ||
||                                                                 ||
-----------------------------------------------------------------]]--
function action_select_option_challenge_sandworm(context,evt)
    if evt.param2 == local_defs.challenge_option then
        LF_On_Challenge_Start(context)
    end
    return 0
end

function action_challenge_success_challenge_sandworm(context,evt)
    if evt.param1 == defs.challenge_id then
        LF_On_Challenge_Finish(context,true)
    end
    return 0
end

function action_challenge_fail_challenge_sandworm(context,evt)
    if evt.param1 == defs.challenge_id then
        LF_On_Challenge_Finish(context,false)
    end
    return 0
end


function action_group_will_unload_challenge_sandworm(context,evt)
    
    ScriptLib.PrintContextLog(context,"## [SandwormchallengeControl] group????????????")
    LF_Remove_All_Sandworm(context)
    ScriptLib.EndTimeAxis(context,local_defs.time_axis_name)
    return 0
end


function action_enter_region_challenge_sandworm(context,evt)
    if ScriptLib.IsChallengeStartedByChallengeId(context, defs.challenge_id) then
        if evt.param1 == defs.sandworm_region then
            ScriptLib.PrintContextLog(context,"## [SandwormchallengeControl]enter_region: ??????????????????????????????")
            ScriptLib.ContinueTimeAxis(context,local_defs.time_axis_name)
        end
    end
    return 0
end


function action_leave_region_challenge_sandworm(context,evt)
    if ScriptLib.IsChallengeStartedByChallengeId(context, defs.challenge_id) then
        if evt.param1 == defs.sandworm_region then
            ScriptLib.PrintContextLog(context,"## [SandwormchallengeControl]leave_region: ?????????????????????????????????????????????")
            LF_Remove_All_Sandworm(context)
            ScriptLib.PauseTimeAxis(context,local_defs.time_axis_name)
        end
    end
    return 0
end

function action_time_axis_pass_challenge_sandworm(context,evt)
    if ScriptLib.IsChallengeStartedByChallengeId(context, defs.challenge_id) then
        if (evt.source_name == local_defs.time_axis_name) then
            local uid = ScriptLib.GetSceneOwnerUid(context)
            LF_Summon_Direct_Sandworm_By_Avatar(context,uid,defs.attack_times)
        end
    end
    return 0
end

function condition_variable_change_challenge_sandworm(context,evt)
    --?????????????????????????????????
    if evt.param1 ~= 0 then
        return true
    end
    return false
end


function action_variable_change_challenge_sandworm(context,evt)
    return 0
end


--[[-----------------------------------------------------------------
||                                                                 ||
||                      ??????????????????                                ||
||                                                                 ||
-----------------------------------------------------------------]]--

function LF_On_Challenge_Start(context)
    LF_Reset_Attack_Count(context)
    ScriptLib.InitTimeAxis(context,local_defs.time_axis_name,{defs.attack_interval},true)
end

function LF_On_Challenge_Finish(context,is_success)  
    LF_Remove_All_Sandworm(context)
    ScriptLib.EndTimeAxis(context,local_defs.time_axis_name)
end





--[[-----------------------------------------------------------------
||                                                                 ||
||                      ??????????????????                                ||
||                                                                 ||
-----------------------------------------------------------------]]--

--???????????????????????????????????????
function LF_On_Create_Sandworm_Success(context)
    ScriptLib.PrintContextLog(context,"## [SandwormchallengeControl]LF_On_Create_Sandworm_Success: ???????????????????????????????????????")
end

--???????????????????????????????????????
function LF_On_Create_Sandworm_Fail(context)
    ScriptLib.PrintContextLog(context,"## [SandwormchallengeControl]LF_On_Create_Sandworm_Success: ???????????????????????????????????????")
end

--?????????????????????????????????
function LF_On_Remove_Sandworm(context) 
    ScriptLib.PrintContextLog(context,"## [SandwormchallengeControl]LF_On_Create_Sandworm_Success: ?????????????????????????????????")
end

--???????????????????????????????????????
function LF_On_Attack_Finish(context)
    ScriptLib.PrintContextLog(context,"## [SandwormchallengeControl]LF_On_Attack_Finish: ?????????????????????????????????")
end

--?????????????????????????????????????????????
function LF_On_Attack_Hit_Avatar(context)
    if LF_Is_Attack_Count(context) then
        ScriptLib.ChangeGroupVariableValue(context,"attack_count",1)
    end
end

--[[-----------------------------------------------------------------
||                                                                 ||
||                      ??????????????????                                ||
||                                                                 ||
-----------------------------------------------------------------]]--
function LF_Reset_Attack_Count(context)
    ScriptLib.SetGroupVariableValue(context,"attack_count",0)
end

function LF_Start_Attack_Count(context)
    ScriptLib.SetGroupVariableValue(context,"is_attack_count",1)
end

function LF_Stop_Attack_Count(context)
    ScriptLib.SetGroupVariableValue(context,"is_attack_count",0)
end

function LF_Is_Attack_Count(context)
    return ScriptLib.GetGroupVariableValue(context,"is_attack_count")
end


--[[-----------------------------------------------------------------
||                                                                 ||
||                      ????????????                                    ||
||                                                                 ||
-----------------------------------------------------------------]]--

------------------------------------------------------------------
challenge_Initialize()