-- 基础信息
local base_info = {
	group_id = 133310483
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
	{ config_id = 483001, gadget_id = 70500000, pos = { x = -2694.398, y = 287.076, z = 4751.932 }, rot = { x = 0.000, y = 154.125, z = 0.000 }, level = 32, point_type = 4014, isOneoff = true, persistent = true, explore = { name = "gather", exp = 30 }, area_id = 28 },
	{ config_id = 483002, gadget_id = 70500000, pos = { x = -2717.109, y = 242.875, z = 4647.379 }, rot = { x = 0.000, y = 154.125, z = 0.000 }, level = 32, point_type = 4014, isOneoff = true, persistent = true, explore = { name = "gather", exp = 30 }, area_id = 28 }
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
		gadgets = { 483001, 483002 },
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