-- 基础信息
local base_info = {
	group_id = 133302680
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 680001, monster_id = 28040102, pos = { x = -44.230, y = 200.000, z = 3058.336 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 20 },
	{ config_id = 680002, monster_id = 28040102, pos = { x = -49.671, y = 200.000, z = 3070.436 }, rot = { x = 0.000, y = 49.184, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 22 },
	{ config_id = 680003, monster_id = 28040102, pos = { x = -49.604, y = 200.000, z = 3064.270 }, rot = { x = 0.000, y = 71.117, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 20 },
	{ config_id = 680004, monster_id = 28040101, pos = { x = -84.368, y = 200.000, z = 3046.273 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 22 },
	{ config_id = 680005, monster_id = 28040101, pos = { x = -131.916, y = 200.000, z = 3075.045 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 22 },
	{ config_id = 680006, monster_id = 28040101, pos = { x = -173.461, y = 200.000, z = 3066.173 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 22 },
	{ config_id = 680007, monster_id = 28040101, pos = { x = -165.748, y = 200.000, z = 3077.487 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "水族", area_id = 22 }
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
		monsters = { 680001, 680002, 680003, 680004, 680005, 680006, 680007 },
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