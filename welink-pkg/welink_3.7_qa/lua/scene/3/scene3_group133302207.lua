-- 基础信息
local base_info = {
	group_id = 133302207
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
	{ config_id = 207001, gadget_id = 70500000, pos = { x = -210.642, y = 316.917, z = 2098.344 }, rot = { x = 0.000, y = 285.988, z = 0.000 }, level = 27, point_type = 1003, area_id = 20 },
	{ config_id = 207002, gadget_id = 70500000, pos = { x = -210.910, y = 320.337, z = 2089.131 }, rot = { x = 0.000, y = 285.988, z = 0.000 }, level = 27, point_type = 1003, area_id = 20 },
	{ config_id = 207003, gadget_id = 70500000, pos = { x = -206.786, y = 307.947, z = 2111.678 }, rot = { x = 0.000, y = 285.988, z = 0.000 }, level = 27, point_type = 1003, area_id = 20 },
	{ config_id = 207004, gadget_id = 70500000, pos = { x = -209.245, y = 308.488, z = 2110.491 }, rot = { x = 0.000, y = 254.998, z = 0.000 }, level = 27, point_type = 1002, area_id = 20 },
	{ config_id = 207005, gadget_id = 70500000, pos = { x = -210.684, y = 319.315, z = 2093.874 }, rot = { x = 0.000, y = 254.998, z = 0.000 }, level = 27, point_type = 1002, area_id = 20 },
	{ config_id = 207006, gadget_id = 70500000, pos = { x = -209.594, y = 316.235, z = 2100.435 }, rot = { x = 0.000, y = 254.998, z = 0.000 }, level = 27, point_type = 1002, area_id = 20 },
	{ config_id = 207007, gadget_id = 70500000, pos = { x = -204.393, y = 306.560, z = 2113.435 }, rot = { x = 0.000, y = 254.998, z = 0.000 }, level = 27, point_type = 1002, area_id = 20 },
	{ config_id = 207008, gadget_id = 70500000, pos = { x = -211.621, y = 308.745, z = 2110.292 }, rot = { x = 0.000, y = 147.350, z = 0.000 }, level = 27, point_type = 1003, area_id = 20 }
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
		gadgets = { 207001, 207002, 207003, 207004, 207005, 207006, 207007, 207008 },
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