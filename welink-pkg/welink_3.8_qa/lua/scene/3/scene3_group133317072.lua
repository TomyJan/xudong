-- 基础信息
local base_info = {
	group_id = 133317072
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 72001, monster_id = 28060101, pos = { x = 810.802, y = 205.500, z = 5898.777 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 1, area_id = 30 },
	{ config_id = 72002, monster_id = 28060101, pos = { x = 786.907, y = 205.500, z = 5904.909 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 1, area_id = 30 },
	{ config_id = 72003, monster_id = 28060101, pos = { x = 806.427, y = 205.500, z = 5923.863 }, rot = { x = 0.000, y = 237.830, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 1, area_id = 30 },
	{ config_id = 72004, monster_id = 28060101, pos = { x = 799.661, y = 200.000, z = 5976.563 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 1, area_id = 30 },
	{ config_id = 72005, monster_id = 28060101, pos = { x = 783.240, y = 200.000, z = 5990.133 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 1, area_id = 30 }
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
		monsters = { 72001, 72002, 72003, 72004, 72005 },
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