-- 基础信息
local base_info = {
	group_id = 250101015
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
	{ config_id = 15001, gadget_id = 70330325, pos = { x = 2504.866, y = 258.097, z = 4797.974 }, rot = { x = 0.000, y = 298.001, z = 0.000 }, level = 1 },
	{ config_id = 15002, gadget_id = 70330325, pos = { x = 2504.877, y = 268.047, z = 4797.967 }, rot = { x = 0.000, y = 298.001, z = 0.000 }, level = 1 }
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
		gadgets = { 15001, 15002 },
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