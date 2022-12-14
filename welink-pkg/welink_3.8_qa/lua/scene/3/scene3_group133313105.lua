-- 基础信息
local base_info = {
	group_id = 133313105
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
	{ config_id = 105001, gadget_id = 70290624, pos = { x = -467.813, y = 146.716, z = 5929.337 }, rot = { x = 352.168, y = 95.107, z = 347.909 }, level = 32, area_id = 32 },
	{ config_id = 105002, gadget_id = 70290624, pos = { x = -479.362, y = 137.725, z = 5905.416 }, rot = { x = 344.176, y = 57.309, z = 351.663 }, level = 32, area_id = 32 },
	{ config_id = 105003, gadget_id = 70290624, pos = { x = -495.900, y = 141.312, z = 5926.468 }, rot = { x = 346.985, y = 55.899, z = 348.864 }, level = 32, area_id = 32 },
	{ config_id = 105004, gadget_id = 70290625, pos = { x = -480.822, y = 142.142, z = 5922.178 }, rot = { x = 343.839, y = 83.162, z = 349.893 }, level = 32, area_id = 32 }
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
		gadgets = { 105001, 105002, 105003, 105004 },
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