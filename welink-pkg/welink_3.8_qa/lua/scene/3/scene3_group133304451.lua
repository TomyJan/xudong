-- 基础信息
local base_info = {
	group_id = 133304451
}

-- DEFS_MISCS
local defs = 
{
    maxRegion = 451011,
    maxJumpTimes = 5,
    mushroomList = {
        [1] = {451001, 451002,451003,451009,451010}, 
        [2] = {451012,451013,451014,451015,451016,451017,451018,451019}, 
        [3] = {451020,451021,451022,451023,451024,451025,451026},

    },
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
	-- 组1
	[451001] = { config_id = 451001, gadget_id = 70310488, pos = { x = -1781.221, y = 301.037, z = 2368.581 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
	-- 组1
	[451002] = { config_id = 451002, gadget_id = 70310488, pos = { x = -1779.122, y = 301.677, z = 2367.636 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
	-- 组1
	[451003] = { config_id = 451003, gadget_id = 70310488, pos = { x = -1774.883, y = 302.520, z = 2362.368 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
	-- 组1
	[451009] = { config_id = 451009, gadget_id = 70310488, pos = { x = -1769.545, y = 304.214, z = 2369.766 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
	-- 组1
	[451010] = { config_id = 451010, gadget_id = 70310488, pos = { x = -1773.667, y = 303.441, z = 2376.777 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
	-- 组2
	[451012] = { config_id = 451012, gadget_id = 70310488, pos = { x = -1779.407, y = 301.261, z = 2360.553 }, rot = { x = 0.000, y = 86.433, z = 0.000 }, level = 1, area_id = 21 },
	-- 组2
	[451013] = { config_id = 451013, gadget_id = 70310488, pos = { x = -1781.516, y = 300.593, z = 2361.102 }, rot = { x = 0.000, y = 258.354, z = 0.000 }, level = 1, area_id = 21 },
	-- 组2
	[451014] = { config_id = 451014, gadget_id = 70310488, pos = { x = -1780.218, y = 300.941, z = 2363.163 }, rot = { x = 0.000, y = 315.486, z = 0.000 }, level = 1, area_id = 21 },
	-- 组2
	[451015] = { config_id = 451015, gadget_id = 70310488, pos = { x = -1770.779, y = 304.131, z = 2374.516 }, rot = { x = 0.000, y = 112.599, z = 0.000 }, level = 1, area_id = 21 },
	-- 组2
	[451016] = { config_id = 451016, gadget_id = 70310488, pos = { x = -1773.206, y = 303.874, z = 2373.816 }, rot = { x = 0.000, y = 75.558, z = 0.000 }, level = 1, area_id = 21 },
	-- 组2
	[451017] = { config_id = 451017, gadget_id = 70310488, pos = { x = -1767.039, y = 304.467, z = 2368.901 }, rot = { x = 0.000, y = 145.412, z = 0.000 }, level = 1, area_id = 21 },
	-- 组2
	[451018] = { config_id = 451018, gadget_id = 70310488, pos = { x = -1771.864, y = 303.029, z = 2358.617 }, rot = { x = 0.000, y = 103.734, z = 0.000 }, level = 1, area_id = 21 },
	-- 组2
	[451019] = { config_id = 451019, gadget_id = 70310488, pos = { x = -1774.157, y = 302.499, z = 2358.156 }, rot = { x = 0.000, y = 15.743, z = 0.000 }, level = 1, area_id = 21 },
	-- 组3
	[451020] = { config_id = 451020, gadget_id = 70310488, pos = { x = -1778.497, y = 301.957, z = 2373.990 }, rot = { x = 0.000, y = 191.845, z = 0.000 }, level = 1, area_id = 21 },
	-- 组3
	[451021] = { config_id = 451021, gadget_id = 70310488, pos = { x = -1777.012, y = 302.637, z = 2371.712 }, rot = { x = 0.000, y = 320.391, z = 0.000 }, level = 1, area_id = 21 },
	-- 组3
	[451022] = { config_id = 451022, gadget_id = 70310488, pos = { x = -1771.358, y = 303.811, z = 2366.329 }, rot = { x = 0.000, y = 117.615, z = 0.000 }, level = 1, area_id = 21 },
	-- 组3
	[451023] = { config_id = 451023, gadget_id = 70310488, pos = { x = -1767.076, y = 304.401, z = 2359.957 }, rot = { x = 0.000, y = 336.741, z = 0.000 }, level = 1, area_id = 21 },
	-- 组3
	[451024] = { config_id = 451024, gadget_id = 70310488, pos = { x = -1768.622, y = 304.020, z = 2362.063 }, rot = { x = 0.000, y = 90.301, z = 0.000 }, level = 1, area_id = 21 },
	-- 组3
	[451025] = { config_id = 451025, gadget_id = 70310488, pos = { x = -1763.111, y = 304.914, z = 2367.555 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
	-- 组3
	[451026] = { config_id = 451026, gadget_id = 70310488, pos = { x = -1764.374, y = 304.861, z = 2370.000 }, rot = { x = 0.000, y = 317.855, z = 0.000 }, level = 1, area_id = 21 }
}

-- 区域
regions = {
	[451011] = { config_id = 451011, shape = RegionShape.SPHERE, radius = 50, pos = { x = -1768.667, y = 304.285, z = 2369.610 }, area_id = 21 }
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
		{ config_id = 451004, gadget_id = 70310488, pos = { x = -1767.048, y = 304.392, z = 2365.199 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
		{ config_id = 451005, gadget_id = 70310488, pos = { x = -1769.065, y = 303.936, z = 2363.210 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
		{ config_id = 451006, gadget_id = 70310488, pos = { x = -1767.105, y = 304.389, z = 2362.607 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
		{ config_id = 451007, gadget_id = 70310488, pos = { x = -1764.370, y = 304.779, z = 2373.690 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
		{ config_id = 451008, gadget_id = 70310488, pos = { x = -1766.613, y = 304.544, z = 2374.074 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 21 },
		{ config_id = 451027, gadget_id = 70310488, pos = { x = -1777.729, y = 301.857, z = 2356.716 }, rot = { x = 0.000, y = 81.119, z = 0.000 }, level = 1, area_id = 21 },
		{ config_id = 451028, gadget_id = 70310488, pos = { x = -1779.799, y = 301.367, z = 2356.985 }, rot = { x = 0.000, y = 217.914, z = 0.000 }, level = 1, area_id = 21 },
		{ config_id = 451029, gadget_id = 70310488, pos = { x = -1778.649, y = 301.839, z = 2354.468 }, rot = { x = 0.000, y = 48.537, z = 0.000 }, level = 1, area_id = 21 }
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
		gadgets = { },
		regions = { 451011 },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

require "V3_0/ContinuousTrampoline"