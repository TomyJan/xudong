-- 基础信息
local base_info = {
	group_id = 133303177
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 177001, monster_id = 28060401, pos = { x = -1666.924, y = 292.437, z = 4242.285 }, rot = { x = 0.000, y = 333.835, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 1, area_id = 26 },
	{ config_id = 177002, monster_id = 28060401, pos = { x = -1679.781, y = 289.332, z = 4208.999 }, rot = { x = 0.000, y = 2.681, z = 0.000 }, level = 32, drop_tag = "走兽", disableWander = true, pose_id = 2, area_id = 26 },
	{ config_id = 177003, monster_id = 28060301, pos = { x = -1693.915, y = 328.155, z = 4217.971 }, rot = { x = 0.000, y = 113.030, z = 0.000 }, level = 32, drop_tag = "鸟类", pose_id = 121, area_id = 26 }
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
		monsters = { 177001, 177002, 177003 },
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