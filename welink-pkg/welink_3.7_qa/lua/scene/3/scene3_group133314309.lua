-- 基础信息
local base_info = {
	group_id = 133314309
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 309001, monster_id = 28010404, pos = { x = -824.013, y = -58.357, z = 4894.305 }, rot = { x = 0.000, y = 116.888, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 2, area_id = 32 },
	{ config_id = 309002, monster_id = 28010404, pos = { x = -805.418, y = -58.687, z = 4879.458 }, rot = { x = 0.000, y = 274.712, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 2, area_id = 32 }
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
		monsters = { 309001, 309002 },
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