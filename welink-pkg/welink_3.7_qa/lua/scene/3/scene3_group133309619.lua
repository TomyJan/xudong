-- 基础信息
local base_info = {
	group_id = 133309619
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
	{ config_id = 619001, gadget_id = 70220103, pos = { x = -2542.732, y = 205.232, z = 5772.409 }, rot = { x = 3.558, y = 359.757, z = 355.526 }, level = 32, area_id = 27 },
	{ config_id = 619002, gadget_id = 70220103, pos = { x = -2460.764, y = 213.748, z = 5734.909 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 27 },
	{ config_id = 619003, gadget_id = 70220103, pos = { x = -2534.156, y = 205.323, z = 5684.877 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 27 }
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
		gadgets = { 619001, 619002, 619003 },
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