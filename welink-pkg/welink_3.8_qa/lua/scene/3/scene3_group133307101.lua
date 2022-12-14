-- 基础信息
local base_info = {
	group_id = 133307101
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
	{ config_id = 101001, gadget_id = 70220103, pos = { x = -1937.369, y = 158.020, z = 5564.407 }, rot = { x = 33.114, y = 355.319, z = 344.344 }, level = 32, area_id = 27 },
	{ config_id = 101002, gadget_id = 70220103, pos = { x = -1863.254, y = 159.325, z = 5634.151 }, rot = { x = 351.352, y = 358.903, z = 14.431 }, level = 32, area_id = 27 },
	{ config_id = 101003, gadget_id = 70220103, pos = { x = -1892.948, y = 169.740, z = 5687.142 }, rot = { x = 352.471, y = 358.448, z = 15.455 }, level = 32, area_id = 27 },
	{ config_id = 101004, gadget_id = 70220103, pos = { x = -1983.409, y = 159.550, z = 5565.470 }, rot = { x = 330.656, y = 3.561, z = 346.458 }, level = 32, area_id = 27 },
	{ config_id = 101005, gadget_id = 70220103, pos = { x = -2023.347, y = 160.493, z = 5646.908 }, rot = { x = 13.562, y = 357.250, z = 354.428 }, level = 32, area_id = 27 },
	{ config_id = 101006, gadget_id = 70220103, pos = { x = -1920.819, y = 158.362, z = 5733.345 }, rot = { x = 2.470, y = 0.539, z = 24.604 }, level = 32, area_id = 27 },
	{ config_id = 101007, gadget_id = 70220103, pos = { x = -1948.240, y = 150.070, z = 5789.196 }, rot = { x = 349.350, y = 356.470, z = 346.221 }, level = 32, area_id = 27 },
	{ config_id = 101008, gadget_id = 70220103, pos = { x = -1969.123, y = 165.044, z = 5865.576 }, rot = { x = 20.503, y = 359.373, z = 356.533 }, level = 32, area_id = 27 },
	{ config_id = 101009, gadget_id = 70220103, pos = { x = -1986.187, y = 150.234, z = 5687.189 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 27 },
	{ config_id = 101010, gadget_id = 70220103, pos = { x = -1976.373, y = 148.882, z = 5748.252 }, rot = { x = 356.488, y = 0.319, z = 348.519 }, level = 32, area_id = 27 },
	{ config_id = 101011, gadget_id = 70220103, pos = { x = -2022.005, y = 153.968, z = 5769.779 }, rot = { x = 357.328, y = 0.125, z = 354.644 }, level = 32, area_id = 27 },
	{ config_id = 101012, gadget_id = 70220103, pos = { x = -2040.556, y = 158.445, z = 5817.253 }, rot = { x = 357.346, y = 0.172, z = 350.250 }, level = 32, area_id = 27 }
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
		gadgets = { 101001, 101002, 101003, 101004, 101005, 101006, 101007, 101008, 101009, 101010, 101011, 101012 },
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