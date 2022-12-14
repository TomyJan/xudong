-- 基础信息
local base_info = {
	group_id = 133309547
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 547001, monster_id = 28010201, pos = { x = -2210.409, y = -99.018, z = 5971.747 }, rot = { x = 0.000, y = 358.657, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 27 },
	{ config_id = 547003, monster_id = 28010201, pos = { x = -2260.346, y = -105.080, z = 5966.116 }, rot = { x = 0.000, y = 194.467, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 27 },
	{ config_id = 547007, monster_id = 28020604, pos = { x = -2219.431, y = -45.177, z = 5944.485 }, rot = { x = 0.000, y = 34.177, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 27 },
	{ config_id = 547009, monster_id = 28010202, pos = { x = -2249.107, y = -47.321, z = 6014.900 }, rot = { x = 0.000, y = 47.314, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 27 },
	{ config_id = 547010, monster_id = 28020604, pos = { x = -2258.038, y = -106.281, z = 6003.104 }, rot = { x = 0.000, y = 209.691, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 27 },
	{ config_id = 547011, monster_id = 28020604, pos = { x = -2278.071, y = -102.441, z = 5984.315 }, rot = { x = 0.000, y = 30.463, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 27 }
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
		monsters = { 547001, 547003, 547007, 547009, 547010, 547011 },
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