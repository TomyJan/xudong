-- 基础信息
local base_info = {
	group_id = 133310466
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 466001, monster_id = 26090301, pos = { x = -2441.488, y = 257.486, z = 4405.373 }, rot = { x = 0.000, y = 31.298, z = 0.000 }, level = 32, drop_tag = "蕈兽", pose_id = 105, area_id = 26 },
	{ config_id = 466002, monster_id = 26090301, pos = { x = -2444.940, y = 256.810, z = 4404.971 }, rot = { x = 0.000, y = 15.677, z = 0.000 }, level = 32, drop_tag = "蕈兽", pose_id = 105, area_id = 26 },
	{ config_id = 466003, monster_id = 26090301, pos = { x = -2446.795, y = 256.642, z = 4408.869 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "蕈兽", pose_id = 105, area_id = 26 }
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
		monsters = { 466001, 466002, 466003 },
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