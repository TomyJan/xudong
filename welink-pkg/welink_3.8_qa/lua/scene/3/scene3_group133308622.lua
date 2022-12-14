-- 基础信息
local base_info = {
	group_id = 133308622
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 622001, monster_id = 28020108, pos = { x = -1908.271, y = 359.176, z = 4313.968 }, rot = { x = 0.000, y = 321.973, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 26 },
	{ config_id = 622002, monster_id = 28020108, pos = { x = -1898.919, y = 358.321, z = 4329.549 }, rot = { x = 0.000, y = 258.196, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 26 },
	{ config_id = 622003, monster_id = 28020108, pos = { x = -1882.137, y = 363.258, z = 4325.682 }, rot = { x = 0.000, y = 60.078, z = 0.000 }, level = 32, drop_tag = "走兽", area_id = 26 }
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
		monsters = { 622001, 622002, 622003 },
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