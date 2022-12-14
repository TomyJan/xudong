-- 基础信息
local base_info = {
	group_id = 133310177
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
	{ config_id = 177003, gadget_id = 70330429, pos = { x = -2975.915, y = 313.618, z = 4633.509 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 177004, gadget_id = 70330428, pos = { x = -2975.063, y = 313.689, z = 4631.795 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 177005, gadget_id = 70330426, pos = { x = -2960.160, y = 312.096, z = 4641.101 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 177006, gadget_id = 70330426, pos = { x = -2959.376, y = 312.090, z = 4641.402 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 177007, gadget_id = 70330427, pos = { x = -2959.345, y = 312.113, z = 4640.402 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 28 },
	{ config_id = 177008, gadget_id = 70330396, pos = { x = -2979.608, y = 314.218, z = 4632.292 }, rot = { x = 5.304, y = 359.629, z = 351.995 }, level = 32, state = GadgetState.GearStart, area_id = 28 },
	{ config_id = 177010, gadget_id = 70210101, pos = { x = -2962.781, y = 312.644, z = 4641.073 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 26, drop_tag = "搜刮点解谜果蔬须弥", persistent = true, area_id = 28 }
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
		gadgets = { 177003, 177004, 177005, 177006, 177007, 177008, 177010 },
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