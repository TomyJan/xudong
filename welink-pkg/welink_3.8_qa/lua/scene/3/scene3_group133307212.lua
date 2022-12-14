-- 基础信息
local base_info = {
	group_id = 133307212
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
}

-- 区域
regions = {
	-- 裂谷遗迹
	{ config_id = 212001, shape = RegionShape.POLYGON, pos = { x = -1267.029, y = -10.870, z = 5423.663 }, height = 178.260, point_array = { { x = -1288.573, y = 5494.844 }, { x = -1231.376, y = 5534.529 }, { x = -1155.896, y = 5565.752 }, { x = -1129.630, y = 5497.060 }, { x = -1109.624, y = 5458.644 }, { x = -1147.854, y = 5438.526 }, { x = -1180.520, y = 5434.865 }, { x = -1236.790, y = 5384.886 }, { x = -1272.377, y = 5372.205 }, { x = -1336.690, y = 5310.621 }, { x = -1356.834, y = 5281.573 }, { x = -1413.886, y = 5295.670 }, { x = -1424.433, y = 5341.579 }, { x = -1405.948, y = 5387.715 }, { x = -1347.763, y = 5425.775 } }, area_id = 32, vision_type_list = { 33070007 } },
	-- 裂谷谷底
	{ config_id = 212002, shape = RegionShape.POLYGON, pos = { x = -1126.498, y = -30.000, z = 5542.574 }, height = 140.000, point_array = { { x = -1089.500, y = 5489.213 }, { x = -1074.736, y = 5534.842 }, { x = -1035.492, y = 5644.147 }, { x = -1035.970, y = 5660.441 }, { x = -1063.085, y = 5655.046 }, { x = -1111.387, y = 5572.924 }, { x = -1217.504, y = 5462.625 }, { x = -1209.682, y = 5447.379 }, { x = -1145.572, y = 5424.706 } }, area_id = 32, vision_type_list = { 33070008 } }
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
		gadgets = { },
		regions = { 212001, 212002 },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================