-- 基础信息
local base_info = {
	group_id = 133303188
}

-- DEFS_MISCS
local defs = 
{
	--升降水面--
	rootWaterTable = 
	{[188001] = 330300001,
	},
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
	{ config_id = 188001, gadget_id = 70310225, pos = { x = -1728.200, y = 102.300, z = 3240.000 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 30, start_route = false, is_use_point_array = true, vision_level = VisionLevelType.VISION_LEVEL_REMOTE, area_id = 23 }
}

-- 区域
regions = {
}

-- 触发器
triggers = {
}

-- 变量
variables = {
	{ config_id = 1, name = "waterStatus", value = 0, no_refresh = true }
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
		gadgets = { 188001 },
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

require "V3_0/VarunaStandard"