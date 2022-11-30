CREATE TABLE `t_area_config` (
	`area_type` VARCHAR(64) NOT NULL COMMENT '地区类型' ,
	`business` VARCHAR(128) NOT NULL COMMENT '业务英文标识' ,
	`business_cn` VARCHAR(128) NOT NULL COMMENT '业务中文标识' ,
	PRIMARY KEY (`area_type`)
)
COMMENT='地区信息'
ENGINE=InnoDB
;


CREATE TABLE `t_authkey_config` (
	`version` INT(10) UNSIGNED NOT NULL COMMENT '密钥版本',
	`private_key` VARCHAR(4096) NOT NULL DEFAULT '' COMMENT '密钥' ,
	PRIMARY KEY (`version`)
)
COMMENT='密钥管理'
ENGINE=InnoDB
;


CREATE TABLE `t_client_config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`version` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '版本号' ,
	`name` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '版本名' ,
	`stop_server_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '停服配置' ,
	`client_custom_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '客户端自定义配置，服务器直接转发回客户端' ,
	`dispatch_seed` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '二级dispatch版本校验码' ,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `version` (`version`)
)
COMMENT='客户端配置'
ENGINE=InnoDB
;

CREATE TABLE `t_channel_id_config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`channel_id` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '渠道类型' ,
	`enable_login_pc` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '是否可以登陆PC' ,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `channel_id` (`channel_id`)
)
COMMENT='渠道配置'
ENGINE=InnoDB
;

CREATE TABLE `t_client_channel_id_config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`version` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '版本号' ,
	`channel_id` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '渠道类型' ,
	`sub_channel_id` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '子渠道类型' ,
	`force_update_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '强更配置' ,
	`stop_server_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '停服配置' ,
	PRIMARY KEY (`id`)
)
COMMENT='客户端渠道配置'
ENGINE=InnoDB
;


CREATE TABLE `t_anti_cheat_client_channel_id_config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`version` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '版本号' ,
	`channel_id` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '渠道类型' ,
	`is_forbid_login` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '是否禁止登录' ,
	`checksum` TEXT(65536) NOT NULL COMMENT 'checksum校验值' ,
	`anti_cheat_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '其他配置' ,
	PRIMARY KEY (`id`)
)
COMMENT='客户端渠道配置'
ENGINE=InnoDB
;

CREATE TABLE `t_psn_region_config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`psn_region` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'psn地区' ,
	`region_name` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '区服名称' ,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `psn_region` (`psn_region`)
)
COMMENT='psn对应区服配置'
ENGINE=InnoDB
;

CREATE TABLE `t_region_config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`name` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '分区名称' ,
	`title` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '显示名称' ,
	`region_type` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '分区类型，线上、审核等' ,
	`area_type` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '地区类型' ,
	`dispatch_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'dispatch的URL' ,
	`muipserver_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'muipserver的URL' ,
	`account_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '通行证URL, CB2后废弃' ,
	`account_url_bak` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '通行证URL备份, CB2后废弃' ,
    `sdk_env` INT(4) NOT NULL COMMENT 'CB2启用，0:国内正式环境 1:国内测试环境 2: 海外正式环境  3:海外测试环境' ,
	`account_inner_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '通行证玩家信息URL' ,
	`pay_callback_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '支付回调URL' ,
	`resource_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '资源URL' ,
	`resource_url_bak` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '资源url备份' ,
	`data_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '数据URL' ,
	`data_url_bak` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '数据url备份' ,
	`feedback_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '反馈URL运营方的需求' ,
	`bulletin_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '公告URL运营方的需求' ,
	`handbook_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '游戏指南url' ,
	`stop_server_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '停服配置' ,
	`stop_register_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '注册配置' ,
	`region_custom_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '客户端自定义配置，如果和client_config有字段冲突，则以client表为准' ,
	`client_secret_key` VARBINARY(4096) NOT NULL DEFAULT '' COMMENT '客户端首包加密密钥' ,
	`server_secret_key` VARBINARY(4096) NOT NULL DEFAULT '' COMMENT '服务端首包加密密钥' ,
	`official_community_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '官方社区URL' ,
	`psn_region` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '支持psn地区' ,
	`user_center_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '用户中心URL' ,
	`account_bind_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '帐户绑定URL' ,
	`cdkey_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '兑换码URL' ,
	`privacy_policy_url` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '隐私政策URL' ,
	`rsa_key_list` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '该区服允许的key_id_list，包含0时表示全部允许，以逗号隔开',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `name` (`name`)
)
ENGINE=InnoDB
;

