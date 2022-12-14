-- 基础信息
local base_info = {
	group_id = 133307380
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
	{ config_id = 380001, gadget_id = 70290008, pos = { x = -1687.808, y = -21.931, z = 5832.121 }, rot = { x = 355.424, y = 314.382, z = 351.432 }, level = 32, area_id = 32 },
	{ config_id = 380002, gadget_id = 70500000, pos = { x = -1687.808, y = -21.931, z = 5832.121 }, rot = { x = 355.423, y = 314.375, z = 351.432 }, level = 32, point_type = 3008, owner = 380001, area_id = 32 },
	{ config_id = 380003, gadget_id = 70290008, pos = { x = -1680.730, y = -21.771, z = 5841.012 }, rot = { x = 20.834, y = 175.587, z = 3.767 }, level = 32, area_id = 32 },
	{ config_id = 380004, gadget_id = 70500000, pos = { x = -1680.730, y = -21.771, z = 5841.012 }, rot = { x = 20.834, y = 175.591, z = 3.768 }, level = 32, point_type = 3008, owner = 380003, area_id = 32 },
	{ config_id = 380005, gadget_id = 70290008, pos = { x = -1634.765, y = -21.690, z = 5834.774 }, rot = { x = 350.910, y = 48.646, z = 4.426 }, level = 32, area_id = 32 },
	{ config_id = 380006, gadget_id = 70500000, pos = { x = -1634.765, y = -21.690, z = 5834.774 }, rot = { x = 350.910, y = 48.642, z = 4.426 }, level = 32, point_type = 3008, owner = 380005, area_id = 32 },
	{ config_id = 380008, gadget_id = 70500000, pos = { x = -1721.743, y = 1.289, z = 5847.210 }, rot = { x = 335.728, y = 43.538, z = 352.636 }, level = 32, point_type = 2002, area_id = 32 },
	{ config_id = 380009, gadget_id = 70500000, pos = { x = -1732.494, y = 1.066, z = 5845.504 }, rot = { x = 319.918, y = 305.949, z = 3.204 }, level = 32, point_type = 2002, area_id = 32 },
	{ config_id = 380010, gadget_id = 70500000, pos = { x = -1712.249, y = -2.313, z = 5826.576 }, rot = { x = 15.619, y = 110.296, z = 14.485 }, level = 32, point_type = 2045, area_id = 32 },
	{ config_id = 380011, gadget_id = 70500000, pos = { x = -1728.122, y = -2.025, z = 5833.795 }, rot = { x = 46.101, y = 56.490, z = 355.277 }, level = 32, point_type = 2045, area_id = 32 },
	{ config_id = 380012, gadget_id = 70500000, pos = { x = -1711.556, y = -1.666, z = 5836.587 }, rot = { x = 346.989, y = 95.994, z = 308.174 }, level = 32, point_type = 2045, area_id = 32 }
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
		gadgets = { 380001, 380002, 380003, 380004, 380005, 380006, 380008, 380009, 380010, 380011, 380012 },
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