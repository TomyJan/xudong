-- 基础信息
local base_info = {
	group_id = 133308661
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 661001, monster_id = 28020108, pos = { x = -1776.463, y = 123.777, z = 5138.079 }, rot = { x = 0.000, y = 115.864, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 26 },
	{ config_id = 661002, monster_id = 28020108, pos = { x = -1787.173, y = 117.703, z = 5091.112 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 26 },
	{ config_id = 661003, monster_id = 28020108, pos = { x = -1812.599, y = 127.761, z = 5167.925 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 27 },
	{ config_id = 661004, monster_id = 28020108, pos = { x = -1779.709, y = 127.365, z = 5180.328 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 27 },
	{ config_id = 661005, monster_id = 28020108, pos = { x = -1863.048, y = 134.954, z = 5175.800 }, rot = { x = 0.000, y = 153.992, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 27 },
	{ config_id = 661006, monster_id = 28020108, pos = { x = -1927.202, y = 139.877, z = 5142.080 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 27 }
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
		monsters = { 661001, 661002, 661003, 661004, 661005, 661006 },
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