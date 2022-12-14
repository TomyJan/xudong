-- 基础信息
local base_info = {
	group_id = 133307207
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
	{ config_id = 207001, gadget_id = 70710871, pos = { x = -1533.205, y = 25.134, z = 5157.055 }, rot = { x = 0.000, y = 12.851, z = 0.000 }, level = 30, area_id = 32 },
	{ config_id = 207002, gadget_id = 70710871, pos = { x = -1547.955, y = 49.362, z = 5015.373 }, rot = { x = 0.000, y = 5.430, z = 0.000 }, level = 1, area_id = 32 },
	{ config_id = 207003, gadget_id = 70710872, pos = { x = -1548.061, y = 49.362, z = 5014.185 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 32 },
	{ config_id = 207004, gadget_id = 70710876, pos = { x = -1548.556, y = 50.132, z = 5015.417 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 32 },
	{ config_id = 207005, gadget_id = 70950162, pos = { x = -1547.865, y = 50.132, z = 5015.304 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 32 },
	{ config_id = 207006, gadget_id = 71700567, pos = { x = -1547.649, y = 50.132, z = 5015.220 }, rot = { x = 0.000, y = 199.050, z = 0.000 }, level = 1, area_id = 32 },
	{ config_id = 207007, gadget_id = 71700567, pos = { x = -1547.846, y = 50.132, z = 5015.433 }, rot = { x = 0.000, y = 173.543, z = 0.000 }, level = 1, area_id = 32 },
	{ config_id = 207008, gadget_id = 70710157, pos = { x = -1533.304, y = 25.904, z = 5157.031 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 207009, gadget_id = 70710876, pos = { x = -1532.638, y = 25.904, z = 5156.921 }, rot = { x = 0.000, y = 7.421, z = 0.000 }, level = 30, area_id = 32 },
	{ config_id = 207010, gadget_id = 70950162, pos = { x = -1533.721, y = 25.904, z = 5157.165 }, rot = { x = 0.000, y = 354.111, z = 0.000 }, level = 30, area_id = 32 },
	{ config_id = 207011, gadget_id = 70300094, pos = { x = -1540.464, y = 49.362, z = 5010.743 }, rot = { x = 0.000, y = 66.696, z = 0.000 }, level = 1, area_id = 32 },
	{ config_id = 207012, gadget_id = 70710836, pos = { x = -1533.549, y = 25.134, z = 5155.834 }, rot = { x = 0.000, y = 13.970, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 207013, gadget_id = 70710160, pos = { x = -1531.744, y = 25.134, z = 5156.332 }, rot = { x = 0.000, y = 6.473, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 207014, gadget_id = 70540046, pos = { x = -1531.719, y = 25.532, z = 5156.376 }, rot = { x = 0.000, y = 6.473, z = 0.000 }, level = 32, area_id = 32 },
	{ config_id = 207015, gadget_id = 71700226, pos = { x = -1534.624, y = 25.134, z = 5147.983 }, rot = { x = 0.000, y = 320.560, z = 0.000 }, level = 32, area_id = 32 }
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
		gadgets = { 207001, 207002, 207003, 207004, 207005, 207006, 207007, 207008, 207009, 207010, 207011, 207012, 207013, 207014, 207015 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = ,
		monsters = { },
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