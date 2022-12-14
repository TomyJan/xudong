-- 基础信息
local base_info = {
	group_id = 133309125
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
	{ config_id = 125001, gadget_id = 70500000, pos = { x = -2023.960, y = 160.344, z = 5122.786 }, rot = { x = 0.000, y = 56.652, z = 0.000 }, level = 32, point_type = 1001, area_id = 27 },
	{ config_id = 125002, gadget_id = 70500000, pos = { x = -2026.008, y = 160.490, z = 5123.953 }, rot = { x = 2.000, y = 339.407, z = 354.005 }, level = 32, point_type = 1001, area_id = 27 },
	{ config_id = 125003, gadget_id = 70500000, pos = { x = -2024.638, y = 160.138, z = 5124.245 }, rot = { x = 0.000, y = 347.692, z = 342.816 }, level = 32, point_type = 1002, area_id = 27 },
	{ config_id = 125004, gadget_id = 70500000, pos = { x = -2018.100, y = 158.848, z = 5097.181 }, rot = { x = 0.000, y = 244.087, z = 0.000 }, level = 32, point_type = 1002, area_id = 27 },
	{ config_id = 125005, gadget_id = 70500000, pos = { x = -2018.748, y = 159.402, z = 5102.512 }, rot = { x = 0.000, y = 343.970, z = 0.000 }, level = 32, point_type = 1002, area_id = 27 },
	{ config_id = 125006, gadget_id = 70500000, pos = { x = -2017.941, y = 159.114, z = 5101.195 }, rot = { x = 8.614, y = 320.057, z = 350.719 }, level = 32, point_type = 1001, area_id = 27 },
	{ config_id = 125007, gadget_id = 70500000, pos = { x = -2017.445, y = 159.107, z = 5104.076 }, rot = { x = 0.000, y = 331.475, z = 9.938 }, level = 32, point_type = 1001, area_id = 27 }
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
		gadgets = { 125001, 125002, 125003, 125004, 125005, 125006, 125007 },
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