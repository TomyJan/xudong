-- 基础信息
local base_info = {
	group_id = 133315302
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
	{ config_id = 302001, gadget_id = 70500000, pos = { x = 91.342, y = 247.111, z = 2916.386 }, rot = { x = 0.000, y = 290.508, z = 0.000 }, level = 27, point_type = 2004, area_id = 20 },
	{ config_id = 302002, gadget_id = 70500000, pos = { x = 83.690, y = 246.691, z = 2881.770 }, rot = { x = 0.000, y = 65.602, z = 0.000 }, level = 27, point_type = 2004, area_id = 20 },
	{ config_id = 302003, gadget_id = 70500000, pos = { x = 122.126, y = 246.990, z = 2831.604 }, rot = { x = 0.000, y = 355.280, z = 0.000 }, level = 27, point_type = 2004, area_id = 20 }
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
		gadgets = { 302001, 302002, 302003 },
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