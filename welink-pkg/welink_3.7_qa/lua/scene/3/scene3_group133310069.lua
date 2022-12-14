-- 基础信息
local base_info = {
	group_id = 133310069
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 69001, monster_id = 28020108, pos = { x = -2179.233, y = 141.160, z = 4777.597 }, rot = { x = 0.000, y = 34.561, z = 0.000 }, level = 30, drop_tag = "走兽", area_id = 26 },
	{ config_id = 69002, monster_id = 28020108, pos = { x = -2226.537, y = 131.273, z = 4787.292 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, drop_tag = "走兽", area_id = 26 },
	{ config_id = 69003, monster_id = 28020108, pos = { x = -2265.777, y = 135.926, z = 4762.817 }, rot = { x = 0.000, y = 222.185, z = 0.000 }, level = 30, drop_tag = "走兽", area_id = 26 },
	{ config_id = 69004, monster_id = 28020108, pos = { x = -2217.472, y = 145.274, z = 4739.096 }, rot = { x = 0.000, y = 102.398, z = 0.000 }, level = 30, drop_tag = "走兽", area_id = 26 }
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
		monsters = { 69001, 69002, 69003, 69004 },
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