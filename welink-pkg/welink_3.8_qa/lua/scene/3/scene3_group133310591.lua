-- 基础信息
local base_info = {
	group_id = 133310591
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
	{ config_id = 591001, gadget_id = 70330254, pos = { x = -2562.550, y = 287.611, z = 4044.295 }, rot = { x = 354.407, y = 252.598, z = 357.084 }, level = 32, area_id = 26 },
	{ config_id = 591002, gadget_id = 70330254, pos = { x = -2567.109, y = 289.979, z = 4021.828 }, rot = { x = 347.093, y = 228.880, z = 15.740 }, level = 32, area_id = 26 },
	{ config_id = 591003, gadget_id = 70330254, pos = { x = -2572.852, y = 291.970, z = 4015.348 }, rot = { x = 12.365, y = 342.320, z = 352.461 }, level = 32, area_id = 26 }
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
		gadgets = { 591001, 591002, 591003 },
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