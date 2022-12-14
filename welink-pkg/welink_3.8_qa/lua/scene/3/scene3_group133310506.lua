-- 基础信息
local base_info = {
	group_id = 133310506
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
	{ config_id = 506001, gadget_id = 70330450, pos = { x = -2730.863, y = 219.341, z = 4280.218 }, rot = { x = 14.582, y = 359.698, z = 357.639 }, level = 32, area_id = 28 },
	{ config_id = 506002, gadget_id = 70500000, pos = { x = -2730.863, y = 219.341, z = 4280.218 }, rot = { x = 14.582, y = 359.698, z = 357.639 }, level = 32, point_type = 3012, owner = 506001, area_id = 28 },
	{ config_id = 506003, gadget_id = 70330450, pos = { x = -2733.000, y = 223.062, z = 4266.836 }, rot = { x = 16.534, y = 359.870, z = 359.105 }, level = 32, area_id = 28 },
	{ config_id = 506004, gadget_id = 70500000, pos = { x = -2733.000, y = 223.062, z = 4266.836 }, rot = { x = 16.534, y = 359.870, z = 359.105 }, level = 32, point_type = 3012, owner = 506003, area_id = 28 }
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
		gadgets = { 506001, 506002, 506003, 506004 },
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