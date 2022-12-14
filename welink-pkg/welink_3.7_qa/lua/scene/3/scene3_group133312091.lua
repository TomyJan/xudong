-- 基础信息
local base_info = {
	group_id = 133312091
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 91001, monster_id = 28050106, pos = { x = -3172.953, y = 13.965, z = 4318.702 }, rot = { x = 0.000, y = 47.393, z = 0.000 }, level = 32, drop_tag = "魔法生物", area_id = 28 },
	{ config_id = 91002, monster_id = 28050106, pos = { x = -3170.744, y = 13.449, z = 4315.990 }, rot = { x = 0.000, y = 308.741, z = 0.000 }, level = 32, drop_tag = "魔法生物", area_id = 28 },
	{ config_id = 91003, monster_id = 28050106, pos = { x = -3173.866, y = 13.449, z = 4293.306 }, rot = { x = 0.000, y = 156.693, z = 0.000 }, level = 32, drop_tag = "魔法生物", area_id = 28 },
	{ config_id = 91004, monster_id = 28050106, pos = { x = -3158.726, y = 13.449, z = 4307.009 }, rot = { x = 0.000, y = 16.209, z = 0.000 }, level = 32, drop_tag = "魔法生物", area_id = 28 },
	{ config_id = 91005, monster_id = 28050106, pos = { x = -3155.254, y = 13.449, z = 4298.713 }, rot = { x = 0.000, y = 156.000, z = 0.000 }, level = 32, drop_tag = "魔法生物", area_id = 28 },
	{ config_id = 91006, monster_id = 28050106, pos = { x = -3177.614, y = 13.669, z = 4308.828 }, rot = { x = 0.000, y = 258.000, z = 0.000 }, level = 32, drop_tag = "魔法生物", area_id = 28 },
	{ config_id = 91007, monster_id = 28050106, pos = { x = -3170.703, y = 13.449, z = 4302.414 }, rot = { x = 0.000, y = 65.000, z = 0.000 }, level = 32, drop_tag = "魔法生物", area_id = 28 }
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
		monsters = { 91001, 91002, 91003, 91004, 91005, 91006, 91007 },
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