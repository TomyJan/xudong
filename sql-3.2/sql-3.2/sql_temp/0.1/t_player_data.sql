CREATE TABLE `t_player_data_{idx}` (
	`uid` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`nickname` VARCHAR(128)  NOT NULL DEFAULT '0' ,
	`level` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`exp` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`vip_point` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`json_data` VARCHAR(512)   NOT NULL DEFAULT '' ,
	`bin_data` MEDIUMBLOB NOT NULL,
	`extra_bin_data` BLOB NULL COMMENT 'login前用的数据',
	`data_version` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`tag_list` VARCHAR(128)  NOT NULL DEFAULT '' ,
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`last_save_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`is_delete` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '是否为polardb扩容后废弃数据',
	`reserved_1` INT(10) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段1',
	`reserved_2` INT(10) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段2',
	`before_login_bin_data` BLOB NULL COMMENT 'login前用的数据（对比extra_bin_data没有多写的问题）',
	PRIMARY KEY (`uid`) USING BTREE
)
COMMENT='玩家核心数据包'
ENGINE=InnoDB
;
