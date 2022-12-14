-- 基础信息
local base_info = {
	group_id = 133309604
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
	{ config_id = 604001, gadget_id = 70330429, pos = { x = -2269.662, y = -101.819, z = 5958.299 }, rot = { x = 0.000, y = 0.000, z = 350.312 }, level = 32, area_id = 27 },
	{ config_id = 604002, gadget_id = 70330426, pos = { x = -2275.900, y = -100.174, z = 5958.698 }, rot = { x = 1.891, y = 23.713, z = 54.772 }, level = 32, area_id = 27 },
	{ config_id = 604003, gadget_id = 70330429, pos = { x = -2233.855, y = -42.919, z = 6013.014 }, rot = { x = 345.206, y = 136.872, z = 29.332 }, level = 32, area_id = 27 },
	{ config_id = 604004, gadget_id = 70330427, pos = { x = -2249.545, y = -44.883, z = 6020.144 }, rot = { x = 45.645, y = 339.955, z = 12.796 }, level = 32, area_id = 27 },
	{ config_id = 604005, gadget_id = 70330429, pos = { x = -2230.820, y = -48.791, z = 5952.875 }, rot = { x = 345.024, y = 269.808, z = 38.710 }, level = 32, area_id = 27 },
	{ config_id = 604006, gadget_id = 70330426, pos = { x = -2229.049, y = -47.382, z = 5950.666 }, rot = { x = 0.000, y = 0.000, z = 52.364 }, level = 32, area_id = 27 }
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
		gadgets = { 604001, 604002, 604003, 604004, 604005, 604006 },
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