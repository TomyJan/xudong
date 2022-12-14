-- 基础信息
local base_info = {
	group_id = 133303096
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 96001, monster_id = 26090201, pos = { x = -1050.081, y = 170.300, z = 3630.935 }, rot = { x = 0.000, y = 42.758, z = 0.000 }, level = 30, drop_tag = "蕈兽", pose_id = 101, area_id = 23 },
	{ config_id = 96002, monster_id = 26090201, pos = { x = -1036.388, y = 170.766, z = 3640.952 }, rot = { x = 0.000, y = 42.758, z = 0.000 }, level = 30, drop_tag = "蕈兽", pose_id = 101, area_id = 23 },
	{ config_id = 96003, monster_id = 26090201, pos = { x = -1035.888, y = 170.660, z = 3626.422 }, rot = { x = 0.000, y = 42.758, z = 0.000 }, level = 30, drop_tag = "蕈兽", pose_id = 101, area_id = 23 },
	{ config_id = 96004, monster_id = 26120101, pos = { x = -1042.073, y = 170.300, z = 3632.539 }, rot = { x = 0.000, y = 42.758, z = 0.000 }, level = 30, drop_tag = "大蕈兽", pose_id = 201, area_id = 23 }
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
		monsters = { 96001, 96002, 96003, 96004 },
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