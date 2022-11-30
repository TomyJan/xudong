CREATE TABLE `t_player_online_id_data` (
	`online_id` VARCHAR(64) NOT NULL,
	`uid` INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY (`online_id`) USING BTREE,
	UNIQUE INDEX `uid` (`uid`)
)
COMMENT='PS玩家online与uid映射'
ENGINE=InnoDB
;
