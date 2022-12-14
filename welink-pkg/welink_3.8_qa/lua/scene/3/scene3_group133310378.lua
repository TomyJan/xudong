-- 基础信息
local base_info = {
	group_id = 133310378
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
	{ config_id = 378001, gadget_id = 70220103, pos = { x = -2841.603, y = 238.042, z = 4238.741 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378002, gadget_id = 70220103, pos = { x = -2857.454, y = 257.764, z = 4216.500 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378003, gadget_id = 70220103, pos = { x = -2857.979, y = 300.709, z = 4115.908 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378004, gadget_id = 70220103, pos = { x = -2873.241, y = 295.513, z = 4149.748 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378005, gadget_id = 70220103, pos = { x = -2732.104, y = 294.931, z = 4219.671 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378006, gadget_id = 70220103, pos = { x = -2729.628, y = 308.950, z = 4197.498 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378007, gadget_id = 70220103, pos = { x = -2706.666, y = 332.713, z = 4174.522 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378008, gadget_id = 70220103, pos = { x = -2771.717, y = 339.626, z = 4125.456 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378009, gadget_id = 70220103, pos = { x = -2801.342, y = 331.504, z = 4123.880 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378010, gadget_id = 70220103, pos = { x = -2895.111, y = 258.848, z = 4058.464 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 378011, gadget_id = 70220103, pos = { x = -2893.616, y = 255.115, z = 4186.909 }, rot = { x = 0.000, y = 321.802, z = 0.000 }, level = 32, area_id = 28 }
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
		gadgets = { 378001, 378002, 378003, 378004, 378005, 378006, 378007, 378008, 378009, 378010, 378011 },
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