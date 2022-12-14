-- 基础信息
local base_info = {
	group_id = 133303489
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
	{ config_id = 489001, gadget_id = 70290008, pos = { x = -1845.119, y = 143.962, z = 3284.668 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 23 },
	{ config_id = 489002, gadget_id = 70500000, pos = { x = -1845.119, y = 143.962, z = 3284.668 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, point_type = 3008, owner = 489001, area_id = 23 },
	{ config_id = 489003, gadget_id = 70290008, pos = { x = -1843.272, y = 142.439, z = 3289.489 }, rot = { x = 0.000, y = 101.261, z = 0.000 }, level = 30, area_id = 23 },
	{ config_id = 489004, gadget_id = 70500000, pos = { x = -1843.272, y = 142.439, z = 3289.489 }, rot = { x = 0.000, y = 101.261, z = 0.000 }, level = 30, point_type = 3008, owner = 489003, area_id = 23 }
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
		gadgets = { 489001, 489002, 489003, 489004 },
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