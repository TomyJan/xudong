-- 基础信息
local base_info = {
	group_id = 133310372
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
	{ config_id = 372002, gadget_id = 70500000, pos = { x = -2501.606, y = 192.487, z = 4518.270 }, rot = { x = 2.876, y = 60.623, z = 1.460 }, level = 32, point_type = 1002, area_id = 26 },
	{ config_id = 372003, gadget_id = 70500000, pos = { x = -2501.938, y = 192.465, z = 4519.389 }, rot = { x = 356.880, y = 250.969, z = 359.184 }, level = 32, point_type = 1001, area_id = 26 },
	{ config_id = 372004, gadget_id = 70500000, pos = { x = -2502.823, y = 192.365, z = 4523.724 }, rot = { x = 2.664, y = 0.127, z = 8.878 }, level = 32, point_type = 1001, area_id = 26 },
	{ config_id = 372006, gadget_id = 70500000, pos = { x = -2502.460, y = 192.348, z = 4522.664 }, rot = { x = 355.768, y = 330.594, z = 3.404 }, level = 32, point_type = 1002, area_id = 26 }
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
		gadgets = { 372002, 372003, 372004, 372006 },
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