CREATE TABLE `t_client_region_config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`client_version` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '版本号' ,
	`region_name` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '版本名' ,
	`client_region_custom_config_str` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '客户端区服自定义配置' ,
	PRIMARY KEY (`id`),
	INDEX `client_version` (`client_version`),
	INDEX `region_name` (`region_name`),
	CONSTRAINT `client_version` FOREIGN KEY (`client_version`) REFERENCES `t_client_config` (`version`),
	CONSTRAINT `region_name` FOREIGN KEY (`region_name`) REFERENCES `t_region_config` (`name`)
)
COMMENT='客户端对应分区配置'
ENGINE=InnoDB
;


CREATE TABLE `t_bind_config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`client_version` VARCHAR(64) NOT NULL COMMENT '客户端版本号' ,
	`region_name` VARCHAR(64) NOT NULL COMMENT '绑定的服务器分区' ,
	`channel_id` VARCHAR(64) NOT NULL COMMENT '渠道类型',
	PRIMARY KEY (`id`),
	INDEX `FK_t_bind_config_t_client_config` (`client_version`),
	INDEX `FK_t_bind_config_t_region_config` (`region_name`),
	CONSTRAINT `FK_t_bind_config_t_client_config` FOREIGN KEY (`client_version`) REFERENCES `t_client_config` (`version`),
	CONSTRAINT `FK_t_bind_config_t_region_config` FOREIGN KEY (`region_name`) REFERENCES `t_region_config` (`name`)
)
COMMENT='客户端、服务器绑定关系'
ENGINE=InnoDB
;


CREATE TABLE `t_login_white_ip_config` (
	`ip` VARCHAR(32) NOT NULL ,
	`desc` VARCHAR(32) NOT NULL ,
	PRIMARY KEY (`ip`)
)
COMMENT='登入IP白名单列表'
ENGINE=InnoDB
;


CREATE TABLE `t_deploy_textmap_config` (
	`text_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'textmap的key',
	`en` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '英文' ,
	`sc` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '简体中文' ,
	`tc` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '繁体中文' ,
	`fr` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '法语' ,
	`de` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '德语' ,
	`es` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '西班牙语' ,
	`pt` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '葡萄牙语' ,
	`ru` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '俄语' ,
	`jp` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '日语' ,
	`kr` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '韩语' ,
	`th` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '泰文' ,
	`vn` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '越南语' ,
	`id` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '印尼语' ,
	`tr` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '土耳其语' ,
	`it` VARCHAR(512) NOT NULL DEFAULT '' COMMENT '意大利语' ,
	PRIMARY KEY (`text_id`)
)
COMMENT='服务端的textmap一般用于停服强更等多文本，需要控制条目，因为全部加载到内存中'
ENGINE=InnoDB
;

CREATE TABLE `t_sdk_config` (
	`sdkenv` INT(10) UNSIGNED NOT NULL COMMENT 'sdk环境编号',
	`app_id` INT(10) UNSIGNED NOT NULL,
	`account_key` VARCHAR(512) NOT NULL COMMENT '账号校验key',
	`account_url` VARCHAR(512) NOT NULL COMMENT '账号校验url',
	`recharge_key` VARCHAR(512) NOT NULL COMMENT '支付校验key',
	`desc` VARCHAR(512) NOT NULL COMMENT '描述文本',
	PRIMARY KEY (`sdkenv`)
)
COMMENT='配置sdk环境相关的配置'
ENGINE=InnoDB
;

CREATE TABLE `t_security_file_config` (
	`file_key` VARCHAR(64)   NOT NULL ,
	`file_data` BLOB NOT NULL COMMENT '安全dispatch文件内容',
	PRIMARY KEY (`file_key`)
)
COMMENT='安全dispatch文件配置'
ENGINE=InnoDB
;

CREATE TABLE `t_rsakey_config` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '密钥对id',
    `client_public_key` VARCHAR(4096) NOT NULL DEFAULT '' COMMENT '客户端公钥',
    `server_private_key` VARCHAR(4096) NOT NULL DEFAULT '' COMMENT '服务器私钥',
    PRIMARY KEY (`id`)
)
COMMENT='非对称加密密钥'
ENGINE=InnoDB
;
