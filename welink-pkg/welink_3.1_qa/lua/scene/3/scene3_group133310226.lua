-- 基础信息
local base_info = {
	group_id = 133310226
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
	{ config_id = 226001, gadget_id = 70500000, pos = { x = -3070.801, y = 262.564, z = 4731.046 }, rot = { x = 313.450, y = 56.415, z = 351.081 }, level = 32, point_type = 1001, area_id = 28 },
	{ config_id = 226002, gadget_id = 70500000, pos = { x = -3070.189, y = 262.010, z = 4730.309 }, rot = { x = 337.720, y = 58.670, z = 340.978 }, level = 32, point_type = 1002, area_id = 28 },
	{ config_id = 226003, gadget_id = 70500000, pos = { x = -3069.457, y = 261.735, z = 4729.693 }, rot = { x = 60.388, y = 179.787, z = 349.608 }, level = 32, point_type = 1001, area_id = 28 },
	{ config_id = 226004, gadget_id = 70500000, pos = { x = -3065.922, y = 261.313, z = 4728.209 }, rot = { x = 337.970, y = 29.921, z = 352.463 }, level = 32, point_type = 1002, area_id = 28 },
	{ config_id = 226005, gadget_id = 70500000, pos = { x = -3064.780, y = 261.465, z = 4727.677 }, rot = { x = 337.189, y = 65.113, z = 349.499 }, level = 32, point_type = 1001, area_id = 28 }
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
		gadgets = { 226001, 226002, 226003, 226004, 226005 },
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