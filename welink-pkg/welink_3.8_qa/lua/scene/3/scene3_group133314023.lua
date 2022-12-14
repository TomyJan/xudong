-- 基础信息
local base_info = {
	group_id = 133314023
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
	-- 凋零entry
	{ config_id = 23001, gadget_id = 70360001, pos = { x = -700.071, y = 140.851, z = 4135.640 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, state = GadgetState.GearStop, area_id = 25 },
	-- 山顶entry，一路玩到机器人？
	{ config_id = 23002, gadget_id = 70360001, pos = { x = -287.710, y = 302.771, z = 4149.222 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, state = GadgetState.GearStop, area_id = 32 }
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
		gadgets = { 23001, 23002 },
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