-- 基础信息
local base_info = {
	group_id = 133317006
}

-- DEFS_MISCS
local defs = {
 drum = 45001, --鼓的ConfigID
 interval = 2, --敲鼓的节奏间隔
 reminder_success = 400112, --挑战成功Reminder
 reminder_fail = 400113,--挑战失败Reminder
region_id = 6002, --配置一个敲鼓的区域，
}
--敲鼓的节奏， 0空 1普攻 2下落 70900431鼓ID
local music_staff = {0,1,2,0, 1,2,0,1, 2,0,1,2}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 6001, gadget_id = 70900431, pos = { x = 832.165, y = 262.942, z = 5602.874 }, rot = { x = 0.000, y = 219.483, z = 0.000 }, level = 32, area_id = 30 }
}

-- 区域
regions = {
	{ config_id = 6002, shape = RegionShape.CUBIC, size = { x = 10.000, y = 10.000, z = 10.000 }, pos = { x = 832.165, y = 262.942, z = 5602.874 }, area_id = 30, team_ability_group_list = { "TMHY_Drum_Play_AbilityGroup" } }
}

-- 触发器
triggers = {
}

-- 变量
variables = {
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	end_suite = 0,
	rand_suite = false
}

--================================================================
-- 
-- 小组配置
-- 
--================================================================

suites = {
	{
		-- suite_id = 1,
		-- description = ,
		monsters = { },
		gadgets = { 6001 },
		regions = { 6002 },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

require "V3_6/DrumSingle"