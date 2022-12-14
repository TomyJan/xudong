-- 基础信息
local base_info = {
	group_id = 133308582
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 582001, monster_id = 28010208, pos = { x = -1907.838, y = 135.359, z = 5267.160 }, rot = { x = 0.000, y = 147.636, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 27 },
	{ config_id = 582002, monster_id = 28010208, pos = { x = -1903.493, y = 135.370, z = 5263.618 }, rot = { x = 0.000, y = 204.466, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 27 },
	{ config_id = 582003, monster_id = 28010404, pos = { x = -1926.979, y = 137.608, z = 5314.147 }, rot = { x = 0.000, y = 79.938, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 27 },
	{ config_id = 582004, monster_id = 28010404, pos = { x = -1925.517, y = 137.811, z = 5315.394 }, rot = { x = 0.000, y = 170.718, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 27 },
	{ config_id = 582005, monster_id = 28050401, pos = { x = -1915.319, y = 148.170, z = 5309.910 }, rot = { x = 0.000, y = 69.175, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 101, area_id = 27 },
	{ config_id = 582006, monster_id = 28050401, pos = { x = -1896.164, y = 148.259, z = 5307.474 }, rot = { x = 0.000, y = 247.750, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 101, area_id = 27 }
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
		monsters = { 582001, 582002, 582003, 582004, 582005, 582006 },
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