-- 基础信息
local base_info = {
	group_id = 133313140
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 140001, monster_id = 28060401, pos = { x = -350.300, y = 20.125, z = 5308.161 }, rot = { x = 0.000, y = 179.850, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 2, area_id = 32 },
	{ config_id = 140002, monster_id = 28060401, pos = { x = -357.122, y = 19.051, z = 5299.886 }, rot = { x = 0.000, y = 121.846, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 2, area_id = 32 }
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
		monsters = { 140001, 140002 },
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