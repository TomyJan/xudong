-- 基础信息
local base_info = {
	group_id = 133304110
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
	{ config_id = 110001, gadget_id = 70220103, pos = { x = -1585.843, y = 133.271, z = 2703.867 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110002, gadget_id = 70220103, pos = { x = -1600.350, y = 141.017, z = 2718.453 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110003, gadget_id = 70220103, pos = { x = -1617.022, y = 139.142, z = 2657.010 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110004, gadget_id = 70220103, pos = { x = -1698.912, y = 145.052, z = 2652.905 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110005, gadget_id = 70220103, pos = { x = -1673.174, y = 128.001, z = 2679.490 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110006, gadget_id = 70220103, pos = { x = -1618.156, y = 153.375, z = 2673.678 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110007, gadget_id = 70220103, pos = { x = -1655.145, y = 138.053, z = 2727.265 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110008, gadget_id = 70220103, pos = { x = -1647.461, y = 168.618, z = 2691.657 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110009, gadget_id = 70220103, pos = { x = -1614.608, y = 153.109, z = 2730.007 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110010, gadget_id = 70220103, pos = { x = -1638.015, y = 168.458, z = 2743.078 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110011, gadget_id = 70220103, pos = { x = -1707.228, y = 158.188, z = 2744.136 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110013, gadget_id = 70220103, pos = { x = -1614.643, y = 146.084, z = 2616.962 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110014, gadget_id = 70220103, pos = { x = -1634.615, y = 127.258, z = 2633.279 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110015, gadget_id = 70220103, pos = { x = -1640.413, y = 166.024, z = 2702.479 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110016, gadget_id = 70220103, pos = { x = -1690.630, y = 159.553, z = 2725.552 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110017, gadget_id = 70220103, pos = { x = -1668.298, y = 167.469, z = 2708.384 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110018, gadget_id = 70220103, pos = { x = -1613.540, y = 120.997, z = 2664.884 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110019, gadget_id = 70220103, pos = { x = -1653.588, y = 175.955, z = 2739.094 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110021, gadget_id = 70220103, pos = { x = -1639.078, y = 121.023, z = 2681.502 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110022, gadget_id = 70220103, pos = { x = -1670.703, y = 120.177, z = 2722.146 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 110023, gadget_id = 70220103, pos = { x = -1680.396, y = 140.988, z = 2737.796 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 }
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
		gadgets = { 110001, 110002, 110003, 110004, 110005, 110006, 110007, 110008, 110009, 110010, 110011, 110013, 110014, 110015, 110016, 110017, 110018, 110019, 110021, 110022, 110023 },
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