-- 基础信息
local base_info = {
	group_id = 133308547
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 547001, monster_id = 28010404, pos = { x = -2369.064, y = 44.416, z = 4236.683 }, rot = { x = 0.000, y = 276.725, z = 0.000 }, level = 30, drop_tag = "采集动物", pose_id = 1, area_id = 26 },
	{ config_id = 547002, monster_id = 28010404, pos = { x = -2373.312, y = 44.932, z = 4232.988 }, rot = { x = 0.000, y = 2.419, z = 0.000 }, level = 30, drop_tag = "采集动物", pose_id = 1, area_id = 26 },
	{ config_id = 547003, monster_id = 28010208, pos = { x = -2345.293, y = 48.772, z = 4242.993 }, rot = { x = 0.000, y = 296.593, z = 0.000 }, level = 30, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 547004, monster_id = 28010208, pos = { x = -2386.835, y = 47.672, z = 4278.155 }, rot = { x = 0.000, y = 79.655, z = 0.000 }, level = 30, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 547005, monster_id = 28010208, pos = { x = -2386.334, y = 47.672, z = 4279.993 }, rot = { x = 0.000, y = 128.100, z = 0.000 }, level = 30, drop_tag = "采集动物", area_id = 26 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
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

-- 废弃数据
garbages = {
	monsters = {
		{ config_id = 547006, monster_id = 28050401, pos = { x = -2422.939, y = 44.708, z = 4284.437 }, rot = { x = 0.000, y = 264.228, z = 0.000 }, level = 30, drop_tag = "采集动物", pose_id = 101, area_id = 26 },
		{ config_id = 547007, monster_id = 28010404, pos = { x = -2487.352, y = 25.116, z = 4329.340 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, drop_tag = "采集动物", pose_id = 1, area_id = 26 },
		{ config_id = 547008, monster_id = 28010404, pos = { x = -2489.255, y = 25.145, z = 4331.876 }, rot = { x = 0.000, y = 78.679, z = 0.000 }, level = 30, drop_tag = "采集动物", pose_id = 1, area_id = 26 },
		{ config_id = 547009, monster_id = 28010404, pos = { x = -2444.874, y = 25.666, z = 4341.300 }, rot = { x = 0.000, y = 218.653, z = 0.000 }, level = 30, drop_tag = "采集动物", pose_id = 1, area_id = 26 },
		{ config_id = 547010, monster_id = 28010404, pos = { x = -2445.007, y = 25.495, z = 4338.671 }, rot = { x = 0.000, y = 330.998, z = 0.000 }, level = 30, drop_tag = "采集动物", pose_id = 1, area_id = 26 },
		{ config_id = 547011, monster_id = 28010404, pos = { x = -2446.946, y = 25.640, z = 4340.026 }, rot = { x = 0.000, y = 77.497, z = 0.000 }, level = 30, drop_tag = "采集动物", pose_id = 1, area_id = 26 }
	}
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
		monsters = { 547001, 547002, 547003, 547004, 547005 },
		gadgets = { },
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