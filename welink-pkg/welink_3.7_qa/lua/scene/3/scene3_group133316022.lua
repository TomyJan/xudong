-- 基础信息
local base_info = {
	group_id = 133316022
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
	{ config_id = 22001, gadget_id = 70220133, pos = { x = 482.431, y = 123.386, z = 6323.687 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 30 },
	{ config_id = 22002, gadget_id = 70220134, pos = { x = 481.132, y = 123.153, z = 6343.382 }, rot = { x = 0.000, y = 76.518, z = 0.000 }, level = 32, area_id = 30 },
	{ config_id = 22004, gadget_id = 70310498, pos = { x = 466.587, y = 123.746, z = 6354.061 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 30 },
	{ config_id = 22005, gadget_id = 70310493, pos = { x = 457.042, y = 123.107, z = 6347.425 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 30 }
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
		gadgets = { 22001, 22002, 22004, 22005 },
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