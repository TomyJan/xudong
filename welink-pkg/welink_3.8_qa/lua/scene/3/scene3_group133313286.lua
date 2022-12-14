-- 基础信息
local base_info = {
	group_id = 133313286
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 286001, monster_id = 26100301, pos = { x = -113.837, y = 280.950, z = 5771.651 }, rot = { x = 0.000, y = 323.939, z = 0.000 }, level = 32, drop_tag = "高级镀金旅团", pose_id = 101, area_id = 32 },
	{ config_id = 286004, monster_id = 28060301, pos = { x = -107.582, y = 287.618, z = 5768.938 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, drop_tag = "鸟类", pose_id = 121, area_id = 32 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 286002, gadget_id = 70220103, pos = { x = -106.449, y = 281.530, z = 5760.995 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 286003, gadget_id = 70211001, pos = { x = -108.680, y = 277.622, z = 5765.733 }, rot = { x = 349.463, y = 156.119, z = 8.943 }, level = 26, drop_tag = "战斗低级须弥", isOneoff = true, persistent = true, explore = { name = "chest", exp = 10 }, area_id = 32 }
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
		monsters = { 286001, 286004 },
		gadgets = { 286002, 286003 },
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