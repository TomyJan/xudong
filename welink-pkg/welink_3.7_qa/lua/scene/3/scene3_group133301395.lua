-- 基础信息
local base_info = {
	group_id = 133301395
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	-- 限高5米
	{ config_id = 395001, gadget_id = 70800132, pos = { x = -297.277, y = 200.030, z = 3568.164 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 27, persistent = true, fishing_id = 4005, fishing_areas = { 300060, 300067 }, area_id = 29 }
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
		monsters = { },
		gadgets = { 395001 },
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