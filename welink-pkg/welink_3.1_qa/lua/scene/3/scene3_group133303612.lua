-- 基础信息
local base_info = {
	group_id = 133303612
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 612001, monster_id = 28060201, pos = { x = -1521.804, y = 174.917, z = 3357.410 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, drop_tag = "走兽", pose_id = 3, area_id = 23 },
	{ config_id = 612002, monster_id = 28060201, pos = { x = -1522.963, y = 174.921, z = 3358.940 }, rot = { x = 0.000, y = 76.348, z = 0.000 }, level = 30, drop_tag = "走兽", pose_id = 2, area_id = 23 }
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
		monsters = { 612001, 612002 },
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