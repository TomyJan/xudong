-- 基础信息
local base_info = {
	group_id = 133315219
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 219001, monster_id = 28010304, pos = { x = 74.293, y = 162.555, z = 2594.779 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "采集动物", area_id = 20 },
	{ config_id = 219002, monster_id = 28040101, pos = { x = 66.911, y = 162.200, z = 2718.145 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 20 },
	{ config_id = 219003, monster_id = 28040101, pos = { x = 113.091, y = 162.200, z = 2706.346 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 20 },
	{ config_id = 219004, monster_id = 28040101, pos = { x = 74.141, y = 162.200, z = 2704.657 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 20 },
	{ config_id = 219005, monster_id = 28040101, pos = { x = 79.184, y = 162.200, z = 2697.857 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 20 },
	{ config_id = 219006, monster_id = 28040101, pos = { x = 36.689, y = 162.200, z = 2590.622 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 20 },
	{ config_id = 219007, monster_id = 28040101, pos = { x = 51.019, y = 162.200, z = 2586.896 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 20 },
	{ config_id = 219008, monster_id = 28010304, pos = { x = 26.244, y = 162.390, z = 2591.301 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "采集动物", area_id = 20 },
	{ config_id = 219009, monster_id = 28010304, pos = { x = 81.723, y = 162.305, z = 2686.893 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "采集动物", area_id = 20 }
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
		monsters = { 219001, 219002, 219003, 219004, 219005, 219006, 219007, 219008, 219009 },
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