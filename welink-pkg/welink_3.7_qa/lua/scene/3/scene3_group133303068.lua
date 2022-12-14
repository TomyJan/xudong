-- 基础信息
local base_info = {
	group_id = 133303068
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 68001, monster_id = 28020313, pos = { x = -1081.115, y = 266.617, z = 3424.897 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, drop_tag = "走兽", disableWander = true, area_id = 23 },
	{ config_id = 68002, monster_id = 28020313, pos = { x = -1068.294, y = 265.454, z = 3420.860 }, rot = { x = 0.000, y = 143.786, z = 0.000 }, level = 30, drop_tag = "走兽", disableWander = true, area_id = 23 },
	{ config_id = 68003, monster_id = 28020313, pos = { x = -1073.691, y = 266.075, z = 3423.771 }, rot = { x = 0.000, y = 271.559, z = 0.000 }, level = 30, drop_tag = "走兽", area_id = 23 }
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
		monsters = { 68001, 68002, 68003 },
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