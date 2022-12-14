-- 基础信息
local base_info = {
	group_id = 133304310
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
	{ config_id = 310001, npc_id = 20879, pos = { x = -1322.378, y = 275.340, z = 2876.755 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 21 },
	{ config_id = 310003, npc_id = 20881, pos = { x = -1350.583, y = 276.365, z = 2780.517 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 21 },
	{ config_id = 310005, npc_id = 20880, pos = { x = -1878.542, y = 262.371, z = 2768.674 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 21 }
}

-- 装置
gadgets = {
	{ config_id = 310002, gadget_id = 70300110, pos = { x = -1322.378, y = 275.268, z = 2876.755 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 21 },
	{ config_id = 310004, gadget_id = 70300110, pos = { x = -1350.583, y = 276.365, z = 2780.517 }, rot = { x = 0.000, y = 0.000, z = 11.652 }, level = 30, area_id = 21 },
	{ config_id = 310006, gadget_id = 70300110, pos = { x = -1878.540, y = 262.396, z = 2768.674 }, rot = { x = 354.846, y = 245.302, z = 2.366 }, level = 30, area_id = 21 }
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
		gadgets = { 310002, 310004, 310006 },
		regions = { },
		triggers = { },
		npcs = { 310001, 310003, 310005 },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

require "V3_0/DeathFieldStandard"