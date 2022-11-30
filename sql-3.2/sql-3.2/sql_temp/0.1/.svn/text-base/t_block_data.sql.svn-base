CREATE TABLE `t_block_data_{idx}` (
  `uid` int(10) NOT NULL DEFAULT '0',
  `block_id` int(10) NOT NULL DEFAULT '0',
  `data_version` int(10) NOT NULL,
  `bin_data` mediumblob NOT NULL,
  `last_save_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  primary key (`uid`,`block_id`)
) 
COMMENT='场景block存档'
ENGINE=InnoDB
;
