-- 基础信息
local base_info = {
	group_id = 133307240
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
	{ config_id = 240002, gadget_id = 70330254, pos = { x = -1323.925, y = 44.729, z = 5303.291 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 240004, gadget_id = 70330254, pos = { x = -1314.106, y = 44.520, z = 5316.821 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 240005, gadget_id = 70330254, pos = { x = -1297.074, y = 41.674, z = 5307.178 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 240008, gadget_id = 70330254, pos = { x = -1312.188, y = 46.010, z = 5338.825 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 240010, gadget_id = 70330254, pos = { x = -1281.517, y = 45.471, z = 5367.535 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 240011, gadget_id = 70330254, pos = { x = -1310.054, y = 46.405, z = 5349.003 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 240012, gadget_id = 70330254, pos = { x = -1277.848, y = 42.943, z = 5335.034 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 }
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

-- 废弃数据
garbages = {
	gadgets = {
		{ config_id = 240001, gadget_id = 70330254, pos = { x = -1333.167, y = 45.448, z = 5303.681 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
		{ config_id = 240003, gadget_id = 70330254, pos = { x = -1326.411, y = 46.000, z = 5322.945 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
		{ config_id = 240006, gadget_id = 70330254, pos = { x = -1294.603, y = 42.466, z = 5292.847 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
		{ config_id = 240007, gadget_id = 70330254, pos = { x = -1297.390, y = 45.299, z = 5328.673 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
		{ config_id = 240009, gadget_id = 70330254, pos = { x = -1325.656, y = 45.829, z = 5337.511 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 }
	}
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
		gadgets = { 240002, 240004, 240005, 240008, 240010, 240011, 240012 },
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