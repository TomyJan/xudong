-- 基础信息
local base_info = {
	group_id = 133308451
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 451002, monster_id = 28010302, pos = { x = -1960.308, y = 210.490, z = 4163.930 }, rot = { x = 0.000, y = 336.434, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 451003, monster_id = 28010302, pos = { x = -1970.117, y = 210.575, z = 4184.022 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 451004, monster_id = 28010301, pos = { x = -1995.742, y = 210.272, z = 4205.561 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 451005, monster_id = 28010303, pos = { x = -2017.415, y = 210.000, z = 4202.544 }, rot = { x = 0.000, y = 110.766, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 451006, monster_id = 28040102, pos = { x = -2000.118, y = 210.000, z = 4192.323 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "水族", area_id = 26 },
	{ config_id = 451007, monster_id = 28040102, pos = { x = -2034.697, y = 210.000, z = 4178.934 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "水族", area_id = 26 },
	{ config_id = 451008, monster_id = 28040102, pos = { x = -2016.883, y = 209.900, z = 4195.292 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "水族", area_id = 26 },
	{ config_id = 451009, monster_id = 28040103, pos = { x = -2045.260, y = 210.000, z = 4146.404 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "水族", area_id = 26 },
	{ config_id = 451010, monster_id = 28020108, pos = { x = -2010.891, y = 215.264, z = 4123.190 }, rot = { x = 0.000, y = 232.490, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 26 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
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
		monsters = { 451002, 451003, 451004, 451005, 451006, 451007, 451008, 451009, 451010 },
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