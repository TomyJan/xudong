-- 基础信息
local base_info = {
	group_id = 133303433
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
	{ config_id = 433001, gadget_id = 70300105, pos = { x = -1744.918, y = 287.358, z = 3930.982 }, rot = { x = 354.822, y = 241.015, z = 353.678 }, level = 1, area_id = 26 },
	{ config_id = 433003, gadget_id = 70710852, pos = { x = -1769.021, y = 291.293, z = 3939.016 }, rot = { x = 0.838, y = 58.103, z = 358.439 }, level = 1, area_id = 26 },
	{ config_id = 433004, gadget_id = 71700431, pos = { x = -1756.434, y = 290.288, z = 3933.540 }, rot = { x = 0.000, y = 13.174, z = 0.000 }, level = 1, area_id = 26 },
	{ config_id = 433005, gadget_id = 70310006, pos = { x = -1755.538, y = 291.300, z = 3921.951 }, rot = { x = 5.963, y = 0.000, z = 0.000 }, level = 1, area_id = 26 },
	{ config_id = 433006, gadget_id = 71700431, pos = { x = -1771.572, y = 290.176, z = 3938.180 }, rot = { x = 0.000, y = 244.489, z = 0.000 }, level = 1, drop_id = 1000100, drop_count = 1, vision_level = VisionLevelType.VISION_LEVEL_NEARBY, area_id = 26 },
	{ config_id = 433008, gadget_id = 70310479, pos = { x = -1755.068, y = 289.666, z = 3931.702 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, state = GadgetState.GearStart, area_id = 26 }
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
		gadgets = { 433001, 433003, 433004, 433005, 433006, 433008 },
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