-- 基础信息
local base_info = {
	group_id = 133309503
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
	{ config_id = 503001, gadget_id = 70330432, pos = { x = -2428.841, y = -28.153, z = 5346.349 }, rot = { x = 345.779, y = 116.827, z = 359.714 }, level = 32, area_id = 27 },
	{ config_id = 503002, gadget_id = 70330432, pos = { x = -2323.447, y = -36.999, z = 5371.445 }, rot = { x = 353.356, y = 291.281, z = 14.957 }, level = 32, area_id = 27 }
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
		gadgets = { 503001, 503002 },
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