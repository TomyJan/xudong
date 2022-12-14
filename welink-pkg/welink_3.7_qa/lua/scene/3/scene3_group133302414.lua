-- 基础信息
local base_info = {
	group_id = 133302414
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 414002, monster_id = 26090101, pos = { x = 60.132, y = 246.675, z = 2913.888 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "蕈兽", pose_id = 101, area_id = 20 },
	{ config_id = 414003, monster_id = 26090101, pos = { x = 75.144, y = 246.734, z = 2916.556 }, rot = { x = 0.000, y = 41.396, z = 0.000 }, level = 27, drop_tag = "蕈兽", pose_id = 101, area_id = 20 },
	{ config_id = 414004, monster_id = 20011001, pos = { x = 67.140, y = 246.704, z = 2911.233 }, rot = { x = 0.000, y = 157.171, z = 0.000 }, level = 27, drop_tag = "史莱姆", area_id = 20 }
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
		monsters = { 414002, 414003, 414004 },
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