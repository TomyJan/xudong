-- 基础信息
local base_info = {
	group_id = 133310459
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 459002, monster_id = 28020108, pos = { x = -2171.333, y = 209.613, z = 4634.048 }, rot = { x = 0.000, y = 258.196, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 26 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
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
	monsters = {
		{ config_id = 459001, monster_id = 28020108, pos = { x = -2184.002, y = 216.644, z = 4607.692 }, rot = { x = 0.000, y = 67.433, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 26 }
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
		monsters = { 459002 },
		gadgets = { },
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