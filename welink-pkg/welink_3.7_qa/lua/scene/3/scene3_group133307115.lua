-- 基础信息
local base_info = {
	group_id = 133307115
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 115001, monster_id = 28060401, pos = { x = -1222.437, y = -67.151, z = 5602.256 }, rot = { x = 0.000, y = 178.546, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 4, area_id = 32 },
	{ config_id = 115002, monster_id = 28060401, pos = { x = -1213.672, y = -66.474, z = 5585.395 }, rot = { x = 0.000, y = 301.289, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 4, area_id = 32 }
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
		monsters = { 115001, 115002 },
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