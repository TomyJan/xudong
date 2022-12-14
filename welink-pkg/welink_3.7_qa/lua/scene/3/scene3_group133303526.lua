-- 基础信息
local base_info = {
	group_id = 133303526
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 526001, gadget_id = 70290009, pos = { x = -1943.378, y = 365.936, z = 3473.790 }, rot = { x = 0.000, y = 157.834, z = 0.000 }, level = 30, area_id = 23 },
	{ config_id = 526002, gadget_id = 70500000, pos = { x = -1943.378, y = 365.936, z = 3473.790 }, rot = { x = 0.000, y = 157.834, z = 0.000 }, level = 30, point_type = 3005, owner = 526001, area_id = 23 },
	{ config_id = 526003, gadget_id = 70290009, pos = { x = -1938.968, y = 363.783, z = 3470.005 }, rot = { x = 0.000, y = 186.991, z = 0.000 }, level = 30, area_id = 23 },
	{ config_id = 526004, gadget_id = 70500000, pos = { x = -1938.968, y = 363.783, z = 3470.005 }, rot = { x = 0.000, y = 186.991, z = 0.000 }, level = 30, point_type = 3005, owner = 526003, area_id = 23 }
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
		monsters = { },
		gadgets = { 526001, 526002, 526003, 526004 },
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