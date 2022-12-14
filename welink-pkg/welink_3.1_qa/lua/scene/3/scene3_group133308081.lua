-- 基础信息
local base_info = {
	group_id = 133308081
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 81001, monster_id = 28010404, pos = { x = -1849.332, y = 114.413, z = 4834.195 }, rot = { x = 0.000, y = 330.548, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 26 },
	{ config_id = 81002, monster_id = 28010404, pos = { x = -1852.083, y = 114.592, z = 4832.813 }, rot = { x = 0.000, y = 346.205, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 26 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 81003, gadget_id = 70330429, pos = { x = -1854.759, y = 113.554, z = 4831.886 }, rot = { x = 341.065, y = 292.509, z = 309.471 }, level = 32, area_id = 26 }
}

-- 区域
regions = {
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
		monsters = { 81001, 81002 },
		gadgets = { 81003 },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================