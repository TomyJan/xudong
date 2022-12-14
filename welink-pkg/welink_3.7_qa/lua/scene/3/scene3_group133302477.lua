-- 基础信息
local base_info = {
	group_id = 133302477
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 477001, monster_id = 26090101, pos = { x = -425.702, y = 143.000, z = 2226.800 }, rot = { x = 0.000, y = 309.376, z = 0.000 }, level = 27, drop_tag = "蕈兽", pose_id = 102, area_id = 24 },
	{ config_id = 477002, monster_id = 26090101, pos = { x = -419.083, y = 143.000, z = 2227.319 }, rot = { x = 0.000, y = 309.376, z = 0.000 }, level = 27, drop_tag = "蕈兽", pose_id = 102, area_id = 24 },
	{ config_id = 477003, monster_id = 26090101, pos = { x = -414.700, y = 143.000, z = 2222.521 }, rot = { x = 0.000, y = 309.376, z = 0.000 }, level = 27, drop_tag = "蕈兽", pose_id = 102, area_id = 24 }
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
		monsters = { 477001, 477002, 477003 },
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