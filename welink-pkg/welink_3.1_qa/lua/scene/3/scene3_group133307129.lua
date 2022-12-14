-- 基础信息
local base_info = {
	group_id = 133307129
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 129001, monster_id = 28010404, pos = { x = -1952.944, y = 126.024, z = 5972.844 }, rot = { x = 0.000, y = 194.602, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 27 },
	{ config_id = 129002, monster_id = 28010404, pos = { x = -1951.994, y = 125.947, z = 5972.176 }, rot = { x = 0.000, y = 278.955, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 27 },
	{ config_id = 129003, monster_id = 28010404, pos = { x = -1956.060, y = 125.966, z = 5975.241 }, rot = { x = 0.000, y = 139.221, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 27 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 129004, gadget_id = 70330409, pos = { x = -1958.226, y = 126.071, z = 5968.540 }, rot = { x = 6.609, y = 305.446, z = 346.398 }, level = 32, area_id = 27 }
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
		monsters = { 129001, 129002, 129003 },
		gadgets = { 129004 },
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