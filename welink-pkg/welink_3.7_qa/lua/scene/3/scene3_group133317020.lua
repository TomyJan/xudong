-- 基础信息
local base_info = {
	group_id = 133317020
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 20002, monster_id = 25010201, pos = { x = 945.659, y = 357.351, z = 5923.417 }, rot = { x = 0.000, y = 349.248, z = 0.000 }, level = 32, drop_tag = "盗宝团", area_id = 30 },
	{ config_id = 20003, monster_id = 25010201, pos = { x = 941.913, y = 357.979, z = 5928.744 }, rot = { x = 0.000, y = 129.616, z = 0.000 }, level = 32, drop_tag = "盗宝团", area_id = 30 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 20001, gadget_id = 70211001, pos = { x = 941.698, y = 357.722, z = 5925.848 }, rot = { x = 358.537, y = 99.362, z = 5.541 }, level = 26, drop_tag = "战斗低级须弥", isOneoff = true, persistent = true, explore = { name = "chest", exp = 10 }, area_id = 30 }
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
		monsters = { 20002, 20003 },
		gadgets = { 20001 },
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