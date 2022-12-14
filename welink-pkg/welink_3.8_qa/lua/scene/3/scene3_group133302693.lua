-- 基础信息
local base_info = {
	group_id = 133302693
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 693001, monster_id = 21010101, pos = { x = -338.770, y = 185.177, z = 2366.864 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "丘丘人", pose_id = 9016, area_id = 24 },
	{ config_id = 693002, monster_id = 21010101, pos = { x = -294.374, y = 184.180, z = 2353.042 }, rot = { x = 0.000, y = 162.964, z = 0.000 }, level = 27, drop_tag = "丘丘人", pose_id = 9016, area_id = 24 },
	{ config_id = 693003, monster_id = 21010101, pos = { x = -362.217, y = 193.331, z = 2349.500 }, rot = { x = 0.000, y = 114.564, z = 0.000 }, level = 27, drop_tag = "丘丘人", pose_id = 9016, area_id = 24 }
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
		monsters = { 693001, 693002, 693003 },
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