-- 基础信息
local base_info = {
	group_id = 133303391
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
	{ config_id = 391001, gadget_id = 70540044, pos = { x = -1097.117, y = 264.200, z = 3317.171 }, rot = { x = 0.000, y = 259.463, z = 0.000 }, level = 30, area_id = 23 },
	{ config_id = 391002, gadget_id = 70500000, pos = { x = -1097.117, y = 264.200, z = 3317.171 }, rot = { x = 0.000, y = 259.463, z = 0.000 }, level = 30, point_type = 2048, owner = 391001, area_id = 23 },
	{ config_id = 391003, gadget_id = 70540044, pos = { x = -1093.634, y = 264.200, z = 3312.235 }, rot = { x = 0.000, y = 87.566, z = 0.000 }, level = 30, area_id = 23 },
	{ config_id = 391004, gadget_id = 70500000, pos = { x = -1093.634, y = 264.200, z = 3312.235 }, rot = { x = 0.000, y = 87.566, z = 0.000 }, level = 30, point_type = 2048, owner = 391003, area_id = 23 },
	{ config_id = 391005, gadget_id = 70540044, pos = { x = -1084.769, y = 264.200, z = 3346.857 }, rot = { x = 0.000, y = 99.022, z = 0.000 }, level = 30, area_id = 23 },
	{ config_id = 391006, gadget_id = 70500000, pos = { x = -1084.769, y = 264.200, z = 3346.857 }, rot = { x = 0.000, y = 99.022, z = 0.000 }, level = 30, point_type = 2048, owner = 391005, area_id = 23 },
	{ config_id = 391007, gadget_id = 70540044, pos = { x = -1086.691, y = 264.200, z = 3330.120 }, rot = { x = 0.000, y = 5.079, z = 0.000 }, level = 30, area_id = 23 },
	{ config_id = 391008, gadget_id = 70500000, pos = { x = -1086.691, y = 264.200, z = 3330.120 }, rot = { x = 0.000, y = 5.079, z = 0.000 }, level = 30, point_type = 2048, owner = 391007, area_id = 23 }
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
		gadgets = { 391001, 391002, 391003, 391004, 391005, 391006, 391007, 391008 },
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