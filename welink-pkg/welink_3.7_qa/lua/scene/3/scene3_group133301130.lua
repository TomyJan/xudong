-- 基础信息
local base_info = {
	group_id = 133301130
}

--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 130001, monster_id = 26090201, pos = { x = -391.514, y = 250.328, z = 3422.319 }, rot = { x = 0.000, y = 348.769, z = 0.000 }, level = 27, drop_tag = "蕈兽", disableWander = true, pose_id = 102, area_id = 22 },
	{ config_id = 130002, monster_id = 26090201, pos = { x = -394.127, y = 250.515, z = 3423.998 }, rot = { x = 0.000, y = 70.249, z = 0.000 }, level = 27, drop_tag = "蕈兽", disableWander = true, pose_id = 102, area_id = 22 },
	{ config_id = 130003, monster_id = 26090801, pos = { x = -379.936, y = 260.933, z = 3419.297 }, rot = { x = 0.000, y = 162.559, z = 0.000 }, level = 27, drop_tag = "蕈兽", disableWander = true, pose_id = 101, area_id = 22 },
	{ config_id = 130004, monster_id = 26120101, pos = { x = -407.613, y = 248.587, z = 3399.412 }, rot = { x = 0.000, y = 162.058, z = 0.000 }, level = 27, drop_tag = "大蕈兽", disableWander = true, pose_id = 102, area_id = 22 }
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
		monsters = { 130001, 130002, 130003, 130004 },
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