-- 基础信息
local base_info = {
	group_id = 133308049
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 49001, monster_id = 28010201, pos = { x = -1837.670, y = 283.100, z = 3963.909 }, rot = { x = 0.000, y = 351.825, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 49002, monster_id = 28010201, pos = { x = -1861.774, y = 274.867, z = 4002.385 }, rot = { x = 0.000, y = 129.198, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 49003, monster_id = 28010201, pos = { x = -1914.898, y = 277.369, z = 3991.323 }, rot = { x = 0.000, y = 17.864, z = 0.000 }, level = 32, drop_tag = "采集动物", area_id = 26 },
	{ config_id = 49007, monster_id = 28020108, pos = { x = -1942.216, y = 284.272, z = 3937.727 }, rot = { x = 0.000, y = 163.854, z = 0.000 }, level = 32, drop_tag = "走兽", disableWander = true, area_id = 26 }
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
		monsters = { 49001, 49002, 49003, 49007 },
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