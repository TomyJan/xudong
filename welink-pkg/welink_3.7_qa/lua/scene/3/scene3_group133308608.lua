-- 基础信息
local base_info = {
	group_id = 133308608
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
	{ config_id = 608003, gadget_id = 70330450, pos = { x = -1375.000, y = 246.305, z = 4078.252 }, rot = { x = 357.190, y = 359.855, z = 5.915 }, level = 32, area_id = 26 },
	{ config_id = 608004, gadget_id = 70500000, pos = { x = -1375.000, y = 246.305, z = 4078.252 }, rot = { x = 357.190, y = 359.855, z = 5.915 }, level = 32, point_type = 3012, owner = 608003, area_id = 26 }
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
		{ config_id = 608001, gadget_id = 70330450, pos = { x = -1375.000, y = 246.305, z = 4078.252 }, rot = { x = 357.190, y = 359.855, z = 5.915 }, level = 32, area_id = 26 },
		{ config_id = 608002, gadget_id = 70500000, pos = { x = -1375.000, y = 246.305, z = 4078.252 }, rot = { x = 357.190, y = 359.855, z = 5.915 }, level = 32, point_type = 3012, owner = 608001, area_id = 26 }
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
		gadgets = { 608003, 608004 },
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