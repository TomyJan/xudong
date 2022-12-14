-- 基础信息
local base_info = {
	group_id = 133303209
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 209001, monster_id = 21010101, pos = { x = -1682.677, y = 146.108, z = 3408.321 }, rot = { x = 0.000, y = 290.716, z = 0.000 }, level = 30, drop_tag = "丘丘人", pose_id = 9016, area_id = 23 },
	{ config_id = 209002, monster_id = 21010201, pos = { x = -1681.089, y = 145.387, z = 3410.983 }, rot = { x = 0.000, y = 309.686, z = 0.000 }, level = 30, drop_tag = "丘丘人", disableWander = true, pose_id = 9012, area_id = 23 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 209003, gadget_id = 70210101, pos = { x = -1684.257, y = 147.721, z = 3409.877 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 26, drop_tag = "搜刮点解谜通用须弥", persistent = true, area_id = 23 },
	{ config_id = 209004, gadget_id = 70220103, pos = { x = -1670.807, y = 155.550, z = 3412.700 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, area_id = 23 }
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
		monsters = { 209001, 209002 },
		gadgets = { 209003, 209004 },
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