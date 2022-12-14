-- 基础信息
local base_info = {
	group_id = 133315320
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
	{ config_id = 320006, gadget_id = 70500000, pos = { x = 501.579, y = 295.894, z = 1992.600 }, rot = { x = 0.000, y = 322.704, z = 0.000 }, level = 27, point_type = 2004, area_id = 6 },
	{ config_id = 320007, gadget_id = 70500000, pos = { x = 475.096, y = 299.142, z = 1962.071 }, rot = { x = 0.000, y = 328.370, z = 0.000 }, level = 27, point_type = 2004, area_id = 6 },
	{ config_id = 320008, gadget_id = 70540041, pos = { x = 493.583, y = 305.277, z = 2019.307 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, area_id = 6 },
	{ config_id = 320009, gadget_id = 70500000, pos = { x = 493.851, y = 306.259, z = 2019.536 }, rot = { x = 346.837, y = 4.866, z = 14.014 }, level = 27, point_type = 2051, owner = 320008, area_id = 6 },
	{ config_id = 320010, gadget_id = 70500000, pos = { x = 493.663, y = 306.149, z = 2019.327 }, rot = { x = 344.037, y = 7.209, z = 349.121 }, level = 27, point_type = 2051, owner = 320008, area_id = 6 },
	{ config_id = 320011, gadget_id = 70500000, pos = { x = 493.882, y = 305.900, z = 2019.158 }, rot = { x = 10.767, y = 8.154, z = 14.727 }, level = 27, point_type = 2051, owner = 320008, area_id = 6 },
	{ config_id = 320012, gadget_id = 70500000, pos = { x = 493.301, y = 305.804, z = 2019.242 }, rot = { x = 359.538, y = 0.302, z = 342.000 }, level = 27, point_type = 2051, owner = 320008, area_id = 6 }
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
		{ config_id = 320001, gadget_id = 70540041, pos = { x = 493.640, y = 305.228, z = 2015.448 }, rot = { x = 0.000, y = 45.941, z = 0.000 }, level = 27, area_id = 6 },
		{ config_id = 320002, gadget_id = 70500000, pos = { x = 493.290, y = 306.210, z = 2015.417 }, rot = { x = 18.803, y = 51.832, z = 356.379 }, level = 27, point_type = 2051, owner = 320001, area_id = 6 },
		{ config_id = 320003, gadget_id = 70500000, pos = { x = 493.564, y = 306.100, z = 2015.479 }, rot = { x = 6.810, y = 52.702, z = 18.035 }, level = 27, point_type = 2051, owner = 320001, area_id = 6 },
		{ config_id = 320004, gadget_id = 70500000, pos = { x = 493.484, y = 305.851, z = 2015.743 }, rot = { x = 359.592, y = 52.765, z = 341.832 }, level = 27, point_type = 2051, owner = 320001, area_id = 6 },
		{ config_id = 320005, gadget_id = 70500000, pos = { x = 493.907, y = 305.754, z = 2015.338 }, rot = { x = 350.048, y = 44.849, z = 15.082 }, level = 27, point_type = 2051, owner = 320001, area_id = 6 }
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
		gadgets = { 320006, 320007, 320008, 320009, 320010, 320011, 320012 },
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