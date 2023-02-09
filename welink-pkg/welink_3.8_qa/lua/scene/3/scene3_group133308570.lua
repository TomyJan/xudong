-- 基础信息
local base_info = {
	group_id = 133308570
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 570001, monster_id = 28010404, pos = { x = -1449.695, y = 1.781, z = 4708.246 }, rot = { x = 0.000, y = 179.616, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 26 },
	{ config_id = 570002, monster_id = 28010404, pos = { x = -1450.254, y = 2.392, z = 4705.739 }, rot = { x = 0.000, y = 71.344, z = 0.000 }, level = 32, drop_tag = "采集动物", pose_id = 1, area_id = 26 }
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
		monsters = { 570001, 570002 },
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