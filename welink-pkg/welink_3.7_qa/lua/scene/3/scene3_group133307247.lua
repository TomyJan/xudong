-- 基础信息
local base_info = {
	group_id = 133307247
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
	{ config_id = 247001, gadget_id = 70220103, pos = { x = -1213.648, y = 44.207, z = 5259.101 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 247002, gadget_id = 70220103, pos = { x = -1215.470, y = 56.476, z = 5245.646 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 247005, gadget_id = 70220103, pos = { x = -1215.362, y = 65.568, z = 5222.440 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 247006, gadget_id = 70220103, pos = { x = -1221.223, y = 62.373, z = 5339.896 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 }
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

-- 废弃数据
garbages = {
	gadgets = {
		{ config_id = 247003, gadget_id = 70220103, pos = { x = -1205.648, y = 70.883, z = 5228.528 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
		{ config_id = 247004, gadget_id = 70220103, pos = { x = -1207.752, y = 66.287, z = 5198.716 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 }
	}
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
		gadgets = { 247001, 247002, 247005, 247006 },
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