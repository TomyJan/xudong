-- 基础信息
local base_info = {
	group_id = 133310124
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 124001, monster_id = 28060401, pos = { x = -2357.462, y = 275.678, z = 4281.040 }, rot = { x = 0.000, y = 99.246, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 1, area_id = 26 },
	{ config_id = 124003, monster_id = 28060401, pos = { x = -2338.279, y = 280.638, z = 4257.477 }, rot = { x = 0.000, y = 233.540, z = 0.000 }, level = 32, drop_tag = "走兽", pose_id = 1, area_id = 26 }
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
		monsters = { 124001, 124003 },
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