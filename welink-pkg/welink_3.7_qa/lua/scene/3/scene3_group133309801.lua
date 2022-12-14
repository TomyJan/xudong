-- 基础信息
local base_info = {
	group_id = 133309801
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
	{ config_id = 801001, gadget_id = 70710352, pos = { x = -2645.815, y = 224.282, z = 5922.518 }, rot = { x = 342.288, y = 4.501, z = 331.687 }, level = 32, area_id = 27 },
	{ config_id = 801002, gadget_id = 70210101, pos = { x = -2645.399, y = 224.668, z = 5922.220 }, rot = { x = 342.288, y = 4.501, z = 331.687 }, level = 26, drop_tag = "搜刮点解谜破损须弥", persistent = true, area_id = 27 },
	{ config_id = 801003, gadget_id = 70330432, pos = { x = -2647.601, y = 223.210, z = 5942.048 }, rot = { x = 0.000, y = 54.163, z = 0.000 }, level = 32, area_id = 27 },
	{ config_id = 801004, gadget_id = 70210101, pos = { x = -2647.335, y = 223.710, z = 5942.570 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 26, drop_tag = "搜刮点解谜破损须弥", persistent = true, area_id = 27 }
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
		gadgets = { 801001, 801002, 801003, 801004 },
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