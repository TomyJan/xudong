-- 基础信息
local base_info = {
	group_id = 133315324
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
	{ config_id = 324001, gadget_id = 70290009, pos = { x = 463.624, y = 297.794, z = 2099.786 }, rot = { x = 0.000, y = 199.202, z = 0.000 }, level = 27, area_id = 20 },
	{ config_id = 324002, gadget_id = 70500000, pos = { x = 463.624, y = 297.794, z = 2099.786 }, rot = { x = 0.000, y = 199.202, z = 0.000 }, level = 27, point_type = 3005, owner = 324001, area_id = 20 }
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
		gadgets = { 324001, 324002 },
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