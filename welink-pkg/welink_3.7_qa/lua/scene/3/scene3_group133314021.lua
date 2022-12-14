-- 基础信息
local base_info = {
	group_id = 133314021
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
}

-- 区域
regions = {
	-- 赤王洞下层
	{ config_id = 21001, shape = RegionShape.CUBIC, size = { x = 380.000, y = 100.000, z = 400.000 }, pos = { x = -861.589, y = -148.457, z = 4976.521 }, area_id = 32, vision_type_list = { 33140002 } },
	-- 赤王洞上层
	{ config_id = 21002, shape = RegionShape.CUBIC, size = { x = 380.000, y = 125.000, z = 400.000 }, pos = { x = -861.589, y = -34.024, z = 4976.521 }, area_id = 32, vision_type_list = { 33140001 } },
	-- 赤王洞上下交界
	{ config_id = 21003, shape = RegionShape.CUBIC, size = { x = 120.000, y = 120.000, z = 100.000 }, pos = { x = -775.822, y = -91.937, z = 4898.582 }, area_id = 32, vision_type_list = { 33140009 } },
	-- 赤王洞门口
	{ config_id = 21004, shape = RegionShape.CUBIC, size = { x = 100.000, y = 120.000, z = 200.000 }, pos = { x = -984.698, y = 24.779, z = 4780.658 }, area_id = 32, vision_type_list = { 33140006 } }
}

-- 触发器
triggers = {
	-- 赤王洞门口
	{ config_id = 1021004, name = "ENTER_REGION_21004", event = EventType.EVENT_ENTER_REGION, source = "", condition = "", action = "" }
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
		gadgets = { },
		regions = { 21001, 21002, 21003, 21004 },
		triggers = { "ENTER_REGION_21004" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================