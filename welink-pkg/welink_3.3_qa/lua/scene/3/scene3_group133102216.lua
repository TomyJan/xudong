-- 基础信息
local base_info = {
	group_id = 133102216
}

-- Trigger变量
local defs = {
	gadget_prison = 216001,
	duration = 210,
	rampage_time = 40,
	eye_point = 216079
}

-- DEFS_MISCS
local energy_info = {
        [1] = { time = 100, step = {-30,30},points = { 216084, 216085, 216086, 216087, 216088, 216089}},
        --[2] = { time = 180, step = {-1,1},points = {5075,5076,5077,5078,5079,5080}},
}
--这个group对应的图用哪些，这里就填哪些（对应关系请咨询TD）
local disguiseList = {2,32,33}

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
	[216001] = { config_id = 216001, gadget_id = 70800087, pos = { x = 1718.296, y = 246.374, z = 643.555 }, rot = { x = 0.000, y = 299.643, z = 0.000 }, level = 10, area_id = 5 },
	[216002] = { config_id = 216002, gadget_id = 70800432, pos = { x = 1708.600, y = 247.015, z = 588.673 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216003] = { config_id = 216003, gadget_id = 70800432, pos = { x = 1708.854, y = 247.001, z = 584.404 }, rot = { x = 0.000, y = 20.000, z = 0.000 }, level = 10, area_id = 5 },
	[216004] = { config_id = 216004, gadget_id = 70800432, pos = { x = 1720.672, y = 246.998, z = 595.575 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216005] = { config_id = 216005, gadget_id = 70800107, pos = { x = 1717.272, y = 268.000, z = 582.248 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 5 },
	[216006] = { config_id = 216006, gadget_id = 70800432, pos = { x = 1727.109, y = 247.057, z = 592.462 }, rot = { x = 0.000, y = 30.000, z = 0.000 }, level = 10, area_id = 5 },
	[216007] = { config_id = 216007, gadget_id = 70800432, pos = { x = 1698.549, y = 247.071, z = 599.321 }, rot = { x = 0.000, y = 11.000, z = 0.000 }, level = 10, area_id = 5 },
	[216008] = { config_id = 216008, gadget_id = 70800432, pos = { x = 1697.942, y = 247.827, z = 597.866 }, rot = { x = 0.000, y = 55.000, z = 0.000 }, level = 10, area_id = 5 },
	[216009] = { config_id = 216009, gadget_id = 70800432, pos = { x = 1708.050, y = 247.827, z = 591.651 }, rot = { x = 0.000, y = 55.000, z = 0.000 }, level = 10, area_id = 5 },
	[216010] = { config_id = 216010, gadget_id = 70800432, pos = { x = 1687.551, y = 248.101, z = 607.001 }, rot = { x = 0.000, y = 55.000, z = 0.000 }, level = 10, area_id = 5 },
	[216011] = { config_id = 216011, gadget_id = 70800432, pos = { x = 1722.614, y = 246.960, z = 616.754 }, rot = { x = 0.000, y = 60.000, z = 0.000 }, level = 10, area_id = 5 },
	[216012] = { config_id = 216012, gadget_id = 70800432, pos = { x = 1704.417, y = 246.935, z = 601.616 }, rot = { x = 0.000, y = 60.000, z = 0.000 }, level = 10, area_id = 5 },
	[216013] = { config_id = 216013, gadget_id = 70800432, pos = { x = 1724.273, y = 247.046, z = 612.651 }, rot = { x = 0.000, y = 60.000, z = 0.000 }, level = 10, area_id = 5 },
	[216014] = { config_id = 216014, gadget_id = 70800432, pos = { x = 1710.257, y = 247.016, z = 594.680 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216020] = { config_id = 216020, gadget_id = 70800433, pos = { x = 1722.998, y = 247.129, z = 625.661 }, rot = { x = 0.000, y = 30.000, z = 0.000 }, level = 10, area_id = 5 },
	[216022] = { config_id = 216022, gadget_id = 70800433, pos = { x = 1725.200, y = 247.804, z = 628.777 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216023] = { config_id = 216023, gadget_id = 70800433, pos = { x = 1696.715, y = 247.138, z = 599.732 }, rot = { x = 0.000, y = 67.981, z = 0.000 }, level = 10, area_id = 5 },
	[216025] = { config_id = 216025, gadget_id = 70800433, pos = { x = 1712.424, y = 247.015, z = 597.378 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216026] = { config_id = 216026, gadget_id = 70800433, pos = { x = 1712.717, y = 247.038, z = 591.409 }, rot = { x = 0.000, y = 160.000, z = 0.000 }, level = 10, area_id = 5 },
	[216027] = { config_id = 216027, gadget_id = 70800433, pos = { x = 1721.925, y = 247.015, z = 597.864 }, rot = { x = 0.000, y = 160.000, z = 0.000 }, level = 10, area_id = 5 },
	[216028] = { config_id = 216028, gadget_id = 70800433, pos = { x = 1702.570, y = 248.014, z = 627.446 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216029] = { config_id = 216029, gadget_id = 70800433, pos = { x = 1697.773, y = 246.960, z = 623.578 }, rot = { x = 0.000, y = 90.000, z = 0.000 }, level = 10, area_id = 5 },
	[216030] = { config_id = 216030, gadget_id = 70800433, pos = { x = 1693.450, y = 238.968, z = 639.442 }, rot = { x = 0.000, y = 30.025, z = 0.000 }, level = 10, area_id = 5 },
	[216031] = { config_id = 216031, gadget_id = 70800433, pos = { x = 1726.378, y = 247.478, z = 615.705 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216032] = { config_id = 216032, gadget_id = 70800433, pos = { x = 1680.296, y = 239.289, z = 643.550 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216037] = { config_id = 216037, gadget_id = 44000251, pos = { x = 1706.923, y = 246.974, z = 606.469 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216038] = { config_id = 216038, gadget_id = 44000251, pos = { x = 1689.459, y = 237.626, z = 652.808 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 10, area_id = 5 },
	[216039] = { config_id = 216039, gadget_id = 44000251, pos = { x = 1724.872, y = 245.760, z = 637.538 }, rot = { x = 0.000, y = 328.236, z = 0.000 }, level = 10, area_id = 5 },
	[216040] = { config_id = 216040, gadget_id = 44000251, pos = { x = 1729.475, y = 246.190, z = 622.352 }, rot = { x = 0.000, y = 268.833, z = 0.000 }, level = 10, area_id = 5 },
	[216041] = { config_id = 216041, gadget_id = 44000251, pos = { x = 1724.836, y = 244.541, z = 653.232 }, rot = { x = 0.000, y = 227.629, z = 0.000 }, level = 10, area_id = 5 },
	[216042] = { config_id = 216042, gadget_id = 44000251, pos = { x = 1729.392, y = 246.582, z = 616.336 }, rot = { x = 0.000, y = 297.955, z = 0.000 }, level = 10, area_id = 5 },
	[216043] = { config_id = 216043, gadget_id = 44000251, pos = { x = 1704.751, y = 241.858, z = 655.231 }, rot = { x = 0.000, y = 165.660, z = 0.000 }, level = 10, area_id = 5 },
	[216044] = { config_id = 216044, gadget_id = 44000251, pos = { x = 1670.937, y = 238.124, z = 636.310 }, rot = { x = 0.000, y = 40.000, z = 0.000 }, level = 10, area_id = 5 },
	[216046] = { config_id = 216046, gadget_id = 44000251, pos = { x = 1710.561, y = 247.269, z = 625.238 }, rot = { x = 0.000, y = 107.799, z = 0.000 }, level = 10, area_id = 5 },
	[216047] = { config_id = 216047, gadget_id = 44000251, pos = { x = 1673.066, y = 237.583, z = 652.507 }, rot = { x = 0.000, y = 134.021, z = 0.000 }, level = 10, area_id = 5 },
	[216048] = { config_id = 216048, gadget_id = 44000251, pos = { x = 1685.006, y = 237.178, z = 656.742 }, rot = { x = 0.000, y = 166.575, z = 0.000 }, level = 10, area_id = 5 },
	[216049] = { config_id = 216049, gadget_id = 44000251, pos = { x = 1675.932, y = 237.480, z = 654.714 }, rot = { x = 0.000, y = 328.563, z = 0.000 }, level = 10, area_id = 5 },
	[216066] = { config_id = 216066, gadget_id = 70800414, pos = { x = 1701.074, y = 246.494, z = 619.292 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, level = 1, area_id = 5 }
}

-- 区域
regions = {
	[216078] = { config_id = 216078, shape = RegionShape.SPHERE, radius = 200, pos = { x = 1717.707, y = 246.471, z = 597.828 }, area_id = 5 },
	[216079] = { config_id = 216079, shape = RegionShape.SPHERE, radius = 80, pos = { x = 1695.653, y = 240.264, z = 600.993 }, area_id = 5 }
}

-- 触发器
triggers = {
}

-- 点位
points = {
	-- 场景猎手出生点
	{ config_id = 216080, pos = { x = 1718.316, y = 245.604, z = 642.142 }, rot = { x = 0.000, y = 187.579, z = 0.000 }, area_id = 5 },
	-- 场景游侠出生点1
	{ config_id = 216081, pos = { x = 1714.636, y = 246.952, z = 635.262 }, rot = { x = 7.514, y = 162.720, z = 1.961 }, area_id = 5 },
	-- 场景游侠出生点2
	{ config_id = 216082, pos = { x = 1716.008, y = 246.936, z = 635.439 }, rot = { x = 6.585, y = 174.741, z = 3.377 }, area_id = 5 },
	-- 场景游侠出生点3
	{ config_id = 216083, pos = { x = 1717.802, y = 246.918, z = 635.450 }, rot = { x = 7.588, y = 169.180, z = 2.848 }, area_id = 5 },
	-- 能量随机点1
	{ config_id = 216084, pos = { x = 1674.389, y = 246.532, z = 616.039 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 5 },
	-- 能量随机点1
	{ config_id = 216085, pos = { x = 1706.013, y = 243.863, z = 645.383 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 5 },
	-- 能量随机点1
	{ config_id = 216086, pos = { x = 1726.033, y = 247.693, z = 621.802 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 5 },
	-- 能量随机点1
	{ config_id = 216087, pos = { x = 1696.966, y = 246.925, z = 604.109 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 5 },
	-- 能量随机点1
	{ config_id = 216088, pos = { x = 1718.502, y = 246.945, z = 586.697 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 5 },
	-- 能量随机点1
	{ config_id = 216089, pos = { x = 1679.057, y = 237.441, z = 650.865 }, rot = { x = 0.000, y = 0.000, z = 0.000 }, area_id = 5 }
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
		gadgets = { 216001 },
		regions = { 216078, 216079 },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = ,
		monsters = { },
		gadgets = { 216002, 216003, 216004, 216006, 216007, 216008, 216009, 216010, 216011, 216012, 216013, 216014, 216020, 216022, 216023, 216025, 216026, 216027, 216028, 216029, 216030, 216031, 216032, 216037, 216038, 216039, 216040, 216041, 216042, 216043, 216044, 216046, 216047, 216048, 216049 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = ,
		monsters = { },
		gadgets = { 216005, 216066 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 4,
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

require "V3_3/HideAndSeek_Gallery_V3"
require "V3_3/HideAndSeek_Skill_V3"