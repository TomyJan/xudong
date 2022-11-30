CREATE TABLE `t_player_psn_online_id_data` (
	`psn_id` VARCHAR(64) NOT NULL,
	`online_id` VARCHAR(64) NOT NULL,
	`uid` INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY (`psn_id`),
	UNIQUE INDEX `uid` (`uid`),
	INDEX `online_id` (`online_id`)
)
COMMENT='ps用户psn_id到online_id/uid映射'
ENGINE=InnoDB
;
