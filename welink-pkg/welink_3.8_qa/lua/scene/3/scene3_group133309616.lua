-- 基础信息
local base_info = {
	group_id = 133309616
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
	{ config_id = 616001, gadget_id = 70500000, pos = { x = -2215.635, y = -43.180, z = 5676.777 }, rot = { x = 24.983, y = 276.327, z = 9.931 }, level = 32, point_type = 2045, area_id = 27 },
	{ config_id = 616002, gadget_id = 70500000, pos = { x = -2254.771, y = -51.755, z = 5682.450 }, rot = { x = 352.731, y = 52.459, z = 20.033 }, level = 32, point_type = 2045, area_id = 27 }
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
		gadgets = { 616001, 616002 },
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