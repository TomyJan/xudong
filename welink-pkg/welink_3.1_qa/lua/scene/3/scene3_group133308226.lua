-- 基础信息
local base_info = {
	group_id = 133308226
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
	{ config_id = 226001, gadget_id = 70220103, pos = { x = -1800.893, y = 265.590, z = 4567.501 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 },
	{ config_id = 226002, gadget_id = 70220103, pos = { x = -1805.713, y = 236.231, z = 4692.567 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 },
	{ config_id = 226003, gadget_id = 70330434, pos = { x = -2147.399, y = 240.030, z = 4362.795 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 },
	{ config_id = 226004, gadget_id = 70220103, pos = { x = -1839.031, y = 276.901, z = 4518.918 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 },
	{ config_id = 226005, gadget_id = 70220103, pos = { x = -1819.621, y = 271.454, z = 4540.248 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 },
	{ config_id = 226008, gadget_id = 70220103, pos = { x = -1885.816, y = 220.267, z = 4626.251 }, rot = { x = 4.543, y = 359.435, z = 345.839 }, level = 32, area_id = 26 },
	{ config_id = 226009, gadget_id = 70220103, pos = { x = -1939.708, y = 223.843, z = 4519.001 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 },
	{ config_id = 226010, gadget_id = 70220103, pos = { x = -1949.012, y = 212.932, z = 4622.235 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 },
	{ config_id = 226011, gadget_id = 70220103, pos = { x = -1946.266, y = 215.226, z = 4584.271 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 },
	{ config_id = 226013, gadget_id = 70220103, pos = { x = -1940.864, y = 217.963, z = 4552.780 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 26 }
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
		gadgets = { 226001, 226002, 226003, 226004, 226005, 226008, 226009, 226010, 226011, 226013 },
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