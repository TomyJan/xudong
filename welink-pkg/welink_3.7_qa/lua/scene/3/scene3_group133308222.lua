-- 基础信息
local base_info = {
	group_id = 133308222
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 222001, monster_id = 28050401, pos = { x = -1670.330, y = 295.966, z = 4288.022 }, rot = { x = 0.000, y = 328.996, z = 0.000 }, level = 32, drop_tag = "采集动物", disableWander = true, pose_id = 101, area_id = 26 },
	{ config_id = 222003, monster_id = 28050401, pos = { x = -1673.371, y = 295.913, z = 4284.084 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 101, area_id = 26 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
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
		monsters = { 222001, 222003 },
		gadgets = { },
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