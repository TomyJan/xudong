-- 基础信息
local base_info = {
	group_id = 133302545
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 545001, monster_id = 21010101, pos = { x = -612.669, y = 222.819, z = 2945.318 }, rot = { x = 0.000, y = 146.497, z = 0.000 }, level = 27, drop_tag = "丘丘人", pose_id = 9016, area_id = 24 },
	{ config_id = 545002, monster_id = 21010101, pos = { x = -637.305, y = 217.748, z = 2930.935 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, drop_tag = "丘丘人", pose_id = 9016, area_id = 24 },
	{ config_id = 545003, monster_id = 21010101, pos = { x = -641.647, y = 217.237, z = 2951.865 }, rot = { x = 0.000, y = 294.965, z = 0.000 }, level = 27, drop_tag = "丘丘人", pose_id = 9016, area_id = 24 }
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
		monsters = { 545001, 545002, 545003 },
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