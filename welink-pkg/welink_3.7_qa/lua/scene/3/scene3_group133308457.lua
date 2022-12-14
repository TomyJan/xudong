-- 基础信息
local base_info = {
	group_id = 133308457
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
	{ config_id = 457001, gadget_id = 71700105, pos = { x = -1789.795, y = 327.458, z = 4121.410 }, rot = { x = 0.000, y = 80.883, z = 0.000 }, level = 1, area_id = 26 },
	{ config_id = 457002, gadget_id = 71700105, pos = { x = -1796.084, y = 326.740, z = 4121.525 }, rot = { x = 356.424, y = 0.014, z = -0.001 }, level = 1, area_id = 26 },
	{ config_id = 457003, gadget_id = 71700105, pos = { x = -1797.146, y = 326.743, z = 4121.425 }, rot = { x = 0.174, y = 80.876, z = 355.448 }, level = 1, area_id = 26 },
	{ config_id = 457004, gadget_id = 71700434, pos = { x = -1809.395, y = 327.008, z = 4120.372 }, rot = { x = 353.478, y = 340.674, z = 357.571 }, level = 1, area_id = 26 },
	{ config_id = 457005, gadget_id = 71700434, pos = { x = -1808.471, y = 327.172, z = 4122.445 }, rot = { x = 355.499, y = 30.635, z = 350.174 }, level = 1, area_id = 26 },
	{ config_id = 457006, gadget_id = 70300092, pos = { x = -1794.356, y = 326.946, z = 4122.664 }, rot = { x = 351.815, y = 328.632, z = 7.014 }, level = 1, area_id = 26 },
	{ config_id = 457007, gadget_id = 70330428, pos = { x = -1808.718, y = 326.758, z = 4117.945 }, rot = { x = 357.177, y = 26.804, z = 353.638 }, level = 1, drop_id = 1000100, drop_count = 1, area_id = 26 },
	{ config_id = 457008, gadget_id = 70330427, pos = { x = -1807.343, y = 326.737, z = 4118.769 }, rot = { x = 0.000, y = 0.000, z = 72.152 }, level = 1, drop_id = 1000100, drop_count = 1, area_id = 26 },
	{ config_id = 457009, gadget_id = 71700434, pos = { x = -1790.958, y = 327.766, z = 4124.004 }, rot = { x = 340.865, y = 36.925, z = 3.867 }, level = 1, area_id = 26 },
	{ config_id = 457010, gadget_id = 70330426, pos = { x = -1791.693, y = 327.304, z = 4122.688 }, rot = { x = 349.201, y = 302.527, z = 93.176 }, level = 1, drop_id = 1000100, drop_count = 1, area_id = 26 },
	{ config_id = 457011, gadget_id = 71700105, pos = { x = -1820.702, y = 327.575, z = 4110.713 }, rot = { x = 3.885, y = 80.835, z = 357.589 }, level = 1, area_id = 26 }
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
		-- description = 其他天布设,
		monsters = { },
		gadgets = { 457004, 457005, 457007, 457008, 457009, 457010 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = D4D5  73205  73206,
		monsters = { },
		gadgets = { 457001, 457002, 457003, 457004, 457005, 457006, 457007, 457008, 457009, 457010, 457011 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = 其他天布设,
		monsters = { },
		gadgets = { },
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