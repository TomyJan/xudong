-- 基础信息
local base_info = {
	group_id = 133310370
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
	{ config_id = 370001, gadget_id = 70330450, pos = { x = -2521.631, y = 191.770, z = 4581.638 }, rot = { x = 0.000, y = 0.000, z = 356.424 }, level = 32, area_id = 26 },
	{ config_id = 370002, gadget_id = 70500000, pos = { x = -2521.631, y = 191.770, z = 4581.638 }, rot = { x = 0.000, y = 0.000, z = 356.424 }, level = 32, point_type = 3012, owner = 370001, area_id = 26 }
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
		gadgets = { 370001, 370002 },
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