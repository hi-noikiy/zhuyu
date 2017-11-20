DROP TABLE IF EXISTS ims_abc_replace;
CREATE TABLE `ims_abc_replace` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `replace` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO ims_abc_replace VALUES 
('1','#用户ID#','uid','0'),
('2','#用户名#','username','0'),
('3','#会员组#','groupid','0'),
('4','#积分#','credit1','0'),
('5','#余额#','credit2','0'),
('6','#真实姓名#','realname','0'),
('7','#昵称#','nickname','0'),
('8','#头像#','avatar','0'),
('9','#qq#','qq','0'),
('10','#推荐人#','father','0'),
('11','#二级推荐人#','grandpa','0'),
('12','#三级推荐人#','grandfather','0');


DROP TABLE IF EXISTS ims_account;
CREATE TABLE `ims_account` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `isconnect` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

INSERT INTO ims_account VALUES 
('1','1','uRr8qvQV','1','0');


DROP TABLE IF EXISTS ims_account_wechats;
CREATE TABLE `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL DEFAULT '1',
  `subscribeurl` varchar(120) NOT NULL,
  `topad` varchar(225) NOT NULL,
  `footad` varchar(225) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  `jsapi_ticket` varchar(1000) NOT NULL,
  `card_ticket` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO ims_account_wechats VALUES 
('1','1','omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP','','0','weizan','','','','','','','','','0','','','1','','','','','','','');


DROP TABLE IF EXISTS ims_account_yixin;
CREATE TABLE `ims_account_yixin` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `access_token` varchar(1000) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity;
CREATE TABLE `ims_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ac_pic` varchar(100) NOT NULL,
  `begintime` int(11) unsigned DEFAULT NULL,
  `endtime` int(11) unsigned DEFAULT NULL,
  `createtime` int(11) unsigned DEFAULT NULL,
  `countlimit` int(5) NOT NULL,
  `countvirtual` int(5) DEFAULT '0',
  `visitsCount` int(11) DEFAULT '0',
  `ppt1` varchar(100) DEFAULT NULL,
  `ppt2` varchar(100) DEFAULT NULL,
  `ppt3` varchar(100) DEFAULT NULL,
  `acdes` varchar(500) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL,
  `location_p` varchar(100) NOT NULL COMMENT '所在地区_省',
  `location_c` varchar(100) NOT NULL COMMENT '所在地区_市',
  `location_a` varchar(100) NOT NULL COMMENT '所在地区_区',
  `lng` decimal(18,10) NOT NULL DEFAULT '0.0000000000',
  `lat` decimal(18,10) NOT NULL DEFAULT '0.0000000000',
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `zb` varchar(50) DEFAULT NULL,
  `cb` varchar(50) DEFAULT NULL,
  `xb` varchar(50) DEFAULT NULL,
  `cjdx` varchar(50) DEFAULT NULL,
  `hoteldesc` varchar(500) DEFAULT NULL,
  `costdes` varchar(500) DEFAULT NULL,
  `isrepeat` int(1) DEFAULT '0',
  `istip` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_clerks;
CREATE TABLE `ims_activity_clerks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_coupon;
CREATE TABLE `ims_activity_coupon` (
  `couponid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `title` varchar(30) NOT NULL DEFAULT '',
  `couponsn` varchar(50) NOT NULL,
  `description` text,
  `discount` decimal(10,2) NOT NULL,
  `condition` decimal(10,2) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '0',
  `dosage` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) unsigned NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `credittype` varchar(20) NOT NULL,
  `use_module` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`couponid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_coupon_allocation;
CREATE TABLE `ims_activity_coupon_allocation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`couponid`,`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_coupon_modules;
CREATE TABLE `ims_activity_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_coupon_password;
CREATE TABLE `ims_activity_coupon_password` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(200) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_coupon_record;
CREATE TABLE `ims_activity_coupon_record` (
  `recid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `grantmodule` varchar(50) NOT NULL DEFAULT '',
  `granttime` int(10) unsigned NOT NULL DEFAULT '0',
  `usemodule` varchar(50) NOT NULL DEFAULT '',
  `usetime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remark` varchar(300) NOT NULL DEFAULT '',
  `couponid` int(10) unsigned NOT NULL,
  `operator` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `clerk_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recid`),
  KEY `couponid` (`uid`,`grantmodule`,`usemodule`,`status`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_day;
CREATE TABLE `ims_activity_day` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) unsigned DEFAULT NULL,
  `daytime` int(11) unsigned DEFAULT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `ddes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_exchange;
CREATE TABLE `ims_activity_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `extra` varchar(3000) NOT NULL DEFAULT '',
  `credit` int(10) unsigned NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `pretotal` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) NOT NULL,
  `couponid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_exchange_trades;
CREATE TABLE `ims_activity_exchange_trades` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`,`uid`,`exid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_exchange_trades_shipping;
CREATE TABLE `ims_activity_exchange_trades_shipping` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_guest;
CREATE TABLE `ims_activity_guest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) unsigned DEFAULT NULL,
  `gname` varchar(20) NOT NULL,
  `jobtitle` varchar(20) NOT NULL,
  `gdesc` varchar(500) NOT NULL,
  `sig` varchar(20) NOT NULL,
  `headimage` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='嘉宾';



DROP TABLE IF EXISTS ims_activity_mail;
CREATE TABLE `ims_activity_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `weid` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_modules;
CREATE TABLE `ims_activity_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `available` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `uniacid` (`uniacid`),
  KEY `module` (`module`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_modules_record;
CREATE TABLE `ims_activity_modules_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `num` tinyint(3) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_note;
CREATE TABLE `ims_activity_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) unsigned DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `ndesc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_reply;
CREATE TABLE `ims_activity_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL,
  `new_pic` varchar(200) NOT NULL,
  `news_content` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_stores;
CREATE TABLE `ims_activity_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `opentime` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `open_time` varchar(50) NOT NULL DEFAULT '',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `location_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `offset_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `message` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_activity_user;
CREATE TABLE `ims_activity_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) unsigned DEFAULT NULL,
  `createtime` int(11) unsigned DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `sex` varchar(10) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `jobtitle` varchar(20) NOT NULL,
  `acname` varchar(50) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_aki_yzmye;
CREATE TABLE `ims_aki_yzmye` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '1',
  `rid` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(16) NOT NULL DEFAULT '1',
  `content` int(4) unsigned NOT NULL DEFAULT '1',
  `time` varchar(16) NOT NULL DEFAULT '1',
  `stime` varchar(16) NOT NULL DEFAULT '1',
  `etime` varchar(16) NOT NULL DEFAULT '1',
  `nick_name` varchar(32) DEFAULT '',
  `send_name` varchar(32) DEFAULT '',
  `min_value` int(8) unsigned NOT NULL DEFAULT '0',
  `max_value` int(8) unsigned NOT NULL DEFAULT '0',
  `total_num` int(4) unsigned NOT NULL DEFAULT '1',
  `wishing` varchar(128) DEFAULT '',
  `act_name` varchar(32) DEFAULT '',
  `remark` varchar(128) DEFAULT '',
  `logo_imgurl` varchar(128) DEFAULT '',
  `share_content` varchar(256) DEFAULT '',
  `share_url` varchar(128) DEFAULT '',
  `share_imgurl` varchar(128) DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_aki_yzmye_code;
CREATE TABLE `ims_aki_yzmye_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(64) NOT NULL DEFAULT '',
  `openid` varchar(64) NOT NULL DEFAULT '',
  `yzmyeid` int(4) unsigned NOT NULL DEFAULT '0',
  `yue` decimal(10,2) DEFAULT '0.00',
  `piciid` int(4) unsigned NOT NULL DEFAULT '0',
  `type` char(1) DEFAULT '',
  `time` varchar(16) NOT NULL DEFAULT '',
  `status` char(1) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_aki_yzmye_codenum;
CREATE TABLE `ims_aki_yzmye_codenum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '1',
  `hbid` int(4) unsigned NOT NULL DEFAULT '1',
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  `yue` decimal(10,2) DEFAULT '0.00',
  `type` char(1) DEFAULT '',
  `usedcount` int(10) unsigned NOT NULL DEFAULT '0',
  `time` varchar(16) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_aki_yzmye_sendlist;
CREATE TABLE `ims_aki_yzmye_sendlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '1',
  `piciid` int(10) DEFAULT '0',
  `codeid` int(10) DEFAULT '0',
  `openid` varchar(64) DEFAULT '',
  `yzmyeid` varchar(32) DEFAULT '',
  `yue` decimal(10,2) DEFAULT '0.00',
  `status` varchar(20) DEFAULT '',
  `time` varchar(20) DEFAULT '1',
  `mark` varchar(128) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_aki_yzmye_user;
CREATE TABLE `ims_aki_yzmye_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '1',
  `openid` varchar(64) DEFAULT '',
  `nickname` varchar(64) DEFAULT '',
  `headimgurl` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_album;
CREATE TABLE `ims_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `banner` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `pcate` int(11) unsigned NOT NULL DEFAULT '0',
  `ccate` int(11) unsigned NOT NULL DEFAULT '0',
  `isview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_album_category;
CREATE TABLE `ims_album_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_album_photo;
CREATE TABLE `ims_album_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `albumid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `ispreview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_albumid` (`albumid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_album_reply;
CREATE TABLE `ims_album_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `albumid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_house;
CREATE TABLE `ims_amouse_house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `title` varchar(25) NOT NULL COMMENT '标题',
  `price` varchar(100) NOT NULL COMMENT '租金总价',
  `square_price` varchar(100) NOT NULL COMMENT '每平方价格',
  `area` varchar(100) NOT NULL COMMENT '面积',
  `house_type` varchar(100) NOT NULL COMMENT '户型',
  `floor` varchar(100) NOT NULL COMMENT '楼层',
  `orientation` varchar(100) NOT NULL COMMENT '朝向',
  `type` varchar(2) NOT NULL COMMENT '0：出租；1：求租；2：出售/3：求购',
  `status` varchar(2) NOT NULL COMMENT '是否显示/审核',
  `recommed` int(1) NOT NULL COMMENT '推荐 0未推荐 1推荐',
  `contacts` varchar(100) NOT NULL COMMENT '联系人',
  `phone` varchar(13) NOT NULL COMMENT '联系电话',
  `introduction` text NOT NULL COMMENT '详细描述',
  `openid` varchar(25) NOT NULL COMMENT '微信OPENID',
  `createtime` int(10) NOT NULL,
  `thumb3` varchar(1000) NOT NULL DEFAULT '',
  `thumb4` varchar(1000) NOT NULL DEFAULT '',
  `thumb1` varchar(1000) NOT NULL DEFAULT '',
  `thumb2` varchar(1000) NOT NULL DEFAULT '',
  `place` varchar(1000) NOT NULL DEFAULT '',
  `lat` varchar(1000) NOT NULL DEFAULT '0.0000000000',
  `lng` varchar(1000) NOT NULL DEFAULT '0.0000000000',
  `location_p` varchar(1000) NOT NULL DEFAULT '',
  `location_c` varchar(1000) NOT NULL DEFAULT '',
  `location_a` varchar(1000) NOT NULL DEFAULT '',
  `brokerage` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='租房出售';



DROP TABLE IF EXISTS ims_amouse_house_slide;
CREATE TABLE `ims_amouse_house_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `url` varchar(200) NOT NULL DEFAULT '',
  `slide` varchar(200) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_impress_record;
CREATE TABLE `ims_amouse_impress_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'uid',
  `oid` varchar(100) NOT NULL COMMENT '微信会员openID',
  `vote` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '赞',
  `nickname` varchar(200) NOT NULL COMMENT '用户昵称',
  `realname` varchar(200) NOT NULL COMMENT '昵称',
  `content` varchar(200) NOT NULL COMMENT '印象内容',
  `createtime` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='印象记录';



DROP TABLE IF EXISTS ims_amouse_impress_user;
CREATE TABLE `ims_amouse_impress_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号id',
  `oid` varchar(50) NOT NULL COMMENT '微信会员openID',
  `nickname` varchar(200) NOT NULL COMMENT '昵称',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='参与人';



DROP TABLE IF EXISTS ims_amouse_newflats;
CREATE TABLE `ims_amouse_newflats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `thumb` varchar(255) NOT NULL COMMENT '图片',
  `price` varchar(100) NOT NULL COMMENT '价格',
  `type` varchar(200) NOT NULL COMMENT '建筑类型',
  `years` varchar(100) NOT NULL COMMENT '产权年限',
  `wytype` varchar(100) NOT NULL COMMENT '物业类别',
  `cqtype` varchar(100) NOT NULL COMMENT '产权类型',
  `jzarea` varchar(100) NOT NULL COMMENT '建筑面积',
  `ratio` varchar(100) NOT NULL COMMENT '容积率',
  `floor_area` varchar(100) NOT NULL COMMENT '房屋面积',
  `afforestation` varchar(100) NOT NULL COMMENT '绿化率',
  `total` varchar(100) NOT NULL COMMENT '总户型',
  `door_area` varchar(100) NOT NULL COMMENT '户型面积',
  `road_transport` varchar(100) NOT NULL COMMENT '道路交通',
  `investors` varchar(100) NOT NULL COMMENT '投资商',
  `developers` varchar(100) NOT NULL COMMENT '开发商',
  `property_compay` varchar(100) NOT NULL COMMENT '物业公司',
  `propertypay` varchar(100) NOT NULL COMMENT '物业费',
  `features` varchar(100) NOT NULL COMMENT '楼盘特色',
  `sales_addres` varchar(100) NOT NULL COMMENT '售楼地址',
  `checkin_time` varchar(100) NOT NULL COMMENT '入住时间',
  `sales_status` varchar(100) NOT NULL COMMENT '销售状况',
  `average_price` varchar(100) NOT NULL COMMENT '均价',
  `discounted_costs` varchar(100) NOT NULL COMMENT '折扣价格',
  `payment` varchar(100) NOT NULL COMMENT '付款方式',
  `business` varchar(100) NOT NULL COMMENT '商业配套',
  `banks` varchar(100) NOT NULL COMMENT '银行',
  `trading_area` varchar(100) NOT NULL COMMENT '商圈',
  `park` varchar(100) NOT NULL COMMENT '公园',
  `hotel` varchar(100) NOT NULL COMMENT '酒店',
  `supermarket` varchar(100) NOT NULL COMMENT '超市',
  `humanities` varchar(100) NOT NULL COMMENT '人文自然景观',
  `supporting` varchar(100) NOT NULL COMMENT '社区内配套',
  `internal` varchar(100) NOT NULL COMMENT '内部配套',
  `parking_number` varchar(100) NOT NULL COMMENT '车位数',
  `base` varchar(100) NOT NULL COMMENT '基本参数',
  `equally` varchar(100) NOT NULL COMMENT '公摊系数',
  `surrounding` varchar(100) NOT NULL COMMENT '周边商业',
  `landscape` varchar(100) NOT NULL COMMENT '周边景观',
  `hospitals` varchar(100) NOT NULL COMMENT '周边医院',
  `school` varchar(100) NOT NULL COMMENT '周边学校',
  `traffic` varchar(100) NOT NULL COMMENT '交通',
  `construction` varchar(100) NOT NULL COMMENT '建筑施工单位',
  `design` varchar(100) NOT NULL COMMENT '规划设计单位',
  `salecom` varchar(100) NOT NULL COMMENT '销售公司',
  `address` varchar(255) NOT NULL COMMENT '销售公司所在位置图片',
  `introduction` text NOT NULL COMMENT '详细描述',
  `readcount` int(11) DEFAULT '0' COMMENT '阅读量',
  `openid` varchar(25) NOT NULL COMMENT '微信OPENID',
  `like` int(11) DEFAULT '0' COMMENT '点赞',
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_sysset;
CREATE TABLE `ims_amouse_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `jjrmobile` varchar(13) NOT NULL COMMENT '手机',
  `broker` varchar(200) NOT NULL COMMENT '经纪人',
  `guanzhuUrl` varchar(255) DEFAULT '1' COMMENT '引导关注',
  `copyright` varchar(255) DEFAULT '' COMMENT '版权',
  `newflat_images` varchar(255) DEFAULT '' COMMENT '楼盘图片设置',
  `isoauth` int(10) DEFAULT '1' COMMENT '是否开启高级权限',
  `isshow` int(10) DEFAULT '1' COMMENT '是否只显示经纪人信息',
  `cnzz` varchar(255) DEFAULT '' COMMENT '统计',
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `appid_share` varchar(255) DEFAULT '',
  `appsecret_share` varchar(255) DEFAULT '',
  `defcity` varchar(1000) DEFAULT '中国',
  `nickname` varchar(500) DEFAULT NULL COMMENT '昵称',
  `openid` varchar(500) DEFAULT NULL COMMENT 'openid',
  `isadjuest` varchar(1) DEFAULT '1' COMMENT '是否审核',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard2_fans;
CREATE TABLE `ims_amouse_weicard2_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(100) DEFAULT '' COMMENT '用户ID',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机',
  `name` varchar(20) DEFAULT ' ',
  `email` varchar(200) DEFAULT '',
  `createtime` int(10) DEFAULT '0',
  `qq` varchar(255) DEFAULT '',
  `job` varchar(255) DEFAULT '',
  `department` varchar(255) DEFAULT '',
  `company` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `area` varchar(255) DEFAULT '',
  `weixin` varchar(255) DEFAULT '',
  `joincount` int(11) DEFAULT '0',
  `template` varchar(300) NOT NULL DEFAULT '' COMMENT '模板',
  `templatefile` varchar(300) NOT NULL DEFAULT '' COMMENT '模板名称',
  `headimg` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard2_reply;
CREATE TABLE `ims_amouse_weicard2_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `tpl` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(20) NOT NULL COMMENT '活动标题',
  `description` longtext NOT NULL COMMENT '活动介绍',
  `thumb` varchar(200) DEFAULT '',
  `isshow` tinyint(1) DEFAULT '0',
  `bj` varchar(100) NOT NULL COMMENT '名片图片',
  `viewnum` int(11) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard2_sysset;
CREATE TABLE `ims_amouse_weicard2_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `guanzhuUrl` varchar(255) DEFAULT '1' COMMENT '引导关注',
  `copyright` varchar(255) DEFAULT '' COMMENT '版权',
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `appid_share` varchar(255) DEFAULT '',
  `appsecret_share` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_bg;
CREATE TABLE `ims_amouse_weicard_bg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `displayorder` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_bjyy;
CREATE TABLE `ims_amouse_weicard_bjyy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `musicid` int(10) NOT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_card;
CREATE TABLE `ims_amouse_weicard_card` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `from_user` varchar(255) NOT NULL,
  `mid` int(10) NOT NULL COMMENT '会员表id',
  `mobile` tinyint(1) DEFAULT '0' COMMENT 'type=1;0代表全部可见，1代表互相收藏可见，2代表自己可见',
  `email` tinyint(1) DEFAULT '0' COMMENT 'type=2;0代表全部可见，1代表互相收藏可见，2代表自己可见',
  `weixin` tinyint(1) DEFAULT '0' COMMENT 'type=3;0代表全部可见，1代表互相收藏可见，2代表自己可见',
  `address` tinyint(1) DEFAULT '0' COMMENT 'type=4;0代表全部可见，1代表互相收藏可见，2代表自己可见',
  `bgimg` varchar(255) DEFAULT NULL,
  `shopName` varchar(255) DEFAULT NULL,
  `templateFile` varchar(300) DEFAULT 'qianx_index',
  `shopIcon` varchar(255) DEFAULT NULL,
  `shopUrl` varchar(255) DEFAULT NULL,
  `zan` int(10) DEFAULT '0',
  `view` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_companyinfo;
CREATE TABLE `ims_amouse_weicard_companyinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `from_user` varchar(255) NOT NULL,
  `img` text,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_industry;
CREATE TABLE `ims_amouse_weicard_industry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `displayorder` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

INSERT INTO ims_amouse_weicard_industry VALUES 
('1','IT·互联网·游戏','1'),
('2','金融业（投资·保险·证券·基金）','2'),
('3','医疗·保健·美容','4'),
('4','教育·培训·科研·院校','5'),
('5','通信行业','6'),
('6','房地产开发·建筑与工程','7'),
('7','广告·会展·公关','8'),
('8','电子·微电子','9'),
('9','物业管理·商业中心','10'),
('10','家居·室内设计·装潢','11'),
('11','中介服务','12'),
('12','专业服务（咨询·财会·法律等）','13'),
('13','检验·检测·认证','14'),
('14','贸易·进出口','15'),
('15','媒体·出版·文化传播','16'),
('16','印刷·包装·造纸','17'),
('17','快速消费品','18'),
('18','耐用消费品','19'),
('19','玩具·工艺品·收藏品·奢侈品','20'),
('20','家电业','21'),
('21','办公设备·用品','22'),
('22','批发·零售','23'),
('23','交通·运输·物流','24'),
('24','娱乐·运动·休闲','25'),
('25','制药·生物工程','26'),
('26','医疗设备·器械','27'),
('27','环保行业','28'),
('28','石油·化工·矿产·采掘·冶炼·原材料','29'),
('29','能源·水利','30'),
('30','仪器·仪表·工业自动化·电气','31'),
('31','汽车·摩托车','32'),
('32','机械制造·机电·重工','33'),
('33','原材料及加工','34'),
('34','农·林·牧·渔','35'),
('35','航空·航天研究与制造','36'),
('36','船舶制造','37'),
('37','政府·非营利机构','38'),
('38','酒店/旅游','39'),
('39','餐饮/娱乐','40'),
('40','直销行业','41'),
('41','美容美发','42'),
('42','教育·培训·科研·院校·大学','43'),
('45','DNF','44');


DROP TABLE IF EXISTS ims_amouse_weicard_member;
CREATE TABLE `ims_amouse_weicard_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `weixin` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `myattention` varchar(255) DEFAULT NULL,
  `myfocus` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `lat` decimal(18,10) DEFAULT '0.0000000000',
  `lng` decimal(18,10) DEFAULT '0.0000000000',
  `status` tinyint(1) DEFAULT NULL COMMENT '0表示已审核，1表示未审核，2表示禁用',
  `qianming` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_music;
CREATE TABLE `ims_amouse_weicard_music` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `musicName` varchar(255) DEFAULT NULL,
  `musicSinger` varchar(255) DEFAULT NULL,
  `musicImg` varchar(255) DEFAULT NULL,
  `musicUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_mycollect;
CREATE TABLE `ims_amouse_weicard_mycollect` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `from_user` varchar(255) NOT NULL,
  `collect_mid` int(10) NOT NULL,
  `collect_cid` int(10) NOT NULL,
  `collect_from_user` varchar(255) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_photo;
CREATE TABLE `ims_amouse_weicard_photo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `mid` int(10) NOT NULL COMMENT '会员表id',
  `cid` int(10) NOT NULL COMMENT '名片表id',
  `from_user` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '栏目名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '栏目图标',
  `thumb` text COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_presence;
CREATE TABLE `ims_amouse_weicard_presence` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  `img` text,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_reply;
CREATE TABLE `ims_amouse_weicard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '活动标题',
  `description` longtext NOT NULL COMMENT '活动介绍',
  `thumb` varchar(200) DEFAULT '',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_sysset;
CREATE TABLE `ims_amouse_weicard_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `guanzhuUrl` varchar(255) DEFAULT '1' COMMENT '引导关注',
  `copyright` varchar(255) DEFAULT '' COMMENT '版权',
  `cnzz` varchar(800) DEFAULT '' COMMENT '第三方统计',
  `appid` varchar(255) DEFAULT '',
  `isoauth` int(2) unsigned NOT NULL DEFAULT '1',
  `appsecret` varchar(255) DEFAULT '',
  `appid_share` varchar(255) DEFAULT '',
  `appsecret_share` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_amouse_weicard_zan;
CREATE TABLE `ims_amouse_weicard_zan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `from_user` varchar(255) NOT NULL,
  `zan_mid` int(10) NOT NULL,
  `zan_cid` int(10) NOT NULL,
  `zan_from_user` varchar(255) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_apidaquan;
CREATE TABLE `ims_apidaquan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `status` int(3) NOT NULL,
  `city` varchar(255) NOT NULL,
  `company` varchar(20) NOT NULL,
  `create_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `openid` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_apitype;
CREATE TABLE `ims_apitype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `express_id` varchar(20) NOT NULL,
  `status` int(3) NOT NULL,
  `company` varchar(20) NOT NULL,
  `create_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `openid` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_article_case;
CREATE TABLE `ims_article_case` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `weixinh` varchar(50) NOT NULL,
  `weixintag` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_article_catecase;
CREATE TABLE `ims_article_catecase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_article_category;
CREATE TABLE `ims_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_article_link;
CREATE TABLE `ims_article_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_article_news;
CREATE TABLE `ims_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_article_notice;
CREATE TABLE `ims_article_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_article_reply;
CREATE TABLE `ims_article_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `articleid` int(11) NOT NULL,
  `isfill` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_article_unread_notice;
CREATE TABLE `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_auction_adv;
CREATE TABLE `ims_auction_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_auction_category;
CREATE TABLE `ims_auction_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_auction_goodslist;
CREATE TABLE `ims_auction_goodslist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号',
  `title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `sh_price` int(10) DEFAULT '0' COMMENT '起拍金额',
  `add_price` int(10) DEFAULT '0' COMMENT '默认加价金额',
  `st_price` int(10) DEFAULT '0' COMMENT '成交金额',
  `bond` int(10) DEFAULT '0' COMMENT '保证金',
  `picarr` text COMMENT '商品图片',
  `content` mediumtext COMMENT '商品详情',
  `start_time` int(10) unsigned DEFAULT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned DEFAULT NULL COMMENT '结束时间',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `pos` tinyint(4) unsigned DEFAULT '0' COMMENT '出价次数',
  `status` int(11) NOT NULL COMMENT '1:已付余款',
  `g_status` int(11) NOT NULL COMMENT '2:上架；1：下架',
  `q_uid` varchar(10) DEFAULT NULL COMMENT '成交人昵称',
  `q_user` varchar(50) DEFAULT NULL COMMENT '成交人from_user',
  `send_state` int(4) unsigned NOT NULL COMMENT '1为已发货',
  `send` int(4) unsigned NOT NULL COMMENT '是否需要快递1为需要',
  `express` varchar(20) DEFAULT NULL COMMENT '快递公司',
  `expressn` char(20) DEFAULT NULL COMMENT '快递单',
  `send_time` char(20) DEFAULT NULL COMMENT '发货时间',
  `categoryid` int(10) DEFAULT '0' COMMENT '拍品分类',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `send_state` (`send_state`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_auction_member;
CREATE TABLE `ims_auction_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号id',
  `balance` int(10) unsigned NOT NULL COMMENT '会员余额',
  `from_user` varchar(50) NOT NULL COMMENT '微信会员openID',
  `realname` varchar(10) NOT NULL COMMENT '真实姓名',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `address` varchar(255) NOT NULL COMMENT '邮寄地址',
  `bankcard` varchar(20) NOT NULL,
  `bankname` varchar(10) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `aliname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_auction_recharge;
CREATE TABLE `ims_auction_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号',
  `from_user` varchar(50) NOT NULL COMMENT '微信会员openID',
  `nickname` varchar(20) NOT NULL COMMENT '用户昵称',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `ordersn` varchar(20) NOT NULL COMMENT '订单编号',
  `status` smallint(4) NOT NULL DEFAULT '0' COMMENT '0未支付,1为已付款',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额支付,2为支付宝,3为微信支付,4为定价返还',
  `transid` varchar(30) NOT NULL COMMENT '微信订单号',
  `price` int(10) unsigned NOT NULL COMMENT '充值金额',
  `createtime` int(10) unsigned NOT NULL COMMENT '充值时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `from_user` (`from_user`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_auction_record;
CREATE TABLE `ims_auction_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号',
  `from_user` varchar(50) NOT NULL COMMENT '微信会员openID',
  `nickname` varchar(20) NOT NULL COMMENT '用户昵称',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `sid` int(10) unsigned NOT NULL COMMENT '商品编号',
  `ordersn` varchar(20) NOT NULL COMMENT '订单编号',
  `price` int(10) unsigned NOT NULL COMMENT '交易价格',
  `bond` int(10) unsigned NOT NULL COMMENT '保证金',
  `createtime` int(10) unsigned NOT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_auction_withdrawals;
CREATE TABLE `ims_auction_withdrawals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `ordersn` varchar(20) NOT NULL COMMENT '订单编号',
  `status` smallint(4) NOT NULL COMMENT '0为提现中,1为提现成功，2提现失败',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为银行卡,2为支付宝',
  `price` int(10) unsigned NOT NULL COMMENT '提现金额',
  `createtime` int(10) unsigned NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_basic_reply;
CREATE TABLE `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bbb_reply;
CREATE TABLE `ims_bbb_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `uniacid` int(10) unsigned NOT NULL,
  `picture` varchar(100) NOT NULL COMMENT '活动图片',
  `description` varchar(500) NOT NULL COMMENT '活动描述',
  `rule` text NOT NULL COMMENT '活动描述',
  `periodlottery` smallint(10) unsigned NOT NULL DEFAULT '1' COMMENT '0为无周期',
  `maxlottery` tinyint(3) unsigned NOT NULL COMMENT '最大抽奖数',
  `headpic` varchar(100) NOT NULL COMMENT '默认提示信息',
  `headurl` varchar(255) NOT NULL DEFAULT '',
  `panzi` varchar(100) NOT NULL DEFAULT '',
  `guzhuurl` varchar(255) NOT NULL DEFAULT '',
  `prace_times` int(10) NOT NULL DEFAULT '100',
  `title` varchar(100) NOT NULL DEFAULT '',
  `start_time` int(10) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '1600000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bbb_share;
CREATE TABLE `ims_bbb_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `share_uid` int(10) unsigned NOT NULL COMMENT '分享者ID',
  `createtime` char(8) NOT NULL DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bbb_user;
CREATE TABLE `ims_bbb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `count` int(10) NOT NULL DEFAULT '0',
  `points` int(10) NOT NULL DEFAULT '0',
  `friendcount` int(10) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bbb_winner;
CREATE TABLE `ims_bbb_winner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `point` int(10) unsigned NOT NULL COMMENT '点数',
  `from_user` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未领奖，1不需要领奖，2已领奖',
  `createtime` int(10) unsigned NOT NULL COMMENT '获奖日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bigwheel_award;
CREATE TABLE `ims_bigwheel_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `fansID` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户ID',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `description` varchar(200) DEFAULT '' COMMENT '描述',
  `prizetype` varchar(10) DEFAULT '' COMMENT '类型',
  `award_sn` varchar(50) DEFAULT '' COMMENT 'SN',
  `createtime` int(10) DEFAULT '0',
  `consumetime` int(10) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bigwheel_fans;
CREATE TABLE `ims_bigwheel_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `fansID` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '' COMMENT '用户ID',
  `tel` varchar(20) DEFAULT '' COMMENT '登记信息(手机等)',
  `todaynum` int(11) DEFAULT '0',
  `totalnum` int(11) DEFAULT '0',
  `awardnum` int(11) DEFAULT '0',
  `last_time` int(10) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bigwheel_reply;
CREATE TABLE `ims_bigwheel_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `weid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `content` varchar(200) DEFAULT '',
  `start_picurl` varchar(200) DEFAULT '',
  `isshow` tinyint(1) DEFAULT '0',
  `ticket_information` varchar(200) DEFAULT '',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `repeat_lottery_reply` varchar(50) DEFAULT '',
  `end_theme` varchar(50) DEFAULT '',
  `end_instruction` varchar(200) DEFAULT '',
  `end_picurl` varchar(200) DEFAULT '',
  `c_type_one` varchar(20) DEFAULT '',
  `c_name_one` varchar(50) DEFAULT '',
  `c_num_one` int(11) DEFAULT '0',
  `c_draw_one` int(11) DEFAULT '0',
  `c_rate_one` double DEFAULT '0',
  `c_type_two` varchar(20) DEFAULT '',
  `c_name_two` varchar(50) DEFAULT '',
  `c_num_two` int(11) DEFAULT '0',
  `c_draw_two` int(11) DEFAULT '0',
  `c_rate_two` double DEFAULT '0',
  `c_type_three` varchar(20) DEFAULT '',
  `c_name_three` varchar(50) DEFAULT '',
  `c_num_three` int(11) DEFAULT '0',
  `c_draw_three` int(11) DEFAULT '0',
  `c_rate_three` double DEFAULT '0',
  `c_type_four` varchar(20) DEFAULT '',
  `c_name_four` varchar(50) DEFAULT '',
  `c_num_four` int(11) DEFAULT '0',
  `c_draw_four` int(11) DEFAULT '0',
  `c_rate_four` double DEFAULT '0',
  `c_type_five` varchar(20) DEFAULT '',
  `c_name_five` varchar(50) DEFAULT '',
  `c_num_five` int(11) DEFAULT '0',
  `c_draw_five` int(11) DEFAULT '0',
  `c_rate_five` double DEFAULT '0',
  `c_type_six` varchar(20) DEFAULT '',
  `c_name_six` varchar(50) DEFAULT '',
  `c_num_six` int(11) DEFAULT '0',
  `c_draw_six` int(10) DEFAULT '0',
  `c_rate_six` double DEFAULT '0',
  `total_num` int(11) DEFAULT '0' COMMENT '总获奖人数(自动加)',
  `probability` double DEFAULT '0',
  `award_times` int(11) DEFAULT '0',
  `number_times` int(11) DEFAULT '0',
  `most_num_times` int(11) DEFAULT '0',
  `sn_code` tinyint(4) DEFAULT '0',
  `sn_rename` varchar(20) DEFAULT '',
  `tel_rename` varchar(20) DEFAULT '',
  `copyright` varchar(20) DEFAULT '',
  `show_num` tinyint(2) DEFAULT '0',
  `viewnum` int(11) DEFAULT '0',
  `fansnum` int(11) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  `share_title` varchar(200) DEFAULT '',
  `share_desc` varchar(300) DEFAULT '',
  `share_url` varchar(100) DEFAULT '',
  `share_txt` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bm_qrsign_payed;
CREATE TABLE `ims_bm_qrsign_payed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `fromuser` text NOT NULL,
  `username` text NOT NULL,
  `paytime` int(11) NOT NULL DEFAULT '0',
  `qrmoney` float(10,2) DEFAULT '0.00',
  `credit` int(11) NOT NULL DEFAULT '0',
  `play_time` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `clientOrderId` varchar(50) NOT NULL,
  `play_status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_bm_qrsign_record;
CREATE TABLE `ims_bm_qrsign_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `fromuser` text NOT NULL,
  `username` text NOT NULL,
  `today_rank` int(11) NOT NULL DEFAULT '0',
  `sign_time` int(11) NOT NULL DEFAULT '0',
  `last_sign_time` int(11) NOT NULL DEFAULT '0',
  `continue_sign_days` int(11) NOT NULL DEFAULT '0',
  `maxcontinue_sign_days` int(11) NOT NULL DEFAULT '0',
  `total_sign_num` int(11) NOT NULL DEFAULT '0',
  `maxtotal_sign_num` int(11) NOT NULL DEFAULT '0',
  `first_sign_days` int(11) NOT NULL DEFAULT '0',
  `maxfirst_sign_days` int(11) NOT NULL DEFAULT '0',
  `credit` int(11) NOT NULL DEFAULT '0',
  `play_status` int(1) NOT NULL DEFAULT '0',
  `play_time` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_bm_qrsign_reply;
CREATE TABLE `ims_bm_qrsign_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `weid` int(11) NOT NULL,
  `n` int(10) NOT NULL DEFAULT '0',
  `desc` varchar(500) NOT NULL DEFAULT '',
  `pictype` int(1) NOT NULL DEFAULT '0',
  `picurl` varchar(200) NOT NULL DEFAULT '',
  `urlx` varchar(200) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `qrcode` varchar(100) NOT NULL DEFAULT '',
  `urly` varchar(200) NOT NULL DEFAULT '',
  `url1` varchar(200) NOT NULL DEFAULT '',
  `url2` varchar(200) NOT NULL DEFAULT '',
  `memo1` varchar(100) NOT NULL DEFAULT '',
  `memo2` varchar(100) NOT NULL DEFAULT '',
  `play_times` int(10) NOT NULL DEFAULT '0',
  `play_nums` int(10) NOT NULL DEFAULT '0',
  `play_type` int(1) NOT NULL DEFAULT '0',
  `qrtype` int(1) NOT NULL DEFAULT '0',
  `qrmoney` float(10,2) DEFAULT '0.00',
  `qrerrormemo` varchar(100) NOT NULL DEFAULT '',
  `qrerrorurl` varchar(200) NOT NULL DEFAULT '',
  `memo` varchar(100) NOT NULL DEFAULT '',
  `qrinput` int(1) NOT NULL DEFAULT '0',
  `logo` varchar(100) NOT NULL DEFAULT '',
  `play_status` int(1) NOT NULL DEFAULT '0',
  `templateid` varchar(100) NOT NULL DEFAULT '',
  `awaremethod` varchar(100) NOT NULL DEFAULT '',
  `awaretime` varchar(100) NOT NULL DEFAULT '',
  `openid` varchar(100) NOT NULL DEFAULT '',
  `templateid1` varchar(100) NOT NULL DEFAULT '',
  `button` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bm_qrsign_winner;
CREATE TABLE `ims_bm_qrsign_winner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(32) NOT NULL DEFAULT '',
  `username` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `awardid` int(10) unsigned NOT NULL DEFAULT '0',
  `awardname` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `avatar` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_bmfloor;
CREATE TABLE `ims_bmfloor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `awardprompt` text NOT NULL,
  `currentprompt` text NOT NULL,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `total` int(10) unsigned NOT NULL DEFAULT '0',
  `memo` text NOT NULL,
  `picture` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `url1` varchar(255) NOT NULL DEFAULT '',
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `memo1` text NOT NULL,
  `memo2` text NOT NULL,
  `share_keyword` varchar(100) NOT NULL DEFAULT '',
  `share_logo` varchar(255) NOT NULL DEFAULT '',
  `share_memo` text NOT NULL,
  `share_statement` text NOT NULL,
  `share_url` varchar(255) NOT NULL DEFAULT '',
  `share_point` int(10) unsigned NOT NULL DEFAULT '0',
  `adv_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bmfloor_award;
CREATE TABLE `ims_bmfloor_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `floor` varchar(100) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bmfloor_member;
CREATE TABLE `ims_bmfloor_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `share_point` int(10) unsigned NOT NULL DEFAULT '0',
  `share_used` int(10) unsigned NOT NULL DEFAULT '0',
  `weid` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `IPaddress` char(15) NOT NULL DEFAULT '',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_bmfloor_winner;
CREATE TABLE `ims_bmfloor_winner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(32) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `awardid` int(10) unsigned NOT NULL DEFAULT '0',
  `awardname` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `floor` int(10) NOT NULL DEFAULT '0',
  `realname` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_brand;
CREATE TABLE `ims_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `bname` varchar(50) NOT NULL,
  `intro` varchar(1000) NOT NULL,
  `intro2` varchar(1000) NOT NULL,
  `video_name` varchar(100) DEFAULT NULL,
  `video_url` varchar(100) DEFAULT NULL,
  `createtime` int(11) unsigned DEFAULT NULL,
  `pptname` varchar(100) DEFAULT NULL,
  `ppt1` varchar(100) DEFAULT NULL,
  `ppt2` varchar(100) DEFAULT NULL,
  `ppt3` varchar(100) DEFAULT NULL,
  `pic` varchar(100) NOT NULL,
  `visitsCount` int(11) DEFAULT '0',
  `btnName` varchar(20) DEFAULT NULL,
  `btnUrl` varchar(100) DEFAULT NULL,
  `btnName2` varchar(20) DEFAULT NULL,
  `btnUrl2` varchar(100) DEFAULT NULL,
  `btnName3` varchar(20) DEFAULT NULL,
  `btnUrl3` varchar(100) DEFAULT NULL,
  `showMsg` int(1) DEFAULT '0',
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_brand_image;
CREATE TABLE `ims_brand_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(11) unsigned DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_brand_message;
CREATE TABLE `ims_brand_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createtime` int(11) unsigned DEFAULT NULL,
  `bid` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_brand_note;
CREATE TABLE `ims_brand_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(11) unsigned DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_brand_product;
CREATE TABLE `ims_brand_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(11) unsigned DEFAULT NULL,
  `pname` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `intro` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_brand_reply;
CREATE TABLE `ims_brand_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `bid` int(10) unsigned NOT NULL,
  `new_pic` varchar(200) NOT NULL,
  `news_content` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_acmanager;
CREATE TABLE `ims_broke_acmanager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `listorder` int(5) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL,
  `content` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `loupan` int(10) NOT NULL,
  `loupanid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_assistant;
CREATE TABLE `ims_broke_assistant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `realname` varchar(50) NOT NULL,
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `company` varchar(50) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `flag` tinyint(1) DEFAULT '0' COMMENT '0为销售员，1为经理',
  `content` text,
  `createtime` int(10) NOT NULL,
  `loupan` int(10) NOT NULL DEFAULT '0',
  `pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_commission;
CREATE TABLE `ims_broke_commission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL COMMENT '经纪人ID',
  `cid` int(10) unsigned DEFAULT NULL COMMENT '客户ID',
  `commission` int(10) unsigned NOT NULL COMMENT '佣金',
  `content` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `opid` int(10) unsigned DEFAULT '0' COMMENT '操作员ID经理或销售或管理员',
  `opname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_counselor;
CREATE TABLE `ims_broke_counselor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `loupan` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(5) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL,
  `content` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_customer;
CREATE TABLE `ims_broke_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `realname` varchar(50) NOT NULL,
  `loupan` int(10) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL,
  `updatetime` int(10) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `cid` int(10) unsigned DEFAULT '0' COMMENT '该客户从属于某销售员',
  `allottime` int(10) DEFAULT NULL COMMENT '分配时间',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_identity;
CREATE TABLE `ims_broke_identity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `identity_name` varchar(20) NOT NULL,
  `iscompany` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要填写公司名称，1要，默认不要',
  `listorder` int(5) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_item;
CREATE TABLE `ims_broke_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `lpid` int(10) unsigned NOT NULL,
  `photoid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `item` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `x` int(3) NOT NULL DEFAULT '0',
  `y` int(3) NOT NULL DEFAULT '0',
  `animation` varchar(20) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photoid` (`photoid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_log;
CREATE TABLE `ims_broke_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `share_from_user` varchar(50) DEFAULT NULL,
  `loupan` int(10) unsigned NOT NULL,
  `browser` varchar(200) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `createtime` int(10) NOT NULL COMMENT '时间戳格式',
  `createtime1` varchar(20) NOT NULL COMMENT '日期格式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=417 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_logloupan;
CREATE TABLE `ims_broke_logloupan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `lid` int(10) unsigned NOT NULL,
  `createtime` int(10) NOT NULL COMMENT '时间戳格式',
  `createtime1` varchar(20) NOT NULL COMMENT '日期格式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_loupan;
CREATE TABLE `ims_broke_loupan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `share` varchar(100) NOT NULL DEFAULT '',
  `open` varchar(100) NOT NULL DEFAULT '',
  `ostyle` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `music` varchar(100) NOT NULL DEFAULT '',
  `mauto` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `mloop` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `isloop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dist` varchar(20) DEFAULT '',
  `city` varchar(20) DEFAULT '',
  `province` varchar(20) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `lng` varchar(12) DEFAULT '116.403694',
  `lat` varchar(12) DEFAULT '39.916042',
  `addr` varchar(255) DEFAULT NULL,
  `commission` varchar(20) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `jw_addr` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_member;
CREATE TABLE `ims_broke_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `tjmid` int(10) NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL,
  `realname` varchar(50) NOT NULL,
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `bankcard` varchar(20) DEFAULT NULL,
  `banktype` varchar(20) DEFAULT NULL,
  `identity` int(10) unsigned NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `createtime` int(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `commission` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_photo;
CREATE TABLE `ims_broke_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `lpid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `ispreview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lpid` (`lpid`)
) ENGINE=MyISAM AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_protect;
CREATE TABLE `ims_broke_protect` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT '0',
  `weid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_broke_rule;
CREATE TABLE `ims_broke_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '',
  `rule` text,
  `terms` text,
  `createtime` int(10) NOT NULL,
  `gzurl` varchar(255) NOT NULL,
  `teamfy` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_business;
CREATE TABLE `ims_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL DEFAULT '',
  `phone` varchar(15) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `province` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `dist` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(500) NOT NULL DEFAULT '',
  `lng` varchar(10) NOT NULL DEFAULT '',
  `lat` varchar(10) NOT NULL DEFAULT '',
  `industry1` varchar(10) NOT NULL DEFAULT '',
  `industry2` varchar(10) NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lat_lng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_attachment;
CREATE TABLE `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_cache;
CREATE TABLE `ims_core_cache` (
  `key` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_cron;
CREATE TABLE `ims_core_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createtime` (`createtime`),
  KEY `nextruntime` (`nextruntime`),
  KEY `uniacid` (`uniacid`),
  KEY `cloudid` (`cloudid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_cron_record;
CREATE TABLE `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `tid` (`tid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_menu;
CREATE TABLE `ims_core_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(60) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(60) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

INSERT INTO ims_core_menu VALUES 
('1','0','基础设置','platform','','fa fa-cog','','0','url','1','1',''),
('2','1','基本功能','platform','','','','0','url','1','1',''),
('3','2','文字回复','platform','./index.php?c=platform&a=reply&m=basic','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=basic','0','url','1','1','platform_reply_basic'),
('4','2','图文回复','platform','./index.php?c=platform&a=reply&m=news','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=news','0','url','1','1','platform_reply_news'),
('5','2','音乐回复','platform','./index.php?c=platform&a=reply&m=music','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=music','0','url','1','1','platform_reply_music'),
('6','2','图片回复','platform','./index.php?c=platform&a=reply&m=images','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=images','0','url','1','1','platform_reply_images'),
('7','2','语音回复','platform','./index.php?c=platform&a=reply&m=voice','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=voice','0','url','1','1','platform_reply_voice'),
('8','2','视频回复','platform','./index.php?c=platform&a=reply&m=video','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=video','0','url','1','1','platform_reply_video'),
('9','2','自定义接口回复','platform','./index.php?c=platform&a=reply&m=userapi','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=userapi','0','url','1','1','platform_reply_userapi'),
('10','2','系统回复','platform','./index.php?c=platform&a=special&do=display&','','','0','url','1','1','platform_reply_system'),
('11','1','高级功能','platform','','','','0','url','1','1',''),
('12','11','常用服务接入','platform','./index.php?c=platform&a=service&do=switch&','','','0','url','1','1','platform_service'),
('13','11','自定义菜单','platform','./index.php?c=platform&a=menu&','','','0','url','1','1','platform_menu'),
('14','11','特殊消息回复','platform','./index.php?c=platform&a=special&do=message&','','','0','url','1','1','platform_special'),
('15','11','二维码管理','platform','./index.php?c=platform&a=qr&','','','0','url','1','1','platform_qr'),
('16','11','多客服接入','platform','./index.php?c=platform&a=reply&m=custom','','','0','url','1','1','platform_reply_custom'),
('17','11','长链接二维码','platform','./index.php?c=platform&a=url2qr&','','','0','url','1','1','platform_url2qr'),
('18','1','数据统计','platform','','','','0','url','1','1',''),
('19','18','聊天记录','platform','./index.php?c=platform&a=stat&do=history&','','','0','url','1','1','platform_stat_history'),
('20','18','回复规则使用情况','platform','./index.php?c=platform&a=stat&do=rule&','','','0','url','1','1','platform_stat_rule'),
('21','18','关键字命中情况','platform','./index.php?c=platform&a=stat&do=keyword&','','','0','url','1','1','platform_stat_keyword'),
('22','18','参数','platform','./index.php?c=platform&a=stat&do=setting&','','','0','url','1','1','platform_stat_setting'),
('23','0','微站功能','site','','fa fa-life-bouy','','0','url','1','1',''),
('24','23','微站管理','site','','','','0','url','1','1',''),
('25','24','站点管理','site','./index.php?c=site&a=multi&do=display&','fa fa-plus','./index.php?c=site&a=multi&do=post&','0','url','1','1','site_multi_display'),
('26','24','站点添加/编辑','site','','','','0','permission','0','1','site_multi_post'),
('27','24','站点删除','site','','','','0','permission','0','1','site_multi_del'),
('28','24','模板管理','site','./index.php?c=site&a=style&do=template&','','','0','url','1','1','site_style_template'),
('29','24','模块模板扩展','site','./index.php?c=site&a=style&do=module&','','','0','url','1','1','site_style_module'),
('30','23','特殊页面管理','site','','','','0','url','1','1',''),
('31','30','会员中心','site','./index.php?c=site&a=editor&do=uc&','','','0','url','1','1','site_editor_uc'),
('32','30','专题页面','site','./index.php?c=site&a=editor&do=page&','fa fa-plus','./index.php?c=site&a=editor&do=design&','0','url','1','1','site_editor_page'),
('33','23','功能组件','site','','','','0','url','1','1',''),
('34','33','分类设置','site','./index.php?c=site&a=category&','','','0','url','1','1','site_category'),
('35','33','文章管理','site','./index.php?c=site&a=article&','','','0','url','1','1','site_article'),
('36','0','粉丝营销','mc','','fa fa-gift','','0','url','1','1',''),
('37','36','粉丝管理','mc','','','','0','url','1','1',''),
('38','37','粉丝分组','mc','./index.php?c=mc&a=fangroup&','','','0','url','1','1','mc_fangroup'),
('39','37','粉丝','mc','./index.php?c=mc&a=fans&','','','0','url','1','1','mc_fans'),
('40','36','会员中心','mc','','','','0','url','1','1',''),
('41','40','会员中心访问入口','mc','./index.php?c=platform&a=cover&do=mc&','','','0','url','1','1','platform_cover_mc'),
('42','40','会员','mc','./index.php?c=mc&a=member&','','','0','url','1','1','mc_member'),
('43','40','会员组','mc','./index.php?c=mc&a=group&','','','0','url','1','1','mc_group'),
('46','36','会员卡管理','mc','','','','0','url','1','1',''),
('47','46','会员卡访问入口','mc','./index.php?c=platform&a=cover&do=card&','','','0','url','1','1','platform_cover_card'),
('48','46','会员卡管理','mc','./index.php?c=mc&a=card&do=manage','','','0','url','1','1','mc_card_manage'),
('51','36','积分兑换','mc','','','','0','url','1','1',''),
('52','51','折扣券','mc','./index.php?c=activity&a=coupon&','','','0','url','1','1','activity_coupon_display'),
('57','36','微信素材&群发','mc','','','','0','url','1','1',''),
('61','0','功能选项','setting','','fa fa-umbrella','','0','url','1','1',''),
('62','61','公众号选项','setting','','','','0','url','1','1',''),
('63','62','支付参数','setting','./index.php?c=profile&a=payment&','','','0','url','1','1','profile_payment'),
('64','62','借用 oAuth 权限','setting','./index.php?c=mc&a=passport&do=oauth&','','','0','url','1','1','mc_passport_oauth'),
('65','62','借用 JS 分享权限','setting','./index.php?c=profile&a=jsauth&','','','0','url','1','1','profile_jsauth'),
('66','61','会员及粉丝选项','setting','','','','0','url','1','1',''),
('67','66','积分设置','setting','./index.php?c=mc&a=credit&','','','0','url','1','1','mc_credit'),
('68','66','注册设置','setting','./index.php?c=mc&a=passport&do=passport&','','','0','url','1','1','mc_passport_passport'),
('69','66','粉丝同步设置','setting','./index.php?c=mc&a=passport&do=sync&','','','0','url','1','1','mc_passport_sync'),
('70','66','UC站点整合','setting','./index.php?c=mc&a=uc&','','','0','url','1','1','mc_uc'),
('71','61','其他功能选项','setting','','','','0','url','1','1',''),
('72','0','扩展功能','ext','','fa fa-cubes','','0','url','1','1',''),
('73','72','管理','ext','','','','0','url','1','1',''),
('74','73','扩展功能管理','ext','./index.php?c=profile&a=module&','','','0','url','1','1','profile_module'),
('75','47','店员操作访问入口','mc','./index.php?c=platform&a=cover&do=clerk&','','','0','url','1','1','platform_cover_clerk'),
('77','47','店员操作访问入口','mc','./index.php?c=platform&a=cover&do=clerk&','','','0','url','1','1','platform_cover_clerk'),
('79','47','店员操作访问入口','mc','./index.php?c=platform&a=cover&do=clerk&','','','0','url','1','1','platform_cover_clerk'),
('85','2','微信卡券回复','platform','./index.php?c=platform&a=reply&m=wxcard','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=wxcard','0','url','1','1','platform_reply_wxcard'),
('86','46','会员卡设置','mc','./index.php?c=mc&a=card&do=editor','','','0','url','1','1','mc_card_editor'),
('87','46','会员卡其他功能','mc','./index.php?c=mc&a=card&do=other','','','0','url','1','1','mc_card_other'),
('88','51','折扣券核销','mc','./index.php?c=activity&a=consume&do=display&type=1','','','0','url','1','1','activity_consume_coupon'),
('89','51','代金券','mc','./index.php?c=activity&a=token','','','0','url','1','1','activity_token_display'),
('90','51','代金券核销','mc','./index.php?c=activity&a=consume&do=display&type=2','','','0','url','1','1','activity_consume_token'),
('91','51','真实物品','mc','./index.php?c=activity&a=goods','','','0','url','1','1','activity_goods_display'),
('92','57','微信素材','mc','./index.php?c=material&a=display','','','0','url','1','1','material_display'),
('93','57','微信群发','mc','./index.php?c=material&a=mass','','','0','url','1','1','material_mass'),
('94','36','微信卡券管理','mc','','','','0','url','1','1',''),
('95','94','卡券列表','mc','./index.php?c=wechat&a=card&do=list','','','0','url','1','1','wechat_card_list'),
('96','94','卡券核销','mc','./index.php?c=wechat&a=consume','','','0','url','1','1','wechat_consume'),
('97','94','测试白名单','mc','./index.php?c=wechat&a=white&do=list','','','0','url','1','1','wechat_white_list'),
('98','36','门店管理','mc','','','','0','url','1','1',''),
('99','98','门店列表','mc','./index.php?c=activity&a=store','','','0','url','1','1','activity_store_list'),
('100','98','店员列表','mc','./index.php?c=activity&a=clerk','','','0','url','1','1','activity_clerk_list'),
('101','36','微信收款','mc','','','','0','url','0','1',''),
('102','101','刷卡支付','mc','./index.php?c=wxpay&a=micro&do=pay','','','0','url','1','1','wxpay_micro_pay'),
('103','36','统计中心','mc','','','','0','url','1','1',''),
('104','103','会员积分统计','mc','./index.php?c=stat&a=credit1','','','0','url','1','1','stat_credit1'),
('105','103','会员余额统计','mc','./index.php?c=stat&a=credit2','','','0','url','1','1','stat_credit2'),
('106','103','会员现金消费统计','mc','./index.php?c=stat&a=cash','','','0','url','1','1','stat_cash'),
('107','103','会员卡统计','mc','./index.php?c=stat&a=card','','','0','url','1','1','stat_card'),
('108','62','会员字段管理','setting','./index.php?c=mc&a=fields','','','0','url','1','1','mc_fields'),
('109','62','微信通知设置','setting','./index.php?c=mc&a=tplnotice','','','0','url','1','1','mc_tplnotice'),
('110','66','邮件通知参数','setting','./index.php?c=profile&a=notify','','','0','url','1','1','profile_notify'),
('111','0','会员续费','members','','fa fa-cubes','','0','url','1','1',''),
('112','111','管理','members','','','','0','url','1','1',''),
('113','112','续费管理','members','./index.php?c=members&a=member&','','','0','url','1','1','members_member'),
('114','112','续费套餐','members','./index.php?c=members&a=buypackage&','','','0','url','1','1','members_buypackage'),
('115','111','站长管理','members','','','','0','permission','1','1',''),
('116','115','会员消费','members','./index.php?c=members&a=record&','','','0','permission','1','1','members_record'),
('117','115','服务配置','members','./index.php?c=members&a=configs&','','','0','permission','1','1','members_configs'),
('118','115','测试服务','members','./index.php?c=members&a=test&','','','0','permission','1','1','members_test');


DROP TABLE IF EXISTS ims_core_paylog;
CREATE TABLE `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `uniacid` int(11) NOT NULL,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `tid` varchar(64) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(2000) NOT NULL DEFAULT '',
  `acid` int(10) unsigned NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  `uniontid` varchar(50) NOT NULL,
  `createtime` varchar(64) NOT NULL DEFAULT '',
  `eso_tag` varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_performance;
CREATE TABLE `ims_core_performance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_queue;
CREATE TABLE `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL DEFAULT '',
  `params` varchar(1000) NOT NULL DEFAULT '',
  `keyword` varchar(1000) NOT NULL DEFAULT '',
  `response` varchar(2000) NOT NULL DEFAULT '',
  `module` varchar(50) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_resource;
CREATE TABLE `ims_core_resource` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `acid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_sendsms_log;
CREATE TABLE `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_sessions;
CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL DEFAULT '',
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_core_settings;
CREATE TABLE `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `ims_core_settings` VALUES ('authmode','i:1;'),('close','a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}'),('copyright','a:26:{s:6:\"status\";s:1:\"0\";s:10:\"verifycode\";N;s:6:\"reason\";s:3:\"111\";s:6:\"smname\";s:0:\"\";s:8:\"sitename\";s:24:\"微赞微信管理系统\";s:3:\"url\";s:16:\"http://012wz.com\";s:8:\"sitehost\";s:0:\"\";s:8:\"statcode\";s:0:\"\";s:10:\"footerleft\";s:32:\"powered by 微信第三方平台\";s:11:\"footerright\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:3:\"ewm\";s:0:\"\";s:5:\"flogo\";s:0:\"\";s:6:\"slides\";s:2:\"N;\";s:6:\"notice\";s:0:\"\";s:5:\"blogo\";s:0:\"\";s:8:\"baidumap\";a:2:{s:3:\"lng\";s:10:\"114.060055\";s:3:\"lat\";s:9:\"22.529554\";}s:7:\"company\";s:36:\"深圳市零壹贰科技有限公司\";s:7:\"address\";s:60:\"深圳市龙华新区民治大道展滔科技大厦A栋13A03\";s:6:\"person\";s:9:\"锦品汇\";s:5:\"phone\";s:11:\"15800008888\";s:2:\"qq\";s:10:\"1601408008\";s:5:\"email\";s:0:\"\";s:8:\"keywords\";s:82:\"微赞,微信,微信公众平台,公众平台二次开发,公众平台开源软件\";s:11:\"description\";s:82:\"微赞,微信,微信公众平台,公众平台二次开发,公众平台开源软件\";s:12:\"showhomepage\";i:1;}'),('register','a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}'),('addons','a:3:{s:11:\"addons_site\";s:1:\"0\";s:10:\"addons_url\";s:27:\"http://addons.weizancms.com\";s:5:\"c_url\";s:20:\"http://www.012wz.com\";}'),('site','s:0:\"\";'),('module_receive_ban','a:141:{s:12:\"hx_pictorial\";s:12:\"hx_pictorial\";s:10:\"hx_lottery\";s:10:\"hx_lottery\";s:9:\"meepo_pai\";s:9:\"meepo_pai\";s:10:\"hx_express\";s:10:\"hx_express\";s:8:\"hx_cards\";s:8:\"hx_cards\";s:12:\"we7_business\";s:12:\"we7_business\";s:9:\"we7_album\";s:9:\"we7_album\";s:7:\"wl_heka\";s:7:\"wl_heka\";s:12:\"lxy_rtrouter\";s:12:\"lxy_rtrouter\";s:10:\"meepo_sexy\";s:10:\"meepo_sexy\";s:12:\"we7_research\";s:12:\"we7_research\";s:10:\"we7_survey\";s:10:\"we7_survey\";s:9:\"ewei_vote\";s:9:\"ewei_vote\";s:6:\"hl_bbb\";s:6:\"hl_bbb\";s:6:\"hl_dqq\";s:6:\"hl_dqq\";s:6:\"hl_zzz\";s:6:\"hl_zzz\";s:8:\"hx_alert\";s:8:\"hx_alert\";s:10:\"hx_dialect\";s:10:\"hx_dialect\";s:12:\"we7_activity\";s:12:\"we7_activity\";s:9:\"lxy_marry\";s:9:\"lxy_marry\";s:11:\"meepo_nsign\";s:11:\"meepo_nsign\";s:7:\"we7_car\";s:7:\"we7_car\";s:9:\"we7_shake\";s:9:\"we7_shake\";s:9:\"ewei_exam\";s:9:\"ewei_exam\";s:10:\"ewei_hotel\";s:10:\"ewei_hotel\";s:16:\"fwei_moneyimport\";s:16:\"fwei_moneyimport\";s:18:\"stonefish_bigwheel\";s:18:\"stonefish_bigwheel\";s:10:\"scene_cube\";s:10:\"scene_cube\";s:14:\"n1ce_picwether\";s:14:\"n1ce_picwether\";s:12:\"weisrc_audio\";s:12:\"weisrc_audio\";s:10:\"we7_wxwall\";s:10:\"we7_wxwall\";s:11:\"weisrc_pano\";s:11:\"weisrc_pano\";s:15:\"iwobanji_xcpage\";s:15:\"iwobanji_xcpage\";s:10:\"ykbl_robot\";s:10:\"ykbl_robot\";s:17:\"weisrc_invitative\";s:17:\"weisrc_invitative\";s:7:\"we7_egg\";s:7:\"we7_egg\";s:19:\"weisrc_clubbigwheel\";s:19:\"weisrc_clubbigwheel\";s:9:\"eso_share\";s:9:\"eso_share\";s:9:\"mon_house\";s:9:\"mon_house\";s:12:\"hx_zhongchou\";s:12:\"hx_zhongchou\";s:12:\"zam_weimails\";s:12:\"zam_weimails\";s:11:\"ewei_comeon\";s:11:\"ewei_comeon\";s:17:\"stonefish_scratch\";s:17:\"stonefish_scratch\";s:11:\"jeffh_vwifi\";s:11:\"jeffh_vwifi\";s:10:\"zam_findlx\";s:10:\"zam_findlx\";s:11:\"wkf_message\";s:11:\"wkf_message\";s:8:\"eso_sale\";s:8:\"eso_sale\";s:8:\"hx_voice\";s:8:\"hx_voice\";s:18:\"stonefish_luckynum\";s:18:\"stonefish_luckynum\";s:11:\"czt_zhuanfa\";s:11:\"czt_zhuanfa\";s:21:\"weisrc_businesscenter\";s:21:\"weisrc_businesscenter\";s:12:\"lxy_buildpro\";s:12:\"lxy_buildpro\";s:14:\"microb_redpack\";s:14:\"microb_redpack\";s:10:\"ewei_bonus\";s:10:\"ewei_bonus\";s:12:\"weisrc_truth\";s:12:\"weisrc_truth\";s:18:\"stonefish_chailihe\";s:18:\"stonefish_chailihe\";s:10:\"ewei_money\";s:10:\"ewei_money\";s:15:\"xfeng_community\";s:15:\"xfeng_community\";s:15:\"jdg_luvwhispers\";s:15:\"jdg_luvwhispers\";s:21:\"stonefish_redenvelope\";s:21:\"stonefish_redenvelope\";s:8:\"czt_zwmm\";s:8:\"czt_zwmm\";s:12:\"ewei_couplet\";s:12:\"ewei_couplet\";s:8:\"mon_sign\";s:8:\"mon_sign\";s:13:\"null_getvoice\";s:13:\"null_getvoice\";s:16:\"thinkidea_rencai\";s:16:\"thinkidea_rencai\";s:9:\"czt_voice\";s:9:\"czt_voice\";s:19:\"thinkidea_phonebook\";s:19:\"thinkidea_phonebook\";s:11:\"str_takeout\";s:11:\"str_takeout\";s:11:\"weisrc_dish\";s:11:\"weisrc_dish\";s:10:\"eso_runman\";s:10:\"eso_runman\";s:12:\"mon_weishare\";s:12:\"mon_weishare\";s:11:\"lee_tlvoice\";s:11:\"lee_tlvoice\";s:15:\"zombie_fighting\";s:15:\"zombie_fighting\";s:7:\"ju_read\";s:7:\"ju_read\";s:18:\"stonefish_planting\";s:18:\"stonefish_planting\";s:11:\"xhw_picvote\";s:11:\"xhw_picvote\";s:9:\"xhw_voice\";s:9:\"xhw_voice\";s:8:\"xhw_face\";s:8:\"xhw_face\";s:18:\"super_securitycode\";s:18:\"super_securitycode\";s:12:\"amouse_house\";s:12:\"amouse_house\";s:8:\"mon_yjgz\";s:8:\"mon_yjgz\";s:14:\"amouse_article\";s:14:\"amouse_article\";s:10:\"jufeng_wcy\";s:10:\"jufeng_wcy\";s:9:\"mon_brand\";s:9:\"mon_brand\";s:12:\"lee_coreball\";s:12:\"lee_coreball\";s:11:\"page_switch\";s:11:\"page_switch\";s:8:\"mon_fool\";s:8:\"mon_fool\";s:14:\"amouse_weicard\";s:14:\"amouse_weicard\";s:10:\"ewei_dream\";s:10:\"ewei_dream\";s:13:\"ewei_shangshi\";s:13:\"ewei_shangshi\";s:17:\"meepo_weixiangqin\";s:17:\"meepo_weixiangqin\";s:12:\"amouse_ecard\";s:12:\"amouse_ecard\";s:12:\"wdl_bigwheel\";s:12:\"wdl_bigwheel\";s:9:\"xwz_queue\";s:9:\"xwz_queue\";s:12:\"wdl_shopping\";s:12:\"wdl_shopping\";s:12:\"microb_shake\";s:12:\"microb_shake\";s:12:\"feng_auction\";s:12:\"feng_auction\";s:16:\"hl_periarthritis\";s:16:\"hl_periarthritis\";s:9:\"demo_pia3\";s:9:\"demo_pia3\";s:17:\"weisrc_dragonboat\";s:17:\"weisrc_dragonboat\";s:13:\"mon_orderform\";s:13:\"mon_orderform\";s:11:\"water_query\";s:11:\"water_query\";s:8:\"zh_zhibo\";s:8:\"zh_zhibo\";s:18:\"francin_lovehelper\";s:18:\"francin_lovehelper\";s:9:\"bobo_love\";s:9:\"bobo_love\";s:7:\"mon_egg\";s:7:\"mon_egg\";s:9:\"n1ce_love\";s:9:\"n1ce_love\";s:9:\"meepo_fen\";s:9:\"meepo_fen\";s:12:\"water_query2\";s:12:\"water_query2\";s:12:\"n1ce_newchat\";s:12:\"n1ce_newchat\";s:11:\"wmb_goshare\";s:11:\"wmb_goshare\";s:10:\"bobo_dabai\";s:10:\"bobo_dabai\";s:7:\"czt_qzz\";s:7:\"czt_qzz\";s:8:\"bf_shell\";s:8:\"bf_shell\";s:15:\"ewei_takephotoa\";s:15:\"ewei_takephotoa\";s:10:\"find_hotel\";s:10:\"find_hotel\";s:11:\"fl_dkf_khxx\";s:11:\"fl_dkf_khxx\";s:11:\"hx_othermsg\";s:11:\"hx_othermsg\";s:19:\"junsion_qixiqueqiao\";s:19:\"junsion_qixiqueqiao\";s:8:\"lions_zq\";s:8:\"lions_zq\";s:13:\"n1ce_chatmore\";s:13:\"n1ce_chatmore\";s:10:\"on3_voxpic\";s:10:\"on3_voxpic\";s:18:\"netbuffer_idsearch\";s:18:\"netbuffer_idsearch\";s:10:\"wang_huayu\";s:10:\"wang_huayu\";s:9:\"we7_fance\";s:9:\"we7_fance\";s:12:\"quick_center\";s:12:\"quick_center\";s:9:\"yhc_ecard\";s:9:\"yhc_ecard\";s:9:\"ewei_shop\";s:9:\"ewei_shop\";s:7:\"bmfloor\";s:7:\"bmfloor\";s:15:\"hx_securityspro\";s:15:\"hx_securityspro\";s:10:\"yobydashan\";s:10:\"yobydashan\";s:5:\"broke\";s:5:\"broke\";s:7:\"xf_vktv\";s:7:\"xf_vktv\";s:7:\"mon_wkj\";s:7:\"mon_wkj\";s:5:\"lvyou\";s:5:\"lvyou\";s:7:\"hlzonyu\";s:7:\"hlzonyu\";s:8:\"cgt_qyhb\";s:8:\"cgt_qyhb\";s:10:\"xc_article\";s:10:\"xc_article\";s:9:\"aki_yzmye\";s:9:\"aki_yzmye\";s:19:\"q_3354988381_xuyuan\";s:19:\"q_3354988381_xuyuan\";s:9:\"fm_jiaoyu\";s:9:\"fm_jiaoyu\";}'),('basic','a:1:{s:8:\"template\";s:7:\"default\";}'),('mail','a:5:{s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:4:\"smtp\";a:4:{s:4:\"type\";s:3:\"163\";s:6:\"server\";s:0:\"\";s:4:\"port\";s:0:\"\";s:8:\"authmode\";s:1:\"0\";}s:6:\"sender\";s:0:\"\";s:9:\"signature\";s:0:\"\";}'),('sms','a:15:{s:4:\"type\";s:6:\"cocsms\";s:3:\"url\";s:0:\"\";s:12:\"serialNumber\";s:0:\"\";s:8:\"password\";s:0:\"\";s:10:\"sessionKey\";s:0:\"\";s:9:\"proxyhost\";s:0:\"\";s:9:\"proxyport\";s:0:\"\";s:13:\"proxyusername\";s:0:\"\";s:13:\"proxypassword\";s:0:\"\";s:7:\"timeout\";s:0:\"\";s:16:\"response_timeout\";s:0:\"\";s:14:\"dxton_username\";s:0:\"\";s:9:\"dxton_pwd\";s:0:\"\";s:15:\"cocsms_username\";s:0:\"\";s:10:\"cocsms_pwd\";s:0:\"\";}');

DROP TABLE IF EXISTS ims_core_wechats_attachment;
CREATE TABLE `ims_core_wechats_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `type` varchar(15) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_coupon;
CREATE TABLE `ims_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `logo_url` varchar(150) NOT NULL,
  `code_type` tinyint(3) unsigned NOT NULL,
  `brand_name` varchar(15) NOT NULL,
  `title` varchar(15) NOT NULL,
  `sub_title` varchar(20) NOT NULL,
  `color` varchar(15) NOT NULL,
  `notice` varchar(15) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date_info` varchar(200) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `location_id_list` varchar(1000) NOT NULL,
  `use_custom_code` tinyint(3) NOT NULL,
  `bind_openid` tinyint(3) unsigned NOT NULL,
  `can_share` tinyint(3) unsigned NOT NULL,
  `can_give_friend` tinyint(3) unsigned NOT NULL,
  `get_limit` tinyint(3) unsigned NOT NULL,
  `service_phone` varchar(20) NOT NULL,
  `extra` varchar(1000) NOT NULL,
  `source` varchar(20) NOT NULL,
  `url_name_type` varchar(20) NOT NULL,
  `custom_url` varchar(100) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `promotion_url_name` varchar(10) NOT NULL,
  `promotion_url` varchar(100) NOT NULL,
  `promotion_url_sub_title` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_coupon_location;
CREATE TABLE `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_coupon_modules;
CREATE TABLE `ims_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `card_id` (`card_id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_coupon_record;
CREATE TABLE `ims_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `outer_id` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `friend_openid` varchar(50) NOT NULL,
  `givebyfriend` tinyint(3) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL,
  `clerk_name` varchar(15) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `clerk_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `outer_id` (`outer_id`),
  KEY `card_id` (`card_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_coupon_setting;
CREATE TABLE `ims_coupon_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) NOT NULL,
  `logourl` varchar(150) NOT NULL,
  `whitelist` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_cover_reply;
CREATE TABLE `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL DEFAULT '',
  `do` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ims_cover_reply VALUES 
('1','1','0','7','mc','','个人中心入口设置','','','./index.php?c=mc&a=home&i=1'),
('2','1','1','8','site','','微赞团队入口设置','','','./index.php?c=home&i=1&t=1');


DROP TABLE IF EXISTS ims_custom_reply;
CREATE TABLE `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL DEFAULT '-1',
  `end1` int(10) NOT NULL DEFAULT '-1',
  `start2` int(10) NOT NULL DEFAULT '-1',
  `end2` int(10) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_cut_zongzi_billboard;
CREATE TABLE `ims_cut_zongzi_billboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `score` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_cut_zongzi_settings;
CREATE TABLE `ims_cut_zongzi_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_czt_subscribe_redpack_records;
CREATE TABLE `ims_czt_subscribe_redpack_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `fee` varchar(20) NOT NULL DEFAULT '',
  `log` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_t` int(10) unsigned NOT NULL,
  `success_t` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `log` (`log`(333)),
  KEY `uniacid` (`uniacid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_czt_zhuanfa_reply;
CREATE TABLE `ims_czt_zhuanfa_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `url` varchar(500) NOT NULL,
  `token` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dayu_yuyuepay;
CREATE TABLE `ims_dayu_yuyuepay` (
  `reid` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL,
  `content` text NOT NULL,
  `information` varchar(500) NOT NULL DEFAULT '',
  `thumb` varchar(200) NOT NULL DEFAULT '',
  `inhome` tinyint(4) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `starttime` int(10) NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `kaishi` int(11) NOT NULL DEFAULT '1',
  `jieshu` int(11) NOT NULL DEFAULT '22',
  `tianshu` int(11) NOT NULL DEFAULT '15',
  `pretotal` int(10) unsigned NOT NULL DEFAULT '1',
  `pay` int(10) unsigned NOT NULL DEFAULT '1',
  `xmshow` int(10) unsigned NOT NULL DEFAULT '0',
  `xmname` varchar(50) NOT NULL DEFAULT '',
  `yuyuename` varchar(50) NOT NULL DEFAULT '',
  `noticeemail` varchar(50) NOT NULL DEFAULT '',
  `k_templateid` varchar(50) NOT NULL DEFAULT '',
  `kfid` varchar(50) NOT NULL DEFAULT '',
  `m_templateid` varchar(50) NOT NULL DEFAULT '',
  `accountsid` varchar(50) NOT NULL DEFAULT '',
  `tokenid` varchar(50) NOT NULL DEFAULT '',
  `appId` varchar(50) NOT NULL DEFAULT '',
  `templateId` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `mname` varchar(10) NOT NULL DEFAULT '',
  `skins` varchar(20) NOT NULL DEFAULT 'submit',
  `kfirst` varchar(100) NOT NULL COMMENT '客服模板页头',
  `kfoot` varchar(100) NOT NULL COMMENT '客服模板页尾',
  `mfirst` varchar(100) NOT NULL COMMENT '客户模板页头',
  `mfoot` varchar(100) NOT NULL COMMENT '客户模板页尾',
  `share_url` varchar(100) NOT NULL DEFAULT '',
  `follow` tinyint(1) DEFAULT '0',
  `code` tinyint(1) DEFAULT '0',
  `is_time` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`reid`),
  KEY `weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dayu_yuyuepay_data;
CREATE TABLE `ims_dayu_yuyuepay_data` (
  `redid` bigint(20) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL,
  `rerid` int(11) NOT NULL,
  `refid` int(11) NOT NULL,
  `data` varchar(800) NOT NULL,
  PRIMARY KEY (`redid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dayu_yuyuepay_fields;
CREATE TABLE `ims_dayu_yuyuepay_fields` (
  `refid` int(11) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `essential` tinyint(4) NOT NULL DEFAULT '0',
  `bind` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `displayorder` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`refid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dayu_yuyuepay_info;
CREATE TABLE `ims_dayu_yuyuepay_info` (
  `rerid` int(11) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL,
  `member` varchar(50) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '预约状态',
  `xmid` int(11) NOT NULL,
  `price` varchar(10) NOT NULL DEFAULT '',
  `ordersn` varchar(20) NOT NULL COMMENT '订单编号',
  `transid` varchar(30) NOT NULL COMMENT '微信订单号',
  `paystatus` tinyint(4) NOT NULL COMMENT '付款状态',
  `paytype` tinyint(4) NOT NULL COMMENT '付款方式',
  `yuyuetime` int(10) NOT NULL DEFAULT '0' COMMENT '客服确认时间',
  `kfinfo` varchar(100) NOT NULL COMMENT '客服信息',
  `createtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rerid`),
  KEY `reid` (`reid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dayu_yuyuepay_reply;
CREATE TABLE `ims_dayu_yuyuepay_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `reid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dayu_yuyuepay_xiangmu;
CREATE TABLE `ims_dayu_yuyuepay_xiangmu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `reid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `price` varchar(10) NOT NULL DEFAULT '',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `isshow` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dqq_award;
CREATE TABLE `ims_dqq_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `title` varchar(50) NOT NULL COMMENT '奖品名称',
  `total` int(11) NOT NULL COMMENT '数量',
  `probalilty` varchar(5) NOT NULL COMMENT '概率单位%',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '描述',
  `inkind` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否是实物',
  `get_jf` int(11) NOT NULL COMMENT '获取的积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dqq_reply;
CREATE TABLE `ims_dqq_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `picture` varchar(100) NOT NULL COMMENT '活动图片',
  `description` varchar(100) NOT NULL COMMENT '活动描述',
  `rule` varchar(1000) NOT NULL COMMENT '规则',
  `periodlottery` smallint(10) unsigned NOT NULL DEFAULT '1' COMMENT '0为无周期',
  `maxlottery` tinyint(3) unsigned NOT NULL COMMENT '最大抽奖数',
  `default_tips` varchar(100) NOT NULL COMMENT '默认提示信息',
  `hitcredit` int(11) NOT NULL COMMENT '中奖奖励积分',
  `misscredit` int(11) NOT NULL COMMENT '未中奖奖励积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dqq_winner;
CREATE TABLE `ims_dqq_winner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `aid` int(10) unsigned NOT NULL COMMENT '奖品ID',
  `award` varchar(100) NOT NULL DEFAULT '' COMMENT '奖品名称',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '中奖信息描述',
  `from_user` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未领奖，1不需要领奖，2已领奖',
  `createtime` int(10) unsigned NOT NULL COMMENT '获奖日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dream_reply;
CREATE TABLE `ims_dream_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `weid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `picurl` varchar(200) DEFAULT '',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `share_title` varchar(50) DEFAULT '',
  `share_content` varchar(255) DEFAULT '',
  `isshow` tinyint(1) DEFAULT '0',
  `viewnum` int(11) DEFAULT '0',
  `dreamnum` int(11) DEFAULT '0',
  `logo` varchar(200) DEFAULT NULL,
  `gzurl` varchar(255) DEFAULT NULL,
  `slogans` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_dream_wish;
CREATE TABLE `ims_dream_wish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `fansID` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '0',
  `drea_mname` varchar(50) DEFAULT '' COMMENT '自己名字',
  `to_name` varchar(200) DEFAULT '' COMMENT '好友名字',
  `dream` varchar(50) DEFAULT '' COMMENT '梦想',
  `createtime` int(10) DEFAULT '0',
  `consumetime` int(10) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_duanwu_dianzan;
CREATE TABLE `ims_duanwu_dianzan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `toopenid` varchar(100) NOT NULL,
  `createtime` int(12) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_duanwu_fans;
CREATE TABLE `ims_duanwu_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `content` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `yingcang` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否隐藏',
  `uid` int(10) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `liketimes` int(10) NOT NULL DEFAULT '0' COMMENT '点赞次数',
  `sharetimes` int(10) NOT NULL DEFAULT '0' COMMENT '分享次数',
  `createtime` int(12) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_duanwu_show;
CREATE TABLE `ims_duanwu_show` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `picurl` varchar(200) NOT NULL DEFAULT '0',
  `thumbpath` varchar(200) NOT NULL DEFAULT '0',
  `hei` varchar(20) DEFAULT '',
  `openid` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `uid` int(10) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `createtime` int(12) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_egg_award;
CREATE TABLE `ims_egg_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `title` varchar(50) NOT NULL COMMENT '奖品名称',
  `total` int(11) NOT NULL COMMENT '数量',
  `probalilty` varchar(5) NOT NULL COMMENT '概率单位%',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '描述',
  `inkind` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否是实物',
  `activation_code` text,
  `activation_url` varchar(200) NOT NULL COMMENT '激活地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_egg_reply;
CREATE TABLE `ims_egg_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `picture` varchar(100) NOT NULL COMMENT '活动图片',
  `description` varchar(100) NOT NULL COMMENT '活动描述',
  `rule` text NOT NULL COMMENT '规则',
  `periodlottery` smallint(10) unsigned NOT NULL DEFAULT '1' COMMENT '0为无周期',
  `maxlottery` tinyint(3) unsigned NOT NULL COMMENT '最大抽奖数',
  `default_tips` varchar(100) NOT NULL COMMENT '默认提示信息',
  `hitcredit` int(11) NOT NULL COMMENT '中奖奖励积分',
  `misscredit` int(11) NOT NULL COMMENT '未中奖奖励积分',
  `starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_egg_winner;
CREATE TABLE `ims_egg_winner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `aid` int(10) unsigned NOT NULL COMMENT '奖品ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `isaward` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `award` varchar(100) NOT NULL DEFAULT '' COMMENT '奖品名称',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '中奖信息描述',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未领奖，1不需要领奖，2已领奖',
  `createtime` int(10) unsigned NOT NULL COMMENT '获奖日期',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_circle_comment;
CREATE TABLE `ims_enjoy_circle_comment` (
  `cid` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(50) DEFAULT NULL,
  `tid` int(255) DEFAULT NULL,
  `comment` varchar(10000) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `cuid` int(200) DEFAULT '0',
  `hot` int(50) DEFAULT '0',
  `createtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_circle_fans;
CREATE TABLE `ims_enjoy_circle_fans` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `proxy` varchar(40) NOT NULL DEFAULT '',
  `unionid` varchar(40) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `gender` varchar(2) DEFAULT '',
  `state` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(20) NOT NULL DEFAULT '',
  `avatar` varchar(500) NOT NULL DEFAULT '',
  `puid` int(20) DEFAULT NULL,
  `black` int(2) NOT NULL DEFAULT '0',
  `ip` varchar(50) DEFAULT NULL,
  `subscribe` int(2) DEFAULT NULL,
  `subscribe_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `uniacid` (`uniacid`),
  KEY `openid` (`openid`),
  KEY `proxy` (`proxy`),
  KEY `nickname` (`nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_circle_reply;
CREATE TABLE `ims_enjoy_circle_reply` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(20) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sucai` varchar(200) DEFAULT NULL,
  `exurl` varchar(500) DEFAULT NULL,
  `expic` varchar(200) DEFAULT NULL,
  `extitle` varchar(200) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `ewm` varchar(200) DEFAULT NULL,
  `bgpic` varchar(200) DEFAULT NULL,
  `subscribe` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_circle_topic;
CREATE TABLE `ims_enjoy_circle_topic` (
  `tid` int(255) NOT NULL AUTO_INCREMENT,
  `uniacid` int(50) NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `hot` int(100) DEFAULT NULL,
  `zan` varchar(500) DEFAULT NULL,
  `cuid` int(200) DEFAULT '0',
  `joinnum` int(200) DEFAULT NULL,
  `createtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_red_back;
CREATE TABLE `ims_enjoy_red_back` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(50) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `money` float(50,2) NOT NULL DEFAULT '0.00',
  `createtime` int(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_red_chance;
CREATE TABLE `ims_enjoy_red_chance` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(20) DEFAULT NULL,
  `openid` varchar(200) DEFAULT NULL,
  `chance` int(20) unsigned DEFAULT NULL,
  `createtime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_red_chance_log;
CREATE TABLE `ims_enjoy_red_chance_log` (
  `id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(20) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `puid` int(20) DEFAULT NULL,
  `chance` int(10) DEFAULT NULL,
  `createtime` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_red_fans;
CREATE TABLE `ims_enjoy_red_fans` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `proxy` varchar(40) NOT NULL DEFAULT '',
  `unionid` varchar(40) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `gender` varchar(2) DEFAULT '',
  `state` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(20) NOT NULL DEFAULT '',
  `avatar` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `puid` int(20) DEFAULT NULL,
  `subscribe` int(2) DEFAULT NULL,
  `subscribe_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `uniacid` (`uniacid`),
  KEY `openid` (`openid`),
  KEY `proxy` (`proxy`),
  KEY `nickname` (`nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_red_log;
CREATE TABLE `ims_enjoy_red_log` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(20) DEFAULT NULL,
  `openid` varchar(200) DEFAULT NULL,
  `money` float(20,2) DEFAULT NULL,
  `createtime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_red_reply;
CREATE TABLE `ims_enjoy_red_reply` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(20) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `rule` varchar(1000) DEFAULT NULL,
  `adept` varchar(1000) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `apic` varchar(200) DEFAULT NULL,
  `fpic` varchar(200) DEFAULT NULL,
  `bgpic` varchar(200) DEFAULT NULL,
  `redpic` varchar(200) DEFAULT NULL,
  `redpic1` varchar(200) DEFAULT NULL,
  `redpic2` varchar(200) DEFAULT NULL,
  `redpic3` varchar(200) DEFAULT NULL,
  `redpic4` varchar(200) DEFAULT NULL,
  `redpic5` varchar(200) DEFAULT NULL,
  `redpic6` varchar(200) DEFAULT NULL,
  `custom` int(2) NOT NULL DEFAULT '0',
  `sucai` varchar(200) DEFAULT NULL,
  `chance` int(20) DEFAULT NULL,
  `share_chance` int(20) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `vnum` int(200) DEFAULT NULL,
  `vmin` int(50) DEFAULT NULL,
  `vmax` int(50) DEFAULT NULL,
  `subscribe` int(2) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `times` int(50) NOT NULL DEFAULT '200',
  `cashgz` int(2) NOT NULL DEFAULT '0',
  `stime` varchar(200) DEFAULT NULL,
  `etime` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_enjoy_red_rule;
CREATE TABLE `ims_enjoy_red_rule` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(50) unsigned DEFAULT NULL,
  `rmax` int(20) DEFAULT NULL,
  `rmin` int(20) DEFAULT NULL,
  `rchance` int(10) DEFAULT NULL,
  `rcount` int(100) DEFAULT NULL,
  `createtime` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_runman_plus;
CREATE TABLE `ims_eso_runman_plus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL COMMENT '加分-被加分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='奔跑兄弟 - 加温记录';



DROP TABLE IF EXISTS ims_eso_runman_reply;
CREATE TABLE `ims_eso_runman_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `content` text,
  `background` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `description` text,
  `share_title` varchar(255) DEFAULT '',
  `share_desc` varchar(255) DEFAULT '',
  `share_url` varchar(255) DEFAULT '',
  `mp3` varchar(255) DEFAULT '',
  `join` int(10) unsigned DEFAULT '0',
  `view` int(10) unsigned DEFAULT '0',
  `share_txt` text,
  `regular` text,
  `setting` text,
  `starttime` bigint(18) unsigned DEFAULT '0',
  `endtime` bigint(18) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='奔跑兄弟 - 回复规则';



DROP TABLE IF EXISTS ims_eso_runman_submit;
CREATE TABLE `ims_eso_runman_submit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT '',
  `rid` int(11) DEFAULT NULL,
  `openid` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '0',
  `did` int(10) unsigned DEFAULT '0',
  `indate` bigint(18) unsigned DEFAULT '0',
  `update` bigint(18) unsigned DEFAULT '0',
  `money` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '提现金额',
  `exchange` tinyint(3) unsigned DEFAULT '0' COMMENT '1为已处理',
  `setting` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='奔跑兄弟 - 领取记录';



DROP TABLE IF EXISTS ims_eso_runman_users;
CREATE TABLE `ims_eso_runman_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `ruid` int(11) DEFAULT NULL COMMENT '来源会员ID',
  `rnum` int(10) unsigned DEFAULT '0' COMMENT '被访问次数',
  `title` varchar(255) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `openid` varchar(255) DEFAULT '',
  `indate` bigint(18) unsigned DEFAULT '0' COMMENT '入住时间',
  `ladate` varchar(20) DEFAULT '',
  `defaultval` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '初始暖值',
  `ruidval` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '别人加的暖值',
  `val` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '当前暖值（暖值总）',
  `one` tinyint(3) unsigned DEFAULT '0' COMMENT '第一次进入',
  `setting` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='奔跑兄弟 - 会员';



DROP TABLE IF EXISTS ims_eso_sale_address;
CREATE TABLE `ims_eso_sale_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL,
  `address` varchar(300) NOT NULL,
  `isdefault` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_adv;
CREATE TABLE `ims_eso_sale_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_cart;
CREATE TABLE `ims_eso_sale_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `goodsid` int(11) NOT NULL,
  `goodstype` tinyint(1) NOT NULL DEFAULT '1',
  `from_user` varchar(50) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `optionid` int(10) DEFAULT '0',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_openid` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_category;
CREATE TABLE `ims_eso_sale_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `commission` int(10) unsigned DEFAULT '0' COMMENT '推荐该类商品所能获得的佣金',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_commission;
CREATE TABLE `ims_eso_sale_commission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL COMMENT '粉丝ID',
  `ogid` int(10) unsigned DEFAULT NULL COMMENT '订单商品ID',
  `commission` decimal(10,2) unsigned NOT NULL COMMENT '佣金',
  `content` text,
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为账户充值记录，1为提现记录',
  `isout` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为未导出，1为已导出',
  `isshare` int(11) DEFAULT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_credit_award;
CREATE TABLE `ims_eso_sale_credit_award` (
  `award_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `deadline` datetime NOT NULL,
  `credit_cost` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '100',
  `content` text NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`award_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_credit_request;
CREATE TABLE `ims_eso_sale_credit_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `award_id` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_dispatch;
CREATE TABLE `ims_eso_sale_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `dispatchname` varchar(50) DEFAULT '',
  `dispatchtype` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `firstprice` decimal(10,2) DEFAULT '0.00',
  `secondprice` decimal(10,2) DEFAULT '0.00',
  `firstweight` int(11) DEFAULT '0',
  `secondweight` int(11) DEFAULT '0',
  `express` int(11) DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_express;
CREATE TABLE `ims_eso_sale_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `express_name` varchar(50) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `express_price` varchar(10) DEFAULT '',
  `express_area` varchar(100) DEFAULT '',
  `express_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_feedback;
CREATE TABLE `ims_eso_sale_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为维权，2为告擎',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0未解决，1用户同意，2用户拒绝',
  `feedbackid` varchar(30) NOT NULL COMMENT '投诉单号',
  `transid` varchar(30) NOT NULL COMMENT '订单号',
  `reason` varchar(1000) NOT NULL COMMENT '理由',
  `solution` varchar(1000) NOT NULL COMMENT '期待解决方案',
  `remark` varchar(1000) NOT NULL COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_feedbackid` (`feedbackid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_transid` (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_goods;
CREATE TABLE `ims_eso_sale_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为实体，2为虚拟',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `xsthumb` varchar(255) DEFAULT '',
  `unit` varchar(5) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `goodssn` varchar(50) NOT NULL DEFAULT '',
  `productsn` varchar(50) NOT NULL DEFAULT '',
  `marketprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `costprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` int(10) NOT NULL DEFAULT '0',
  `totalcnf` int(11) DEFAULT '0' COMMENT '0 拍下减库存 1 付款减库存 2 永久不减',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `spec` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit` int(11) DEFAULT '0',
  `maxbuy` int(11) DEFAULT '0',
  `hasoption` int(11) DEFAULT '0',
  `dispatch` int(11) DEFAULT '0',
  `thumb_url` text,
  `isnew` int(11) DEFAULT '0',
  `ishot` int(11) DEFAULT '0',
  `isdiscount` int(11) DEFAULT '0',
  `isrecommand` int(11) DEFAULT '0',
  `istime` int(11) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `viewcount` int(11) DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `commission2` int(3) DEFAULT NULL,
  `commission3` int(3) DEFAULT NULL,
  `commission` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_goods_option;
CREATE TABLE `ims_eso_sale_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `productprice` decimal(10,2) DEFAULT '0.00',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `costprice` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `displayorder` int(11) DEFAULT '0',
  `specs` text,
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_goods_param;
CREATE TABLE `ims_eso_sale_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_member;
CREATE TABLE `ims_eso_sale_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `shareid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `from_user` varchar(50) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `bankcard` varchar(20) DEFAULT NULL,
  `banktype` varchar(20) DEFAULT NULL,
  `alipay` varchar(100) DEFAULT NULL,
  `wxhao` varchar(100) DEFAULT NULL,
  `commission` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '已结佣佣金',
  `zhifu` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '已打款佣金',
  `content` text,
  `createtime` int(10) NOT NULL,
  `flagtime` int(10) DEFAULT NULL COMMENT '为成推广人的时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '0为禁用，1为可用',
  `flag` tinyint(1) DEFAULT '0' COMMENT '0为会推广人，1为推广人',
  `clickcount` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_order;
CREATE TABLE `ims_eso_sale_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `shareid` int(10) unsigned DEFAULT '0' COMMENT '推荐人ID',
  `ordersn` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `sendtype` tinyint(1) unsigned NOT NULL COMMENT '1为快递，2为自提',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `goodstype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `addressid` int(10) unsigned NOT NULL,
  `expresscom` varchar(30) NOT NULL DEFAULT '',
  `expresssn` varchar(50) NOT NULL DEFAULT '',
  `express` varchar(200) NOT NULL DEFAULT '',
  `goodsprice` decimal(10,2) DEFAULT '0.00',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `dispatch` int(10) DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_order_goods;
CREATE TABLE `ims_eso_sale_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `goodsid` int(10) unsigned NOT NULL,
  `commission` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '该订单的推荐佣金',
  `commission2` decimal(10,2) unsigned DEFAULT '0.00',
  `commission3` decimal(10,2) unsigned DEFAULT '0.00',
  `applytime` int(10) unsigned DEFAULT NULL COMMENT '申请时间',
  `checktime` int(10) unsigned DEFAULT NULL COMMENT '审核时间',
  `status` tinyint(3) DEFAULT '0' COMMENT '申请状态，-2为标志删除，-1为审核无效，0为未申请，1为正在申请，2为审核通过',
  `content` text,
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(10) unsigned NOT NULL DEFAULT '1',
  `optionid` int(10) DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `optionname` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_product;
CREATE TABLE `ims_eso_sale_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NOT NULL,
  `productsn` varchar(50) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `marketprice` decimal(10,0) unsigned NOT NULL,
  `productprice` decimal(10,0) unsigned NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `spec` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodsid` (`goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_rule;
CREATE TABLE `ims_eso_sale_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '',
  `rule` text,
  `terms` text,
  `createtime` int(10) NOT NULL,
  `gzurl` varchar(255) NOT NULL,
  `teamfy` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_rules;
CREATE TABLE `ims_eso_sale_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `rule` text,
  `terms` text,
  `createtime` int(10) NOT NULL,
  `commtime` int(5) NOT NULL DEFAULT '15' COMMENT '默认15天',
  `promotertimes` int(10) NOT NULL DEFAULT '1' COMMENT '默认成交一次才能成为推广员',
  `ischeck` tinyint(1) DEFAULT '1' COMMENT '0为未审核，1为审核',
  `clickcredit` int(10) NOT NULL DEFAULT '0' COMMENT '点击获取积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_share_history;
CREATE TABLE `ims_eso_sale_share_history` (
  `sharemid` int(11) DEFAULT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_spec;
CREATE TABLE `ims_eso_sale_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `displaytype` tinyint(3) unsigned NOT NULL,
  `content` text NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_sale_spec_item;
CREATE TABLE `ims_eso_sale_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `show` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_specid` (`specid`),
  KEY `indx_show` (`show`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_eso_share_data;
CREATE TABLE `ims_eso_share_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则id',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `userid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户uid',
  `eso_shareip` varchar(15) NOT NULL DEFAULT '' COMMENT '分享达人IP',
  `eso_sharetime` int(10) unsigned NOT NULL COMMENT '分享时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享达人';



DROP TABLE IF EXISTS ims_eso_share_list;
CREATE TABLE `ims_eso_share_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则id',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `userid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户uid',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `eso_sharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `eso_sharetime` int(10) unsigned NOT NULL COMMENT '最后分享时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁止',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享达人';



DROP TABLE IF EXISTS ims_eso_share_reply;
CREATE TABLE `ims_eso_share_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `isname` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要绑定个人信息',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL COMMENT '规则标题',
  `checkkeyword` varchar(50) NOT NULL COMMENT '查询关键词',
  `picture` varchar(100) NOT NULL COMMENT '图片',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开关状态',
  `r` int(10) unsigned NOT NULL DEFAULT '0',
  `z` int(10) unsigned NOT NULL DEFAULT '0',
  `u` varchar(255) DEFAULT NULL,
  `share_url` text,
  `share_txt` text,
  `share_desc` text,
  `share_title` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享达人';



DROP TABLE IF EXISTS ims_ewei_bonus_fans;
CREATE TABLE `ims_ewei_bonus_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `openid` varchar(100) DEFAULT '' COMMENT '用户ID',
  `nickname` varchar(255) DEFAULT '' COMMENT '昵称',
  `headurl` varchar(255) DEFAULT '' COMMENT '头像',
  `area` varchar(255) DEFAULT '' COMMENT '地区',
  `realname` varchar(255) DEFAULT '' COMMENT '姓名',
  `mobile` varchar(255) DEFAULT '' COMMENT '手机',
  `paytype` tinyint(1) DEFAULT '0',
  `account` varchar(255) DEFAULT '',
  `bank` varchar(255) DEFAULT '',
  `points_start` decimal(10,2) DEFAULT '0.00' COMMENT '初始钱数',
  `points_current` decimal(10,2) DEFAULT '0.00' COMMENT '当前钱数',
  `points_help` decimal(10,2) DEFAULT '0.00' COMMENT '合体钱数',
  `points_withdraw` decimal(10,2) DEFAULT '0.00' COMMENT '提取钱数',
  `points_total` decimal(10,2) DEFAULT '0.00' COMMENT '钱数总数',
  `helps` int(11) DEFAULT '0' COMMENT '被帮助数',
  `helpothers` int(11) DEFAULT '0' COMMENT '帮助数',
  `joincount` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '0 未提现 1 已提现',
  `createtime` int(10) DEFAULT '0' COMMENT '参与时间',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_bonus_fans_help;
CREATE TABLE `ims_ewei_bonus_fans_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `fansopenid` varchar(100) DEFAULT '',
  `openid` varchar(100) DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `headurl` varchar(255) DEFAULT '',
  `points` decimal(10,2) DEFAULT '0.00',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_bonus_fans_record;
CREATE TABLE `ims_ewei_bonus_fans_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `openid` varchar(100) DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `points` decimal(10,2) DEFAULT '0.00' COMMENT '钱数',
  `status` int(11) DEFAULT '0' COMMENT '状态 0 申请 1 已提现',
  `sim` int(11) DEFAULT '0' COMMENT '状态 0 用户 1 模拟',
  `createtime` int(10) DEFAULT '0' COMMENT '申请时间',
  `consumetime` int(10) DEFAULT '0' COMMENT '提现时间',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_bonus_reply;
CREATE TABLE `ims_ewei_bonus_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `thumb` varchar(200) DEFAULT '',
  `isshow` tinyint(1) DEFAULT '0',
  `viewnum` int(11) DEFAULT '0',
  `start` decimal(10,2) DEFAULT '0.00',
  `end` decimal(10,2) DEFAULT '0.00',
  `detail` text,
  `rules` text,
  `copyright` varchar(200) DEFAULT '',
  `followurl` varchar(1000) DEFAULT '',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `joincount` int(11) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  `points` decimal(10,2) DEFAULT '100.00' COMMENT '多少可以申请提现',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_bonus_sysset;
CREATE TABLE `ims_ewei_bonus_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `appid_share` varchar(255) DEFAULT '',
  `appsecret_share` varchar(255) DEFAULT '',
  `resroot` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_comeon_award;
CREATE TABLE `ims_ewei_comeon_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `point` decimal(10,2) DEFAULT '0.00',
  `name` varchar(255) DEFAULT '',
  `num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_comeon_fans;
CREATE TABLE `ims_ewei_comeon_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `from_user` varchar(100) DEFAULT '' COMMENT '用户ID',
  `mobile` varchar(20) DEFAULT '' COMMENT '登记信息(手机等)',
  `points` decimal(10,2) DEFAULT '0.00' COMMENT '点数',
  `helps` int(11) DEFAULT '0' COMMENT '被助力次数',
  `createtime` int(10) DEFAULT '0',
  `status` int(10) DEFAULT '0',
  `awardid` int(10) DEFAULT '0',
  `awardtime` int(10) DEFAULT '0',
  `finger` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_comeon_fans_help;
CREATE TABLE `ims_ewei_comeon_fans_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `from_user` varchar(100) DEFAULT '' COMMENT '助力的',
  `fansid` int(11) DEFAULT '0' COMMENT '被助力的',
  `date` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_comeon_reply;
CREATE TABLE `ims_ewei_comeon_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `weid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `thumb` varchar(200) DEFAULT '',
  `isshow` tinyint(1) DEFAULT '0',
  `fansnum` int(11) DEFAULT '0',
  `viewnum` int(11) DEFAULT '0',
  `toppic` varchar(255) DEFAULT '',
  `bgcolor` varchar(255) DEFAULT '',
  `fontcolor` varchar(255) DEFAULT '',
  `btncolor` varchar(255) DEFAULT '',
  `btnfontcolor` varchar(255) DEFAULT '',
  `start` decimal(10,2) DEFAULT '0.00',
  `end` decimal(10,2) DEFAULT '0.00',
  `tips` varchar(200) DEFAULT '',
  `info_tips` varchar(200) DEFAULT '' COMMENT '例如 您已经获得 [P] [U]',
  `help_tips` varchar(200) DEFAULT '' COMMENT '例如 给TA助力',
  `join_tips` varchar(200) DEFAULT '' COMMENT '例如 我也来领取加油卡',
  `invite_tips` varchar(200) DEFAULT '' COMMENT '例如 邀请好友助力',
  `rank_tips` varchar(200) DEFAULT '' COMMENT '例如 显示排名',
  `rank_num` int(11) DEFAULT '0' COMMENT '多少名之前的排名',
  `unit` varchar(200) DEFAULT '' COMMENT '单位',
  `ticket_information` varchar(200) DEFAULT '',
  `tel_rename` varchar(200) DEFAULT '',
  `content` text,
  `copyright` varchar(200) DEFAULT '',
  `joincontent` text,
  `overcontent` text,
  `self_times` int(11) DEFAULT '0' COMMENT '活动期间可以被助力几次',
  `self_day_times` int(11) DEFAULT '0' COMMENT '每天可以被助力几次',
  `other_times` int(11) DEFAULT '0' COMMENT '活动期间可给别人助力多少次',
  `other_day_times` int(11) DEFAULT '0' COMMENT '每天可给别人助力多少次',
  `other_one_times` int(11) DEFAULT '0' COMMENT '活动期间可给相同助力多少次',
  `other_one_day_times` int(11) DEFAULT '0' COMMENT '每天可给相同用户助力多少次',
  `type` tinyint(1) DEFAULT '0' COMMENT '规则类型 0 集分 1 集分',
  `show_rank` tinyint(1) DEFAULT '0' COMMENT '显示排名 0 不显示 1 显示',
  `show_num` tinyint(1) DEFAULT '0' COMMENT '是否显示奖品数量',
  `show_helps` tinyint(1) DEFAULT '0' COMMENT '是否显示助力数',
  `awardtype` tinyint(1) DEFAULT '0' COMMENT '奖品类型 0 一次性 1 阶梯性',
  `awards` text COMMENT '奖品',
  `rules` text COMMENT '规则',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  `share_title` varchar(200) DEFAULT '',
  `share_desc` varchar(300) DEFAULT '',
  `share_url` varchar(100) DEFAULT '',
  `share_txt` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_comeon_rule;
CREATE TABLE `ims_ewei_comeon_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `point` decimal(10,2) DEFAULT '0.00',
  `start` decimal(10,2) DEFAULT '0.00',
  `end` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_comeon_sysset;
CREATE TABLE `ims_ewei_comeon_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `appid_share` varchar(255) DEFAULT '',
  `appsecret_share` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_couplet_fans;
CREATE TABLE `ims_ewei_couplet_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `openid` varchar(100) DEFAULT '' COMMENT '用户ID',
  `nickname` varchar(255) DEFAULT '' COMMENT '昵称',
  `headurl` varchar(255) DEFAULT '' COMMENT '头像',
  `area` varchar(255) DEFAULT '' COMMENT '地区',
  `realname` varchar(255) DEFAULT '' COMMENT '姓名',
  `mobile` varchar(255) DEFAULT '' COMMENT '手机',
  `uptext` text COMMENT '上联',
  `downtext` text COMMENT '下联',
  `rule` text COMMENT '规则',
  `helps` int(11) DEFAULT '0' COMMENT '被帮助数',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 未中奖 1 已中奖 2 已兑奖',
  `num` int(11) DEFAULT '0' COMMENT '抽中个数',
  `log` tinyint(1) DEFAULT '0',
  `sim` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0' COMMENT '参与时间',
  `consumetime` int(10) DEFAULT '0' COMMENT '兑奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_couplet_fans_help;
CREATE TABLE `ims_ewei_couplet_fans_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `fansopenid` varchar(100) DEFAULT '',
  `openid` varchar(100) DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `headurl` varchar(255) DEFAULT '',
  `desc` text,
  `status` tinyint(1) DEFAULT '0' COMMENT '0 错误 1 正确',
  `createtime` int(10) DEFAULT '0' COMMENT '帮助时间',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_couplet_reply;
CREATE TABLE `ims_ewei_couplet_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `thumb` varchar(200) DEFAULT '',
  `isshow` tinyint(1) DEFAULT '0',
  `viewnum` int(11) DEFAULT '0',
  `start` decimal(10,2) DEFAULT '0.00',
  `end` decimal(10,2) DEFAULT '0.00',
  `detail` text,
  `rules` text,
  `couplets` text,
  `award_name` varchar(255) DEFAULT '0',
  `award_total` int(11) DEFAULT '0',
  `award_last` int(11) DEFAULT '0',
  `friendcount` int(11) DEFAULT '0',
  `copyright` varchar(200) DEFAULT '',
  `toptext` varchar(200) DEFAULT '',
  `followurl` varchar(1000) DEFAULT '',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `joincount` int(11) DEFAULT '0',
  `bgcolor` varchar(255) DEFAULT '',
  `res_img1` varchar(255) DEFAULT '',
  `res_img2` varchar(255) DEFAULT '',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_couplet_sysset;
CREATE TABLE `ims_ewei_couplet_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `appid_share` varchar(255) DEFAULT '',
  `appsecret_share` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_dream_fans;
CREATE TABLE `ims_ewei_dream_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `fansid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `headurl` varchar(255) DEFAULT '',
  `dream` varchar(255) DEFAULT '',
  `punishment` varchar(255) DEFAULT '',
  `views` int(11) DEFAULT '0',
  `oversees` text,
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_dream_oversee;
CREATE TABLE `ims_ewei_dream_oversee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `fansid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `headurl` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_dream_reply;
CREATE TABLE `ims_ewei_dream_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `dreams` text,
  `punishments` text,
  `views` int(11) DEFAULT '0',
  `shares` int(11) DEFAULT '0',
  `follow_url` varchar(255) DEFAULT '',
  `follow_need` int(11) DEFAULT '0',
  `diy_bgcolor` varchar(255) DEFAULT '',
  `diy_fontcolor` varchar(255) DEFAULT '',
  `diy_topimg` varchar(255) DEFAULT '',
  `diy_btncolor` varchar(255) DEFAULT '',
  `diy_btnfontcolor` varchar(255) DEFAULT '',
  `diy_btntext` varchar(255) DEFAULT '',
  `diy_title1` varchar(255) DEFAULT '',
  `diy_title2` varchar(255) DEFAULT '',
  `diy_title3` varchar(255) DEFAULT '',
  `diy_title4` varchar(255) DEFAULT '',
  `diy_title5` varchar(255) DEFAULT '',
  `diy_audio` varchar(255) DEFAULT '',
  `diy_topimgshare` varchar(255) DEFAULT '',
  `diy_inputcolor` varchar(255) DEFAULT '',
  `diy_inputtextcolor` varchar(255) DEFAULT '',
  `diy_paperimg` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `copyright` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_course;
CREATE TABLE `ims_ewei_exam_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0' COMMENT '所属帐号',
  `pcate` int(11) DEFAULT '0',
  `ccate` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '' COMMENT '课程标题',
  `ctype` int(11) DEFAULT '0' COMMENT '0 时间限制 1 人数限制',
  `starttime` int(11) DEFAULT '0' COMMENT '报名开始时间',
  `endtime` int(11) DEFAULT '0' COMMENT '报名截止时间',
  `ctotal` int(11) DEFAULT '0' COMMENT '报名人数限制',
  `description` text,
  `content` text,
  `thumb` varchar(255) DEFAULT '',
  `viewnum` int(11) DEFAULT '0' COMMENT '访问人数',
  `fansnum` int(11) DEFAULT '0' COMMENT '报名人数',
  `teachers` text COMMENT '授课讲师',
  `coursetime` int(11) DEFAULT '0' COMMENT '开始时间',
  `times` int(11) DEFAULT '0' COMMENT '授课时长',
  `week` int(11) DEFAULT '0' COMMENT '第几期',
  `address` text,
  `location_p` varchar(255) DEFAULT NULL,
  `location_c` varchar(255) DEFAULT NULL,
  `location_a` varchar(255) DEFAULT NULL,
  `lng` decimal(18,10) NOT NULL DEFAULT '0.0000000000',
  `lat` decimal(18,10) NOT NULL DEFAULT '0.0000000000',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0' COMMENT '题目排序',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_pcate` (`ccate`),
  KEY `idx_ccate` (`ccate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_course_category;
CREATE TABLE `ims_ewei_exam_course_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0' COMMENT '所属帐号',
  `parentid` int(11) DEFAULT '0',
  `cname` varchar(255) DEFAULT '',
  `description` text COMMENT '描述',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_parentid` (`parentid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_course_reserve;
CREATE TABLE `ims_ewei_exam_course_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `courseid` int(11) DEFAULT '0',
  `memberid` int(11) DEFAULT '0',
  `times` int(11) DEFAULT '0' COMMENT '用时',
  `createtime` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `ordersn` varchar(255) DEFAULT '',
  `msg` text,
  `mngtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`memberid`),
  KEY `idx_weid` (`weid`),
  KEY `idx_paperid` (`courseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;



DROP TABLE IF EXISTS ims_ewei_exam_member;
CREATE TABLE `ims_ewei_exam_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '',
  `userid` varchar(255) DEFAULT '',
  `username` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_paper;
CREATE TABLE `ims_ewei_exam_paper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0' COMMENT '所属帐号',
  `pcate` int(11) DEFAULT '0',
  `ccate` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '' COMMENT '试卷标题',
  `level` int(11) DEFAULT '0' COMMENT '难度',
  `score` int(11) DEFAULT '0' COMMENT '分值',
  `description` text,
  `thumb` varchar(255) DEFAULT '',
  `year` int(11) DEFAULT '0' COMMENT '年份',
  `viewnum` int(11) DEFAULT '0' COMMENT '访问人数',
  `fansnum` int(11) DEFAULT '0' COMMENT '考试人数',
  `times` int(11) DEFAULT '0' COMMENT '时间限制 0不限制',
  `types` varchar(5) DEFAULT NULL COMMENT '考题类型选择 例如 11111 包含5种题型',
  `avscore` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `avtimes` int(11) NOT NULL DEFAULT '0' COMMENT '平均用时',
  `createtime` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '考题类型id',
  `status` tinyint(1) DEFAULT '0',
  `isfull` tinyint(1) NOT NULL DEFAULT '0' COMMENT '试题是否完整1完整0不完整',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_pcate` (`ccate`),
  KEY `idx_ccate` (`ccate`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_paper_category;
CREATE TABLE `ims_ewei_exam_paper_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0' COMMENT '所属帐号',
  `parentid` int(11) DEFAULT '0',
  `cname` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `description` text COMMENT '描述',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_parentid` (`parentid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_paper_member_data;
CREATE TABLE `ims_ewei_exam_paper_member_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `paperid` int(11) DEFAULT '0',
  `memberid` int(11) DEFAULT '0',
  `recordid` int(11) DEFAULT '0' COMMENT '学员考试记录id',
  `questionid` int(11) NOT NULL DEFAULT '0',
  `answer` text,
  `times` int(11) DEFAULT '0' COMMENT '单题用时',
  `createtime` int(11) DEFAULT '0',
  `isright` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否回答正确',
  `type` int(11) DEFAULT '0' COMMENT '1 判断 2单选 3多选 4 填空  5 解答',
  `pageid` int(11) NOT NULL DEFAULT '0' COMMENT '顺序id',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_memberid` (`memberid`),
  KEY `idx_paperid` (`paperid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_paper_member_record;
CREATE TABLE `ims_ewei_exam_paper_member_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `paperid` int(11) DEFAULT '0',
  `memberid` int(11) DEFAULT '0',
  `times` int(11) DEFAULT '0' COMMENT '用时',
  `countdown` int(11) DEFAULT '0' COMMENT '倒计时',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '得分',
  `did` int(11) DEFAULT '0' COMMENT '是否完成考试',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`memberid`),
  KEY `idx_weid` (`weid`),
  KEY `idx_paperid` (`paperid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_paper_question;
CREATE TABLE `ims_ewei_exam_paper_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) DEFAULT '0' COMMENT '题ID',
  `displayorder` int(11) DEFAULT '0' COMMENT '题目排序',
  `paperid` bigint(20) NOT NULL DEFAULT '0' COMMENT '试卷ID',
  PRIMARY KEY (`id`),
  KEY `idx_questionid` (`questionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_paper_type;
CREATE TABLE `ims_ewei_exam_paper_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0' COMMENT '所属帐号',
  `title` varchar(255) DEFAULT '' COMMENT '试卷标题',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '分值',
  `types` text COMMENT '试题类型设置 包含试题类型 试题分数',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '考试时间',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_pool;
CREATE TABLE `ims_ewei_exam_pool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_question;
CREATE TABLE `ims_ewei_exam_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `poolid` int(11) DEFAULT '0' COMMENT '题库ID',
  `paperid1` int(11) DEFAULT '0' COMMENT '题库ID',
  `type` int(11) DEFAULT '0' COMMENT '1 判断 2单选 3多选 4 填空  5 解答',
  `level` int(11) DEFAULT '0' COMMENT '难度',
  `question` text COMMENT '问题',
  `thumb` varchar(255) DEFAULT '' COMMENT '问题图片',
  `answer` text COMMENT '答案',
  `isimg` tinyint(1) DEFAULT '0' COMMENT '答案是否包含图片',
  `explain` text COMMENT '讲解',
  `fansnum` int(11) DEFAULT '0' COMMENT '多少人做过',
  `correctnum` int(11) DEFAULT '0' COMMENT '多少人正确',
  `items` text,
  `img_items` text,
  PRIMARY KEY (`id`),
  KEY `idx_poolid` (`poolid`),
  KEY `idx_type` (`type`),
  KEY `idx_weid` (`weid`),
  KEY `idx_paperid` (`paperid1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_reply;
CREATE TABLE `ims_ewei_exam_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `weid` int(11) DEFAULT '0' COMMENT '所属帐号',
  `paperid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`),
  KEY `idx_weid` (`weid`),
  KEY `idx_paperid` (`paperid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_exam_sysset;
CREATE TABLE `ims_ewei_exam_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `classopen` int(11) DEFAULT '1',
  `login_flag` tinyint(1) DEFAULT '0' COMMENT '是否开启登录',
  `about` text COMMENT '帮助',
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_money_award;
CREATE TABLE `ims_ewei_money_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `sum` float DEFAULT NULL,
  `info` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户ID',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `description` varchar(200) DEFAULT '' COMMENT '描述',
  `prizetype` varchar(10) DEFAULT '' COMMENT '类型',
  `award_sn` varchar(50) DEFAULT '' COMMENT 'SN',
  `createtime` int(10) DEFAULT '0',
  `consumetime` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `exchange` double DEFAULT '0',
  `useable` double DEFAULT '0',
  `shopUrl` varchar(300) NOT NULL COMMENT '购物链接地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_money_fans;
CREATE TABLE `ims_ewei_money_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `isplay` tinyint(1) DEFAULT '0',
  `info` tinyint(1) DEFAULT '0',
  `from_user` varchar(50) NOT NULL,
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `sum` float DEFAULT NULL,
  `remain` int(11) NOT NULL,
  `max_score` float NOT NULL,
  `alltimes` int(11) NOT NULL COMMENT '总剩余次数',
  `daytimes` int(11) NOT NULL COMMENT '当天剩余次数',
  `lasttime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_money_reply;
CREATE TABLE `ims_ewei_money_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `isfollow` tinyint(1) NOT NULL COMMENT '是否关注',
  `isshow` tinyint(1) DEFAULT '0',
  `info` int(11) DEFAULT '0',
  `c_rate_one` tinyint(1) DEFAULT '0',
  `c_rate_two` tinyint(1) DEFAULT '0',
  `c_rate_three` tinyint(1) DEFAULT '0',
  `c_rate_four` tinyint(1) DEFAULT '0',
  `c_rate_five` tinyint(1) DEFAULT '0',
  `c_rate_six` tinyint(1) DEFAULT '0',
  `c_rate_seven` tinyint(1) DEFAULT '0',
  `c_rate_eight` tinyint(1) DEFAULT '0',
  `c_rate_nine` tinyint(1) DEFAULT '0',
  `game_time` int(11) NOT NULL,
  `title` varchar(200) DEFAULT '',
  `start_picurl` varchar(200) DEFAULT '',
  `reg_first` tinyint(1) NOT NULL COMMENT '游戏前后注册',
  `max_sum` int(11) NOT NULL,
  `min_sum` int(11) NOT NULL,
  `total_remain` int(11) NOT NULL,
  `remain` int(11) NOT NULL,
  `remain_stime` int(11) NOT NULL,
  `remain_etime` int(11) NOT NULL,
  `remain_name` varchar(50) NOT NULL COMMENT '现金劵名称',
  `remain_sm` varchar(15) NOT NULL COMMENT '兑奖密码',
  `valid_time` varchar(100) NOT NULL COMMENT '现金劵有效时间',
  `remain_rule` varchar(100) NOT NULL COMMENT '现金劵规则',
  `rule` text NOT NULL COMMENT '规则',
  `description` text NOT NULL COMMENT '活动简介',
  `alltimes` int(3) unsigned NOT NULL COMMENT '最大抽奖数',
  `daytimes` int(11) NOT NULL COMMENT '每天最大抽奖数',
  `homeurl` varchar(300) NOT NULL COMMENT '微站链接地址',
  `homepicurl` varchar(200) DEFAULT '',
  `followurl` varchar(300) NOT NULL COMMENT '提示关注网址',
  `homename` varchar(50) NOT NULL COMMENT '微站名称',
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `view_times` int(11) NOT NULL,
  `play_times` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_money_sysset;
CREATE TABLE `ims_ewei_money_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `appid_share` varchar(255) DEFAULT '',
  `appsecret_share` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_takephotoa_fans;
CREATE TABLE `ims_ewei_takephotoa_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '' COMMENT '用户openid',
  `nickname` varchar(255) DEFAULT '' COMMENT '用户昵称',
  `headimgurl` varchar(255) DEFAULT '' COMMENT '用户头像',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '平均',
  `img` varchar(255) DEFAULT '' COMMENT '成绩截图',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_takephotoa_fans_score;
CREATE TABLE `ims_ewei_takephotoa_fans_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '' COMMENT '用户openid',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '平均',
  `createtime` int(10) DEFAULT '0',
  `img` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_takephotoa_reply;
CREATE TABLE `ims_ewei_takephotoa_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `starttime` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `bgimg` varchar(255) DEFAULT '',
  `helpimg` varchar(255) DEFAULT '',
  `shareimg` varchar(255) DEFAULT '',
  `titleimg` varchar(255) DEFAULT '',
  `cameraimg` varchar(255) DEFAULT '',
  `numberimg` varchar(255) DEFAULT '',
  `items` text COMMENT '物品',
  `follow_url` varchar(1000) DEFAULT '',
  `share_url` varchar(1000) DEFAULT '',
  `viewnum` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `share_desc` varchar(500) DEFAULT '',
  `share_icon` varchar(255) DEFAULT '',
  `share_title` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ewei_takephotoa_sysset;
CREATE TABLE `ims_ewei_takephotoa_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `oauth2` tinyint(1) DEFAULT '0',
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_goodscodes;
CREATE TABLE `ims_feng_goodscodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众账号',
  `s_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `s_cid` smallint(5) unsigned NOT NULL,
  `s_len` smallint(5) DEFAULT NULL COMMENT '长度',
  `s_codes` longtext COMMENT '商品码',
  `s_codes_tmp` longtext COMMENT '商品码备份',
  PRIMARY KEY (`id`),
  KEY `s_id` (`s_id`),
  KEY `uniacid` (`uniacid`),
  KEY `s_len` (`s_len`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_goodslist;
CREATE TABLE `ims_feng_goodslist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号',
  `sid` int(10) unsigned NOT NULL COMMENT '同一个商品id',
  `title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `price` int(10) DEFAULT '0' COMMENT '金额',
  `zongrenshu` int(10) unsigned DEFAULT '0' COMMENT '总需人数',
  `canyurenshu` int(10) unsigned DEFAULT '0' COMMENT '已参与人数',
  `shengyurenshu` int(10) unsigned DEFAULT NULL COMMENT '剩余人数',
  `periods` smallint(6) unsigned DEFAULT '0' COMMENT '期数',
  `maxperiods` smallint(5) unsigned DEFAULT '1' COMMENT ' 最大期数',
  `picarr` text COMMENT '商品图片',
  `content` mediumtext COMMENT '商品详情',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `pos` tinyint(4) unsigned DEFAULT NULL COMMENT '是否推荐',
  `status` int(11) NOT NULL COMMENT '1:下架, 2: 上架',
  `scale` int(10) unsigned DEFAULT NULL COMMENT '比例',
  `q_uid` varchar(10) DEFAULT NULL COMMENT '中奖人昵称',
  `q_user` varchar(50) DEFAULT NULL COMMENT '中奖人from_user',
  `q_user_code` char(20) DEFAULT NULL COMMENT '中奖码',
  `q_end_time` char(20) DEFAULT NULL COMMENT '揭晓时间',
  `send_state` int(4) unsigned NOT NULL COMMENT '1为已发货',
  `send` int(4) unsigned NOT NULL COMMENT '是否需要快递1为需要',
  `express` varchar(20) DEFAULT NULL COMMENT '快递公司',
  `expressn` char(20) DEFAULT NULL COMMENT '快递单',
  `send_time` char(20) DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `sid` (`sid`),
  KEY `status` (`status`),
  KEY `shenyurenshu` (`shengyurenshu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_member;
CREATE TABLE `ims_feng_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号id',
  `from_user` varchar(50) NOT NULL COMMENT '微信会员openID',
  `realname` varchar(10) NOT NULL COMMENT '真实姓名',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `address` varchar(255) NOT NULL COMMENT '邮寄地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_rebate_changci;
CREATE TABLE `ims_feng_rebate_changci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `goodsn` varchar(45) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_rebate_goods;
CREATE TABLE `ims_feng_rebate_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(45) NOT NULL,
  `thumb` varchar(115) NOT NULL,
  `price` varchar(45) NOT NULL,
  `num` int(11) NOT NULL,
  `status` int(4) NOT NULL,
  `gdesc` varchar(1024) NOT NULL COMMENT '商品描述',
  `hours` int(11) NOT NULL COMMENT '限时抢购',
  `uniacid` int(11) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `goodsn` varchar(45) NOT NULL COMMENT '商品每日上架标识',
  `uptime` varchar(45) NOT NULL COMMENT '上架时间',
  `fanli` varchar(45) NOT NULL COMMENT '返利倍数',
  `fanli_num` varchar(45) NOT NULL COMMENT '返利倍数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_rebate_member;
CREATE TABLE `ims_feng_rebate_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(45) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `avatar` varchar(45) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_rebate_orders;
CREATE TABLE `ims_feng_rebate_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordersn` varchar(45) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `transid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(45) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `ptime` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `goodsn` varchar(45) NOT NULL COMMENT '商品上架标识',
  `get` int(11) NOT NULL COMMENT '0未中1已中奖',
  `recvname` varchar(45) NOT NULL COMMENT '收货人名',
  `mobile` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `zjm` varchar(45) NOT NULL COMMENT '中奖码',
  `express` varchar(45) NOT NULL COMMENT '快递公司',
  `expresssn` varchar(45) NOT NULL COMMENT '快递单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_rebate_record;
CREATE TABLE `ims_feng_rebate_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(45) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `goodsid` int(11) NOT NULL COMMENT '商品id',
  `yqm` varchar(45) NOT NULL COMMENT '邀请码',
  `cjm` varchar(11) NOT NULL COMMENT '抽奖码1',
  `goodsn` varchar(45) NOT NULL COMMENT '商品上架标识',
  `ordersn` varchar(45) NOT NULL,
  `cjmfromopenid` varchar(45) NOT NULL COMMENT '抽奖码来自的openid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_record;
CREATE TABLE `ims_feng_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user` varchar(50) NOT NULL COMMENT '微信会员ID',
  `nickname` varchar(20) NOT NULL COMMENT '用户昵称',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号',
  `sid` int(10) unsigned NOT NULL COMMENT '商品编号',
  `ordersn` varchar(20) NOT NULL COMMENT '订单编号',
  `status` smallint(4) NOT NULL DEFAULT '0' COMMENT '0未支付，1为已付款',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额支付，2为支付宝，3为微信支付',
  `transid` varchar(30) NOT NULL COMMENT '微信订单号',
  `count` int(10) unsigned NOT NULL COMMENT '商品数量',
  `s_codes` longtext COMMENT '商品码',
  `createtime` int(10) unsigned NOT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `status` (`status`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_feng_wechat;
CREATE TABLE `ims_feng_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `appid` varchar(100) DEFAULT NULL,
  `appsecret` varchar(200) DEFAULT NULL,
  `access_token` text,
  `lasttime` char(20) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_image` varchar(500) DEFAULT NULL,
  `share_desc` varchar(300) DEFAULT NULL,
  `win_mess` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fighting;
CREATE TABLE `ims_fighting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `fid` int(10) unsigned NOT NULL,
  `answerNum` int(11) unsigned NOT NULL COMMENT '已经答题数量',
  `from_user` varchar(30) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `lasttime` int(10) unsigned NOT NULL,
  `lastcredit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fighting_dept;
CREATE TABLE `ims_fighting_dept` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `deptName` varchar(100) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fighting_level;
CREATE TABLE `ims_fighting_level` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL DEFAULT '0',
  `levelname` varchar(100) NOT NULL DEFAULT '' COMMENT '等级名称',
  `min` int(10) NOT NULL DEFAULT '0' COMMENT '开始积分',
  `max` int(10) NOT NULL DEFAULT '0' COMMENT '结束积分',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '发布日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fighting_question_bank;
CREATE TABLE `ims_fighting_question_bank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `figure` int(30) NOT NULL,
  `question` varchar(500) NOT NULL,
  `option_num` int(10) unsigned NOT NULL,
  `optionA` varchar(100) NOT NULL,
  `optionB` varchar(100) NOT NULL,
  `optionC` varchar(100) NOT NULL,
  `optionD` varchar(100) NOT NULL,
  `optionE` varchar(100) NOT NULL,
  `optionF` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `sid` int(10) unsigned NOT NULL COMMENT '广告URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fighting_question_worng;
CREATE TABLE `ims_fighting_question_worng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `fightingid` int(10) unsigned NOT NULL,
  `qname` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `optionA` varchar(100) NOT NULL,
  `optionB` varchar(100) NOT NULL,
  `optionC` varchar(100) NOT NULL,
  `optionD` varchar(100) NOT NULL,
  `optionE` varchar(100) NOT NULL,
  `optionF` varchar(100) NOT NULL,
  `wornganswer` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fighting_setting;
CREATE TABLE `ims_fighting_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(20) NOT NULL COMMENT '活动标题',
  `description` longtext NOT NULL COMMENT '活动介绍',
  `tiao` tinyint(1) unsigned NOT NULL COMMENT '1允许跳过0不允许',
  `status_fighting` tinyint(1) unsigned NOT NULL COMMENT '0正常1暂停2结束',
  `qnum` int(11) unsigned NOT NULL COMMENT '题目数量',
  `answertime` int(10) unsigned NOT NULL COMMENT '答题时间',
  `start` int(10) unsigned NOT NULL DEFAULT '1383235200' COMMENT '开始时间',
  `end` int(10) unsigned NOT NULL DEFAULT '1383235200' COMMENT '结束时间',
  `most_num_times` int(11) DEFAULT '0',
  `picture` varchar(100) NOT NULL COMMENT '活动图片',
  `followurl` varchar(1000) DEFAULT '',
  `thumb` varchar(100) NOT NULL COMMENT '广告',
  `thumb_url` varchar(100) NOT NULL COMMENT '广告URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fighting_user;
CREATE TABLE `ims_fighting_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `deptid` int(10) NOT NULL COMMENT '部门ID',
  `fid` int(10) unsigned NOT NULL COMMENT '活动ID',
  `nickname` varchar(100) NOT NULL COMMENT '活动ID',
  `mobile` varchar(100) NOT NULL COMMENT '手机号码',
  `openid` varchar(255) NOT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fineness_admire;
CREATE TABLE `ims_fineness_admire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `author` varchar(255) NOT NULL COMMENT '昵称',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `ordersn` varchar(255) NOT NULL COMMENT '订单号',
  `thumb` varchar(500) NOT NULL COMMENT '头像',
  `status` varchar(2) NOT NULL COMMENT '是否显示',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赞赏价格',
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fineness_admire_set;
CREATE TABLE `ims_fineness_admire_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `price` decimal(10,1) DEFAULT NULL,
  `createtime` int(10) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fineness_adv;
CREATE TABLE `ims_fineness_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `pcateid` int(11) DEFAULT '0',
  `link` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '父ID',
  `zanNum` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片';



DROP TABLE IF EXISTS ims_fineness_adv_er;
CREATE TABLE `ims_fineness_adv_er` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '广告标题',
  `thumb` varchar(500) NOT NULL COMMENT '广告图片',
  `link` varchar(500) NOT NULL COMMENT '广告外链',
  `type` tinyint(1) unsigned NOT NULL COMMENT '0商品推广1推荐公众',
  `description` varchar(500) NOT NULL COMMENT '广告外链',
  `status` varchar(2) NOT NULL COMMENT '是否显示',
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='随机广告';



DROP TABLE IF EXISTS ims_fineness_article;
CREATE TABLE `ims_fineness_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `musicurl` varchar(100) NOT NULL DEFAULT '' COMMENT '上传音乐',
  `content` mediumtext,
  `credit` varchar(255) DEFAULT '0',
  `pcate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类',
  `template` varchar(300) NOT NULL DEFAULT '' COMMENT '内容模板目录',
  `templatefile` varchar(300) NOT NULL DEFAULT '' COMMENT '分类模板名称',
  `bg_music_switch` varchar(1) NOT NULL DEFAULT '1',
  `clickNum` int(10) unsigned NOT NULL DEFAULT '0',
  `zanNum` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(500) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '简介',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `outLink` varchar(500) DEFAULT '0' COMMENT '外链',
  `author` varchar(100) DEFAULT '' COMMENT '作者',
  `type` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `tel` varchar(15) NOT NULL,
  `iscomment` tinyint(1) DEFAULT '0',
  `admiretxt` varchar(30) NOT NULL DEFAULT '' COMMENT '内容模板目录',
  `isadmire` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否赞赏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fineness_article_category;
CREATE TABLE `ims_fineness_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `thumb` varchar(1024) NOT NULL DEFAULT '' COMMENT '分类图片',
  `kid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '分类描述',
  `template` varchar(300) NOT NULL DEFAULT '' COMMENT '分类模板目录',
  `templatefile` varchar(300) NOT NULL DEFAULT '' COMMENT '分类模板名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fineness_comment;
CREATE TABLE `ims_fineness_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `author` varchar(255) NOT NULL COMMENT '昵称',
  `openid` varchar(255) NOT NULL COMMENT '昵称',
  `thumb` varchar(500) NOT NULL COMMENT '头像',
  `js_cmt_input` varchar(500) NOT NULL COMMENT '留言内容',
  `js_cmt_reply` varchar(500) NOT NULL COMMENT '回复内容',
  `status` varchar(2) NOT NULL COMMENT '是否显示',
  `praise_num` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL,
  `updatetime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章评价';



DROP TABLE IF EXISTS ims_fineness_sysset;
CREATE TABLE `ims_fineness_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `guanzhuUrl` varchar(255) DEFAULT '' COMMENT '引导关注',
  `guanzhutitle` varchar(255) DEFAULT '' COMMENT '引导关注名称',
  `historyUrl` varchar(255) DEFAULT '' COMMENT '历史记录外链',
  `copyright` varchar(255) DEFAULT '' COMMENT '版权',
  `cnzz` varchar(800) DEFAULT '' COMMENT '统计',
  `appid` varchar(255) DEFAULT '',
  `logo` varchar(255) DEFAULT '',
  `footlogo` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `appid_share` varchar(255) DEFAULT '',
  `isopen` varchar(1) DEFAULT '1',
  `title` varchar(255) DEFAULT '',
  `tjgzh` varchar(255) DEFAULT '1' COMMENT '推荐公众号图片',
  `tjgzhUrl` varchar(255) DEFAULT '1' COMMENT '推荐公众号引导关注',
  `appsecret_share` varchar(255) DEFAULT '',
  `iscomment` varchar(1) DEFAULT '1',
  `isget` varchar(1) DEFAULT '0',
  `mchid` varchar(255) DEFAULT '',
  `shkey` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fl_wsq_area;
CREATE TABLE `ims_fl_wsq_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '父id为0为顶级',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '地区名称',
  `status` int(1) NOT NULL COMMENT '状态1显示0隐藏',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `weid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='微社区地区表';



DROP TABLE IF EXISTS ims_fl_wsq_config;
CREATE TABLE `ims_fl_wsq_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `weid` int(11) NOT NULL COMMENT '公众号id',
  `show_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '显示名称',
  `use_area` int(1) NOT NULL DEFAULT '0' COMMENT '使用地区分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='微社区配置文件';



DROP TABLE IF EXISTS ims_fl_wsq_search_log;
CREATE TABLE `ims_fl_wsq_search_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '搜索词',
  `create_time` int(11) NOT NULL COMMENT '搜索时间',
  `openid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '搜索用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='微社区搜索记录';



DROP TABLE IF EXISTS ims_fl_wsq_shoping;
CREATE TABLE `ims_fl_wsq_shoping` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '商户名称',
  `tel` varchar(255) NOT NULL COMMENT '电话',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` int(1) NOT NULL COMMENT '状态1正常0关闭',
  `orders` int(11) NOT NULL DEFAULT '0' COMMENT '排序越大越前',
  `weid` int(11) NOT NULL DEFAULT '0' COMMENT '所属公众号id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='社区商户列表';



DROP TABLE IF EXISTS ims_fl_wsq_shoping_reg;
CREATE TABLE `ims_fl_wsq_shoping_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商户名',
  `tel` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '店铺电话',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '店铺地址',
  `create_time` int(11) NOT NULL COMMENT '申请时间',
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请者openid',
  `status` int(1) NOT NULL COMMENT '申请状态0未处理1审核通过2拒绝',
  `contact_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系人姓名',
  `contact_tel` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系人电话',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '申请理由',
  `weid` int(11) NOT NULL COMMENT '公众号id',
  `tid` int(11) DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商户申请表';



DROP TABLE IF EXISTS ims_fl_wsq_shoping_type;
CREATE TABLE `ims_fl_wsq_shoping_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `images` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类封面',
  `weid` int(11) NOT NULL COMMENT '公众号id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商户分类表';



DROP TABLE IF EXISTS ims_fl_wsq_shoping_type_bind;
CREATE TABLE `ims_fl_wsq_shoping_type_bind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tid` int(11) NOT NULL COMMENT '分类id',
  `sid` int(11) NOT NULL COMMENT '商铺id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商铺分类绑定表';



DROP TABLE IF EXISTS ims_fl_wsq_slide;
CREATE TABLE `ims_fl_wsq_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '幻灯片标题',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '幻灯片图片',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '链接地址',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` int(1) NOT NULL COMMENT '状态1正常0关闭',
  `weid` int(11) NOT NULL COMMENT '公众号id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='幻灯片管理';



DROP TABLE IF EXISTS ims_fm_photosvote_advs;
CREATE TABLE `ims_fm_photosvote_advs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `description` varchar(350) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `times` int(11) DEFAULT '0',
  `ismiaoxian` int(2) DEFAULT '0',
  `issuiji` int(2) DEFAULT '0',
  `nexttime` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_announce;
CREATE TABLE `ims_fm_photosvote_announce` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `content` varchar(150) NOT NULL DEFAULT '' COMMENT '公告',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '公告',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '公告链接',
  `createtime` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_awarding;
CREATE TABLE `ims_fm_photosvote_awarding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL,
  `typeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区域ID',
  `shoptitle` varchar(50) NOT NULL DEFAULT '' COMMENT '兑奖店面名称',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '兑奖地址',
  `tel` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `pass` varchar(20) NOT NULL DEFAULT '' COMMENT '兑奖密码',
  `images` varchar(200) NOT NULL DEFAULT '' COMMENT '广告或店面图',
  `carmap` varchar(50) NOT NULL COMMENT '地图导航',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_awardingtype;
CREATE TABLE `ims_fm_photosvote_awardingtype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL,
  `quyutitle` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `orderid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_banners;
CREATE TABLE `ims_fm_photosvote_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(11) DEFAULT '0',
  `bannername` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_bbsreply;
CREATE TABLE `ims_fm_photosvote_bbsreply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL,
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `tid` varchar(125) NOT NULL COMMENT '帖子的ID',
  `tfrom_user` varchar(255) NOT NULL DEFAULT '' COMMENT '帖子作者的openid',
  `reply_id` varchar(125) NOT NULL COMMENT '回复评论帖子的ID',
  `from_user` varchar(255) NOT NULL DEFAULT '' COMMENT '回复评论帖子的openid',
  `to_reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '回复评论的id',
  `rfrom_user` varchar(255) NOT NULL DEFAULT '' COMMENT '被回复的评论的作者的openid',
  `content` text NOT NULL COMMENT '评论回复内容',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否已删除 0-否 1-是',
  `status` tinyint(2) DEFAULT '0' COMMENT '是否审核 0-否 1-是',
  `storey` int(11) NOT NULL DEFAULT '0' COMMENT '绝对楼层',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT '回复IP',
  `iparr` varchar(200) NOT NULL DEFAULT '' COMMENT 'IP区域',
  `createtime` int(11) NOT NULL COMMENT '回复时间',
  `zan` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_createtime` (`createtime`),
  KEY `indx_from_user` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_data;
CREATE TABLE `ims_fm_photosvote_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL,
  `fromuser` varchar(150) NOT NULL DEFAULT '' COMMENT '分享用户openid',
  `from_user` varchar(150) NOT NULL DEFAULT '' COMMENT '当前用户openid',
  `tfrom_user` varchar(150) NOT NULL DEFAULT '' COMMENT '被分享用户openid',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享人UID',
  `isin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否参与',
  `visitorsip` varchar(15) NOT NULL DEFAULT '' COMMENT '访问IP',
  `visitorstime` int(10) unsigned NOT NULL COMMENT '访问时间',
  `viewnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uid` (`uid`),
  KEY `indx_from_user` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_gift;
CREATE TABLE `ims_fm_photosvote_gift` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '奖品名称',
  `total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `total_winning` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '中奖数量',
  `lingjiangtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '奖品库存减少方式0为有资格1为提交2为兑奖',
  `description` text NOT NULL COMMENT '描述',
  `inkind` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否是实物',
  `activation_code` varchar(50) NOT NULL COMMENT '激活码',
  `activation_url` varchar(215) NOT NULL COMMENT '激活地址',
  `break` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '需要朋友人数',
  `awardpic` varchar(200) NOT NULL COMMENT '奖品图片',
  `awardpass` varchar(20) NOT NULL COMMENT '兑奖密码',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_giftmika;
CREATE TABLE `ims_fm_photosvote_giftmika` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL,
  `giftid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '礼盒ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `mika` varchar(50) NOT NULL COMMENT '密卡字符串',
  `activationurl` varchar(200) NOT NULL COMMENT '激活地址',
  `typename` varchar(20) NOT NULL DEFAULT '' COMMENT '类型说明',
  `description` varchar(50) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否领取1为领取过',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_iplist;
CREATE TABLE `ims_fm_photosvote_iplist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `iparr` varchar(200) NOT NULL DEFAULT '' COMMENT 'IP区域',
  `ipadd` varchar(100) NOT NULL DEFAULT '' COMMENT 'IP区域',
  `createtime` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_iplistlog;
CREATE TABLE `ims_fm_photosvote_iplistlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `from_user` varchar(255) NOT NULL DEFAULT '' COMMENT 'openid',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP',
  `hitym` varchar(255) NOT NULL DEFAULT '' COMMENT '点击页面',
  `createtime` int(11) NOT NULL COMMENT '初始时间',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_createtime` (`createtime`),
  KEY `indx_from_user` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_provevote;
CREATE TABLE `ims_fm_photosvote_provevote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL,
  `from_user` varchar(255) NOT NULL DEFAULT '' COMMENT '用户openid',
  `tfrom_user` varchar(255) NOT NULL DEFAULT '' COMMENT '被投票用户openid',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '微信头像',
  `photo` varchar(200) NOT NULL DEFAULT '' COMMENT '照片',
  `music` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `mediaid` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐id',
  `timelength` varchar(200) NOT NULL DEFAULT '' COMMENT '时间轴',
  `voice` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `vedio` varchar(200) NOT NULL DEFAULT '' COMMENT '视频',
  `youkuurl` varchar(200) NOT NULL DEFAULT '' COMMENT '视频',
  `fmmid` varchar(200) NOT NULL DEFAULT '' COMMENT '识别',
  `picarr` varchar(2000) DEFAULT '',
  `picarr_1` varchar(200) NOT NULL DEFAULT '' COMMENT '照片组',
  `picarr_2` varchar(200) NOT NULL DEFAULT '' COMMENT '照片组',
  `picarr_3` varchar(200) NOT NULL DEFAULT '' COMMENT '照片组',
  `picarr_4` varchar(200) NOT NULL DEFAULT '' COMMENT '照片组',
  `picarr_5` varchar(200) NOT NULL DEFAULT '' COMMENT '照片组',
  `picarr_6` varchar(200) NOT NULL DEFAULT '' COMMENT '照片组',
  `picarr_7` varchar(200) NOT NULL DEFAULT '' COMMENT '照片组',
  `picarr_8` varchar(200) NOT NULL DEFAULT '' COMMENT '照片组',
  `description` text NOT NULL COMMENT '简介，描述',
  `photoname` varchar(50) NOT NULL DEFAULT '' COMMENT '照片名字',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `job` varchar(20) NOT NULL DEFAULT '' COMMENT '职业',
  `xingqu` varchar(20) NOT NULL DEFAULT '' COMMENT '兴趣',
  `weixin` varchar(255) NOT NULL DEFAULT '' COMMENT '联系微信号',
  `qqhao` varchar(20) NOT NULL DEFAULT '' COMMENT '联系QQ号码',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '联系地址',
  `photosnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '票数',
  `xnphotosnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟票数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '人气',
  `xnhits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟人气',
  `yaoqingnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请量',
  `ewm` varchar(200) NOT NULL DEFAULT '' COMMENT '二维码地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '审核状态',
  `createip` varchar(50) NOT NULL DEFAULT '' COMMENT '创建IP',
  `lastip` varchar(50) NOT NULL DEFAULT '' COMMENT '编辑IP',
  `iparr` varchar(200) NOT NULL DEFAULT '' COMMENT 'ip地区',
  `lasttime` int(10) unsigned NOT NULL COMMENT '最后编辑时间',
  `sharetime` int(10) unsigned NOT NULL COMMENT '最后分享时间',
  `sharenum` int(10) unsigned NOT NULL COMMENT '最后分享',
  `createtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `ysid` int(10) unsigned NOT NULL COMMENT 'ysid',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别，1、男 2、女 0 、未知',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `tagid` int(10) unsigned NOT NULL COMMENT '分组id',
  `zans` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `isadmin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否设置为管理员',
  `istuijian` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否设置为推荐',
  `limitsd` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限速',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_createtime` (`createtime`),
  KEY `indx_from_user` (`from_user`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_provevote_name;
CREATE TABLE `ims_fm_photosvote_provevote_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL,
  `from_user` varchar(255) NOT NULL DEFAULT '' COMMENT '用户openid',
  `musicname` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `photoname` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `picarr_1_name` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `picarr_2_name` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `picarr_3_name` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `picarr_4_name` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `picarr_5_name` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `picarr_6_name` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `picarr_7_name` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `picarr_8_name` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `musicnamefop` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `voicename` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `voicenamefop` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `vedioname` varchar(200) NOT NULL DEFAULT '' COMMENT '视频',
  `vedionamefop` varchar(200) NOT NULL DEFAULT '' COMMENT '视频',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_from_user` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_provevote_picarr;
CREATE TABLE `ims_fm_photosvote_provevote_picarr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `mid` int(10) unsigned NOT NULL,
  `lastmid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `from_user` varchar(255) NOT NULL DEFAULT '' COMMENT '用户openid',
  `photos` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `photoname` varchar(200) NOT NULL DEFAULT '' COMMENT '图片名字',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `isfm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否设置为封面',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_from_user` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_provevote_voice;
CREATE TABLE `ims_fm_photosvote_provevote_voice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `from_user` varchar(555) NOT NULL DEFAULT '' COMMENT 'openid',
  `mediaid` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐id',
  `timelength` varchar(200) NOT NULL DEFAULT '' COMMENT '时间轴',
  `voice` varchar(200) NOT NULL DEFAULT '' COMMENT '音乐',
  `fmmid` varchar(200) NOT NULL DEFAULT '' COMMENT '识别',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(11) NOT NULL COMMENT '初始时间',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_createtime` (`createtime`),
  KEY `indx_from_user` (`from_user`(333)),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_reply;
CREATE TABLE `ims_fm_photosvote_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '规则标题',
  `shareurl` varchar(255) NOT NULL COMMENT '活动网址',
  `sharetitle` varchar(50) NOT NULL COMMENT '分享标题',
  `sharecontent` varchar(100) NOT NULL COMMENT '分享简介',
  `picture` varchar(225) NOT NULL COMMENT '规则图片',
  `sharephoto` varchar(225) NOT NULL COMMENT 'fx图片',
  `stopping` varchar(225) NOT NULL COMMENT 'fx图片',
  `nostart` varchar(225) NOT NULL COMMENT 'fx图片',
  `end` varchar(225) NOT NULL COMMENT 'fx图片',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `tstart_time` int(10) unsigned NOT NULL COMMENT '投票开始时间',
  `tend_time` int(10) unsigned NOT NULL COMMENT '投票结束时间',
  `bstart_time` int(10) unsigned NOT NULL COMMENT '报名开始时间',
  `bend_time` int(10) unsigned NOT NULL COMMENT '报名结束时间',
  `ttipstart` varchar(255) NOT NULL COMMENT '投票开始时间',
  `ttipend` varchar(255) NOT NULL COMMENT '投票结束时间',
  `btipstart` varchar(255) NOT NULL COMMENT '报名开始时间',
  `btipend` varchar(255) NOT NULL COMMENT '报名结束时间',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `command` varchar(10) NOT NULL COMMENT '报名命令',
  `ckcommand` varchar(255) NOT NULL COMMENT '命令',
  `content` text NOT NULL COMMENT '内容',
  `tj` text NOT NULL COMMENT '站长统计代码',
  `moshi` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '展示模式： 1 相册模式  2 详情模式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '开关状态',
  `addpv` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启添加投稿',
  `isbbsreply` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启评论',
  `cqtp` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可重复投票',
  `tpsh` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '投稿是否需审核',
  `indexpx` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '活动首页显示,0 按最新排序 1 按人气排序 3 按投票数排序',
  `tpxz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投稿照片数限制',
  `daytpxz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每日投票数限制',
  `dayonetp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '同一选手投票数限制',
  `allonetp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '同一选手最高投票数',
  `fansmostvote` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户最高投票数',
  `indextpxz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首页列表显示数',
  `phbtpxz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '人气榜显示个数',
  `autolitpic` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '裁剪大小',
  `autozl` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '裁剪质量',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `xuninum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟人数',
  `xuninumtime` int(10) unsigned NOT NULL DEFAULT '86400' COMMENT '虚拟间隔时间',
  `xuninuminitial` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '虚拟随机数值1',
  `xuninumending` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '虚拟随机数值2',
  `xuninum_time` int(10) unsigned NOT NULL COMMENT '虚拟更新时间',
  `isvisits` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否互访0为不可以1为可以',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否强制需要关注公众号才能参与',
  `opensubscribe` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要参与活动才算人气0为不需要1为需要',
  `share_shownum` int(3) unsigned NOT NULL DEFAULT '10' COMMENT '加载一次显示多少参与者',
  `userinfo` varchar(200) NOT NULL COMMENT '输入姓名或手机时的提示词',
  `isindex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否首页显示0为不需要1为需要',
  `isvotexq` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否详情页显示0为不需要1为需要',
  `ispaihang` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否排行页显示0为不需要1为需要',
  `isreg` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否报名页显示0为不需要1为需要',
  `isdes` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否描述页显示0为不需要1为需要',
  `isrealname` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入姓名0为不需要1为需要',
  `ismobile` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入手机号0为不需要1为需要',
  `isweixin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入微信号0为不需要1为需要',
  `isqqhao` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入QQ号0为不需要1为需要',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入邮箱0为不需要1为需要',
  `isaddress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入地址0为不需要1为需要',
  `isjob` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职业0为不需要1为需要',
  `isxingqu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入兴趣0为不需要1为需要',
  `isfans` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0只保存本模块下1同步更新至官方FANS表',
  `iscopyright` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0显示公众号版权1为显示自定义版权',
  `copyrighturl` varchar(255) NOT NULL COMMENT '版权链接',
  `copyright` varchar(50) NOT NULL COMMENT '版权',
  `zbgcolor` varchar(50) NOT NULL COMMENT '背景色',
  `zbg` varchar(255) NOT NULL COMMENT '背景图',
  `zbgtj` varchar(255) NOT NULL COMMENT '背景图',
  `lapiao` varchar(5) NOT NULL COMMENT '拉票',
  `sharename` varchar(2) NOT NULL COMMENT '分享',
  `ishuodong` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `mtemplates` varchar(500) NOT NULL COMMENT '模板ID',
  `huodong` varchar(500) NOT NULL COMMENT '活动',
  `hhhdpicture` varchar(255) NOT NULL COMMENT '活动图片',
  `messagetemplate` varchar(255) NOT NULL COMMENT '投票消息模板id 微信的模板id',
  `regmessagetemplate` varchar(255) NOT NULL COMMENT '报名消息模板id 微信的模板id',
  `shmessagetemplate` varchar(255) NOT NULL COMMENT '报名消息模板id 微信的模板id',
  `addpvapp` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '前端是否允许用户报名',
  `iscode` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启投票验证码',
  `codekey` varchar(255) NOT NULL COMMENT '验证码key',
  `isedes` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启首页显示说明',
  `tmreply` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '弹幕评论是否同步到数据库',
  `tmyushe` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '弹幕评论是否同步到数据库',
  `isipv` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启IP作弊限制',
  `ipturl` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '存在作弊ip后是否继续允许查看，投票，评论等',
  `ipstopvote` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '存在作弊ip后是否继续允许查看，投票，评论等',
  `ipannounce` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启公告',
  `tmoshi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '首页显示模式',
  `mediatype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '上传模式',
  `mediatypem` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '上传模式',
  `mediatypev` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '上传模式',
  `bgarr` varchar(1000) NOT NULL COMMENT '颜色及背景配置',
  `tpname` varchar(100) NOT NULL COMMENT '投票名称',
  `rqname` varchar(100) NOT NULL COMMENT '人气名称',
  `tpsname` varchar(100) NOT NULL COMMENT '投票数名称',
  `votesuccess` varchar(200) NOT NULL COMMENT '投票成功提示语',
  `subscribedes` varchar(200) NOT NULL COMMENT '分享提示语',
  `csrs` varchar(10) NOT NULL COMMENT '参赛作品',
  `ljtp` varchar(10) NOT NULL COMMENT '累计投票',
  `cyrs` varchar(10) NOT NULL COMMENT '参与人数',
  `voicebg` varchar(200) NOT NULL COMMENT '录音室背景',
  `qiniu` varchar(600) NOT NULL COMMENT '七牛',
  `voicemoshi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '语音室模式',
  `isdaojishi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '倒计时',
  `votetime` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '用户投票时间',
  `limitip` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票ip每天限制数',
  `indexorder` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '首页排序',
  `ttipvote` varchar(100) NOT NULL COMMENT '用户投票时间结束提示语',
  `webinfo` text NOT NULL COMMENT '内容',
  `istopheader` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '最上方',
  `zanzhums` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '赞助商显示',
  `istop` varchar(300) NOT NULL COMMENT '顶部设置',
  `isid` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'isid',
  `iplocallimit` varchar(100) NOT NULL COMMENT '地区限制',
  `iplocaldes` varchar(100) NOT NULL COMMENT '地区限制',
  `huodongname` varchar(100) NOT NULL COMMENT '活动名称',
  `huodongurl` varchar(255) NOT NULL COMMENT '活动链接网址',
  `templates` varchar(50) NOT NULL DEFAULT 'default' COMMENT '默认模板',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_fm_photosvote_reply_body;
CREATE TABLE `ims_fm_photosvote_reply_body` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `zbgcolor` varchar(10) NOT NULL COMMENT '背景色',
  `zbg` varchar(125) NOT NULL COMMENT '背景图',
  `voicebg` varchar(125) NOT NULL COMMENT '录音室背景',
  `zbgtj` varchar(125) NOT NULL COMMENT '背景图',
  `topbgcolor` varchar(10) NOT NULL COMMENT '背景图',
  `topbg` varchar(125) NOT NULL COMMENT '背景图',
  `topbgtext` varchar(125) NOT NULL COMMENT '背景图',
  `topbgrightcolor` varchar(10) NOT NULL COMMENT '背景图',
  `topbgright` varchar(125) NOT NULL COMMENT '背景图',
  `foobg1` varchar(125) NOT NULL COMMENT '背景图',
  `foobg2` varchar(125) NOT NULL COMMENT '背景图',
  `foobgtextn` varchar(125) NOT NULL COMMENT '背景图',
  `foobgtexty` varchar(125) NOT NULL COMMENT '背景图',
  `foobgtextmore` varchar(125) NOT NULL COMMENT '背景图',
  `foobgmorecolor` varchar(10) NOT NULL COMMENT '背景图',
  `foobgmore` varchar(125) NOT NULL COMMENT '背景图',
  `bodytextcolor` varchar(10) NOT NULL COMMENT '背景图',
  `bodynumcolor` varchar(10) NOT NULL COMMENT '背景图',
  `inputcolor` varchar(10) NOT NULL COMMENT '背景图',
  `bodytscolor` varchar(10) NOT NULL COMMENT '背景图',
  `bodytsbg` varchar(125) NOT NULL COMMENT '背景图',
  `xinbg` varchar(125) NOT NULL COMMENT '背景图',
  `copyrightcolor` varchar(10) NOT NULL COMMENT '背景图',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_reply_display;
CREATE TABLE `ims_fm_photosvote_reply_display` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `istopheader` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '顶部导航',
  `ipannounce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '顶部公告',
  `isbgaudio` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '背景音乐',
  `bgmusic` varchar(125) NOT NULL COMMENT '背景音乐链接',
  `isedes` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启首页显示说明',
  `tmoshi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '首页显示模式',
  `indextpxz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首页列表显示数',
  `indexorder` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '首页排序',
  `indexpx` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '活动首页显示,0 按最新排序 1 按人气排序 3 按投票数排序',
  `phbtpxz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '人气榜显示个数',
  `zanzhums` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '赞助商显示',
  `xuninum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟人数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `xuninumtime` int(10) unsigned NOT NULL DEFAULT '86400' COMMENT '虚拟间隔时间',
  `xuninuminitial` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '虚拟随机数值1',
  `xuninumending` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '虚拟随机数值2',
  `xuninum_time` int(10) unsigned NOT NULL COMMENT '虚拟随机数值',
  `isrealname` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入姓名0为不需要1为需要',
  `ismobile` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入手机号0为不需要1为需要',
  `isweixin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入微信号0为不需要1为需要',
  `isqqhao` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入QQ号0为不需要1为需要',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入邮箱0为不需要1为需要',
  `isjob` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职业0为不需要1为需要',
  `isxingqu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入兴趣0为不需要1为需要',
  `isaddress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入地址0为不需要1为需要',
  `isindex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否首页显示0为不需要1为需要',
  `isreg` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否报名页显示0为不需要1为需要',
  `isdes` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否描述页显示0为不需要1为需要',
  `isvotexq` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否详情页显示0为不需要1为需要',
  `ispaihang` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否排行页显示0为不需要1为需要',
  `lapiao` varchar(5) NOT NULL COMMENT '拉票',
  `sharename` varchar(2) NOT NULL COMMENT '分享名字',
  `tpname` varchar(100) NOT NULL COMMENT '投票名称',
  `tpsname` varchar(100) NOT NULL COMMENT '投票数名称',
  `rqname` varchar(100) NOT NULL COMMENT '人气名称',
  `csrs` varchar(10) NOT NULL COMMENT '参赛作品',
  `ljtp` varchar(10) NOT NULL COMMENT '累计投票',
  `cyrs` varchar(10) NOT NULL COMMENT '参与人数',
  `iscopyright` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0显示公众号版权1为显示自定义版权',
  `copyrighturl` varchar(255) NOT NULL COMMENT '版权链接',
  `copyright` varchar(50) NOT NULL COMMENT '版权',
  `isvoteusers` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示投票人',
  `regtitlearr` varchar(500) NOT NULL COMMENT '姓名自定义',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_reply_huihua;
CREATE TABLE `ims_fm_photosvote_reply_huihua` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `command` varchar(10) NOT NULL COMMENT '报名命令',
  `tcommand` varchar(10) NOT NULL COMMENT '报名命令',
  `ishuodong` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 开启',
  `huodongname` varchar(20) NOT NULL COMMENT '活动名字',
  `huodongdes` varchar(50) NOT NULL COMMENT '活动简介',
  `huodongurl` varchar(125) NOT NULL COMMENT '活动链接',
  `hhhdpicture` varchar(125) NOT NULL COMMENT '活动图片',
  `regmessagetemplate` varchar(50) NOT NULL COMMENT '投票创建成功通知报名成功',
  `messagetemplate` varchar(50) NOT NULL COMMENT '投票创建成功通知',
  `shmessagetemplate` varchar(50) NOT NULL COMMENT '投票创建成功通知投票审核成功',
  `fmqftemplate` varchar(50) NOT NULL COMMENT '投票创建成功通知群发消息',
  `msgtemplate` varchar(50) NOT NULL COMMENT '评论通知消息',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_reply_share;
CREATE TABLE `ims_fm_photosvote_reply_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否强制需要关注公众号才能参与',
  `shareurl` varchar(255) NOT NULL COMMENT '活动网址',
  `sharetitle` varchar(50) NOT NULL COMMENT '分享标题',
  `sharephoto` varchar(225) NOT NULL COMMENT 'fx图片',
  `sharecontent` varchar(100) NOT NULL COMMENT '分享简介',
  `subscribedes` varchar(200) NOT NULL COMMENT '分享提示语',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_reply_vote;
CREATE TABLE `ims_fm_photosvote_reply_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `iscode` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启投票验证码',
  `codekey` varchar(255) NOT NULL COMMENT '验证码key',
  `addpvapp` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '前端是否允许用户报名',
  `isfans` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0只保存本模块下1同步更新至官方FANS表',
  `mediatype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '上传模式',
  `mediatypem` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '上传模式',
  `mediatypev` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '上传模式',
  `voicemoshi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '语音室模式',
  `moshi` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '展示模式： 1 相册模式  2 详情模式',
  `webinfo` text NOT NULL COMMENT '内容',
  `cqtp` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可重复投票',
  `tpsh` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '投稿是否需审核',
  `isbbsreply` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启评论',
  `tmyushe` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '弹幕评论是否同步到数据库',
  `tmreply` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '弹幕评论是否同步到数据库',
  `isipv` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启IP作弊限制',
  `ipturl` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '存在作弊ip后是否继续允许查看，投票，评论等',
  `ipstopvote` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '存在作弊ip后是否继续允许查看，投票，评论等',
  `iplocallimit` varchar(100) NOT NULL COMMENT '地区限制',
  `iplocaldes` varchar(100) NOT NULL COMMENT '地区限制',
  `tpxz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投稿照片数限制',
  `autolitpic` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '裁剪大小',
  `autozl` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '裁剪质量',
  `limitip` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票ip每天限制数',
  `daytpxz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每日投票数限制',
  `dayonetp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '同一选手投票数限制',
  `allonetp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '同一选手最高投票数',
  `fansmostvote` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户最高投票数',
  `userinfo` varchar(200) NOT NULL COMMENT '输入姓名或手机时的提示词',
  `votesuccess` varchar(200) NOT NULL COMMENT '投票成功提示语',
  `limitsd` varchar(20) NOT NULL COMMENT '全体限速',
  `limitsdps` varchar(20) NOT NULL COMMENT '全体限速投机票',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_tags;
CREATE TABLE `ims_fm_photosvote_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `title` varchar(100) NOT NULL DEFAULT '',
  `icon` varchar(200) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_templates;
CREATE TABLE `ims_fm_photosvote_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `author` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_templates_designer;
CREATE TABLE `ims_fm_photosvote_templates_designer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `stylename` varchar(30) NOT NULL,
  `pagename` varchar(255) NOT NULL DEFAULT '' COMMENT '页面名称',
  `pagetype` tinyint(3) NOT NULL DEFAULT '0' COMMENT '页面类型',
  `pageinfo` text NOT NULL,
  `keyword` varchar(255) DEFAULT '',
  `savetime` varchar(255) NOT NULL DEFAULT '' COMMENT '页面最后保存时间',
  `setdefault` tinyint(3) NOT NULL DEFAULT '0' COMMENT '默认页面',
  `datas` text NOT NULL COMMENT '数据',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_pagetype` (`pagetype`),
  FULLTEXT KEY `idx_keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_fm_photosvote_votelog;
CREATE TABLE `ims_fm_photosvote_votelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL,
  `tptype` int(10) unsigned NOT NULL COMMENT '投票类型 1 微信页面投票  2 微信会话界面',
  `from_user` varchar(255) NOT NULL DEFAULT '' COMMENT '用户openid',
  `tfrom_user` varchar(255) NOT NULL DEFAULT '' COMMENT '被投票用户openid',
  `afrom_user` varchar(255) NOT NULL DEFAULT '' COMMENT '分享用户openid',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '投票IP',
  `iparr` varchar(200) NOT NULL DEFAULT '' COMMENT 'ip地区',
  `photosnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '票数',
  `createtime` int(10) unsigned NOT NULL COMMENT '投票时间',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_createtime` (`createtime`),
  KEY `indx_from_user` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hc_ybdzs_setting;
CREATE TABLE `ims_hc_ybdzs_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `hc_ybdzs_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `hc_ybdzs_url` varchar(200) CHARACTER SET utf8 NOT NULL,
  `share_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `share_desc` varchar(100) CHARACTER SET utf8 NOT NULL,
  `wechat` varchar(100) CHARACTER SET utf8 NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8 NOT NULL,
  `counts` varchar(500) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_hc_zqttt_setting;
CREATE TABLE `ims_hc_zqttt_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `hc_zqttt_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `hc_zqttt_url` varchar(200) CHARACTER SET utf8 NOT NULL,
  `share_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `share_desc` varchar(100) CHARACTER SET utf8 NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_heka_list;
CREATE TABLE `ims_heka_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `title` varchar(50) DEFAULT NULL,
  `card` varchar(20) NOT NULL COMMENT '活动图片',
  `author` varchar(20) DEFAULT NULL,
  `content` varchar(500) NOT NULL COMMENT '活动描述',
  `cardName` varchar(50) DEFAULT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `share` int(11) DEFAULT NULL,
  `create_time` int(10) NOT NULL COMMENT '规则',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_heka_reply;
CREATE TABLE `ims_heka_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `title` varchar(50) DEFAULT NULL,
  `picture` varchar(100) NOT NULL COMMENT '活动图片',
  `description` varchar(200) NOT NULL COMMENT '活动描述',
  `create_time` int(10) NOT NULL COMMENT '规则',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hl_periarthritis;
CREATE TABLE `ims_hl_periarthritis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `weid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `shaketimes` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL COMMENT '活动图片',
  `gzurl` varchar(255) NOT NULL COMMENT '关注URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hlzonyu_data;
CREATE TABLE `ims_hlzonyu_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '用户头像',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '点赞人姓名',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享人UID',
  `zonyuip` varchar(15) NOT NULL DEFAULT '' COMMENT '集赞人IP',
  `zonyutime` int(10) unsigned NOT NULL COMMENT '集赞时间',
  `viewnum` int(10) NOT NULL DEFAULT '1' COMMENT '查看次数',
  `content` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hlzonyu_list;
CREATE TABLE `ims_hlzonyu_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `zonyunum` int(10) NOT NULL DEFAULT '0' COMMENT '分享量',
  `ndrank` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内定排名',
  `ndranknum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内定分享量',
  `ndranknums` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内定增加量',
  `zhongjiang` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否中奖',
  `zonyutime` int(10) unsigned NOT NULL COMMENT '最后分享时间',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁止',
  `btype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hlzonyu_log;
CREATE TABLE `ims_hlzonyu_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1积分，2金额',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '分值或金额',
  `nametype` varchar(50) NOT NULL COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'IP地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hlzonyu_order;
CREATE TABLE `ims_hlzonyu_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `ordersn` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `sendtype` tinyint(1) unsigned NOT NULL COMMENT '1为快递，2为自提',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `goodstype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `rid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `address` varchar(1000) NOT NULL DEFAULT '',
  `goodsprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goodsname` varchar(100) NOT NULL DEFAULT '',
  `tjname` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hlzonyu_reply;
CREATE TABLE `ims_hlzonyu_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `title` varchar(50) NOT NULL COMMENT '规则标题',
  `zonyuurl` varchar(255) NOT NULL COMMENT '活动网址',
  `picture` varchar(100) NOT NULL COMMENT '图片',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开关状态',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '奖励最小积分',
  `creditx` int(10) NOT NULL DEFAULT '0' COMMENT '奖励最大积分',
  `zonyunum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集多少赞奖励',
  `email` varchar(100) NOT NULL COMMENT '通知邮箱',
  `zhongjiang` varchar(200) NOT NULL COMMENT '中奖提醒词',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '活动类型0为分享、1为集赞',
  `dingpic` varchar(512) NOT NULL COMMENT '顶部图片',
  `zanpic` varchar(512) NOT NULL COMMENT '点赞图片',
  `shangjia` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示赞助商',
  `shangjianame` varchar(50) NOT NULL COMMENT '赞助商名称',
  `shangjiapic` varchar(512) NOT NULL COMMENT '赞助商图片展示',
  `shangjiatel` varchar(50) NOT NULL COMMENT '赞助商联系电话',
  `shangjiaaddress` varchar(90) NOT NULL COMMENT '赞助商联系地址',
  `shangjiamap` varchar(50) NOT NULL COMMENT '赞助商地图导航',
  `shangjialink` varchar(250) NOT NULL COMMENT '赞助商链接',
  `ndrankstatus` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启内定排名',
  `ndrankstatusnum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内定前几排名',
  `zonyu_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '点赞方式',
  `zonyu_show` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示方式投赞者',
  `zonyu_imgtext` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示头像或昵称',
  `zonyu_rankshow` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示方式排名',
  `zonyu_shownum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示多少投赞者',
  `zonyu_ranknum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排名显示多少位',
  `zonyu_numtype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以重复累计',
  `zonyu_num` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '点赞周期',
  `btype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sharetitle` varchar(200) NOT NULL COMMENT '分享标题',
  `productprice` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hnblacklist;
CREATE TABLE `ims_hnblacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `wantblack` varchar(255) NOT NULL,
  `blackwho` varchar(255) NOT NULL,
  `time` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hnfans;
CREATE TABLE `ims_hnfans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL COMMENT '用户的唯一身份ID',
  `createtime` int(10) unsigned NOT NULL COMMENT '加入时间',
  `realname` varchar(10) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '头像',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别(0:保密 1:男 2:女)',
  `constellation` varchar(10) NOT NULL DEFAULT '' COMMENT '星座',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '邮寄地址',
  `nationality` varchar(30) NOT NULL DEFAULT '' COMMENT '国籍',
  `resideprovincecity` varchar(30) NOT NULL DEFAULT '' COMMENT '居住省市',
  `residedist` varchar(30) NOT NULL DEFAULT '' COMMENT '居住行政区/县',
  `education` varchar(10) NOT NULL DEFAULT '' COMMENT '学历',
  `occupation` varchar(30) NOT NULL DEFAULT '' COMMENT '职业',
  `position` varchar(30) NOT NULL DEFAULT '' COMMENT '职位',
  `revenue` varchar(10) NOT NULL DEFAULT '' COMMENT '年收入',
  `affectivestatus` varchar(30) NOT NULL DEFAULT '' COMMENT '情感状态',
  `lookingfor` varchar(255) NOT NULL DEFAULT '' COMMENT ' 交友目的',
  `height` varchar(5) NOT NULL DEFAULT '' COMMENT '身高',
  `weight` varchar(5) NOT NULL DEFAULT '' COMMENT '体重',
  `interest` text NOT NULL COMMENT '兴趣爱好',
  `lxxingzuo` varchar(200) NOT NULL DEFAULT '' COMMENT '理想星座',
  `housestatus` varchar(20) NOT NULL DEFAULT '' COMMENT '是否有房',
  `carstatus` varchar(20) NOT NULL DEFAULT '' COMMENT '是否有车',
  `lat` varchar(20) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(20) NOT NULL DEFAULT '' COMMENT '纬度',
  `ueducation` varchar(30) NOT NULL DEFAULT '' COMMENT 'TA的学历',
  `urevenue` varchar(30) NOT NULL DEFAULT '' COMMENT '他的月薪',
  `love` int(10) NOT NULL DEFAULT '0' COMMENT '被喜欢次数',
  `mails` int(10) NOT NULL DEFAULT '0' COMMENT '收信次数',
  `uheightL` int(10) NOT NULL DEFAULT '0' COMMENT 'Ta的最小身高',
  `uheightH` int(10) NOT NULL DEFAULT '0' COMMENT 'Ta的最大身高',
  `uweight` int(10) NOT NULL DEFAULT '0' COMMENT 'Ta的体重',
  `uage` int(10) NOT NULL DEFAULT '0' COMMENT 'Ta的年龄',
  `Descrip` varchar(200) NOT NULL DEFAULT '' COMMENT '一句话描述',
  `uitsCharacter` varchar(300) NOT NULL DEFAULT '' COMMENT 'Ta的性格',
  `uitsOthers` varchar(300) NOT NULL DEFAULT '' COMMENT 'Ta的其他要求',
  `age` int(10) NOT NULL DEFAULT '0' COMMENT '自己的年龄',
  `isshow` int(2) NOT NULL DEFAULT '0' COMMENT '注册审核机制',
  `time` int(12) NOT NULL DEFAULT '0' COMMENT '进入平台获取资料时间',
  `yingcang` int(2) NOT NULL DEFAULT '1' COMMENT '隐藏显示',
  `qq` varchar(20) NOT NULL COMMENT '会员QQ',
  `wechat` varchar(25) NOT NULL COMMENT '会员微信',
  `telephoneconfirm` int(2) NOT NULL DEFAULT '0' COMMENT '是否手机验证',
  `tuijian` int(2) NOT NULL DEFAULT '1' COMMENT '推荐',
  `tjtype` int(2) NOT NULL DEFAULT '0' COMMENT '推荐类型',
  PRIMARY KEY (`id`),
  KEY `weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hnmessage;
CREATE TABLE `ims_hnmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `sendernickname` varchar(200) NOT NULL,
  `senderavatar` varchar(255) NOT NULL,
  `geter` varchar(255) NOT NULL,
  `stime` int(12) NOT NULL,
  `mloop` tinyint(1) NOT NULL DEFAULT '0',
  `msgtype` varchar(20) NOT NULL DEFAULT 'text' COMMENT 'leixing',
  `thumburl` varchar(100) NOT NULL DEFAULT '0' COMMENT 'thumb',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hnpayjifen;
CREATE TABLE `ims_hnpayjifen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `tid` varchar(20) NOT NULL DEFAULT '0' COMMENT '订单编号',
  `openid` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `fee` int(10) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `paytype` varchar(20) NOT NULL,
  `transid` varchar(30) NOT NULL DEFAULT '0',
  `time` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hnresearch;
CREATE TABLE `ims_hnresearch` (
  `reid` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL,
  `content` text NOT NULL,
  `information` varchar(500) NOT NULL DEFAULT '',
  `thumb` varchar(200) NOT NULL DEFAULT '',
  `inhome` tinyint(4) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `starttime` int(10) NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `pretotal` int(10) unsigned NOT NULL DEFAULT '1',
  `noticeemail` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`reid`),
  KEY `weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hnresearch_data;
CREATE TABLE `ims_hnresearch_data` (
  `redid` bigint(20) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL,
  `rerid` int(11) NOT NULL,
  `refid` int(11) NOT NULL,
  `data` varchar(800) NOT NULL,
  PRIMARY KEY (`redid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hnresearch_fields;
CREATE TABLE `ims_hnresearch_fields` (
  `refid` int(11) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `essential` tinyint(4) NOT NULL DEFAULT '0',
  `bind` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `displayorder` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`refid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hnresearch_rows;
CREATE TABLE `ims_hnresearch_rows` (
  `rerid` int(11) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rerid`),
  KEY `reid` (`reid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hongapis;
CREATE TABLE `ims_hongapis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `status` int(3) NOT NULL,
  `city` varchar(255) NOT NULL,
  `company` varchar(20) NOT NULL,
  `create_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `openid` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hongapitype;
CREATE TABLE `ims_hongapitype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `express_id` varchar(20) NOT NULL,
  `status` int(3) NOT NULL,
  `company` varchar(20) NOT NULL,
  `create_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `openid` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hongniangexchangelog;
CREATE TABLE `ims_hongniangexchangelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) NOT NULL,
  `toopenid` varchar(100) NOT NULL,
  `twhichone` varchar(100) NOT NULL,
  `credit` tinyint(1) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hongniangsharelogs;
CREATE TABLE `ims_hongniangsharelogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `jljifen` varchar(10) NOT NULL,
  `sharetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2;
CREATE TABLE `ims_hotel2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `lng` decimal(10,2) DEFAULT '0.00',
  `lat` decimal(10,2) DEFAULT '0.00',
  `ordermax` int(11) DEFAULT '0',
  `numsmax` int(11) DEFAULT '0',
  `daymax` int(11) DEFAULT '0',
  `address` varchar(255) DEFAULT '',
  `location_p` varchar(50) DEFAULT '',
  `location_c` varchar(50) DEFAULT '',
  `location_a` varchar(50) DEFAULT '',
  `roomcount` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `phone` varchar(255) DEFAULT '',
  `mail` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `thumborder` varchar(255) DEFAULT '',
  `description` text,
  `content` text,
  `traffic` text,
  `thumbs` text,
  `sales` text,
  `displayorder` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `device` text,
  `brandid` int(11) DEFAULT '0',
  `businessid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2_brand;
CREATE TABLE `ims_hotel2_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2_business;
CREATE TABLE `ims_hotel2_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `location_p` varchar(255) DEFAULT '',
  `location_c` varchar(255) DEFAULT '',
  `location_a` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2_member;
CREATE TABLE `ims_hotel2_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `userid` varchar(50) DEFAULT '',
  `from_user` varchar(50) DEFAULT '',
  `realname` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `createtime` int(11) DEFAULT '0',
  `userbind` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `username` varchar(30) DEFAULT '' COMMENT '用户名',
  `password` varchar(200) DEFAULT '' COMMENT '密码',
  `salt` varchar(8) NOT NULL DEFAULT '' COMMENT '加密盐',
  `islogin` tinyint(3) NOT NULL DEFAULT '0',
  `isauto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动添加，0否，1是',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2_order;
CREATE TABLE `ims_hotel2_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `hotelid` int(11) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `memberid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `btime` int(11) DEFAULT '0',
  `etime` int(11) DEFAULT '0',
  `style` varchar(255) DEFAULT '',
  `nums` int(11) DEFAULT '0',
  `oprice` decimal(10,2) DEFAULT '0.00' COMMENT '原价',
  `cprice` decimal(10,2) DEFAULT '0.00' COMMENT '现价',
  `mprice` decimal(10,2) DEFAULT '0.00' COMMENT '会员价',
  `info` text,
  `time` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `paytype` int(11) DEFAULT '0',
  `paystatus` int(11) DEFAULT '0',
  `msg` text,
  `mngtime` int(11) DEFAULT '0',
  `contact_name` varchar(30) NOT NULL DEFAULT '' COMMENT '联系人',
  `day` tinyint(2) NOT NULL DEFAULT '0' COMMENT '住几晚',
  `sum_price` decimal(10,2) DEFAULT '0.00' COMMENT '总价',
  `ordersn` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_hotelid` (`hotelid`),
  KEY `indx_weid` (`weid`),
  KEY `indx_roomid` (`roomid`),
  KEY `indx_memberid` (`memberid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2_reply;
CREATE TABLE `ims_hotel2_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `hotelid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2_room;
CREATE TABLE `ims_hotel2_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelid` int(11) DEFAULT '0',
  `weid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `oprice` decimal(10,2) DEFAULT '0.00' COMMENT '原价',
  `cprice` decimal(10,2) DEFAULT '0.00' COMMENT '现价',
  `mprice` decimal(10,2) DEFAULT '0.00' COMMENT '会员价',
  `thumbs` text,
  `device` text,
  `area` varchar(255) DEFAULT '',
  `floor` varchar(255) DEFAULT '',
  `smoke` varchar(255) DEFAULT '',
  `bed` varchar(255) DEFAULT '',
  `persons` int(11) DEFAULT '0',
  `bedadd` varchar(30) DEFAULT '',
  `status` int(11) DEFAULT '0',
  `isshow` int(11) DEFAULT '0',
  `sales` text,
  `displayorder` int(11) DEFAULT '0',
  `area_show` int(11) DEFAULT '0',
  `floor_show` int(11) DEFAULT '0',
  `smoke_show` int(11) DEFAULT '0',
  `bed_show` int(11) DEFAULT '0',
  `persons_show` int(11) DEFAULT '0',
  `bedadd_show` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '0' COMMENT '订房积分',
  `breakfast` tinyint(3) DEFAULT '0' COMMENT '0无早 1单早 2双早',
  `sortid` int(11) NOT NULL DEFAULT '0' COMMENT '房间id，排序时使用',
  PRIMARY KEY (`id`),
  KEY `indx_hotelid` (`hotelid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2_room_price;
CREATE TABLE `ims_hotel2_room_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `hotelid` int(11) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `roomdate` int(11) DEFAULT '0',
  `thisdate` varchar(255) NOT NULL DEFAULT '' COMMENT '当天日期',
  `oprice` decimal(10,2) DEFAULT '0.00' COMMENT '原价',
  `cprice` decimal(10,2) DEFAULT '0.00' COMMENT '现价',
  `mprice` decimal(10,2) DEFAULT '0.00' COMMENT '会员价',
  `num` varchar(255) DEFAULT '-1',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_hotelid` (`hotelid`),
  KEY `indx_roomid` (`roomid`),
  KEY `indx_roomdate` (`roomdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hotel2_set;
CREATE TABLE `ims_hotel2_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `user` tinyint(1) DEFAULT '0' COMMENT '用户类型0微信用户1独立用户',
  `reg` tinyint(1) DEFAULT '0' COMMENT '是否允许注册0禁止注册1允许注册',
  `bind` tinyint(1) DEFAULT '0' COMMENT '是否绑定',
  `regcontent` text COMMENT '注册提示',
  `ordertype` tinyint(1) DEFAULT '0' COMMENT '预定类型0电话预定1电话和网络预订',
  `is_unify` tinyint(1) DEFAULT '0' COMMENT '0使用各分店电话,1使用统一电话',
  `tel` varchar(20) DEFAULT '' COMMENT '统一电话',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '提醒接受邮箱',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '提醒接受手机',
  `template` varchar(32) NOT NULL DEFAULT '' COMMENT '发送模板消息',
  `templateid` varchar(255) NOT NULL DEFAULT '' COMMENT '模板ID',
  `paytype1` tinyint(1) DEFAULT '0',
  `paytype2` tinyint(1) DEFAULT '0',
  `paytype3` tinyint(1) DEFAULT '0',
  `version` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0单酒店版1多酒店版',
  `location_p` varchar(50) DEFAULT '',
  `location_c` varchar(50) DEFAULT '',
  `location_a` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_hx_alert_list;
CREATE TABLE `ims_hx_alert_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `title` varchar(50) DEFAULT NULL,
  `loops` int(10) unsigned NOT NULL COMMENT '循环次数',
  `items` text NOT NULL COMMENT '弹出文字',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_alert_reply;
CREATE TABLE `ims_hx_alert_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `title` varchar(50) DEFAULT NULL,
  `picture` varchar(100) NOT NULL COMMENT '活动图片',
  `description` varchar(200) NOT NULL COMMENT '活动描述',
  `gzurl` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_cards_award;
CREATE TABLE `ims_hx_cards_award` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reply_id` int(10) DEFAULT '0',
  `uid` int(10) DEFAULT '0',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `prizetype` varchar(10) DEFAULT '' COMMENT '类型',
  `level` int(10) unsigned NOT NULL,
  `createtime` int(10) DEFAULT '0',
  `consumetime` int(10) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_cards_fans;
CREATE TABLE `ims_hx_cards_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reply_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `todaynum` int(10) unsigned NOT NULL DEFAULT '0',
  `totalnum` int(10) unsigned NOT NULL DEFAULT '0',
  `awardnum` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_cards_reply;
CREATE TABLE `ims_hx_cards_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `groupid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '可参与的用户组',
  `thumb` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `need_type` varchar(10) NOT NULL,
  `need_num` int(10) unsigned NOT NULL,
  `give_type` varchar(10) NOT NULL,
  `give_num` int(10) unsigned NOT NULL DEFAULT '0',
  `onlynone` tinyint(1) NOT NULL DEFAULT '0',
  `awardnum` int(10) unsigned NOT NULL,
  `playnum` int(10) unsigned NOT NULL,
  `dayplaynum` int(10) unsigned NOT NULL,
  `zfcs` int(10) unsigned NOT NULL COMMENT '转发次数',
  `zjcs` int(10) unsigned NOT NULL,
  `tips` varchar(255) NOT NULL,
  `noprize` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `share_title` varchar(100) NOT NULL,
  `share_img` varchar(255) NOT NULL,
  `share_url` varchar(255) NOT NULL,
  `share_content` varchar(255) NOT NULL,
  `rate` int(10) unsigned NOT NULL,
  `prizes` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0结束1正常2暂停',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_cards_share;
CREATE TABLE `ims_hx_cards_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uinacid` int(10) unsigned NOT NULL,
  `reply_id` int(10) unsigned NOT NULL,
  `share_from` varchar(50) NOT NULL,
  `share_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_dialect_questions;
CREATE TABLE `ims_hx_dialect_questions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `audio` varchar(200) NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `answer` varchar(2) NOT NULL,
  `mark` int(10) NOT NULL,
  `hard` varchar(5) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `remark` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_dialect_reply;
CREATE TABLE `ims_hx_dialect_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `r_name` varchar(200) NOT NULL,
  `r_title` varchar(200) NOT NULL,
  `thumb` varchar(1000) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_icon` varchar(1000) NOT NULL,
  `s_des` varchar(1000) NOT NULL,
  `s_cancel` varchar(200) NOT NULL,
  `s_share` varchar(2000) NOT NULL,
  `s_sucai` varchar(2000) NOT NULL,
  `py_1` varchar(200) NOT NULL,
  `py_2` varchar(200) NOT NULL,
  `py_3` varchar(200) NOT NULL,
  `py_4` varchar(200) NOT NULL,
  `py_5` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_lottery_award;
CREATE TABLE `ims_hx_lottery_award` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reply_id` int(10) DEFAULT '0',
  `uid` int(10) DEFAULT '0',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `prizetype` varchar(10) DEFAULT '' COMMENT '类型',
  `level` int(10) unsigned NOT NULL,
  `createtime` int(10) DEFAULT '0',
  `consumetime` int(10) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_lottery_fans;
CREATE TABLE `ims_hx_lottery_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reply_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `todaynum` int(10) unsigned NOT NULL DEFAULT '0',
  `totalnum` int(10) unsigned NOT NULL DEFAULT '0',
  `awardnum` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_lottery_reply;
CREATE TABLE `ims_hx_lottery_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `groupid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '可参与的用户组',
  `thumb` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `need_type` varchar(10) NOT NULL,
  `need_num` int(10) unsigned NOT NULL,
  `give_type` varchar(10) NOT NULL,
  `give_num` int(10) unsigned NOT NULL DEFAULT '0',
  `onlynone` tinyint(1) NOT NULL DEFAULT '0',
  `awardnum` int(10) unsigned NOT NULL,
  `playnum` int(10) unsigned NOT NULL,
  `dayplaynum` int(10) unsigned NOT NULL,
  `zfcs` int(10) unsigned NOT NULL,
  `zjcs` int(10) unsigned NOT NULL,
  `tips` varchar(255) NOT NULL,
  `prizeinfo` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `share_title` varchar(100) NOT NULL,
  `share_img` varchar(255) NOT NULL,
  `share_url` varchar(255) NOT NULL,
  `share_content` varchar(255) NOT NULL,
  `rate` int(10) unsigned NOT NULL,
  `prizes` text NOT NULL,
  `reg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0结束1正常2暂停',
  `createtime` int(10) unsigned NOT NULL,
  `daytotalnum` int(10) unsigned NOT NULL COMMENT '总参加次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_lottery_share;
CREATE TABLE `ims_hx_lottery_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uinacid` int(10) unsigned NOT NULL,
  `reply_id` int(10) unsigned NOT NULL,
  `share_from` varchar(50) NOT NULL,
  `share_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_pictorial;
CREATE TABLE `ims_hx_pictorial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `share` varchar(250) NOT NULL DEFAULT '',
  `open` varchar(100) NOT NULL DEFAULT '',
  `ostyle` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `music` varchar(100) NOT NULL DEFAULT '',
  `mauto` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `mloop` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `loading` varchar(100) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `isloop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `moban` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_pictorial_item;
CREATE TABLE `ims_hx_pictorial_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `pictorialid` int(10) unsigned NOT NULL,
  `photoid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `item` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `x` int(3) NOT NULL DEFAULT '0',
  `y` int(3) NOT NULL DEFAULT '0',
  `bigimg` varchar(1000) NOT NULL DEFAULT '',
  `animation` varchar(20) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photoid` (`photoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_pictorial_photo;
CREATE TABLE `ims_hx_pictorial_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `pictorialid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `ispreview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_huabaoid` (`pictorialid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_pictorial_reply;
CREATE TABLE `ims_hx_pictorial_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `huabaoid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_securityspro_data_56;
CREATE TABLE `ims_hx_securityspro_data_56` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `factory` varchar(500) NOT NULL,
  `creditname` varchar(20) NOT NULL,
  `creditnum` int(10) unsigned NOT NULL,
  `creditstatus` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `stime` int(10) unsigned NOT NULL,
  `createtime` decimal(11,0) NOT NULL,
  `num` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_securityspro_data_67;
CREATE TABLE `ims_hx_securityspro_data_67` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `factory` varchar(500) NOT NULL,
  `creditname` varchar(20) NOT NULL,
  `creditnum` int(10) unsigned NOT NULL,
  `creditstatus` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `stime` int(10) unsigned NOT NULL,
  `createtime` decimal(11,0) NOT NULL,
  `num` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_securityspro_data_moban;
CREATE TABLE `ims_hx_securityspro_data_moban` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `factory` varchar(500) NOT NULL,
  `creditname` varchar(20) NOT NULL,
  `creditnum` int(10) unsigned NOT NULL,
  `creditstatus` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `stime` int(10) unsigned NOT NULL,
  `createtime` decimal(11,0) NOT NULL,
  `num` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_securityspro_logs;
CREATE TABLE `ims_hx_securityspro_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_securityspro_reply;
CREATE TABLE `ims_hx_securityspro_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(10) NOT NULL,
  `Reply` varchar(1000) NOT NULL,
  `Integral` int(10) NOT NULL,
  `tnumber` int(10) NOT NULL,
  `Failure` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_subscribe_apply;
CREATE TABLE `ims_hx_subscribe_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `realname` varchar(20) NOT NULL,
  `qq` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `alipay` varchar(50) NOT NULL,
  `cardid` varchar(50) NOT NULL,
  `cardfrom` varchar(255) NOT NULL,
  `cardname` varchar(10) NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mobile` varchar(12) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_subscribe_article;
CREATE TABLE `ims_hx_subscribe_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(500) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `credit` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_subscribe_data;
CREATE TABLE `ims_hx_subscribe_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `from_uid` int(10) unsigned NOT NULL,
  `sn` int(10) unsigned NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `article_id` int(10) unsigned NOT NULL,
  `shouyi` int(10) unsigned NOT NULL DEFAULT '0',
  `zjrs` int(10) unsigned NOT NULL DEFAULT '0',
  `jjrs` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_address;
CREATE TABLE `ims_hx_zhongchou_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL,
  `address` varchar(300) NOT NULL,
  `isdefault` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_adv;
CREATE TABLE `ims_hx_zhongchou_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_cart;
CREATE TABLE `ims_hx_zhongchou_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `projectid` int(11) NOT NULL,
  `from_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_openid` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_category;
CREATE TABLE `ims_hx_zhongchou_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_dispatch;
CREATE TABLE `ims_hx_zhongchou_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `dispatchname` varchar(50) DEFAULT '',
  `dispatchtype` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `firstprice` decimal(10,2) DEFAULT '0.00',
  `secondprice` decimal(10,2) DEFAULT '0.00',
  `firstweight` int(11) DEFAULT '0',
  `secondweight` int(11) DEFAULT '0',
  `express` int(11) DEFAULT '0',
  `description` text,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_express;
CREATE TABLE `ims_hx_zhongchou_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `express_name` varchar(50) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `express_price` varchar(10) DEFAULT '',
  `express_area` varchar(100) DEFAULT '',
  `express_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_feedback;
CREATE TABLE `ims_hx_zhongchou_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为维权，2为告擎',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0未解决，1用户同意，2用户拒绝',
  `feedbackid` varchar(30) NOT NULL COMMENT '投诉单号',
  `transid` varchar(30) NOT NULL COMMENT '订单号',
  `reason` varchar(1000) NOT NULL COMMENT '理由',
  `solution` varchar(1000) NOT NULL COMMENT '期待解决方案',
  `remark` varchar(1000) NOT NULL COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_feedbackid` (`feedbackid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_transid` (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_news;
CREATE TABLE `ims_hx_zhongchou_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `cateid` int(10) unsigned DEFAULT NULL,
  `content` text,
  `source` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `displayorder` int(10) unsigned DEFAULT NULL,
  `click` int(10) unsigned DEFAULT NULL,
  `is_display` tinyint(1) unsigned DEFAULT NULL,
  `createtime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_hx_zhongchou_news_category;
CREATE TABLE `ims_hx_zhongchou_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `displayorder` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_hx_zhongchou_order;
CREATE TABLE `ims_hx_zhongchou_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `ordersn` varchar(20) NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `price` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `sendtype` tinyint(1) unsigned NOT NULL COMMENT '1为快递，2为自提',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `return_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `addressid` int(10) unsigned NOT NULL,
  `expresscom` varchar(30) NOT NULL DEFAULT '',
  `expresssn` varchar(50) NOT NULL DEFAULT '',
  `express` varchar(200) NOT NULL DEFAULT '',
  `item_price` decimal(10,2) DEFAULT '0.00',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `dispatch` int(10) DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_order_ws;
CREATE TABLE `ims_hx_zhongchou_order_ws` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `ordersn` int(10) unsigned DEFAULT NULL,
  `price` decimal(10,2) unsigned DEFAULT NULL,
  `paytype` varchar(10) DEFAULT NULL,
  `transid` varchar(20) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `createtime` int(10) unsigned DEFAULT NULL,
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_hx_zhongchou_project;
CREATE TABLE `ims_hx_zhongchou_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `limit_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `donenum` int(10) unsigned NOT NULL DEFAULT '0',
  `finish_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deal_days` int(10) unsigned NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isrecommand` tinyint(1) unsigned DEFAULT '0',
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `brief` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `nosubuser` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0暂停1正常2停止',
  `createtime` int(10) unsigned NOT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `starttime` int(10) unsigned DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `subsurl` varchar(500) DEFAULT NULL,
  `show_type` int(10) DEFAULT '0',
  `type` tinyint(10) DEFAULT '0',
  `lianxiren` varchar(20) DEFAULT '',
  `qq` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_hx_zhongchou_project_item;
CREATE TABLE `ims_hx_zhongchou_project_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `description` varchar(2000) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `limit_num` int(10) unsigned NOT NULL,
  `donenum` int(10) unsigned NOT NULL DEFAULT '0',
  `repaid_day` int(10) unsigned NOT NULL,
  `return_type` tinyint(1) unsigned NOT NULL,
  `dispatch` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `delivery_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ice_picwall;
CREATE TABLE `ims_ice_picwall` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '1',
  `tousername` varchar(32) NOT NULL DEFAULT '1',
  `timeID` int(10) unsigned NOT NULL DEFAULT '1',
  `timestart` int(10) unsigned NOT NULL DEFAULT '1',
  `timeend` varchar(16) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ice_picwalllikelist;
CREATE TABLE `ims_ice_picwalllikelist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '1',
  `openid` varchar(64) NOT NULL DEFAULT '1',
  `tousername` varchar(32) NOT NULL DEFAULT '1',
  `timeID` int(10) unsigned NOT NULL DEFAULT '1',
  `picid` int(10) unsigned NOT NULL DEFAULT '1',
  `time` varchar(16) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ice_picwallmain;
CREATE TABLE `ims_ice_picwallmain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '1',
  `openid` varchar(64) NOT NULL DEFAULT '1',
  `tousername` varchar(32) NOT NULL DEFAULT '1',
  `timeID` int(10) unsigned NOT NULL DEFAULT '1',
  `showID` int(10) unsigned NOT NULL DEFAULT '1',
  `imgurl` varchar(512) NOT NULL DEFAULT '1',
  `likeNum` int(10) unsigned NOT NULL DEFAULT '0',
  `time` varchar(16) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ice_picwalluserinfo;
CREATE TABLE `ims_ice_picwalluserinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '1',
  `openid` varchar(64) NOT NULL DEFAULT '1',
  `uname` varchar(16) NOT NULL,
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_images_reply;
CREATE TABLE `ims_images_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_iwobanji_xcpage_adma;
CREATE TABLE `ims_iwobanji_xcpage_adma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `copyright` varchar(50) NOT NULL,
  `info` varchar(120) NOT NULL,
  `title` varchar(60) NOT NULL,
  `class` varchar(60) NOT NULL,
  `classkouling` varchar(60) NOT NULL,
  `classslogan` varchar(60) NOT NULL,
  `background_img` varchar(60) NOT NULL,
  `group_photo` varchar(60) NOT NULL,
  `wxh` varchar(60) NOT NULL,
  `wxm` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_iwobanji_xcpage_reply;
CREATE TABLE `ims_iwobanji_xcpage_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_j_activity_reply;
CREATE TABLE `ims_j_activity_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `weid` int(10) DEFAULT '0',
  `fid` int(10) DEFAULT '0' COMMENT '外链接ID',
  `picture` varchar(200) NOT NULL COMMENT '活动图片',
  `qrcode` varchar(200) NOT NULL DEFAULT '' COMMENT '二维码',
  `clientpic` varchar(200) NOT NULL COMMENT '转发图片',
  `title` varchar(100) NOT NULL COMMENT '活动标题',
  `description` varchar(100) NOT NULL COMMENT '转发介绍',
  `info` varchar(2000) NOT NULL COMMENT '活动介绍',
  `rule` text NOT NULL COMMENT '规则描述',
  `content` text NOT NULL COMMENT '活动完成介绍',
  `applicants` int(10) NOT NULL DEFAULT '0' COMMENT '报名名额',
  `quota` int(10) NOT NULL DEFAULT '0' COMMENT '名额',
  `joinstarttime` int(10) unsigned NOT NULL COMMENT '报名开始时间',
  `joinendtime` int(10) unsigned NOT NULL COMMENT '报名结束时间',
  `starttime` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `appendcode` varchar(10) NOT NULL DEFAULT '',
  `usertype` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '会员组要求，-1不要求，0只允许普通粉丝，1只允许高级粉丝',
  `credit_join` int(10) NOT NULL DEFAULT '0' COMMENT '报名送积分',
  `credit_in` int(10) NOT NULL DEFAULT '0' COMMENT '入选积分',
  `credit_append` int(10) NOT NULL DEFAULT '0' COMMENT '签到积分',
  `parama` varchar(1000) NOT NULL COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_j_activity_winner;
CREATE TABLE `ims_j_activity_winner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `weid` int(10) NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `openid` varchar(50) NOT NULL COMMENT '借用身份',
  `mobile` varchar(20) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `gender` smallint(1) NOT NULL DEFAULT '0',
  `realname` varchar(20) NOT NULL,
  `parama` varchar(1000) NOT NULL COMMENT '参数',
  `status` smallint(1) NOT NULL DEFAULT '0',
  `attend` smallint(1) NOT NULL DEFAULT '0',
  `endtime` varchar(10) NOT NULL,
  `createtime` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jer_da_event;
CREATE TABLE `ims_jer_da_event` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `content` text,
  `money` decimal(10,2) DEFAULT NULL,
  `starttime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `createtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jer_da_event_category;
CREATE TABLE `ims_jer_da_event_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parentid` int(10) DEFAULT NULL,
  `createtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jer_da_module;
CREATE TABLE `ims_jer_da_module` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `createtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jer_da_module_table;
CREATE TABLE `ims_jer_da_module_table` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `mid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `tablename` varchar(100) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `timefield` varchar(100) DEFAULT NULL,
  `uniacidfield` varchar(100) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `createtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jing_ns_reply;
CREATE TABLE `ims_jing_ns_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `loading` varchar(200) NOT NULL,
  `audio` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `link1` varchar(255) NOT NULL,
  `link2` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ju_credit_log;
CREATE TABLE `ims_ju_credit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `openid` varchar(40) DEFAULT NULL,
  `subscribetime` int(10) unsigned DEFAULT NULL,
  `unsubscribetime` int(10) unsigned DEFAULT NULL,
  `follow` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ju_read_data;
CREATE TABLE `ims_ju_read_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `reply_id` int(10) unsigned NOT NULL,
  `openid` varchar(30) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `sn` varchar(20) NOT NULL,
  `prizeid` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ju_read_log;
CREATE TABLE `ims_ju_read_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `reply_id` int(10) unsigned NOT NULL,
  `parentopenid` varchar(30) NOT NULL,
  `readopenid` varchar(30) NOT NULL,
  `ceratetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_ju_read_reply;
CREATE TABLE `ims_ju_read_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `topimg` varchar(255) NOT NULL,
  `bgcolor` varchar(10) NOT NULL,
  `pagestyle` longtext NOT NULL,
  `address` text NOT NULL,
  `tips` varchar(500) NOT NULL,
  `linkurl` varchar(200) NOT NULL,
  `adimg` varchar(255) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `copyright` varchar(20) NOT NULL,
  `prizes` longtext NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_cart;
CREATE TABLE `ims_jufeng_wcy_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `foodsid` int(11) NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_category;
CREATE TABLE `ims_jufeng_wcy_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID,0为店铺',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `sendprice` int(10) unsigned NOT NULL DEFAULT '0',
  `total` int(10) unsigned NOT NULL DEFAULT '0',
  `shouji` bigint(50) NOT NULL COMMENT '店家手机',
  `email` varchar(50) NOT NULL DEFAULT '',
  `typeid` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `time1` varchar(10) NOT NULL DEFAULT '0',
  `time2` varchar(10) NOT NULL DEFAULT '0',
  `time3` varchar(10) NOT NULL DEFAULT '0',
  `time4` varchar(10) NOT NULL DEFAULT '0',
  `address` varchar(100) NOT NULL,
  `loc_x` varchar(20) NOT NULL,
  `loc_y` varchar(20) NOT NULL,
  `mbgroup` int(10) unsigned NOT NULL,
  `count1` varchar(20) NOT NULL,
  `count2` varchar(20) NOT NULL,
  `count3` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_foods;
CREATE TABLE `ims_jufeng_wcy_foods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ishot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `unit` varchar(5) NOT NULL DEFAULT '',
  `preprice` varchar(10) NOT NULL DEFAULT '',
  `oriprice` varchar(10) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_loc;
CREATE TABLE `ims_jufeng_wcy_loc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `loc_x` varchar(20) NOT NULL,
  `loc_y` varchar(20) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_order;
CREATE TABLE `ims_jufeng_wcy_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `mobile` bigint(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `ordersn` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '-2已删除，-1已取消，0已完成，1等待支付，2已下单，3已确认',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为在线付款，2为餐到付款',
  `other` varchar(100) NOT NULL DEFAULT '',
  `time` varchar(20) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_order_foods;
CREATE TABLE `ims_jufeng_wcy_order_foods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `foodsid` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_print;
CREATE TABLE `ims_jufeng_wcy_print` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `cateid` int(10) NOT NULL,
  `deviceno` varchar(20) NOT NULL,
  `key` varchar(20) NOT NULL,
  `printtime` int(10) unsigned NOT NULL,
  `qr` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_shoptype;
CREATE TABLE `ims_jufeng_wcy_shoptype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `displayorder` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jufeng_wcy_sms;
CREATE TABLE `ims_jufeng_wcy_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `email` varchar(50) NOT NULL,
  `emailpsw` varchar(100) NOT NULL,
  `smtp` varchar(50) NOT NULL,
  `smsnum` varchar(50) NOT NULL,
  `smspsw` varchar(50) NOT NULL,
  `smstest` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_junsion_poster_poster;
CREATE TABLE `ims_junsion_poster_poster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `data` text,
  `createtime` varchar(12) DEFAULT NULL,
  `bg` varchar(200) DEFAULT NULL,
  `doneurl` varchar(200) DEFAULT NULL,
  `tipsurl` varchar(200) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `score2` int(11) DEFAULT '0',
  `cscore2` int(11) DEFAULT '0',
  `pscore2` int(11) DEFAULT '0',
  `gid` int(11) DEFAULT '0',
  `kword` varchar(20) DEFAULT NULL,
  `mtips` varchar(200) DEFAULT NULL,
  `sliders` text,
  `slideH` int(11) DEFAULT '0',
  `cscore` int(11) DEFAULT '0',
  `pscore` int(11) DEFAULT '0',
  `credit` int(1) DEFAULT '0',
  `winfo1` varchar(200) DEFAULT NULL,
  `winfo2` varchar(200) DEFAULT NULL,
  `winfo3` varchar(200) DEFAULT NULL,
  `sharetitle` varchar(200) DEFAULT NULL,
  `sharedesc` varchar(200) DEFAULT NULL,
  `sharethumb` varchar(200) DEFAULT NULL,
  `stitle` text,
  `sthumb` text,
  `sdesc` text,
  `surl` text,
  `questions` text,
  `rid` int(11) DEFAULT '0',
  `rtype` int(1) DEFAULT '0',
  `ftips` text,
  `utips` text,
  `utips2` text,
  `wtips` text,
  `starttime` varchar(12) DEFAULT NULL,
  `endtime` varchar(12) DEFAULT NULL,
  `nostarttips` text,
  `endtips` text,
  `grouptips` text,
  `groups` text,
  `rscore` int(11) DEFAULT '0',
  `rtips` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_junsion_poster_record;
CREATE TABLE `ims_junsion_poster_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `openid` varchar(200) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `surplus` int(11) DEFAULT '0',
  `createtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_junsion_poster_share;
CREATE TABLE `ims_junsion_poster_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT '0',
  `nickname` varchar(50) DEFAULT '0',
  `avatar` varchar(200) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `cscore` int(11) DEFAULT '0',
  `pscore` int(11) DEFAULT '0',
  `pid` int(11) DEFAULT '0',
  `sceneid` int(11) DEFAULT '0',
  `ticketid` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parentid` int(11) DEFAULT '0',
  `status` int(1) DEFAULT '0',
  `hasdel` int(1) DEFAULT '0',
  `createtime` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_junsion_qixiqueqiao_player;
CREATE TABLE `ims_junsion_qixiqueqiao_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `realname` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `qq` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `myname` varchar(50) NOT NULL,
  `hname` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `createtime` varchar(11) NOT NULL,
  `successtime` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_junsion_qixiqueqiao_prize;
CREATE TABLE `ims_junsion_qixiqueqiao_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_junsion_qixiqueqiao_record;
CREATE TABLE `ims_junsion_qixiqueqiao_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_junsion_qixiqueqiao_rule;
CREATE TABLE `ims_junsion_qixiqueqiao_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `stitle` varchar(50) NOT NULL,
  `sthumb` varchar(200) NOT NULL,
  `sdesc` text NOT NULL,
  `niulang` varchar(200) NOT NULL,
  `zhinv` varchar(200) NOT NULL,
  `bg` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `starttime` varchar(11) NOT NULL,
  `endtime` varchar(11) NOT NULL,
  `prize_mode` int(1) NOT NULL,
  `describe_limit` int(1) NOT NULL,
  `describe_limit2` int(1) DEFAULT '0',
  `prize_limit` int(11) NOT NULL,
  `birds_success` int(11) NOT NULL,
  `birds_limit` varchar(10) NOT NULL,
  `sharetitle` varchar(200) NOT NULL,
  `sharethumb` varchar(200) NOT NULL,
  `sharedesc` text NOT NULL,
  `isinfo` int(1) NOT NULL,
  `awardtips` varchar(200) NOT NULL,
  `isrealname` int(1) NOT NULL,
  `ismobile` int(1) NOT NULL,
  `isqq` int(1) NOT NULL,
  `isemail` int(1) NOT NULL,
  `isaddress` int(1) NOT NULL,
  `isfans` int(1) NOT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_junsion_qixiqueqiao_share;
CREATE TABLE `ims_junsion_qixiqueqiao_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `birds_num` int(11) NOT NULL,
  `createtime` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_coupons;
CREATE TABLE `ims_jy_coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `coupons` varchar(30) NOT NULL,
  `code` varchar(200) NOT NULL,
  `num` int(10) NOT NULL,
  `coupons_logo` varchar(200) NOT NULL,
  `coupons_pic` varchar(200) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_coupons_log;
CREATE TABLE `ims_jy_coupons_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `from_user` varchar(30) NOT NULL,
  `member_id` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `couponsid` int(10) NOT NULL,
  `status` int(2) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_coupons_member;
CREATE TABLE `ims_jy_coupons_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `from_user` varchar(30) NOT NULL,
  `uid` int(10) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_coupons_setting;
CREATE TABLE `ims_jy_coupons_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `aname` varchar(250) NOT NULL,
  `url` varchar(200) NOT NULL,
  `rule` text,
  `rule_bg` varchar(200) NOT NULL,
  `index_text` varchar(200) NOT NULL,
  `index1` varchar(200) NOT NULL,
  `index2` varchar(200) NOT NULL,
  `index3` varchar(200) NOT NULL,
  `index_bg` varchar(200) NOT NULL,
  `huodong1` varchar(200) NOT NULL,
  `huodong2` varchar(200) NOT NULL,
  `huodong3` varchar(200) NOT NULL,
  `huodong_bg` varchar(200) NOT NULL,
  `share_bg` varchar(200) NOT NULL,
  `friend` varchar(200) NOT NULL,
  `friend_bg` varchar(200) NOT NULL,
  `share_title` varchar(200) NOT NULL,
  `share_desc` varchar(200) NOT NULL,
  `share_logo` varchar(200) NOT NULL,
  `api_ticket` varchar(200) NOT NULL,
  `api_time` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_wei_company;
CREATE TABLE `ims_jy_wei_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '公司URL',
  `title` varchar(255) NOT NULL COMMENT '网站title',
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `shortname` varchar(255) NOT NULL COMMENT '公司名称简写',
  `banner` varchar(255) NOT NULL COMMENT 'Banner',
  `logo` varchar(255) NOT NULL COMMENT 'Logo',
  `propagenda` varchar(255) NOT NULL COMMENT '一句话公司宣传语',
  `description` varchar(255) NOT NULL COMMENT '简介',
  `shareimage` varchar(255) NOT NULL COMMENT '分享图片',
  `sharetitle` varchar(255) NOT NULL COMMENT '分享标题',
  `sharedescription` varchar(255) NOT NULL COMMENT '分享描述',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_wei_invitation;
CREATE TABLE `ims_jy_wei_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `companyid` int(11) unsigned NOT NULL,
  `positionid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `phone` varchar(255) NOT NULL COMMENT '手机',
  `payment` varchar(255) NOT NULL COMMENT '薪酬',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_wei_keyword;
CREATE TABLE `ims_jy_wei_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `companyid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL COMMENT '关键字',
  `unicode` varchar(255) NOT NULL COMMENT '唯一码MD5(name)',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_wei_label;
CREATE TABLE `ims_jy_wei_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `companyid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL COMMENT '标签',
  `unicode` varchar(255) NOT NULL COMMENT '唯一码MD5(name)',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_wei_log;
CREATE TABLE `ims_jy_wei_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `companyid` int(11) unsigned NOT NULL,
  `positionid` int(11) unsigned NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_wei_position;
CREATE TABLE `ims_jy_wei_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `companyid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL COMMENT '职位',
  `payment` varchar(255) NOT NULL COMMENT '薪酬',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `count` int(11) NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_jy_wei_rule;
CREATE TABLE `ims_jy_wei_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `ruleid` int(11) NOT NULL,
  `uniacid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lee_tlvoice_record;
CREATE TABLE `ims_lee_tlvoice_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyid` varchar(40) NOT NULL DEFAULT '',
  `timelength` varchar(20) NOT NULL DEFAULT '',
  `serverid` varchar(500) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lions_zq_billboard;
CREATE TABLE `ims_lions_zq_billboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `score` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='月球来的月饼';



DROP TABLE IF EXISTS ims_lions_zq_settings;
CREATE TABLE `ims_lions_zq_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='月球来的月饼';



DROP TABLE IF EXISTS ims_lonaking_activity_activity;
CREATE TABLE `ims_lonaking_activity_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `name` varchar(255) DEFAULT '' COMMENT '活动标题',
  `admin_name` varchar(255) DEFAULT '' COMMENT '发布人姓名',
  `admin_pic` varchar(255) DEFAULT '' COMMENT '发布人头像',
  `start` date DEFAULT NULL COMMENT '开始时间',
  `end` date DEFAULT NULL COMMENT '结束时间',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `enroll_stop` date DEFAULT NULL COMMENT '报名截止时间',
  `enroll_count` int(11) DEFAULT '0' COMMENT '报名人数',
  `enroll_limit` int(11) DEFAULT '0' COMMENT '限制报名人数',
  `content` text COMMENT '活动介绍',
  `click` int(11) DEFAULT '0' COMMENT '点击次数',
  `share` int(11) DEFAULT '0' COMMENT '分享次数',
  `share_logo` varchar(255) DEFAULT '' COMMENT '分享logo',
  `share_title` varchar(100) DEFAULT '' COMMENT '分享标题',
  `share_description` varchar(255) DEFAULT '' COMMENT '分享内容',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lonaking_activity_enroll;
CREATE TABLE `ims_lonaking_activity_enroll` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `order_num` varchar(255) DEFAULT '' COMMENT '订单号',
  `openid` varchar(255) DEFAULT '' COMMENT 'openid',
  `pic` varchar(255) DEFAULT '' COMMENT '头像',
  `uid` int(11) DEFAULT NULL COMMENT '微擎uid',
  `name` varchar(255) DEFAULT '' COMMENT '姓名',
  `mobile` varchar(11) DEFAULT '' COMMENT '电话',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 报名 1已经核销 2取消报名',
  `verificate_time` timestamp NULL DEFAULT NULL COMMENT '验证时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lonaking_bb_relation;
CREATE TABLE `ims_lonaking_bb_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `openid_o` varchar(100) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lonaking_bb_tag_config;
CREATE TABLE `ims_lonaking_bb_tag_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lonaking_bb_tags;
CREATE TABLE `ims_lonaking_bb_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `fanid` int(11) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL COMMENT '标签内容',
  `buzy` tinyint(1) DEFAULT '0' COMMENT '0  闲置 1忙碌',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lonaking_fishjoy_player;
CREATE TABLE `ims_lonaking_fishjoy_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `token` varchar(225) DEFAULT '' COMMENT 'token',
  `openid` varchar(128) DEFAULT NULL COMMENT 'openid',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `uid` int(11) DEFAULT NULL COMMENT '粉丝id',
  `play_times` int(11) DEFAULT '0' COMMENT '游戏总次数',
  `total_score` int(11) DEFAULT '0' COMMENT '总得分',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '游戏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lonaking_fishjoy_record;
CREATE TABLE `ims_lonaking_fishjoy_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `player_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '玩家uid',
  `openid` varchar(255) DEFAULT '' COMMENT '玩家openid',
  `nickname` varchar(30) DEFAULT '' COMMENT '昵称',
  `score` int(10) DEFAULT '0' COMMENT '得分',
  `play_time` int(11) DEFAULT '1' COMMENT '第几次游戏',
  `shared` tinyint(1) DEFAULT '0' COMMENT '是否分享了 0否 1是',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lovehelper_ip;
CREATE TABLE `ims_lovehelper_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientip` varchar(30) NOT NULL,
  `identity` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lovehelper_msg;
CREATE TABLE `ims_lovehelper_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `fromuser` varchar(50) NOT NULL,
  `bgimage` varchar(200) NOT NULL,
  `viewcount` int(11) NOT NULL DEFAULT '1',
  `forward` int(11) NOT NULL,
  `praise` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lovehelper_res;
CREATE TABLE `ims_lovehelper_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1:music 2:image',
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lw_comments;
CREATE TABLE `ims_lw_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL,
  `toUser` varchar(50) NOT NULL,
  `content` varchar(300) NOT NULL DEFAULT '',
  `createtime` varchar(100) NOT NULL,
  `nowColor` varchar(50) NOT NULL,
  `limit` tinyint(2) NOT NULL DEFAULT '0',
  `isok` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lw_commentslike;
CREATE TABLE `ims_lw_commentslike` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `swnoId` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `createtime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lw_fans;
CREATE TABLE `ims_lw_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `headimgurl` varchar(300) NOT NULL DEFAULT '',
  `createtime` varchar(100) NOT NULL,
  `isblack` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lw_report;
CREATE TABLE `ims_lw_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `swnoId` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `reporter` varchar(50) NOT NULL,
  `createtime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lxy_buildpro_album;
CREATE TABLE `ims_lxy_buildpro_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '相册名称',
  `subtitle` varchar(255) DEFAULT NULL,
  `hid` int(11) DEFAULT NULL COMMENT '楼盘id ims_lxy_buildpro_set table id',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序',
  `jianjie` text,
  `pic` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='楼盘相册';



DROP TABLE IF EXISTS ims_lxy_buildpro_bill;
CREATE TABLE `ims_lxy_buildpro_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT NULL,
  `weid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `pic1` varchar(255) DEFAULT NULL,
  `pic2` varchar(255) DEFAULT NULL,
  `pic3` varchar(255) DEFAULT NULL,
  `pic4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='楼盘海报';



DROP TABLE IF EXISTS ims_lxy_buildpro_expert_comment;
CREATE TABLE `ims_lxy_buildpro_expert_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT NULL,
  `weid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `expert_name` varchar(20) DEFAULT NULL,
  `zhiwei` varchar(255) DEFAULT NULL COMMENT '专家职位',
  `sort` tinyint(4) unsigned DEFAULT NULL COMMENT '排序',
  `jianjie` text,
  `content` text COMMENT '点评内容',
  `thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='楼盘-专家点评';



DROP TABLE IF EXISTS ims_lxy_buildpro_fell;
CREATE TABLE `ims_lxy_buildpro_fell` (
  `yid` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `hid` int(11) DEFAULT NULL COMMENT '楼盘id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序',
  `yinxiang_number` int(11) unsigned DEFAULT '0' COMMENT '印象数',
  `isshow` tinyint(1) DEFAULT '1',
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`yid`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='房友印象';



DROP TABLE IF EXISTS ims_lxy_buildpro_fell_record;
CREATE TABLE `ims_lxy_buildpro_fell_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT NULL,
  `weid` int(11) DEFAULT NULL,
  `fromuser` varchar(255) DEFAULT NULL COMMENT '楼盘id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='房友印象';



DROP TABLE IF EXISTS ims_lxy_buildpro_full_view;
CREATE TABLE `ims_lxy_buildpro_full_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `hsid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `quanjinglink` varchar(500) DEFAULT NULL COMMENT '全景外链',
  `pic_qian` varchar(1023) DEFAULT NULL,
  `pic_hou` varchar(1023) DEFAULT NULL,
  `pic_zuo` varchar(1023) DEFAULT NULL,
  `pic_you` varchar(1023) DEFAULT NULL,
  `pic_shang` varchar(1023) DEFAULT NULL,
  `pic_xia` varchar(1023) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='楼盘户型全景';



DROP TABLE IF EXISTS ims_lxy_buildpro_head;
CREATE TABLE `ims_lxy_buildpro_head` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `xcname` varchar(255) DEFAULT NULL,
  `headpic` varchar(255) DEFAULT NULL,
  `apartpic` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `dist` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `jw_addr` varchar(255) DEFAULT NULL,
  `lng` varchar(12) DEFAULT '116.403694',
  `lat` varchar(12) DEFAULT '39.916042',
  `jianjie` text,
  `xiangmu` text,
  `jiaotong` text,
  `addr` varchar(255) DEFAULT NULL,
  `yyurl` varchar(500) DEFAULT NULL,
  `xwurl` varchar(500) DEFAULT NULL,
  `hyurl` varchar(500) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `lxname` varchar(50) DEFAULT NULL,
  `hyname` varchar(50) DEFAULT NULL,
  `yyname` varchar(50) DEFAULT NULL,
  `xwname` varchar(50) DEFAULT NULL,
  `yxname` varchar(50) DEFAULT NULL,
  `hxname` varchar(50) DEFAULT NULL,
  `jjname` varchar(50) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='楼盘简介';



DROP TABLE IF EXISTS ims_lxy_buildpro_house;
CREATE TABLE `ims_lxy_buildpro_house` (
  `hsid` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT NULL,
  `weid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '户型名称',
  `sid` int(11) DEFAULT NULL COMMENT '子楼盘 ims_lxy_buildpro_set id',
  `louceng` smallint(1) DEFAULT NULL COMMENT '楼层',
  `mianji` varchar(255) DEFAULT NULL COMMENT '建筑面积',
  `fang` tinyint(4) DEFAULT NULL,
  `ting` tinyint(4) DEFAULT NULL,
  `sort` tinyint(4) unsigned DEFAULT NULL COMMENT '排序',
  `jianjie` text,
  `pic` text,
  `picjson` text,
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`hsid`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='楼盘户型';



DROP TABLE IF EXISTS ims_lxy_buildpro_reply;
CREATE TABLE `ims_lxy_buildpro_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `hid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lxy_buildpro_sub;
CREATE TABLE `ims_lxy_buildpro_sub` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `hid` int(11) DEFAULT NULL COMMENT '楼盘id',
  `title` varchar(255) DEFAULT NULL COMMENT '子楼盘名称',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序',
  `jianjie` text,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='子楼盘';



DROP TABLE IF EXISTS ims_lxy_marry_info;
CREATE TABLE `ims_lxy_marry_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `weid` bigint(20) unsigned DEFAULT NULL,
  `fromuser` varchar(32) DEFAULT NULL,
  `sid` bigint(20) unsigned DEFAULT NULL COMMENT 'micro_xitie_set id',
  `name` varchar(25) DEFAULT NULL,
  `tel` varchar(25) DEFAULT NULL,
  `rs` smallint(1) DEFAULT NULL COMMENT '赴宴人数',
  `zhufu` varchar(255) DEFAULT NULL COMMENT '收到祝福',
  `ctime` datetime DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1:赴宴 2：祝福',
  PRIMARY KEY (`id`),
  KEY `idx_sid_openid` (`sid`,`fromuser`),
  KEY `idx_sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微喜帖信息列表';



DROP TABLE IF EXISTS ims_lxy_marry_list;
CREATE TABLE `ims_lxy_marry_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `art_pic` varchar(255) DEFAULT NULL,
  `bg_pic` varchar(255) NOT NULL COMMENT '背景图片',
  `donghua_pic` varchar(255) DEFAULT NULL,
  `suolue_pic` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `xl_name` varchar(255) DEFAULT NULL,
  `xn_name` varchar(255) DEFAULT NULL,
  `is_front` varchar(255) DEFAULT '1' COMMENT '1:新郎名字在前 2:新娘名字在前',
  `tel` varchar(25) DEFAULT NULL,
  `hy_time` datetime DEFAULT NULL COMMENT '婚宴日期',
  `dist` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `hy_addr` varchar(255) DEFAULT NULL COMMENT '婚宴地址',
  `jw_addr` varchar(255) DEFAULT NULL COMMENT '经纬地址',
  `lng` varchar(12) DEFAULT '116.403694',
  `lat` varchar(12) DEFAULT '39.916042',
  `video` varchar(255) DEFAULT '/res/weiXiTie/mp4.mp4',
  `music` varchar(255) DEFAULT '/res/weiXiTie/youGotMe.mp3',
  `hs_pic` text COMMENT '婚纱图片',
  `pwd` varchar(255) DEFAULT NULL,
  `word` varchar(500) DEFAULT NULL,
  `erweima_pic` varchar(255) DEFAULT NULL COMMENT '二维码图片',
  `copyright` varchar(512) DEFAULT NULL COMMENT '版权',
  `createtime` int(11) unsigned DEFAULT NULL,
  `sendtitle` varchar(255) NOT NULL DEFAULT '',
  `senddescription` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微喜帖设置';



DROP TABLE IF EXISTS ims_lxy_marry_reply;
CREATE TABLE `ims_lxy_marry_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `marryid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lxy_rtrouter_authentication;
CREATE TABLE `ims_lxy_rtrouter_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `routerid` int(11) DEFAULT NULL,
  `fromuser` varchar(100) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `resultmemo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lxy_rtrouter_info;
CREATE TABLE `ims_lxy_rtrouter_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `iurl` varchar(255) DEFAULT NULL,
  `rname` varchar(100) DEFAULT NULL,
  `appid` varchar(100) DEFAULT NULL,
  `appkey` varchar(100) DEFAULT NULL,
  `nodeid` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_lxy_rtrouter_reply;
CREATE TABLE `ims_lxy_rtrouter_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `oktip` varchar(255) NOT NULL COMMENT '规则标题',
  `routerid` int(10) unsigned NOT NULL COMMENT '名片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开关状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbrp_activities;
CREATE TABLE `ims_mbrp_activities` (
  `actid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '活动名称',
  `start` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end` int(10) unsigned NOT NULL COMMENT '结束时间',
  `rules` text NOT NULL COMMENT '活动规则介绍',
  `guide` varchar(255) NOT NULL COMMENT '活动指南(图文素材地址)',
  `banner` varchar(500) NOT NULL COMMENT '背景图片',
  `type` varchar(10) NOT NULL COMMENT '活动类型(direct, shared)',
  `limit` varchar(1000) NOT NULL DEFAULT '',
  `share` varchar(1000) NOT NULL DEFAULT '',
  `tag` text NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`actid`),
  KEY `type` (`type`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbrp_activity_gifts;
CREATE TABLE `ims_mbrp_activity_gifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity` int(10) unsigned NOT NULL,
  `gift` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `rate` decimal(6,2) NOT NULL COMMENT '中奖百分比率',
  PRIMARY KEY (`id`),
  KEY `activity` (`activity`),
  KEY `gift` (`gift`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbrp_fans;
CREATE TABLE `ims_mbrp_fans` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `proxy` varchar(40) NOT NULL DEFAULT '',
  `unionid` varchar(40) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `gender` varchar(2) DEFAULT '',
  `state` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(20) NOT NULL DEFAULT '',
  `avatar` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `uniacid` (`uniacid`),
  KEY `openid` (`openid`),
  KEY `proxy` (`proxy`),
  KEY `nickname` (`nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbrp_gifts;
CREATE TABLE `ims_mbrp_gifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'cash - 现金红包, coupon - 券类',
  `tag` text NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbrp_helps;
CREATE TABLE `ims_mbrp_helps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `activity` int(10) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `helper` int(10) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity` (`activity`),
  KEY `uniacid` (`uniacid`),
  KEY `owner` (`owner`),
  KEY `helper` (`helper`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbrp_profiles;
CREATE TABLE `ims_mbrp_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(10) NOT NULL,
  `title` varchar(20) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbrp_records;
CREATE TABLE `ims_mbrp_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `activity` int(10) unsigned NOT NULL,
  `gift` int(10) unsigned NOT NULL,
  `fee` varchar(20) NOT NULL DEFAULT '',
  `log` varchar(500) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `completed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `activity` (`activity`),
  KEY `gift` (`gift`),
  KEY `log` (`log`(333)),
  KEY `uniacid` (`uniacid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbrp_trades;
CREATE TABLE `ims_mbrp_trades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `activity` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `item` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `paid` int(10) unsigned NOT NULL,
  `completed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `activity` (`activity`),
  KEY `uid` (`uid`),
  KEY `item` (`item`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbsk_activities;
CREATE TABLE `ims_mbsk_activities` (
  `actid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '活动名称',
  `start` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end` int(10) unsigned NOT NULL COMMENT '结束时间',
  `rules` text NOT NULL COMMENT '活动规则介绍',
  `guide` varchar(255) NOT NULL COMMENT '活动指南(图文素材地址)',
  `sorry` varchar(500) NOT NULL DEFAULT '',
  `banner` varchar(500) NOT NULL COMMENT '背景图片',
  `type` varchar(10) NOT NULL COMMENT '活动类型(direct, shared)',
  `tag` text NOT NULL,
  `limit` varchar(1000) NOT NULL DEFAULT '',
  `share` varchar(1000) NOT NULL DEFAULT '',
  `shake` varchar(1000) NOT NULL,
  `page` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`actid`),
  KEY `type` (`type`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbsk_activity_gifts;
CREATE TABLE `ims_mbsk_activity_gifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity` int(10) unsigned NOT NULL,
  `gift` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `rate` decimal(6,2) NOT NULL COMMENT '中奖百分比率',
  PRIMARY KEY (`id`),
  KEY `activity` (`activity`),
  KEY `gift` (`gift`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbsk_devices;
CREATE TABLE `ims_mbsk_devices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `activity` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL,
  `device_id` int(10) unsigned NOT NULL,
  `uuid` varchar(50) NOT NULL,
  `major` int(10) unsigned NOT NULL,
  `minor` int(10) unsigned NOT NULL,
  `audit_status` int(11) NOT NULL,
  `audit_comment` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: 未激活, 1:已激不活跃, 2: 活跃',
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`,`major`,`minor`),
  KEY `uniacid` (`uniacid`),
  KEY `device_id` (`device_id`),
  KEY `activity` (`activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbsk_fans;
CREATE TABLE `ims_mbsk_fans` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `proxy` varchar(40) NOT NULL DEFAULT '',
  `unionid` varchar(40) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `gender` varchar(2) DEFAULT '',
  `state` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(20) NOT NULL DEFAULT '',
  `avatar` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `uniacid` (`uniacid`),
  KEY `openid` (`openid`),
  KEY `proxy` (`proxy`),
  KEY `nickname` (`nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbsk_gifts;
CREATE TABLE `ims_mbsk_gifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'cash - 现金红包, coupon - 券类',
  `tag` text NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbsk_profiles;
CREATE TABLE `ims_mbsk_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(10) NOT NULL,
  `title` varchar(20) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbsk_records;
CREATE TABLE `ims_mbsk_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `activity` int(10) unsigned NOT NULL,
  `gift` int(10) unsigned NOT NULL,
  `fee` varchar(20) NOT NULL DEFAULT '',
  `log` varchar(500) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL,
  `device` int(10) unsigned NOT NULL DEFAULT '0',
  `distance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created` int(10) unsigned NOT NULL,
  `completed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `activity` (`activity`),
  KEY `gift` (`gift`),
  KEY `log` (`log`(333)),
  KEY `uniacid` (`uniacid`),
  KEY `status` (`status`),
  KEY `device` (`device`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mbwish_records;
CREATE TABLE `ims_mbwish_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL COMMENT '祝福创建者',
  `wish` varchar(500) NOT NULL COMMENT '祝福语录音',
  `views` int(10) unsigned NOT NULL COMMENT '浏览次数',
  `timecreated` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card;
CREATE TABLE `ims_mc_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT '',
  `background` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `format` varchar(50) NOT NULL DEFAULT '',
  `fields` varchar(1000) NOT NULL DEFAULT '',
  `snpos` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `business` text NOT NULL,
  `description` varchar(512) NOT NULL,
  `discount_type` tinyint(3) unsigned NOT NULL,
  `discount` varchar(3000) NOT NULL,
  `grant` varchar(200) NOT NULL,
  `grant_rate` int(10) unsigned NOT NULL,
  `nums_status` tinyint(3) unsigned NOT NULL,
  `nums_text` varchar(15) NOT NULL,
  `nums` varchar(1000) NOT NULL,
  `times_status` tinyint(3) unsigned NOT NULL,
  `times_text` varchar(15) NOT NULL,
  `times` varchar(1000) NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `offset_rate` int(10) unsigned NOT NULL,
  `offset_max` int(10) NOT NULL,
  `format_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `recommend_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sign_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card_care;
CREATE TABLE `ims_mc_card_care` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit2` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `granttime` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  `time` tinyint(3) unsigned NOT NULL,
  `show_in_card` tinyint(3) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  `sms_notice` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card_credit_set;
CREATE TABLE `ims_mc_card_credit_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `sign` varchar(1000) NOT NULL,
  `share` varchar(500) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card_members;
CREATE TABLE `ims_mc_card_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `cid` int(10) NOT NULL DEFAULT '0',
  `cardsn` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nums` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card_notices;
CREATE TABLE `ims_mc_card_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card_notices_unread;
CREATE TABLE `ims_mc_card_notices_unread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card_recommend;
CREATE TABLE `ims_mc_card_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card_record;
CREATE TABLE `ims_mc_card_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `tag` varchar(10) NOT NULL,
  `note` varchar(255) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_card_sign_record;
CREATE TABLE `ims_mc_card_sign_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `is_grant` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_cash_record;
CREATE TABLE `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_chats_record;
CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_credits_recharge;
CREATE TABLE `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  KEY `idx_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_credits_record;
CREATE TABLE `ims_mc_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL DEFAULT '',
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL DEFAULT '',
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_fans_groups;
CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_groups;
CREATE TABLE `ims_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(20) NOT NULL DEFAULT '',
  `orderlist` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `isdefault` tinyint(4) NOT NULL DEFAULT '0',
  `credit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO ims_mc_groups VALUES 
('1','1','默认会员组','0','1','0');


DROP TABLE IF EXISTS ims_mc_handsel;
CREATE TABLE `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`touid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_mapping_fans;
CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL,
  `salt` char(8) NOT NULL DEFAULT '',
  `follow` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  PRIMARY KEY (`fanid`),
  KEY `acid` (`acid`),
  KEY `uniacid` (`uniacid`),
  KEY `openid` (`openid`),
  KEY `updatetime` (`updatetime`),
  KEY `nickname` (`nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_mapping_ucenter;
CREATE TABLE `ims_mc_mapping_ucenter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `centeruid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_mass_record;
CREATE TABLE `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_member_address;
CREATE TABLE `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_member_fields;
CREATE TABLE `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_fieldid` (`fieldid`)
) ENGINE=MyISAM AUTO_INCREMENT=469 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_members;
CREATE TABLE `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `salt` varchar(8) NOT NULL DEFAULT '',
  `groupid` int(11) NOT NULL DEFAULT '0',
  `credit1` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `credit2` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `credit3` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `credit4` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `credit5` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `vip` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birthyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `birthmonth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `constellation` varchar(10) NOT NULL DEFAULT '',
  `zodiac` varchar(5) NOT NULL DEFAULT '',
  `telephone` varchar(15) NOT NULL DEFAULT '',
  `idcard` varchar(30) NOT NULL DEFAULT '',
  `studentid` varchar(50) NOT NULL DEFAULT '',
  `grade` varchar(10) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(10) NOT NULL DEFAULT '',
  `nationality` varchar(30) NOT NULL DEFAULT '',
  `resideprovince` varchar(30) NOT NULL DEFAULT '',
  `residecity` varchar(30) NOT NULL DEFAULT '',
  `residedist` varchar(30) NOT NULL DEFAULT '',
  `graduateschool` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(50) NOT NULL DEFAULT '',
  `education` varchar(10) NOT NULL DEFAULT '',
  `occupation` varchar(30) NOT NULL DEFAULT '',
  `position` varchar(30) NOT NULL DEFAULT '',
  `revenue` varchar(10) NOT NULL DEFAULT '',
  `affectivestatus` varchar(30) NOT NULL DEFAULT '',
  `lookingfor` varchar(255) NOT NULL DEFAULT '',
  `bloodtype` varchar(5) NOT NULL DEFAULT '',
  `height` varchar(5) NOT NULL DEFAULT '',
  `weight` varchar(5) NOT NULL DEFAULT '',
  `alipay` varchar(30) NOT NULL DEFAULT '',
  `msn` varchar(30) NOT NULL DEFAULT '',
  `taobao` varchar(30) NOT NULL DEFAULT '',
  `site` varchar(30) NOT NULL DEFAULT '',
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mc_oauth_fans;
CREATE TABLE `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_adv;
CREATE TABLE `ims_meepo_bbs_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `typeid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`),
  KEY `uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_api;
CREATE TABLE `ims_meepo_bbs_api` (
  `id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(132) NOT NULL DEFAULT '',
  `file` varchar(132) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_begging;
CREATE TABLE `ims_meepo_bbs_begging` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` varchar(64) NOT NULL DEFAULT '',
  `fid` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `fopenid` varchar(42) NOT NULL DEFAULT '',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `fee` float(6,2) unsigned NOT NULL DEFAULT '0.00',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `transid` varchar(32) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `thumb` text NOT NULL,
  `ttid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_blacklist;
CREATE TABLE `ims_meepo_bbs_blacklist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_credit_goods;
CREATE TABLE `ims_meepo_bbs_credit_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `deadline` datetime NOT NULL,
  `per_user_limit` int(11) NOT NULL DEFAULT '0',
  `cost` int(11) NOT NULL DEFAULT '0',
  `cost_type` int(11) NOT NULL DEFAULT '1' COMMENT '1系统积分 2会员积分 4,8等留作扩展',
  `price` int(11) NOT NULL DEFAULT '100',
  `content` text NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_credit_request;
CREATE TABLE `ims_meepo_bbs_credit_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `realname` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `residedist` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_ec_chong_log;
CREATE TABLE `ims_meepo_bbs_ec_chong_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `fee` float unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `num` float unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `transid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_home_message;
CREATE TABLE `ims_meepo_bbs_home_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fromopenid` varchar(50) NOT NULL DEFAULT '',
  `toopenid` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fromopenid` (`fromopenid`) USING BTREE,
  KEY `toopenid` (`toopenid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14111 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_log;
CREATE TABLE `ims_meepo_bbs_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(42) NOT NULL DEFAULT '',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `log` text NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_msg_template;
CREATE TABLE `ims_meepo_bbs_msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模板标题',
  `tpl_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模板id',
  `template` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模板内容',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模板标签',
  `set` text NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_msg_template_data;
CREATE TABLE `ims_meepo_bbs_msg_template_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(52) NOT NULL DEFAULT '',
  `set` text NOT NULL,
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `tpl_id` varchar(124) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_navs;
CREATE TABLE `ims_meepo_bbs_navs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(132) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `link` varchar(132) NOT NULL DEFAULT '',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `displayorder` int(11) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_o2o_user;
CREATE TABLE `ims_meepo_bbs_o2o_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `shopid` int(11) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `set` text NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `acid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_o2o_user_log;
CREATE TABLE `ims_meepo_bbs_o2o_user_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_reply_ups;
CREATE TABLE `ims_meepo_bbs_reply_ups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `caretetime` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_rss;
CREATE TABLE `ims_meepo_bbs_rss` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(132) NOT NULL DEFAULT '',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `fid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_set;
CREATE TABLE `ims_meepo_bbs_set` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `set` text,
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_share;
CREATE TABLE `ims_meepo_bbs_share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `set` text NOT NULL,
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_task;
CREATE TABLE `ims_meepo_bbs_task` (
  `taskid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `image` varchar(150) NOT NULL DEFAULT '',
  `filename` varchar(50) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `nexttime` int(10) unsigned NOT NULL DEFAULT '0',
  `nexttype` varchar(20) NOT NULL DEFAULT '',
  `credit` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`taskid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_task_user;
CREATE TABLE `ims_meepo_bbs_task_user` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `taskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(6) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `isignore` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`taskid`),
  KEY `isignore` (`isignore`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_threadclass;
CREATE TABLE `ims_meepo_bbs_threadclass` (
  `typeid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayorder` int(11) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `moderators` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `group` varchar(132) DEFAULT NULL,
  `look_group` varchar(232) DEFAULT NULL,
  `post_group` varchar(232) DEFAULT NULL,
  `isgood` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`typeid`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `fid` (`fid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_topic;
CREATE TABLE `ims_meepo_bbs_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(132) DEFAULT NULL,
  `content` text,
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_topic_like;
CREATE TABLE `ims_meepo_bbs_topic_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `num` int(11) unsigned NOT NULL DEFAULT '0',
  `fid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`) USING BTREE,
  KEY `fid` (`fid`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=496 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS ims_meepo_bbs_topic_read;
CREATE TABLE `ims_meepo_bbs_topic_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `num` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17240 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_topic_replie;
CREATE TABLE `ims_meepo_bbs_topic_replie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `create_at` int(11) unsigned NOT NULL DEFAULT '0',
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `thumb` text NOT NULL,
  `fid` int(11) unsigned NOT NULL DEFAULT '0',
  `beggingid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_topic_share;
CREATE TABLE `ims_meepo_bbs_topic_share` (
  `id` int(11) NOT NULL,
  `openid` varchar(40) NOT NULL DEFAULT '',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `num` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_topics;
CREATE TABLE `ims_meepo_bbs_topics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(320) DEFAULT NULL,
  `tab` varchar(32) DEFAULT NULL,
  `last_reply_at` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `replycredit` int(11) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(150) DEFAULT NULL,
  `ratetimes` int(11) unsigned NOT NULL DEFAULT '0',
  `rate` int(11) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `content` text,
  `rnum` int(11) unsigned NOT NULL DEFAULT '0',
  `lnum` int(11) unsigned NOT NULL DEFAULT '0',
  `thumb` text,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=917 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_bbs_user;
CREATE TABLE `ims_meepo_bbs_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(42) NOT NULL DEFAULT '',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `online` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(32) NOT NULL DEFAULT '',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) unsigned NOT NULL DEFAULT '0',
  `acid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1168 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_common_setting;
CREATE TABLE `ims_meepo_common_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `module` varchar(200) NOT NULL,
  `pan_name` varchar(150) NOT NULL,
  `fans_num` int(11) NOT NULL,
  `time` int(10) NOT NULL,
  `credit1` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `set` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_danmu_data;
CREATE TABLE `ims_meepo_danmu_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(250) NOT NULL,
  `click` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_danmu_set;
CREATE TABLE `ims_meepo_danmu_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `logo` varchar(120) NOT NULL,
  `wx_name` varchar(80) NOT NULL,
  `wx_num` varchar(100) NOT NULL,
  `share_title` varchar(200) NOT NULL,
  `share_content` text NOT NULL,
  `share_img` varchar(420) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_fen_basic;
CREATE TABLE `ims_meepo_fen_basic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_fen_click;
CREATE TABLE `ims_meepo_fen_click` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` mediumint(8) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `openid` varchar(20) NOT NULL,
  `time` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `success` tinyint(2) NOT NULL,
  `father` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `father` (`father`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_fen_ip_log;
CREATE TABLE `ims_meepo_fen_ip_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uniacid` mediumint(8) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_fen_reply;
CREATE TABLE `ims_meepo_fen_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `old_basic_id` int(11) NOT NULL,
  `new_basic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_fen_set;
CREATE TABLE `ims_meepo_fen_set` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `pan_name` varchar(150) NOT NULL,
  `fans_num` int(11) NOT NULL,
  `couponid` int(5) NOT NULL,
  `set` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_fen_user;
CREATE TABLE `ims_meepo_fen_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `ecs_userid` int(11) unsigned NOT NULL,
  `father` int(11) unsigned NOT NULL,
  `couponid` int(11) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `father` (`father`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_hongnianglikes;
CREATE TABLE `ims_meepo_hongnianglikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `toopenid` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(12) NOT NULL,
  `weid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_hongniangonoff;
CREATE TABLE `ims_meepo_hongniangonoff` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `status` int(2) NOT NULL DEFAULT '1',
  `weid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_hongniangset;
CREATE TABLE `ims_meepo_hongniangset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_title` varchar(100) NOT NULL,
  `share_link` varchar(300) NOT NULL,
  `share_content` varchar(300) NOT NULL,
  `share_logo` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `headtitle` varchar(200) NOT NULL,
  `logo` varchar(60) NOT NULL,
  `weid` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `hnages` varchar(200) NOT NULL,
  `pay_height` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看身高消费积分',
  `pay_weight` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看体重消费积分',
  `pay_telephone` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看手机号码消费积分',
  `pay_carhouse` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看车房状态',
  `pay_Descrip` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看自我介绍',
  `pay_uitsOthers` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看理想的另一半',
  `pay_uheight` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看对象的身高',
  `pay_uage` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看对象的年龄',
  `pay_all` varchar(12) NOT NULL DEFAULT '0' COMMENT '查看所有',
  `pay_occupation` varchar(10) NOT NULL DEFAULT '0' COMMENT '查看职业',
  `pay_revenue` varchar(10) NOT NULL DEFAULT '0' COMMENT '查看月收入',
  `pay_qq` varchar(10) NOT NULL DEFAULT '0' COMMENT '查看qq',
  `pay_wechat` varchar(10) NOT NULL DEFAULT '0' COMMENT '查看微信',
  `pay_affectivestatus` varchar(10) NOT NULL DEFAULT '0' COMMENT '查看他的情感状态',
  `pay_lxxingzuo` varchar(10) NOT NULL DEFAULT '0' COMMENT '查看理想星座',
  `share_jifen` varchar(10) NOT NULL DEFAULT '0' COMMENT '分享奖励积分',
  `header_ads` varchar(100) NOT NULL COMMENT '前台广告',
  `header_adsurl` varchar(200) NOT NULL COMMENT '首页图片链接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_message_replace;
CREATE TABLE `ims_meepo_message_replace` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `time` int(10) NOT NULL,
  `replace` varchar(200) NOT NULL,
  `set` text,
  `pro` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_module;
CREATE TABLE `ims_meepo_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(32) NOT NULL DEFAULT '',
  `set` text NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_newvote;
CREATE TABLE `ims_meepo_newvote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `left_uid` int(11) unsigned NOT NULL,
  `right_uid` int(11) unsigned NOT NULL,
  `ip` varchar(80) NOT NULL,
  `time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6622 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_pai;
CREATE TABLE `ims_meepo_pai` (
  `pid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `vid` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `school` varchar(200) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `src_img` varchar(250) NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `sex` tinyint(2) unsigned NOT NULL DEFAULT '3',
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_pai_log;
CREATE TABLE `ims_meepo_pai_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `ip` varchar(80) NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14241 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_pai_report;
CREATE TABLE `ims_meepo_pai_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `ip` varchar(80) NOT NULL,
  `repoer_reason` tinyint(3) NOT NULL,
  `report_content` text NOT NULL,
  `contact` varchar(20) NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_pai_set;
CREATE TABLE `ims_meepo_pai_set` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `title` varchar(180) NOT NULL,
  `chongfu` tinyint(3) NOT NULL,
  `share_url` varchar(200) NOT NULL,
  `bao_name` varchar(150) NOT NULL,
  `shen_name` varchar(150) NOT NULL,
  `zhuban_url` varchar(100) DEFAULT NULL,
  `zhuban_title` varchar(32) DEFAULT NULL,
  `tuandui_url` varchar(100) DEFAULT NULL,
  `tuandui_title` varchar(32) DEFAULT NULL,
  `zanzhu_url` varchar(100) DEFAULT NULL,
  `zanzhu_title` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_sexy_set;
CREATE TABLE `ims_meepo_sexy_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `num` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepo_sms_news;
CREATE TABLE `ims_meepo_sms_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `news` varchar(10) NOT NULL DEFAULT '',
  `openid` varchar(200) NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepohn_baoyue;
CREATE TABLE `ims_meepohn_baoyue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `tid` varchar(20) NOT NULL DEFAULT '0' COMMENT '????',
  `openid` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `fee` int(10) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `paytype` varchar(20) NOT NULL,
  `transid` varchar(30) NOT NULL DEFAULT '0',
  `time` int(12) NOT NULL,
  `starttime` int(10) NOT NULL DEFAULT '0',
  `endtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepohn_tuijian;
CREATE TABLE `ims_meepohn_tuijian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `openid` varchar(200) NOT NULL DEFAULT '',
  `payment` int(10) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepohongniangphotos;
CREATE TABLE `ims_meepohongniangphotos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepomailattachment;
CREATE TABLE `ims_meepomailattachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `attachmentname` varchar(50) NOT NULL COMMENT '附件名称',
  `thumb` varchar(255) NOT NULL COMMENT '附件路径',
  `description` varchar(500) NOT NULL COMMENT '附件描述',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附加排序',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_meepoweixiangqin_slide;
CREATE TABLE `ims_meepoweixiangqin_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_menu_event;
CREATE TABLE `ims_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `picmd5` (`picmd5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_message_list;
CREATE TABLE `ims_message_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `weid` int(11) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `fid` int(11) DEFAULT '0',
  `isshow` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mobilenumber;
CREATE TABLE `ims_mobilenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateline` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_modules;
CREATE TABLE `ims_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '',
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL DEFAULT '0',
  `subscribes` varchar(500) NOT NULL DEFAULT '',
  `handles` varchar(500) NOT NULL DEFAULT '',
  `isrulefields` tinyint(1) NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `target` int(10) unsigned NOT NULL DEFAULT '0',
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  `issolution` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `idx_name` (`name`),
  KEY `idx_issystem` (`issystem`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

INSERT INTO ims_modules VALUES 
('1','basic','system','基本文字回复','1.0','和您进行简单对话','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.','Weizan Team','http://www.012wz.com/','0','','','1','1','0','0','','0'),
('2','news','system','基本混合图文回复','1.0','为你提供生动的图文资讯','一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.','Weizan Team','http://www.012wz.com/','0','','','1','1','0','0','','0'),
('3','music','system','基本音乐回复','1.0','提供语音、音乐等音频类回复','在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。','Weizan Team','http://www.012wz.com/','0','','','1','1','0','0','','0'),
('4','userapi','system','自定义接口回复','1.1','更方便的第三方接口设置','自定义接口又称第三方接口，可以让开发者更方便的接入微赞系统，高效的与微信公众平台进行对接整合。','Weizan Team','http://www.012wz.com/','0','','','1','1','0','0','','0'),
('5','recharge','system','会员中心充值模块','1.0','提供会员充值功能','','Weizan Team','http://www.012wz.com/','0','','','0','1','0','0','','0'),
('6','chats','system','发送客服消息','1.0','公众号可以在粉丝最后发送消息的48小时内无限制发送消息','','Weizan Team','http://www.012wz.com/','0','','','0','1','0','0','','0'),
('7','voice','system','基本语音回复','1.0','提供语音回复','在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。','Weizan Team','http://www.012wz.com/','0','','','1','1','0','0','','0'),
('9','images','system','基本图片回复','1.0','提供图片回复','在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。','Weizan Team','http://www.012wz.com/','0','','','1','1','0','0','','0'),
('10','video','system','基本视频回复','1.0','提供视频回复','在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。','Weizan Team','http://www.012wz.com/','0','','','1','1','0','0','','0'),
('8','custom','system','多客服转接','1.0.0','用来接入腾讯的多客服系统','','Weizan Team','http://bbs.012wz.com','0','a:0:{}','a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}','1','1','0','0','','0'),
('11','hx_pictorial','activity','微画报（微场景）','2.5','用一系列场景图片展示产品和服务','用一系列场景图片展示产品和服务','微赞科技','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('12','hx_lottery','activity','幸运大抽奖','1.7','幸运积分大抽奖','幸运积分大抽奖','微赞科技','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('13','meepo_pai','activity','全民自拍','3.8','全民自拍','全民自拍','meepo','http://bbs.012wz.com/','0','a:1:{i:0;s:4:\"text\";}','a:3:{i:0;s:5:\"image\";i:1;s:8:\"location\";i:2;s:4:\"text\";}','1','0','0','0','N;','0'),
('14','hx_express','services','扫码查快递','3.0','扫码查快递','扫描快递单条形码查询快递','微赞','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('15','hx_cards','activity','刮刮乐','4.3','刮刮乐积分大抽奖','刮刮乐积分大抽奖','微动力','','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('16','we7_business','services','周边商户','1.5','提供商家信息的添加、聚合及LBS的查询。','','012WZ.COM','http://bbs.b2ctui.com','1','a:0:{}','a:1:{i:0;s:8:\"location\";}','0','0','0','0','N;','0'),
('17','we7_album','business','微相册','4.0','展示一系列图片来介绍你的公众号','','012WZ.COM','http://www.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('18','wl_heka','activity','送贺卡','1.8','新年贺卡，生日贺卡，同窗贺卡','新年贺卡，生日贺卡，同窗贺卡','微赞 &amp; 012WZ.COM','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('19','lxy_rtrouter','other','微路由','0.8','微路由','支持RippleTek路由器接口实现微信与路由器之间的各项应用交互','微赞科技','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('20','superman_floor','activity','【超人】抢楼活动','4.2','增强粉丝的活跃度和互动性！','抢楼活动可以极大提高粉丝与公众号的互动，提升公众号的黏性。并可在极短时间范围内引爆公众号流量，通过设置抢楼奖品，吸引粉丝关注公众号，并可有效激发公众号上沉睡的粉丝，增加公众号活跃度，可有效提高公众号排名！','微赞','http://bbs.b2ctui.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('21','meepo_sexy','services','英雄联盟','2.9.5','英雄联盟','英雄联盟','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('22','weihaom_wb','wdlgame','踩白块','1.9','拆包装,踩虫子,抽老板耳光...无所不能','拆包装,踩虫子,抽老板耳光...无所不能','微赞','','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('23','meepo_danmu','services','联盟弹幕','1.0','联盟弹幕','联盟弹幕','meepo','http://bbs.012wz.com/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('24','we7_research','business','预约与调查','3.8','可以快速生成调查表单或则预约记录','','微动力','#','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('25','we7_survey','customer','调研','2.8','调研','调研描述','012WZ.COM','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('26','ewei_vote','activity','微投票','2.3','投票系统','图片、文字，单选，多选','微动力','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('27','hl_bbb','activity','摇骰子','2.2','趣味性赚点数功能','腻了大转盘刮刮卡么?来一起摇骰子吧!可周期性举行比赛,按点数排名,增加用户黏度','012WZ.COM','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('28','hl_dqq','wdlgame','打气球','2.6','砸蛋功能升级版','打气球送积分可以增强粉丝与公众号的互动、提升公众号的黏性，让你在短时间内迅速引爆人气。','微动力','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('29','hl_zzz','wdlgame','做粽子','2.5','瑞午节活动','每天系统默认给予10次（可以后台自定义），想要赶快做出XX，那就邀请好友来助威，让你的好友送你体力赚X吧','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('30','hx_alert','activity','弹死你','1.1','用一种TA无法拒绝的方式跟TA对话！定制“弹框整蛊”，发给好友，弹死TA！','用一种TA无法拒绝的方式跟TA对话！定制“弹框整蛊”，发给好友，弹死TA！','华轩科技','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('31','qmteam_zerobuy','activity','零元购','2.2','零元购','零元购闪亮上线，零元抽大奖，大牌低价秒，优惠享不停，动动手指，天天有新品、豪礼抽不停。提高关注度。','微赞','http://www.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('32','hx_dialect','activity','地方话听力版','3.3','方言听力版','方言听力版','华轩科技','http://bbs.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('33','we7_activity','activity','微活动','2.3','报名，议程，嘉宾！','报名，议程，嘉宾，地图导航，邮件提醒！','微赞','www.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('34','lxy_marry','activity','微喜帖','1.6','微喜帖','结婚喜帖发送，赴宴人员登记，新郎新娘结婚照展示，收集祝福语','012WZ.COM','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('35','meepo_nsign','activity','签到','3.2','签到','签到得积分','微赞','http://bbs.b2ctui.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('36','we7_car','business','微汽车','3.7','微汽车','微汽车','012wz.com','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('37','we7_shake','activity','摇一摇中奖','2.9','摇一摇中奖','摇一摇中奖','微动力','http://www.b2ctui.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('38','ewei_exam','business','微考试','3.3','微考试系统','考试系统,判断,单选,多选,用于培训机构及学校!','微动力','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('39','ewei_hotel','business','微酒店','4.8','酒店房间预定,单店版,多店版','酒店房间预定，单店版, 多店版，类似携程','ewei','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('40','fwei_moneyimport','services','会员余额导入','3.0','会员余额导入','将已有系统的会员余额导入到微信系统','微赞','http://bbs.012wz.com','0','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('41','stonefish_bigwheel','activity','幸运大转盘','3.5','幸运大转盘营销抽奖','幸运大转盘营销抽奖－参与会员，分享设置，奖品设置，获奖设置，兑奖设置！','微赞','http://www.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('42','scene_cube','activity','场景魔方','3.0','商业信息华丽展示，高级授权','商业信息华丽展示，高级授权','微动力','','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('43','qiyue_canvas','activity','画图分享','1.4','画图分享','用户画图，然后分享到朋友圈','微赞','','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('44','n1ce_picwether','services','图文天气','1.1','图文天气','图文天气','n1ce','http://blog.4yuan.cn','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('45','weisrc_audio','activity','音乐盒子','1.5','音乐盒子','音乐盒子','012WZ.COM','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('46','we7_wxwall','wdlshow','微信墙','1.9','可以实时同步显示现场参与者发送的微信','微信墙又称微信大屏幕，是在展会、音乐会、婚礼现场等场所展示特定主题微信的大屏幕，大屏幕上可以同步显示现场参与者发送的微信，使场内外观众能够第一时间传递和获取现场信息。','微动力','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('47','weisrc_pano','wdlshow','360全景展示','3.4','360全景展示','360全景展示','微动力','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('48','iwobanji_xcpage','activity','微站展示页','1.0','展示您的微站。','展示您的微站。','微赞','http://www.012wz.com/','0','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('49','ykbl_robot','customer','聊天机器人','2.9.5','调用图灵机器人','调用图灵机器人，能够在系统中锁定图灵机器人！方便用户操作','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('50','weisrc_invitative','activity','邀请函','2.4','邀请函','邀请函','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('51','we7_egg','activity','砸蛋','3.9','趣味性抽奖类营销功能','砸蛋抽奖可以增强粉丝与公众号的互动、提升公众号的黏性，让你在短时间内迅速引爆人气。','012WZ.COM','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('52','weisrc_clubbigwheel','activity','惩罚大转盘','1.1.2','惩罚大转盘','惩罚大转盘','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('53','eso_share','activity','分享达人','2.9.6','分享达人','分享达人是您的微信公众号运营的利器，是您涨粉和宣传最好的工具。','微动力','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('54','mon_house','business','微楼书','1.6','微房产','微房产！','bbs.b2ctui.com','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('55','hx_zhongchou','business','微众筹','3.3','为有梦想、有创意、有项目的朋友提供募资、投资、孵化、运营一站式综合众筹服务,协助您实现自己的创业梦想。','为有梦想、有创意、有项目的朋友提供募资、投资、孵化、运营一站式综合众筹服务,协助您实现自己的创业梦想。','微赞科技','http://www.012wz.com/','1','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('56','zam_weimails','activity','微信邮件','1.19','微信邮件,粉丝邮件订阅与发送','本模块旨在方便粉丝需求各种资料 公众号可通过提供便利 将必要资料发送至粉丝绑定邮箱内 支持翻页 支持各种类型的文件上传','微赞','http://bbs.012wz.com/','1','a:0:{}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"image\";}','1','0','0','0','N;','0'),
('57','ewei_comeon','activity','来吧来吧','2.6','分享集点，赢取加油卡，充值卡等系列活动','分享集点，赢取加油卡，充值卡等系列活动','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('58','stonefish_scratch','activity','幸运刮刮卡','2.4','幸运刮刮卡','幸运刮刮卡－可控参与粉丝刮卡抽奖！','微赞','http://www.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('59','hx_subscribe','activity','加粉神器','3.3','加粉神器','推荐其他用户关注，奖励积分','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('60','jeffh_vwifi','services','微WiFi','2.9.5','微WiFi','微WiFi','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('61','zam_findlx','business','找老乡','6.1','通过本模块可以快速找到老乡以及和老乡打招呼，通过平台进行聊天 等 功能','通过本模块可以快速找到老乡以及和老乡打招呼，通过平台进行聊天 等 功能','微赞','http://bbs.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('62','wkf_message','customer','留言墙','3.1','留言墙','窥探朋友私密的一面，看看朋友发表的秘密、八卦、爆料、真心话','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('63','eso_sale','business','分销系统','3.5','分销系统','分销系统','伊索科技','http://wx.ysuo.net/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('64','hx_voice','services','普通话在线考试','2.9.5','普通话在线考试','普通话在线考试','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('65','stonefish_luckynum','business','幸运数字','1.3','幸运数字','幸运数字','微赞','www.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('66','czt_zhuanfa','services','微信多平台接入','0.2','微信多平台接入','微信多平台接入','','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('67','thinkidea_secondmarket','activity','二手市场','3.3','二手市场','类似58、赶集发布二手信息的模块.后期将继续推出新版本，使其功能更强大','微赞','http://bbs.012wz.com','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('68','feng_duobao','business','一元夺宝','3.4','一元夺宝是一种全新的购物方式。','一云夺宝是一种全新的购物方式,是时尚、潮流的风向标,能满足个性、年轻消费者的购物需求','微赞','http://bbs.012wz.com','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('69','weisrc_businesscenter','business','微商圈','3.8','微商圈','微商圈','微赞','http://www.012wz.com','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('70','lxy_buildpro','business','微房产','3.1','微房产','供房产公司展示楼盘','微赞 QQ:800083075','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('71','microb_redpack','activity','商户现金红包','2.8','提供利用商户现金红包进行营销活动的功能','商户现金红包功能不同于市面上现有的红包功能. 用户领取后不需要提现, 打开后直接存入微信钱包零钱. <br>\n        主要功能使用 <mark>支持支付的认证服务号</mark>, 订阅号和未认证的服务号可以借用接口. <br>\n        也可以支持有赞等其他平台的营销活动','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('72','ewei_bonus','activity','合体红包','1.2','最火的模块，合体红包','最火的模块，合体红包','ewei','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('73','weisrc_truth','wdlshow','真心话','3.0','真心话','窥探朋友私密的一面，看看朋友发表的秘密、八卦、爆料、真心话','微动力','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('74','stonefish_chailihe','activity','幸运拆礼盒','2.7','幸运拆礼盒－领取礼盒分享给朋友，让朋友帮其拆礼盒，成功达到设置拆开礼盒的人数，则有机会得到设置的礼品！','幸运拆礼盒－通过关健词触发活动，或通过朋友分享的活动链接领取礼盒，分享给朋友或朋友圈，朋友点击打开页面，计入拆礼盒人数，当达到活动设置拆开礼盒的人数后，则有机会得到设置的礼品！概率得到礼品或成功拆开即可领取礼品！','微赞','bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('75','ewei_money','wdlgame','数钱数到手抽筋','1.1','疯狂划算, 数钱数到手抽筋','疯狂划算, 数钱数到手抽筋','微赞','bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('76','xfeng_community','business','微小区','5.7','微小区','微小区','微赞','www.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('77','jdg_luvwhispers','other','情话','0.6','情话','情话','微赞微信平台','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('78','stonefish_redenvelope','activity','全民抢红包','1.8','全民抢红包-营销吸粉工具','全民抢红包-结合商家活动可设置为抢红包和分红包，参与粉丝或邀请好友为其增加红包金额以及平分红包金额','微赞','http://www.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('79','czt_zwmm','activity','指纹密码','2.9.5','指纹密码','超好玩的情人节配对游戏！乐爆用户，实现不一样的爱情甜蜜！\', \'超好玩的情人节配对游戏！乐爆用户，实现不一样的爱情甜蜜','微动力','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('80','ewei_couplet','activity','对联猜猜','1.05','新年吸粉利器，邀请好友集对联赢大奖','新年吸粉利器，邀请好友集对联赢大奖','ewei','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('81','mon_sign','activity','积分签到','3.0','积分签到','积分签到!','微赞','http://bbs.012wz.com','0','a:2:{i:0;s:9:\"subscribe\";i:1;s:11:\"unsubscribe\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('82','qiyue_luckymoney','activity','拆红包','1.06','拆红包活动开始啦','拆红包活动开始啦','冯齐跃','http://fengqiyue.com/','1','a:3:{i:0;s:4:\"text\";i:1;s:5:\"click\";i:2;s:4:\"view\";}','a:2:{i:0;s:5:\"click\";i:1;s:4:\"text\";}','1','0','0','0','N;','0'),
('83','null_getvoice','services','提取录音','1.3','用手机录音，生成音频的下载链接','用手机录音，生成音频的下载链接','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('84','qiyue_qiuqian','activity','祈福签','1.3','新年祈福签','新年祈福签','冯齐跃','http://www.admin9.com/','1','a:3:{i:0;s:4:\"text\";i:1;s:5:\"click\";i:2;s:4:\"view\";}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"click\";}','0','0','0','0','N;','0'),
('85','thinkidea_rencai','business','微人才','3.0','微人才','微人才，求职招聘，招人才，找企业，就来微人才。手机端也能发招聘，手机端也能找工作','微赞','www.012wz.com','1','a:10:{i:0;s:4:\"text\";i:1;s:8:\"location\";i:2;s:4:\"link\";i:3;s:9:\"subscribe\";i:4;s:11:\"unsubscribe\";i:5;s:2:\"qr\";i:6;s:5:\"trace\";i:7;s:5:\"click\";i:8;s:4:\"view\";i:9;s:5:\"enter\";}','a:8:{i:0;s:8:\"location\";i:1;s:4:\"link\";i:2;s:9:\"subscribe\";i:3;s:2:\"qr\";i:4;s:5:\"trace\";i:5;s:5:\"click\";i:6;s:5:\"enter\";i:7;s:4:\"text\";}','1','0','0','0','N;','0'),
('86','czt_voice','activity','朋友圈发语音','1.2','朋友圈发语音','朋友圈发语音','','http://bbs.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('87','thinkidea_phonebook','business','电话本','1.4','电话本','','Thinkidea','http://bbs.Thinkidea.net/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('88','str_takeout','business','微外卖','3.0','微外卖','微外卖','微动力','http://bbs.012wz.com','0','a:0:{}','a:2:{i:0;s:8:\"location\";i:1;s:4:\"text\";}','0','0','0','0','N;','0'),
('89','weisrc_dish','business','微点餐','4.1','微点餐','微点餐','微动力','bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('90','eso_runman','activity','奔跑吧兄弟撕名牌','2.9.5','奔跑吧兄弟撕名牌','奔跑吧兄弟撕名牌','微动力','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('91','mon_weishare','activity','微助力','3.4','分享活动赢好礼','分享活动到朋友圈获取朋友的助力，即可获取相应礼品！','微动力','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('92','lee_tlvoice','services','朋友圈语音','1.3','朋友圈语音，可用于朋友圈发送语音。','朋友圈语音，可用于朋友圈发送语音。','微赞','','0','a:0:{}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"voice\";}','0','0','0','0','N;','0'),
('93','zombie_fighting','wdlgame','一战到底','2.8','一战到底','一战到底是一档形式新颖，趣味十足，在挑战中挖掘个性，又充满悬念的全新益智攻擂游戏','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('94','ju_read','business','集阅读','1.3','集阅读','集阅读','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('95','stonefish_planting','activity','种植乐园','1.6','种植乐园--粉丝领取种子，邀请朋友浇水，让种子长大参与抽奖','种植乐园--粉丝通过领取种子，邀请朋友浇水，让种子长大，长大过程中可根据邀请值参与抽奖','微赞','http://www.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('96','xhw_picvote','activity','图片投票','2.9','图片投票','图片投票','微赞','http://www.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('97','xhw_voice','activity','好声音','2.8','好声音','好声音','微赞','http://www.012wz.com','0','a:0:{}','a:2:{i:0;s:5:\"voice\";i:1;s:4:\"text\";}','1','0','0','0','N;','0'),
('98','xhw_face','activity','人脸识别','3.3','人脸识别','通过用户发来的头部照片，识别出性别，年龄等特征。（当然，会存在一定的误差，请挑选脸部清晰的照片上传','微赞','http://www.012wz.com','0','a:0:{}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"image\";}','0','0','0','0','N;','0'),
('99','super_securitycode','services','超级防伪码','3.6','超级防伪码','超级防伪码','微赞','http://bbs.012wz.com','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('100','top_news','business','头条新闻','1.3','头条新闻','头条新闻','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('101','amouse_house','business','微二手房','1.9','出租,求购，求租，出售新房，二手房，新楼盘发布','微房产，出租,求购，求租，出售新房，二手房，最新房产信息平台，可以出租,求购，求租，出售新房，二手房，新楼盘信息,本地时尚生活互动平台','微动力','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('102','mon_yjgz','other','一键关注','3.0','一键关注','一键关注!','微赞','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('103','amouse_article','business','精美图文','5.8','精美图文,官方微文章增加版，内置8套列表模板，很愉快的切换列表显示。可以完全兼容微文章,更好的展示公众号，图文里面可以包含音乐','精美图文,官方微文章增加版，内置8套列表模板，很愉快的切换列表显示。可以完全兼容微文章,更好的展示公众号，图文里面可以包含音乐.打通一键关注（此一键关注为我精美图文内置模块）与精美图文，现在文章上面可以推荐公众号了。让更多的人来关注，也可以很方便运维管理多个公众号，可以跟别人来交换公众号。\n精美图文内置12套列表页面模板，5套内容页。每个内容页都可以 放置要推荐的公众号，都可以后台设置背景音乐','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('104','jufeng_wcy','business','聚风微餐饮','1.8','聚风微餐饮','首个多店铺版微信订餐模块','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('105','mon_brand','activity','微品牌','1.8','品牌介绍，视频，幻灯片，产品！','品牌介绍，视频，幻灯片，产品！','微动力','bbs.b2ctui.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('106','lee_coreball','activity','Coreball','2.0','Coreball,一款热门休闲游戏。','Coreball,一款热门休闲游戏。','Cloudus Team','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('107','page_switch','business','微页面展示','1.0','本模块用于展示海报，公告，宣传等信息，需要实现批好图片！','本模块用于展示海报，公告，宣传等信息，需要事先批好图片！上传图片后，进入界面使用触摸事件进行切换图片','lizhangqu','http://bbs.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('108','mon_fool','activity','愚人整蛊红包','2.9.5','愚人整蛊红包','愚人整蛊红包','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('109','amouse_weicard','customer','微名片','1.8','微俱聚的微名片功能，用户提交自己的名片信息。生成一个名片二维码，扫描二维码可以保存到手机联系人中。','微俱聚的微名片功能，用户提交自己的名片信息。生成一个名片二维码，扫描二维码可以保存到手机联系人中。','微赞','012wz.com','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('110','ewei_dream','activity','梦想契约','1.4','梦想契约，与我共同见证梦想','梦想契约，与我共同见证梦想','ewei 狸小狐','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('111','ewei_shangshi','activity','敲钟上市','1.0','敲钟上市，娱乐模块','敲钟上市，娱乐模块','ewei','http://bbs.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('112','meepo_weixiangqin','business','微相亲','8.3','微相亲/红娘/有缘网/世纪佳缘','微相亲/红娘/有缘网/世纪佳缘','微赞','bbs.b2ctui.com','1','a:0:{}','a:3:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:8:\"location\";}','0','0','0','0','N;','0'),
('113','amouse_ecard','business','微E名片','1.5','千叶微名片，这不是简单的微名片。','千叶微名片，这不是简单的微名片，帮你快速结交朋友，建立人脉。生成一个名片二维码，扫描二维码可以保存到手机联系人中。','微赞','bbs.b2ctui.com','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('114','wdl_bigwheel','activity','大转盘','1.4.1','大转盘营销抽奖','大转盘营销抽奖','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('115','xwz_queue','business','微信排号','3.1','微信排号','微信排号系统','微赞','http://bbs.012wz.com/','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('116','meepo_begging','business','微乞丐','3.5','网络乞讨，朋友圈蹭钱，靠脸吃饭的时代已经到来，抓紧行动起来，让我们一起做---微乞丐！','网络乞讨，朋友圈蹭钱，靠脸吃饭的时代已经到来，抓紧行动起来，让我们一起做---微乞丐！','微赞','http://bbs.012wz.com/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','1','N;','0'),
('117','fm_photosvote','activity','女神投票','4.9','女神来了，－分享朋友拉朋友为你的女神投上一票吧！','女神来了，－分享朋友拉朋友为你的女神投上一票吧！','微赞','http://www.012wz.com/','1','a:3:{i:0;s:4:\"text\";i:1;s:9:\"subscribe\";i:2;s:11:\"unsubscribe\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('118','wdl_shopping','business','微商城','5.1','微商城','微商城','微动力','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('119','microb_shake','activity','周边摇一摇','2.7','提供利用iBeacon蓝牙设备进行现场营销活动的功能','周边摇一摇使用腾讯最新的摇一摇周边功能. 特别适合各种车站, 会场, 卖场等现场活动, 活动形式新颖, 可以迅速引爆现场.','微赞','www.012wz.com','0','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('120','feng_auction','business','微拍卖','3.5','微信拍卖,粉丝互动','微拍卖集限时拍卖购物、账户明细管理、余额充值提现等功能一身，微拍卖可以用于任何有商品出售的平台，如家电、汽车、数码或绝大部分实体商户','微动力','http://bbs.012wz.com','1','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('121','hl_periarthritis','activity','肩周炎','1.4','狂撸吧，翻滚吧，是时候治一下肩周炎了','天天坐在电脑前盼0.6,盼的肩周炎都来了;有病就得治,是时候治一下肩周炎了!','微动力','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('122','wdl_hchighguess','activity','我画你猜高级版','1.0','我画你猜高级版','我画你猜高级版','微赞科技','http://www.012wz.com','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('123','feng_fightgroups','activity','微拼团','3.5','拼团','设计风格一如既往的简约而不简单，拼团即是拼凑起来团购。玩法新颖独特，由队长发起团购，分享给自己的小伙伴，拉来一定数目的小伙伴一起以优惠价格来购买所需产品','微赞','http://bbs.012wz.com/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('124','demo_pia3','activity','啪啪啪','0.1','小游戏而已','小游戏而已','On3','http://bbs.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('125','weisrc_dragonboat','activity','龙舟大赛','1.1','龙舟大赛','龙舟大赛','微赞科技','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('126','mon_orderform','activity','通用预约订单','1.4','通用预约订单','通用预约订单','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('127','water_query','other','单号查询O2O','1.2','配合超级店的单号查询','单号查询','微赞','http://www.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('128','mx_ssgz','wdlgame','手撕鬼子','0.2','纪念抗日战争胜利70周年','纪念抗日战争胜利70周年','新乡微创网络','http://www.012wz.com/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('129','feng_recharge','services','拼团余额充值','2.1','拼团余额充值','拼团余额充值','微赞','http://bbs.012wz.com/','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','1','N;','0'),
('130','jdg_dream','services','为梦想举杯','0.3','为梦想举杯','给自己或他人许愿祝福\', \'给自己或他人许愿祝福','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('131','zh_zhibo','wdlshow','微信电视直播','1.0','微信电视直播','微信电视直播','瘦干干','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('132','yx_mishi','activity','秘室逃离','1.2','以关卡为基础的解谜类游戏','以关卡为基础的解谜类游戏，玩家受困于游戏中的一个个房间，只有找到打开门的方法才能顺利脱身。','瘦干干','http://bbs.012wz.com/','0','a:6:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:9:\"subscribe\";i:3;s:11:\"unsubscribe\";i:4;s:5:\"click\";i:5;s:4:\"view\";}','a:4:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:9:\"subscribe\";i:3;s:5:\"click\";}','0','0','0','0','N;','0'),
('133','yx_stock','activity','炒股票','1.2','在股票中赚钱到流血，在这里来找回面子吧...','在股票中赚钱到流血，在这里来找回面子吧...','瘦干干','http://bbs.012wz.com/','0','a:5:{i:0;s:4:\"text\";i:1;s:9:\"subscribe\";i:2;s:11:\"unsubscribe\";i:3;s:5:\"click\";i:4;s:4:\"view\";}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"click\";}','0','0','0','0','N;','0'),
('134','francin_lovehelper','activity','帮TA传情(小情书)','1.2','帮TA传情','帮助暗恋者传递表白语，关注后可以生成自己的传播语，也可以结合一些线上线下的活动，与粉丝互动，从而吸引粉丝','米兔天空','http://www.bmitu.com/','0','a:15:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:11:\"unsubscribe\";i:9;s:2:\"qr\";i:10;s:5:\"trace\";i:11;s:5:\"click\";i:12;s:4:\"view\";i:13;s:5:\"enter\";i:14;s:14:\"merchant_order\";}','a:13:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:2:\"qr\";i:9;s:5:\"trace\";i:10;s:5:\"click\";i:11;s:5:\"enter\";i:12;s:14:\"merchant_order\";}','0','0','0','0','N;','0'),
('135','bobo_love','activity','七夕我爱你','1.3','七夕我爱你','七夕我爱你','米兔天空','http://www.012wz.com/','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('136','hc_zqttt','wdlgame','萌萌跳跳兔','1.3','不断划线制造跳台，像嫦娥冲刺吧！','不断划线制造跳台，像嫦娥冲刺吧！','新乡微创网络','http://bbs.012wz.com/','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('137','voldemort_moon','wdlgame','嫦娥爱色兔','1.1','游戏，嫦娥爱色兔','营销游戏，嫦娥爱色兔，游戏资源来源于网络','新乡微创网络','http://bbs.012wz.com/','0','a:7:{i:0;s:4:\"text\";i:1;s:5:\"video\";i:2;s:9:\"subscribe\";i:3;s:11:\"unsubscribe\";i:4;s:2:\"qr\";i:5;s:5:\"click\";i:6;s:4:\"view\";}','a:4:{i:0;s:4:\"text\";i:1;s:9:\"subscribe\";i:2;s:2:\"qr\";i:3;s:5:\"click\";}','0','0','0','0','N;','0'),
('138','mon_egg','activity','炫酷砸金蛋','1.6','炫酷微每天砸金蛋','炫酷微每天砸金蛋','微赞科技','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('139','n1ce_love','customer','暖心电话','1.2','暖心的电话，让情侣多珍惜自己的另一半。','暖心的电话，让情侣多珍惜自己的另一半。','微赞','http://bbs.012wz.com/','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('140','meepo_fen','other','关注有礼','3.9','关注有礼,粉丝营销从第一次关注开始,第一印象非常重要,本模块采用最新的变量定义方案，方便运营者灵活定义欢迎语','关注有礼,粉丝营销从第一次关注开始,第一印象非常重要,本模块采用最新的变量定义方案，方便运营者灵活定义欢迎语','微赞','http://bbs.012wz.com/','1','a:1:{i:0;s:4:\"text\";}','a:2:{i:0;s:9:\"subscribe\";i:1;s:4:\"text\";}','0','0','0','0','N;','0'),
('141','water_query2','other','快递100查询','1.1','快递100查询','快递100查询','微赞','http://www.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('142','jy_wei','customer','九烨-微招聘','1.9','招聘微网站','招聘微网站','微赞','012wz.com','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('143','cut_zongzi','wdlgame','切粽子','2.6','由切水果游戏改编，应景即将到来的端午节','①根据切水果改造。\n②认证服务号可设置要求玩游戏者关注后才能玩游戏\n③认证订阅号可通过借用oauth权限实现要求玩游戏者关注后才能玩游戏（认证订阅号、认证服务号需绑定微信开放平台）\\n④可自定义关注图片\n⑤可查看参与记录（可查看参与者详细信息，可与参与者对话','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('144','n1ce_newchat','business','腾讯多客服','3.1.8','微赞的官方多客服需要设置优先级，稍微改良了下！','微赞的官方多客服需要设置优先级，稍微改良了下！','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('145','fl_wsq_bmfw','business','微社区-便民服务','4.2','可以搜集小区附近的便民服务，以方便用户使用','可以搜集小区附近的便民服务，以方便用户使用','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('146','zzplane_hhy','wdlgame','粽子大战','4.3','粽子大战，模仿飞机大战','粽子大战，模仿飞机大战','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('147','hong_kuaidi','services','智能快递','4.2','智能快递查询，自定义广告位','智能快递查询，自定义广告位','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('148','lonaking_dwblessing','activity','端午祝福','4.2','端午祝福朋友圈分享吸粉利器','端午祝福朋友圈分享吸粉利器','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('149','lonaking_niulangfly','wdlgame','牛郎追织女','4.2','牛郎追织女','牛郎追织女一款小游戏','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('150','wmb_goshare','activity','集分享','4.2','集分享','集分享兑奖活动展示商业信息','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('151','yg_zongzi','wdlgame','端午狂吃','4.2','一口气吃多少个粽子','一口气吃多少个粽子','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('152','bobo_dabai','wdlgame','大白治疗师','4.3','大白治疗师','大白治疗师','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('153','czt_qzz','wdlgame','切切粽子','4.2','切切粽子','切切粽子','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('154','abc_basic','services','新版文字回复','4.3','新版文字回复','新版文字回复','微赞','bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('155','abc_news','services','新版图文回复','4.5','新版图文回复','新版图文回复','微赞','bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('156','astro_hhy','wdlgame','星座今日运势','4.2','星座今日运势','星座今日运势','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('157','bus_hhy','other','地铁公交线路查询','4.2','地铁公交线路查询','地铁公交线路查询','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('158','enjoy_circle','wdlgame','我和明星一个圈','4.8','我和明星一个圈','我和明星一个圈','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('159','bf_shell','other','UNIONID粉丝互通','4.3','通过配置可以实现A公众号和B公众号粉丝互通','通过配置可以实现A公众号和B公众号粉丝互通','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('160','ewei_takephotoa','wdlgame','拍大白(高级版)','4.2','流行游戏，拍大白，排名，发奖品，导出成绩','流行游戏，拍大白，排名，发奖品，导出成绩','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('161','find_hotel','services','找酒店','4.2','找酒店','发送关键字，然后发送位置信息就会返回相应信息','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('162','fl_dkf_khxx','services','多客服-客户信息插件','4.3','多客服接入时直接显示客户基本资料','多客服接入时直接显示客户基本资料','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('163','fl_gp','services','股票插件','4.3','显示股票资料','显示股票资料','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('164','guess_girl','wdlgame','猜美女明星','4.2','猜美女明星赢奖品','猜美女明星或者自己上传指定人物照片','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('165','hc_ybdzs','wdlgame','中秋月饼大战','4.3','月饼大战，打得越多分数越高，背景音乐','月饼大战，打得越多分数越高，背景音乐','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('166','hx_othermsg','other','特殊消息接口转发','4.2','特殊消息接口转发','特殊消息接口转发','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('167','ju_credit','business','关注送积分','4.2','关注送积分或者余额','关注送积分或者余额','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('168','junsion_qixiqueqiao','wdlgame','七夕鹊桥','4.2','酒七夕鹊桥','七夕鹊桥','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('169','lions_zq','business','月球来的月饼','4.2','小游戏中玩家通过控制叉子叉中月饼来获得积分，积分越高排名越高','小游戏中玩家通过控制叉子叉中月饼来获得积分，积分越高排名越高','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('170','lonaking_express','services','快递专家','4.2','用户体验超高的一款快递查询应用','用户体验超高的一款快递查询应用','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('171','meepo_credit1','business','积分充值','4.2','积分充值','积分充值','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('172','n1ce_chatmore','customer','多回复推送','4.2','多回复推送','多回复推送','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('173','nace_catch','services','商品抓取','4.3','抓取VIP的商品信息','抓取VIP的商品信息','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('174','name_hhy','wdlgame','姓名测试','4.3','姓名测试','姓名测试','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('175','on3_voxpic','business','留声墙','4.3','留声墙','留声墙','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('176','sinrch_dataosha','wdlgame','大逃杀','4.2','大逃杀微信小游戏','大逃杀微信小游戏','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('177','netbuffer_idsearch','wdlgame','身份证查询','4.2','身份证查询','身份证查询','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('178','scnace_lm','services','最后一公里','4.3','最后一公里','校园快递代送','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('179','wdl_cube','wdlgame','变态方块','4.2','童年的美好回忆','童年的美好回忆','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('180','scnace_weblm','services','校园快递代送','4.3','最后一公里','校园快递代送','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('181','sunshine_gaokaotoutiao','wdlgame','高考头条','4.3','高考头条,让上头条更简单，我也要上头条！','高考头条,让上头条更简单，我也要上头条！','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('182','wang_huayu','wdlgame','花语','4.2','花语/送花攻略','花语/送花攻略','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('183','wdl_daoguo','wdlgame','岛国么么哒','4.2','岛国么么哒赢奖品','猜美女明星或者自己上传指定人物照片','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('184','wdl_damao','wdlgame','暴打神经猫','4.2','暴打神经猫','看看你能抓住几只小猫','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('185','wdl_daqie','wdlgame','疯狂打企鹅','4.2','打的越远企鹅看得起你哦','打的越远企鹅看得起你哦','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('186','wdl_daweiwang','wdlgame','吃包子武道赛','4.2','吃包子武道赛','吃包子大比拼，吃的越快、越多能量就越牛B','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('187','wdl_gongfumao','business','功夫熊猫','4.2','功夫熊猫来了','功夫熊猫来了','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('188','wdl_mazouri','wdlgame','象棋马走日','4.2','象棋马走日','马走日挑战看你是不是象棋高手','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('189','wdl_luolicome','wdlgame','萝莉来了','4.2','和萝莉一块去大冒险吧，困难重重，你和她最后能猎取胜利吗？','和萝莉一块去大冒险吧，困难重重，你和她最后能猎取胜利吗？','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('190','wdl_houzi','wdlgame','小猴摘桃','4.2','小猴摘桃当钱用','小猴摘桃当钱用、抢的越多得到的钱当然就越多，赶紧来帮帮大圣吧！','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('191','wdl_mishi','wdlgame','密室逃脱游戏','4.2','密室逃脱游戏','以关卡为基础的解谜类游戏','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('192','wdl_motianlou','wdlgame','惊悚摩天楼','4.2','惊悚摩天楼','不是一般难度的游戏，真正考验你的数学、物理技能、甚至建筑技能。胆小者慎入','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('193','wdl_nodie','wdlgame','一个都不能死','4.2','一个都不能死','一个都不能死','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('194','wdl_qiexigua','wdlgame','切西瓜切水果','4.2','切西瓜切水果','切西瓜切水果','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('195','we7_fance','activity','微信打印系统','4.2','关注后发送照片即可打印照片','关注后发送照片即可打印照片','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('196','wdl_sudujiqing','wdlgame','速度与激情','4.2','看看你是不是一个高技能赛车手','看看你是不是一个高技能赛车手','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('197','wdl_weizanxiu','business','微赞秀','4.2','微赞秀:H5微赞秀移动场景应用自营销管家','微赞秀::微赞秀移动场景应用自营销管家,免费为中小微企业或团队提供业务场景应用展示、潜在客户在线报名收集','微赞','bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('198','quick_center','business','菜单中心','1.2','菜单中心','菜单中心','微赞','www.wdlcms.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('199','yg_supergrowth','business','超级成长','4.2','超级成长','超级成长','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('200','yhc_onenavi','services','一键导航','1.2','手指点一点，自动规划路线到目的地','手指点一点，自动规划路线到目的地','yhctech','http://bbs.012wz.com/','0','a:2:{i:0;s:4:\"text\";i:1;s:8:\"location\";}','a:2:{i:0;s:8:\"location\";i:1;s:4:\"text\";}','1','0','0','0','N;','0'),
('201','yhc_ecard','customer','云名片','1.3','云名片，是一种基于移动互联网的二维码手机名片，名片信息云端管理，实时更新、所有好友即时同步。','云名片，是一种基于移动互联网的二维码手机名片，名片信息云端管理，实时更新、所有好友即时同步。只需扫一扫微名片二维码，即可将您的名片资料保存到手机通讯录。拥有微名片，无须因联系信息变更而通知大量好友而烦恼。','yhctech','http://bbs.012wz.com/','0','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('202','meepo_bbs','business','微社区','4.9','微社区','微社区','微赞','http://www.admin8.co/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','1','N;','0'),
('204','water_super','hy','超级店','6.0','超级店','超级店','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('205','bmfloor','activity','占楼送礼','1.1','提高粉丝的活跃度，互动性！','微信抢楼可以活动提高粉丝与公众号的互动，提升公众号的黏性。支持自定义菜单，自定义触发关键字，自定义楼层提示语，自定义中奖提示语，支持自定义中奖楼层，支持单奖品和多奖品添加！','微赞','','0','a:0:{}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"image\";}','1','0','0','0','N;','0'),
('206','hx_securityspro','services','防伪码增强版','0.4','防伪码','批量创建产品防伪码二维码，扫码查询，推送该产品信息，企业或商家用户自动成为会员，并获得积分，积分可可设置多换礼品，这样就会让企业或者商家粉丝主动参与进来，达到企业包装产品，传播品牌，和广范围吸粉的目的。','梦小生','http://www.yofosky.com/','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('207','yobydashan','customer','搭讪管家','3.0','这是一个搭讪美女或帅哥的模块,能够与公众号内部妹纸,蝈蝈们聊天,首次使用需要简单注册','发送@可以找到随机异性\n@编号可以找到直接对话某个人\n搜索+关键字可以找到人','微赞','','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('208','wdl_quickspread','business','码上涨粉','2.9.6','码上涨粉','传单传播,码上涨粉','微赞','http://bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('209','broke','business','全民经纪人','3.8','全民经纪人','全民经纪人','微动力','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('210','scan_video','business','扫码看视频','0.3','扫码看视频，未关注时要求关注，关注后扫码看视频','扫码看视频，未关注时要求关注，关注后扫码看视频','微赞','http://www.admin8.co/','0','a:4:{i:0;s:4:\"text\";i:1;s:9:\"subscribe\";i:2;s:2:\"qr\";i:3;s:5:\"click\";}','a:4:{i:0;s:4:\"text\";i:1;s:9:\"subscribe\";i:2;s:2:\"qr\";i:3;s:5:\"click\";}','1','0','0','0','N;','0'),
('211','xf_vktv','business','微KTV','0.5','微KTV','可添加ktv分店,包厢,ktv海报信息,可进行订单预约','微动力','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('212','mon_wkj','activity','微砍价','1.8','微砍价，砍砍！！！！！','微砍价，砍砍！！！！！！','微赞','bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('213','lvyou','business','微旅游','1.0','微动力要的微旅游','','微动力','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('214','hlzonyu','activity','组团来砍价','1.8','砍价帮','砍价帮，组团来砍价','微动力','http://bbs.b2ctui.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('215','cgt_qyhb','customer','一分钱红包','1.1','一分钱红包','站长吧源码社区 www.admin8.co','微赞','http://bbs.we7.cc/','1','a:1:{i:0;s:4:\"text\";}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"click\";}','1','0','0','0','N;','0'),
('216','meepo_bigwall','activity','微现场超级版','4.4','可以实时同步显示现场参与者发送的微信消息','微现场超级版，是在年会、展会、音乐会、婚礼现场、校园开学典礼、元旦晚会等场所展示特定主题微信的大屏幕，大屏幕上可以同步显示现场参与者发送的微信消息，现场人员参与抽奖、摇一摇、投票等等活动，也可在一个公众号内同时举行多个活动，非常的强大，能使场内外观众能够第一时间传递和获取现场信息，嗨爆整个现场。','微赞','http://www.mitusky.com','0','a:3:{i:0;s:4:\"text\";i:1;s:2:\"qr\";i:2;s:9:\"subscribe\";}','a:5:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:2:\"qr\";i:3;s:9:\"subscribe\";i:4;s:5:\"click\";}','1','0','0','0','N;','0'),
('217','xc_article','activity','微文章营销版','8.4','展示一个手机网页来介绍你的公众号，基于微赞官方微文章扩展。提供访问跟踪功能。分享转向。','模块说明：1、以微信最核心的文章模块作为营销利器，充分考虑运营者的需求。2、通过本模块可以激励用户分享，引导用户的好友进入到公众号的营销活动中来。3、分享文章给好友或朋友圈。只要分享就送积分，好友如果点开了分享的链接，还送积分。4、支持自定义文章广告、自定义文章推荐，给运营者更大发挥空间。你的文章你做主。5、积分计算规则：微文章积分=转发积分+点击积分。转发积分：转发积分仅送一次，仅送从微信号转发的人，也就是说其他人看到你转发的文章再转发，你不获得积分。点击积分：一台设备点击一次送一次 重复点击不送分，防止作弊。','微文章营销cuman修复版','Q35669852','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('218','czt_subscribe_redpack','activity','关注送红包','1.0','关注送红包！！！','关注送红包！！！','米兔天空','http://www.012wz.com','0','a:0:{}','a:2:{i:0;s:9:\"subscribe\";i:1;s:4:\"text\";}','1','0','0','0','N;','0'),
('219','wdl_amovie','customer','种子搜索器','2.9.5','种子资源搜索器,你懂得\', \'种子资源搜索器,你懂得','种子资源搜索器,你懂得\', \'种子资源搜索器,你懂得','微赞','http://bbs.012wz.com','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('220','weisrc_feedback','other','留言板','1.3','留言板','留言板','微赞','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('221','aki_yzmye','activity','验证码兑换余额','1.1','微信发送验证码兑换余额系统','微信发送验证码兑换余额系统','微赞','http://www.012wz.com/','0','a:7:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:9:\"subscribe\";i:6;s:11:\"unsubscribe\";}','a:5:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";}','1','0','0','0','N;','0'),
('222','lonaking_activity','activity','活动管理平台','1.6','活动管理平台','活动管理平台','微赞','http://www.012wz.com/','1','a:7:{i:0;s:4:\"text\";i:1;s:8:\"location\";i:2;s:9:\"subscribe\";i:3;s:11:\"unsubscribe\";i:4;s:2:\"qr\";i:5;s:5:\"click\";i:6;s:4:\"view\";}','a:6:{i:0;s:8:\"location\";i:1;s:4:\"link\";i:2;s:9:\"subscribe\";i:3;s:2:\"qr\";i:4;s:5:\"click\";i:5;s:4:\"text\";}','1','0','0','0','N;','0'),
('223','lonaking_flash','activity','Flash','3.6.6','此模块为基础模块！','','weiwei','','1','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('224','lonaking_fishjoy','activity','捕鱼达人','0.2','一款搭配积分商城使用的游戏模块','一款搭配积分商城使用的游戏模块','weiwei','','1','a:12:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:11:\"unsubscribe\";i:9;s:2:\"qr\";i:10;s:5:\"click\";i:11;s:4:\"view\";}','a:10:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:10:\"shortvideo\";i:4;s:8:\"location\";i:5;s:4:\"link\";i:6;s:9:\"subscribe\";i:7;s:2:\"qr\";i:8;s:5:\"click\";i:9;s:4:\"text\";}','1','0','0','0','N;','0'),
('225','jing_guanzhu','other','一键关注生成器','1.0','一键关注生成器','一键关注生成器','weiwei','','1','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('226','bm_qrsign','business','扫码支付/扫码签到','1.8','扫码签到&扫码支付','扫码签到&扫码支付','微赞','','1','a:0:{}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"image\";}','1','0','0','0','N;','0'),
('227','weini_rhino','activity','犀牛溜冰场','1.3','犀牛牛溜冰场','牛溜冰场','智慧校园','http://www.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('228','xm_housekeep_we7','business','家政服务','1.5','家政服务，为你找家政','家政服务，为你找家政','智慧校园','http://www.012wz.com/','0','a:15:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:11:\"unsubscribe\";i:9;s:2:\"qr\";i:10;s:5:\"trace\";i:11;s:5:\"click\";i:12;s:4:\"view\";i:13;s:5:\"enter\";i:14;s:14:\"merchant_order\";}','a:13:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:10:\"shortvideo\";i:4;s:8:\"location\";i:5;s:4:\"link\";i:6;s:9:\"subscribe\";i:7;s:2:\"qr\";i:8;s:5:\"trace\";i:9;s:5:\"click\";i:10;s:5:\"enter\";i:11;s:14:\"merchant_order\";i:12;s:4:\"text\";}','1','0','0','0','N;','0'),
('229','kim_financial','customer','财务中心','1.8','用于会员在线充值余额、余额购买套餐，购买短信条数服务','用于会员在线充值余额、余额购买套餐，购买短信条数服务','微赞科技','http://www.012wz.com/','0','a:13:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:8:\"location\";i:5;s:4:\"link\";i:6;s:9:\"subscribe\";i:7;s:11:\"unsubscribe\";i:8;s:2:\"qr\";i:9;s:5:\"trace\";i:10;s:5:\"click\";i:11;s:4:\"view\";i:12;s:5:\"enter\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('230','q_3354988381_xuyuan','business','微许愿让梦想实现','1.4','给自己或他人许愿祝福，让每个人都能美梦成真！','给自己或他人许愿祝福，让每个人都能美梦成真！','','','0','a:2:{i:0;s:4:\"text\";i:1;s:5:\"image\";}','a:2:{i:0;s:4:\"text\";i:1;s:5:\"image\";}','1','0','0','0','N;','0'),
('231','yg_hcity','activity','辛福城','1.7','大家一起来聚款','大家一起来聚款，大家一起来聚款。','微赞','http://bbs.012wz.com/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('232','tim_cow','other','爱吹牛','1.1','爱吹牛，赢奖品','爱吹牛，赢奖品','','','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('233','amouse_friend_impress','business','好友印象','1.1.3','好友印象,匿名说出您对好友的印象吧。','好友印象,匿名说出您对好友的印象吧','微赞','http://bbs.012wz.com/','1','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('234','yg_parkour','activity','跑酷','1.1','跑跑','跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑跑','微赞','http://bbs.012wz.com/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('235','yg_asty','activity','按死通用插件','1.1','按死游戏可以自由设置','按死游戏可以自由设置，设置游戏首页面图片，设置，被按死对象','微赞','http://bbs.012wz.com/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('236','lonaking_bb','activity','猪八戒爱BB','1.4.3','BB一下 你就知道','BB一下你就知道','微赞','http://bbs.012wz.com/','1','a:14:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:10:\"shortvideo\";i:5;s:8:\"location\";i:6;s:4:\"link\";i:7;s:9:\"subscribe\";i:8;s:11:\"unsubscribe\";i:9;s:2:\"qr\";i:10;s:5:\"trace\";i:11;s:5:\"click\";i:12;s:4:\"view\";i:13;s:5:\"enter\";}','a:12:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:10:\"shortvideo\";i:4;s:8:\"location\";i:5;s:4:\"link\";i:6;s:9:\"subscribe\";i:7;s:2:\"qr\";i:8;s:5:\"trace\";i:9;s:5:\"click\";i:10;s:5:\"enter\";i:11;s:4:\"text\";}','1','0','0','0','N;','0'),
('237','jing_ns','activity','测女神','0.12','测测你能遇到的男神女神','测测你能遇到的男神女神','微赞','http://bbs.012wz.com/','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('238','ice_picwall','customer','照片墙新版','1.7','照片墙升级版本','照片墙升级版本','微赞','http://bbs.012wz.com/','0','a:2:{i:0;s:4:\"text\";i:1;s:5:\"image\";}','a:2:{i:0;s:5:\"image\";i:1;s:4:\"text\";}','1','0','0','0','N;','0'),
('239','enjoy_red','activity','翻红包','1.84','翻红包，感觉太酸爽','想怎么翻就怎么翻','微赞科技','http://www.012wz.com/','1','a:6:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:9:\"subscribe\";i:3;s:11:\"unsubscribe\";i:4;s:5:\"click\";i:5;s:4:\"view\";}','a:3:{i:0;s:5:\"image\";i:1;s:5:\"click\";i:2;s:4:\"text\";}','0','0','0','0','N;','0'),
('240','fm_jiaoyu','business','微教育-多校版','1.5','教育行业通用模块，适用于培训学校，幼儿园，具备成绩查询，教师管理，课程安排等功能','教育行业通用模块，适用于培训学校，幼儿园，具备成绩查询，教师管理，课程安排等功能','微赞','http://www.012wz.com','0','a:8:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:5:\"voice\";i:3;s:5:\"video\";i:4;s:8:\"location\";i:5;s:4:\"link\";i:6;s:9:\"subscribe\";i:7;s:11:\"unsubscribe\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('241','mon_jgg','activity','幸运九宫格','2.1','幸运九宫格！','幸运九宫格！','微赞','bbs.b2ctui.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('242','mon_qmshake','activity','每天摇一摇','1.6','每天摇一摇','每天摇一摇','微赞科技','bbs.012wz.com','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('243','dayu_yuyuepay','services','微预约支付版','2.1','行业通用预约模块','','微赞','QQ800083075','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('245','jy_coupons','activity','大家来领券','1.1','大家来领券','大家来领券','锦品汇','h大家来领券','0','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('246','superman_getcash','services','【超人】提现','2.4','支持一键提现，实时到账，无需繁琐的线下打款','会员可在微信公众号上申请提现，管理员后台一键提现，现金及时到微信钱包，不需要繁琐的线下打款','锦品汇','http://www.012wz.com','1','a:0:{}','a:0:{}','0','0','0','0','a:0:{}','0'),
('247','j_activity','activity','捷迅活动中心','1.2','用于活动的报名，通知，介绍等','用于活动的报名，通知，介绍等','微擎','http://s.we7.cc/','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('248','danwu_show','activity','街拍秀','1.5','粉丝街拍、发表心情等展示、粉丝们可以给他们点赞、可以分享粉丝的心情等等','粉丝街拍、发表心情等展示、粉丝们可以给他们点赞、可以分享粉丝的心情等等','街拍秀','街拍秀','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('249','mb_swish','business','猴赛雷语音祝福','1.0.2','猴赛雷的语音祝福模块, 形式新颖, 最好玩','猴赛雷语音祝福','we7.cc','flypin.taobao.com','1','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('250','tp_goods','activity','商品推广','2.0','商品推广','帮助你推广商品，让客户更快了解你的商品！','锦品汇','商品推广','1','a:0:{}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','N;','0'),
('251','jer_da','services','用户综合运营分析系统','1.2','用户综合运营分析系统','对用户增长及模块进行运营管理分析','锦品汇','用户综合运营分析系统','0','a:0:{}','a:0:{}','0','0','0','0','N;','0'),
('252','qw_yinpin','business','营销讲堂','1.0.1','上传音乐','上传流畅音频，\n用户能方便听课','qwzhao','http://bbs.we7.cc/','1','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','1','0','0','0','a:0:{}','0'),
('253','junsion_poster','services','分享海报','1.4.8','自定义海报','自定义海报','自定义海报','flypin.taobao.com','1','a:1:{i:0;s:11:\"unsubscribe\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','N;','0'),
('254','xiaofeng_cexpress','activity','微表白','1.0','大学校园表白','大学校园表白','大学校园表白','大学校园表白','0','a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}','0','0','0','0','a:0:{}','0');


DROP TABLE IF EXISTS ims_modules_bindings;
CREATE TABLE `ims_modules_bindings` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL DEFAULT '',
  `entry` varchar(10) NOT NULL DEFAULT '',
  `call` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL,
  `do` varchar(30) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=762 DEFAULT CHARSET=utf8;

INSERT INTO ims_modules_bindings VALUES 
('1','hx_pictorial','cover','','列表入口设置','list','','0','','','0'),
('2','hx_pictorial','menu','','画报管理','list','','0','','','0'),
('3','hx_pictorial','home','','画报首页','list','','0','','','0'),
('4','hx_lottery','menu','','活动管理','list','','0','','','0'),
('5','hx_lottery','profile','','我的奖品','myaward','','0','','','0'),
('6','meepo_pai','cover','','全民自拍','index','','0','','','0'),
('7','meepo_pai','menu','getMenuTiles','','','','0','','','0'),
('8','hx_cards','menu','','活动管理','list','','0','','','0'),
('9','hx_cards','profile','','我的奖品','myaward','','0','','','0'),
('10','we7_business','menu','','商户列表','display','','0','','','0'),
('11','we7_business','menu','','添加商户','post','','0','','','0'),
('12','we7_album','cover','','相册列表入口设置','list','','0','','','0'),
('13','we7_album','menu','','相册分类','category','','0','','','0'),
('14','we7_album','menu','','相册列表','list','','0','','','0'),
('15','we7_album','home','getAlbumTiles','','','','0','','','0'),
('16','we7_album','home','','相册首页','list','','0','','','0'),
('17','wl_heka','menu','','贺卡管理','list','','0','','','0'),
('18','wl_heka','home','gethometiles','','','','0','','','0'),
('19','lxy_rtrouter','menu','','路由器管理','routerlist','','0','','','0'),
('20','lxy_rtrouter','menu','','认证记录','authlist','','0','','','0'),
('21','lxy_rtrouter','menu','','节点管理','nodelist','','0','','','0'),
('22','superman_floor','menu','','中奖名单','awardlist','','0','','','0'),
('23','meepo_sexy','menu','','基本设置','set','','0','','','0'),
('24','weihaom_wb','rule','','用户排名','userlist','','0','','','0'),
('25','meepo_danmu','cover','','弹幕入口','index','','0','','','0'),
('26','meepo_danmu','menu','getMenuTiles','','','','0','','','0'),
('27','we7_research','menu','','预约活动列表','display','','0','','','0'),
('28','we7_research','menu','','新建预约活动','post','','0','','','0'),
('29','we7_research','home','getHomeTiles','','','','0','','','0'),
('30','we7_research','profile','','我的预约调查','myresearch','','0','','','0'),
('31','we7_survey','menu','','调研活动列表','display','','0','','','0'),
('32','we7_survey','menu','','新建调研活动','post','','0','','','0'),
('33','we7_survey','home','gethometiles','','','','0','','','0'),
('34','we7_survey','profile','','我的调研','myresearch','','0','','','0'),
('35','ewei_vote','rule','','查看投票记录','votelist','','0','','','0'),
('36','ewei_vote','menu','','微投票管理','manage','','0','','','0'),
('37','ewei_vote','home','getItemTiles','','','','0','','','0'),
('38','hl_bbb','rule','','中奖名单','awardlist','','0','','','0'),
('39','hl_dqq','rule','','中奖名单','awardlist','','0','','','0'),
('40','hl_dqq','home','gethometiles','','','','0','','','0'),
('41','hl_zzz','rule','','排名','awardlist','','0','','','0'),
('42','qmteam_zerobuy','cover','','零元购入口','list','','0','','','0'),
('43','qmteam_zerobuy','menu','','商品管理','list','','0','','','0'),
('44','qmteam_zerobuy','menu','','活动详情','detail','','0','','','0'),
('45','qmteam_zerobuy','menu','','活动规则','activity_rule','','0','','','0'),
('46','qmteam_zerobuy','home','','零元购列表','list1','','0','','','0'),
('47','qmteam_zerobuy','home','','零元购详细页','detail','','1','','','0'),
('48','qmteam_zerobuy','profile','','个人中心导航','zerobuy_uc','','0','','','0'),
('49','hx_dialect','menu','','题库管理','list','','0','','','0'),
('50','hx_dialect','menu','','添加题目','add','','0','','','0'),
('51','hx_dialect','home','','地方话测试','detail','','0','','','0'),
('52','we7_activity','menu','','活动管理','activityManger','','0','','','0'),
('53','we7_activity','menu','','提醒设置','tip','','0','','','0'),
('54','lxy_marry','menu','','喜帖管理','Manager','','0','','','0'),
('55','meepo_nsign','rule','','签到统计','record','','0','','','0'),
('56','meepo_nsign','rule','','中奖名单','winners','','0','','','0'),
('57','meepo_nsign','rule','','广告管理','mngadd','','0','','','0'),
('58','meepo_nsign','home','gethometiles','','','','0','','','0'),
('59','we7_car','cover','','汽车首页入口设置','index','','0','','','0'),
('60','we7_car','cover','','汽车车型入口设置','series','','0','','','0'),
('61','we7_car','cover','','车主关怀入口设置','guanhuai','','0','','','0'),
('62','we7_car','cover','','意见回馈入口设置','message','','0','','','0'),
('63','we7_car','cover','','实用工具入口设置','tool','','0','','','0'),
('64','we7_car','menu','','汽车首页设置','index','','0','','','0'),
('65','we7_car','menu','','汽车品牌管理','brand','','0','','','0'),
('66','we7_car','menu','','汽车车系管理','series','','0','','','0'),
('67','we7_car','menu','','汽车车型管理','type','','0','','','0'),
('68','we7_car','menu','','预约管理','yuyue','','0','','','0'),
('69','we7_car','menu','','车主关怀管理','guanhuai','','0','','','0'),
('70','we7_car','menu','','销售客服管理','kefu','','0','','','0'),
('71','we7_car','menu','','汽车资讯管理','news','','0','','','0'),
('72','we7_car','menu','','车型相册管理','album','','0','','','0'),
('73','we7_car','menu','','意见回馈管理','message','','0','','','0'),
('74','we7_car','menu','','实用工具设置','tool','','0','','','0'),
('75','we7_car','home','','汽车首页','index','','0','','','0'),
('76','we7_car','home','','汽车车型','series','','0','','','0'),
('77','we7_car','home','','预约试驾','yuyue','1','0','','','0'),
('78','we7_car','home','','预约保养','yuyue','2','0','','','0'),
('79','we7_car','home','','车主关怀','guanhuai','','0','','','0'),
('80','we7_car','home','','销售客服','kefu','','0','','','0'),
('81','we7_car','home','','意见回馈','message','','0','','','0'),
('82','we7_car','home','','实用工具','tool','','0','','','0'),
('83','we7_shake','rule','','查看活动','detail','','0','','','0'),
('84','we7_shake','rule','','管理用户','manage','','0','','','0'),
('85','we7_shake','home','','摇一摇中奖','detail','','0','','','0'),
('86','ewei_exam','cover','','微考试入口设置','index','','0','','','0'),
('87','ewei_exam','cover','','试卷入口设置','paperlist','','0','','','0'),
('88','ewei_exam','cover','','课程入口设置','courselist','','0','','','0'),
('89','ewei_exam','cover','','我的预约入口设置','reservelist','','0','','','0'),
('90','ewei_exam','menu','','试卷类型','paper_type','','0','','','0'),
('91','ewei_exam','menu','','试卷管理','paper','','0','','','0'),
('92','ewei_exam','menu','','试卷分类','paper_category','','0','','','0'),
('93','ewei_exam','menu','','试题管理','question','','0','','','0'),
('94','ewei_exam','menu','','题库管理','pool','','0','','','0'),
('95','ewei_exam','menu','','试题导入','upload_question','','0','','','0'),
('96','ewei_exam','menu','','课程管理','course','','0','','','0'),
('97','ewei_exam','menu','','课程分类','course_category','','0','','','0'),
('98','ewei_exam','menu','','课程预定','reserve','','0','','','0'),
('99','ewei_exam','menu','','用户管理','member','','0','','','0'),
('100','ewei_exam','menu','','系统设置','sysset','','0','','','0'),
('101','ewei_exam','home','getItemTiles','','','','0','','','0'),
('102','ewei_hotel','cover','','微酒店入口设置','index','','0','','','0'),
('103','ewei_hotel','menu','','酒店管理','hotel','','0','','','0'),
('104','ewei_hotel','menu','','房型管理','room','','0','','','0'),
('105','ewei_hotel','menu','','品牌管理','brand','','0','','','0'),
('106','ewei_hotel','menu','','商圈管理','business','','0','','','0'),
('107','ewei_hotel','menu','','用户管理','member','','0','','','0'),
('108','ewei_hotel','menu','','订单管理','order','','0','','','0'),
('109','ewei_hotel','menu','','基本设置','hotelset','','0','','','0'),
('110','ewei_hotel','home','getItemTiles','','','','0','','','0'),
('111','fwei_moneyimport','menu','','导入余额','import','','0','','','0'),
('112','stonefish_bigwheel','cover','','列表入口','listentry','','0','','','0'),
('113','stonefish_bigwheel','rule','','参与粉丝','fansdata','','0','','','0'),
('114','stonefish_bigwheel','rule','','分享数据','sharedata','','0','','','0'),
('115','stonefish_bigwheel','rule','','奖品数据','prizedata','','0','','','0'),
('116','stonefish_bigwheel','rule','','粉丝排行','rankdata','','0','','','0'),
('117','stonefish_bigwheel','rule','','活动分析','trend','','0','','','0'),
('118','stonefish_bigwheel','rule','','消息通知','posttmplmsg','','0','','','0'),
('119','stonefish_bigwheel','menu','','活动管理','manage','','0','','','0'),
('120','stonefish_bigwheel','menu','','活动模板','template','','0','','','0'),
('121','stonefish_bigwheel','menu','','消息模板','tmplmsg','','0','','','0'),
('122','stonefish_bigwheel','home','gethomeurl','','','','0','','','0'),
('123','stonefish_bigwheel','profile','','我的**','myprofile','','0','','','0'),
('124','scene_cube','menu','','场景菜单','manager','','0','','','0'),
('125','qiyue_canvas','cover','','画图入口','index','','0','','','0'),
('126','qiyue_canvas','menu','','图片管理','list','','0','','','0'),
('127','weisrc_audio','cover','','音乐盒子入口设置','index','','0','','','0'),
('128','weisrc_audio','menu','','音乐管理','music','','0','','','0'),
('129','weisrc_audio','menu','','基本设置','setting','','0','','','0'),
('130','weisrc_audio','home','','微音乐','index','','0','','','0'),
('131','we7_wxwall','rule','','查看内容','detail','','0','','','0'),
('132','we7_wxwall','rule','','审核内容','manage','','0','','','0'),
('133','we7_wxwall','rule','','中奖名单','awardlist','','0','','','0'),
('134','we7_wxwall','rule','','黑名单','blacklist','','0','','','0'),
('135','weisrc_pano','cover','','360全景入口设置','index','','0','','','0'),
('136','weisrc_pano','menu','','全景管理','manage','','0','','','0'),
('137','weisrc_pano','home','','360全景入展示','index','','0','','','0'),
('138','iwobanji_xcpage','cover','','入口配置','adshow','','1','','','0'),
('139','iwobanji_xcpage','menu','','宣传页配置','adshow','','0','','','0'),
('140','iwobanji_xcpage','home','','关注微信','adshow','','0','','','0'),
('141','iwobanji_xcpage','profile','','关注微信','adshow','','0','','','0'),
('142','iwobanji_xcpage','shortcut','','关注微信','adshow','','0','','','0'),
('143','weisrc_invitative','menu','','邀请函管理','activity','','0','','','0'),
('144','weisrc_invitative','home','getHomeTiles','','','','0','','','0'),
('145','we7_egg','rule','','中奖名单','awardlist','','0','','','0'),
('146','we7_egg','home','gethometiles','','','','0','','','0'),
('147','weisrc_clubbigwheel','cover','','入口设置','index','','0','','','0'),
('148','weisrc_clubbigwheel','home','','惩罚大转盘','index','','0','','','0'),
('149','eso_share','rule','','达人管理','eso_sharelist','','0','','','0'),
('150','mon_house','menu','','楼盘设置','houseSetting','','0','','','0'),
('151','mon_house','menu','','户型管理','unitSetting','','0','','','0'),
('152','mon_house','menu','','置业顾问管理','agentSetting','','0','','','0'),
('153','hx_zhongchou','cover','','众筹入口设置','list','','0','','','0'),
('154','hx_zhongchou','menu','','订单管理','order','','0','','','0'),
('155','hx_zhongchou','menu','','项目管理','project','','0','','','0'),
('156','hx_zhongchou','menu','','项目分类','category','','0','','','0'),
('157','hx_zhongchou','menu','','配送方式','dispatch','','0','','','0'),
('158','hx_zhongchou','menu','','物流管理','express','','0','','','0'),
('159','hx_zhongchou','menu','','幻灯片管理','adv','','0','','','0'),
('160','hx_zhongchou','home','','众筹','list','','0','','','0'),
('652','weisrc_feedback','cover','','留言板入口设置','index','','0','','','0'),
('162','zam_weimails','menu','','附件管理','list','','0','','','0'),
('163','ewei_comeon','menu','','活动管理','manage','','0','','','0'),
('164','ewei_comeon','menu','','授权设置','sysset','','0','','','0'),
('165','stonefish_scratch','cover','','列表入口','listentry','','0','','','0'),
('166','stonefish_scratch','rule','','参与粉丝','fansdata','','0','','','0'),
('167','stonefish_scratch','rule','','分享数据','sharedata','','0','','','0'),
('168','stonefish_scratch','rule','','奖品数据','prizedata','','0','','','0'),
('169','stonefish_scratch','rule','','粉丝排行','rankdata','','0','','','0'),
('170','stonefish_scratch','rule','','粉丝排行','rankdata','','0','','','0'),
('171','stonefish_scratch','rule','','活动分析','trend','','0','','','0'),
('172','stonefish_scratch','rule','','消息通知','posttmplmsg','','0','','','0'),
('173','stonefish_scratch','menu','','活动管理','manage','','0','','','0'),
('174','stonefish_scratch','menu','','活动模板','template','','0','','','0'),
('175','stonefish_scratch','menu','','消息模板','tmplmsg','','0','','','0'),
('176','stonefish_scratch','home','gethomeurl','','','','0','','','0'),
('177','hx_subscribe','cover','','推荐关注入口设置','list','','0','','','0'),
('178','hx_subscribe','menu','','文章管理','article','','0','','','0'),
('179','hx_subscribe','menu','','积分排行','list','','0','','','0'),
('180','hx_subscribe','menu','','红包管理','credit','','0','','','0'),
('181','hx_subscribe','profile','','我的红包','mycredit','','0','','','0'),
('182','zam_findlx','menu','','基本设置','set','','0','','','0'),
('183','zam_findlx','menu','','注册列表管理','manage','','0','','','0'),
('184','zam_findlx','menu','','消息管理','news','','0','','','0'),
('185','wkf_message','cover','','留言墙入口设置','list','','0','','','0'),
('186','wkf_message','menu','','留言管理','manage','','0','','','0'),
('187','eso_sale','cover','','购物入口设置','list','','0','','','0'),
('188','eso_sale','cover','','代理入口','fansindex','','0','','','0'),
('189','eso_sale','cover','','排行榜入口设置','phb','','0','','','0'),
('190','eso_sale','cover','','积分兑换入口设置','award','','0','','','0'),
('191','eso_sale','menu','','订单管理','order','','0','','','0'),
('192','eso_sale','menu','','CRM会员管理','charge','','0','','','0'),
('193','eso_sale','menu','','商品管理','goods','','0','','','0'),
('194','eso_sale','menu','','商品分类','category','','0','','','0'),
('195','eso_sale','menu','','积分商品设置','award','','0','','','0'),
('196','eso_sale','menu','','积分兑换管理','credit','','0','','','0'),
('197','eso_sale','menu','','代理管理','fansmanager','','0','','','0'),
('198','eso_sale','menu','','佣金审核','commission','','0','','','0'),
('199','eso_sale','menu','','物流配送设置','dispatch','','0','','','0'),
('200','eso_sale','menu','','基础设置','rules','','0','','','0'),
('201','eso_sale','menu','','首页广告设置','adv','','0','','','0'),
('202','hx_voice','cover','','普通话在线考试入口设置','voice','','0','','','0'),
('203','stonefish_luckynum','menu','','幸运数字管理','list','','0','','','0'),
('204','thinkidea_secondmarket','menu','','物品管理','goods','','0','','','0'),
('205','thinkidea_secondmarket','menu','','物品分类','category','','0','','','0'),
('206','thinkidea_secondmarket','home','gethometiles','','','','0','','','0'),
('207','feng_duobao','cover','','首页入口设置','index','','0','','','0'),
('208','feng_duobao','menu','','商品管理','goods','','0','','','0'),
('209','feng_duobao','menu','','交易记录','record','','0','','','0'),
('210','feng_duobao','menu','','订单管理','order','','0','','','0'),
('211','feng_duobao','menu','','会员管理','member','','0','','','0'),
('212','feng_duobao','home','','夺宝首页','index','','0','','','0'),
('213','feng_duobao','home','','个人中心','profile','','0','','','0'),
('214','weisrc_businesscenter','cover','','入口设置','index','','0','','','0'),
('215','weisrc_businesscenter','menu','','分类管理','category','','0','','','0'),
('216','weisrc_businesscenter','menu','','商家管理','stores','','0','','','0'),
('217','weisrc_businesscenter','menu','','优惠资讯','news','','0','','','0'),
('218','weisrc_businesscenter','menu','','留言管理','feedback','','0','','','0'),
('219','weisrc_businesscenter','menu','','幻灯片管理','slide','','0','','','0'),
('220','weisrc_businesscenter','menu','','网站设置','setting','','0','','','0'),
('221','weisrc_businesscenter','home','','微商圈','index','','0','','','0'),
('222','lxy_buildpro','menu','','楼盘管理','buildlists','','0','','','0'),
('223','lxy_buildpro','home','gethometiles','','','','0','','','0'),
('224','microb_redpack','menu','','活动参与方式','entry','','0','','','0'),
('225','microb_redpack','menu','','活动管理','activity','','0','','','0'),
('226','microb_redpack','menu','','礼品设置','gifts','','0','','','0'),
('227','microb_redpack','menu','','接口参数','api','','0','','','0'),
('228','ewei_bonus','menu','','活动管理','manage','','0','','','0'),
('229','ewei_bonus','menu','','基础设置','sysset','','0','','','0'),
('230','weisrc_truth','cover','','真心话入口设置','index','','0','','','0'),
('231','weisrc_truth','menu','','问题管理','question','','0','','','0'),
('232','weisrc_truth','menu','','参数设置','setting','','0','','','0'),
('233','weisrc_truth','home','','真心话','index','','0','','','0'),
('234','stonefish_chailihe','cover','','列表入口','listentry','','0','','','0'),
('235','stonefish_chailihe','rule','','参与粉丝','fansdata','','0','','','0'),
('236','stonefish_chailihe','rule','','分享数据','sharedata','','0','','','0'),
('237','stonefish_chailihe','rule','','奖品数据','prizedata','','0','','','0'),
('238','stonefish_chailihe','rule','','粉丝排行','rankdata','','0','','','0'),
('239','stonefish_chailihe','rule','','活动分析','trend','','0','','','0'),
('240','stonefish_chailihe','rule','','消息通知','posttmplmsg','','0','','','0'),
('241','stonefish_chailihe','menu','','活动管理','manage','','0','','','0'),
('242','stonefish_chailihe','menu','','活动模板','template','','0','','','0'),
('243','stonefish_chailihe','menu','','消息模板','tmplmsg','','0','','','0'),
('244','stonefish_chailihe','menu','','礼盒样式','lihestyle','','0','','','0'),
('245','stonefish_chailihe','home','gethomeurl','','','','0','','','0'),
('246','ewei_money','menu','','活动管理','manage','','0','','','0'),
('247','ewei_money','menu','','授权管理','sysset','','0','','','0'),
('248','xfeng_community','cover','','首页入口设置','home','','0','','','0'),
('249','xfeng_community','cover','','公告入口设置','announcement','','0','','','0'),
('250','xfeng_community','cover','','报修入口设置','repair','','0','','','0'),
('251','xfeng_community','cover','','投诉入口设置','report','','0','','','0'),
('252','xfeng_community','cover','','电话入口设置','phone','','0','','','0'),
('253','xfeng_community','cover','','家政入口设置','homemaking','','0','','','0'),
('254','xfeng_community','cover','','租赁入口设置','houselease','','0','','','0'),
('255','xfeng_community','cover','','活动入口设置','activity','','0','','','0'),
('256','xfeng_community','cover','','二手入口设置','fled','','0','','','0'),
('257','xfeng_community','cover','','商家入口设置','business','','0','','','0'),
('258','xfeng_community','cover','','超市入口设置','shopping','','0','','','0'),
('259','xfeng_community','cover','','常用查询入口设置','search','','0','','','0'),
('260','xfeng_community','cover','','物业介绍入口设置','property','','0','','','0'),
('261','xfeng_community','cover','','查物业费入口设置','propertyfree','','0','','','0'),
('262','xfeng_community','menu','getMenuTiles','','','','0','','','0'),
('263','xfeng_community','menu','','小区管理','region','','0','','','0'),
('264','xfeng_community','menu','','菜单设置','nav','','0','','','0'),
('265','xfeng_community','menu','','类型管理','serviceCategory','','0','','','0'),
('266','xfeng_community','menu','','幻灯管理','slide','','0','','','0'),
('267','xfeng_community','menu','','物业介绍','property','','0','','','0'),
('268','xfeng_community','menu','','导航管理','NavExtension','','0','','','0'),
('269','xfeng_community','menu','','小区活动','activity','','0','','','0'),
('270','xfeng_community','menu','','常用查询','search','','0','','','0'),
('271','xfeng_community','menu','','便民号码','phone','','0','','','0'),
('272','xfeng_community','menu','','二手市场','fled','','0','','','0'),
('273','xfeng_community','menu','','小区拼车','carpool','','0','','','0'),
('274','xfeng_community','menu','','商家管理','business','','0','','','0'),
('275','xfeng_community','menu','','超市管理','shopping','','0','','','0'),
('276','xfeng_community','menu','','查物业费','propertyfree','','0','','','0'),
('277','xfeng_community','menu','','黑名单管理','black','','0','','','0'),
('278','jdg_luvwhispers','cover','','情话入口设置','Myindex','','0','','','0'),
('279','jdg_luvwhispers','menu','','访问用户列表','Userlist','','0','','','0'),
('280','jdg_luvwhispers','menu','','情话记录列表','Talklist','','0','','','0'),
('281','jdg_luvwhispers','menu','','举报信息列表','Reportlist','','0','','','0'),
('282','stonefish_redenvelope','menu','','抢红包管理','manage','','0','','','0'),
('283','stonefish_redenvelope','home','gethome','','','','0','','','0'),
('284','stonefish_redenvelope','profile','','全民抢红包','redenvelope','','0','','','0'),
('285','czt_zwmm','cover','','指纹蜜码','index','','0','','','0'),
('286','ewei_couplet','menu','','活动管理','manage','','0','','','0'),
('287','ewei_couplet','menu','','基础设置','sysset','','0','','','0'),
('288','mon_sign','menu','','签到管理','sign','','0','','','0'),
('289','mon_sign','menu','','统计分析','analyse','','0','','','0'),
('290','qiyue_luckymoney','rule','','活动统计','list','','0','','','0'),
('291','null_getvoice','cover','','录音机','set','','0','','','0'),
('292','qiyue_qiuqian','cover','','祈签入口','index','','0','','','0'),
('293','thinkidea_rencai','menu','','招聘企业管理','zhaounit','','0','','','0'),
('294','thinkidea_rencai','menu','','职位分类管理','category','','0','','','0'),
('295','thinkidea_rencai','menu','','行业分类管理','Industry','','0','','','0'),
('296','thinkidea_rencai','menu','','求职简历管理','Resume','','0','','','0'),
('297','thinkidea_rencai','menu','','招聘信息管理','zhaoinfo','','0','','','0'),
('298','thinkidea_rencai','menu','','使用说明必读','readme','','0','','','0'),
('299','thinkidea_rencai','menu','','幻灯图片广告','ADSlider','','0','','','0'),
('300','czt_voice','cover','','入口设置','index','','0','','','0');
INSERT INTO ims_modules_bindings VALUES 
('301','thinkidea_phonebook','menu','','区域管理','zone','','0','','','0'),
('302','thinkidea_phonebook','menu','','分类管理','category','','0','','','0'),
('303','thinkidea_phonebook','menu','','信息管理','bookinfo','','0','','','0'),
('304','str_takeout','cover','','微外卖入口','index','','1','','','0'),
('305','str_takeout','menu','','门店管理','store','','0','','','0'),
('306','str_takeout','menu','','参数设置','config','','0','','','0'),
('307','str_takeout','menu','','系统说明','system','','0','','','0'),
('308','str_takeout','home','','外卖','index','','0','','','0'),
('309','str_takeout','profile','','我的外卖','myorder','','0','','','0'),
('310','weisrc_dish','cover','','首页入口设置','wapindex','','0','','','0'),
('311','weisrc_dish','cover','','门店列表入口','waprestList','','0','','','0'),
('312','weisrc_dish','cover','','商品列表入口','waplist','','0','','','0'),
('313','weisrc_dish','cover','','智能点餐入口','wapselect','','0','','','0'),
('314','weisrc_dish','cover','','我的订单入口','orderlist','','0','','','0'),
('315','weisrc_dish','menu','','门店管理','stores','','0','','','0'),
('316','weisrc_dish','menu','','区域管理','area','','0','','','0'),
('317','weisrc_dish','menu','','黑名单','blacklist','','0','','','0'),
('318','weisrc_dish','menu','','基本设置','setting','','0','','','0'),
('319','weisrc_dish','home','','微点餐','wapindex','','0','','','0'),
('320','weisrc_dish','home','','门店列表','waprestList','','0','','','0'),
('321','weisrc_dish','home','','商品列表','waplist','','0','','','0'),
('322','weisrc_dish','home','','智能点餐','wapselect','','0','','','0'),
('323','weisrc_dish','home','','我的订单','orderlist','','0','','','0'),
('324','eso_runman','rule','','管理','index','','0','','','0'),
('325','eso_runman','menu','','列表','manage','','0','','','0'),
('326','mon_weishare','menu','','助力活动管理','share','','0','','','0'),
('327','mon_weishare','menu','','授权接口设置','setting','','0','','','0'),
('328','lee_tlvoice','cover','','首页入口设置','index','','0','','','0'),
('329','lee_tlvoice','menu','','语音记录','data','','0','','','0'),
('330','zombie_fighting','menu','','题库管理','questions','','0','','','0'),
('331','zombie_fighting','menu','','活动管理','lists','','0','','','0'),
('332','ju_read','menu','','活动管理','list','','0','','','0'),
('333','stonefish_planting','menu','','种植乐园管理','manage','','0','','','0'),
('334','stonefish_planting','menu','','种子管理','seed','','0','','','0'),
('335','stonefish_planting','home','gethome','','','','0','','','0'),
('336','stonefish_planting','profile','','种植乐园','planting','','0','','','0'),
('337','xhw_picvote','menu','','项目管理','project','','0','','','0'),
('338','xhw_picvote','menu','','高级设置','setting','','0','','','0'),
('339','xhw_voice','menu','','项目管理','project','','0','','','0'),
('340','xhw_voice','menu','','高级设置','setting','','0','','','0'),
('341','xhw_face','menu','','照片管理','picture','','0','','','0'),
('342','xhw_face','menu','','参数设置','setting','','0','','','0'),
('343','super_securitycode','menu','','防伪码列表','list','','0','','','0'),
('344','super_securitycode','menu','','生成防伪码','create','','0','','','0'),
('345','super_securitycode','menu','','防伪码导入','insert','','0','','','0'),
('346','super_securitycode','menu','','防伪码导出','list','','0','','','0'),
('347','amouse_house','cover','','最新房产信息入口','index','','0','','','0'),
('348','amouse_house','menu','','房产管理','house','','0','','','0'),
('349','amouse_house','menu','','新楼盘管理','premises','','0','','','0'),
('350','amouse_house','menu','','参数设置','sysset','','0','','','0'),
('351','amouse_house','menu','','幻灯片管理','slide','','0','','','0'),
('352','amouse_house','home','','微站首页','index','','0','','','0'),
('353','mon_yjgz','menu','','关注管理','gz','','0','','','0'),
('354','amouse_article','cover','','精美图文入口','index','','0','','','0'),
('355','amouse_article','cover','','微信互推入口','tuijian','','0','','','0'),
('356','amouse_article','menu','','文章分类','category','','0','','','0'),
('357','amouse_article','menu','','文章管理','paper','','0','','','0'),
('358','amouse_article','menu','','随机广告管理','adv','','0','','','0'),
('359','amouse_article','menu','','幻灯片管理','slide','','0','','','0'),
('360','amouse_article','menu','','一键关注管理','hutui','','0','','','0'),
('361','amouse_article','menu','','设置','sysset','','0','','','0'),
('362','amouse_article','menu','','教程','jiaocheng','','0','','','0'),
('363','jufeng_wcy','cover','','点餐入口设置','dianjia','','0','','','0'),
('364','jufeng_wcy','menu','','店铺与菜系','category','','0','','','0'),
('365','jufeng_wcy','menu','','店铺分类','shoptype','','0','','','0'),
('366','jufeng_wcy','menu','','订单管理','order','','0','','','0'),
('367','jufeng_wcy','menu','','菜品管理','foods','','0','','','0'),
('368','jufeng_wcy','menu','','打印机管理','print','','0','','','0'),
('369','jufeng_wcy','menu','','基本设置','settings','','0','','','0'),
('370','jufeng_wcy','home','','在线订餐','dianjia','','0','','','0'),
('371','jufeng_wcy','profile','','我的订单','order','','0','','','0'),
('372','mon_brand','menu','','品牌管理','brand','','0','','','0'),
('373','lee_coreball','cover','','首页入口设置','index','','0','','','0'),
('374','page_switch','cover','','首页','index','','0','','','0'),
('375','page_switch','menu','','图片管理','upload','','0','','','0'),
('376','mon_fool','menu','','愚人红包管理','fool','','0','','','0'),
('377','amouse_weicard','menu','','基本设置','sysset','','0','','','0'),
('378','amouse_weicard','menu','','名片管理','weicard','','0','','','0'),
('379','ewei_dream','menu','','契约管理','manage','','0','','','0'),
('380','ewei_shangshi','cover','','敲钟上市入口','index','','0','','','0'),
('381','meepo_weixiangqin','cover','','微相亲入口设置','alllist','','0','','','0'),
('382','meepo_weixiangqin','menu','','审核机制','list','','0','','','0'),
('383','meepo_weixiangqin','menu','','审核开关','onoff','','0','','','0'),
('384','meepo_weixiangqin','menu','','推荐申请','tjapply','','0','','','0'),
('385','meepo_weixiangqin','menu','','包月记录','baoyuerecord','','0','','','0'),
('386','meepo_weixiangqin','menu','','基本设置','set','','0','','','0'),
('387','meepo_weixiangqin','menu','','图片管理','photolist','','0','','','0'),
('388','meepo_weixiangqin','menu','','聊天记录','chatcontent','','0','','','0'),
('389','meepo_weixiangqin','menu','','充值记录','payrecord','','0','','','0'),
('390','meepo_weixiangqin','menu','','兑换记录','exchangerecord','','0','','','0'),
('391','meepo_weixiangqin','menu','','幻灯片管理','slide','','0','','','0'),
('392','meepo_weixiangqin','menu','','相亲活动列表','Display','','0','','','0'),
('393','meepo_weixiangqin','menu','','新建相亲活动','Post','','0','','','0'),
('394','amouse_ecard','cover','','我的名片首页','index','','0','','','0'),
('395','amouse_ecard','menu','','基本设置','sysset','','0','','','0'),
('396','amouse_ecard','menu','','名片管理','ecard','','0','','','0'),
('397','amouse_ecard','menu','','背景图片','bg','','0','','','0'),
('398','amouse_ecard','menu','','行业管理','industry','','0','','','0'),
('399','amouse_ecard','menu','','音乐管理','music','','0','','','0'),
('400','wdl_bigwheel','menu','','大转盘管理','manage','','0','','','0'),
('401','wdl_bigwheel','home','getItemTiles','','','','0','','','0'),
('402','xwz_queue','menu','','排号管理','manage','','0','','','0'),
('403','meepo_begging','cover','','我要乞讨','index','','0','','','0'),
('404','meepo_begging','menu','','乞讨管理','manage','','0','','','0'),
('405','meepo_begging','menu','','发放饭钱','money','','0','','','0'),
('406','meepo_begging','menu','','红包参数','hongset','','0','','','0'),
('407','meepo_begging','profile','','我要乞讨','index','','0','','','0'),
('408','fm_photosvote','menu','','管理中心','index','','0','','','0'),
('409','fm_photosvote','home','gettiles','','','','0','','','0'),
('410','wdl_shopping','cover','','商城入口设置','list','','0','','','0'),
('411','wdl_shopping','menu','','订单管理','order','','0','','','0'),
('412','wdl_shopping','menu','','商品管理','goods','','0','','','0'),
('413','wdl_shopping','menu','','商品分类','category','','0','','','0'),
('414','wdl_shopping','menu','','物流管理','express','','0','','','0'),
('415','wdl_shopping','menu','','配送方式','dispatch','','0','','','0'),
('416','wdl_shopping','menu','','幻灯片管理','adv','','0','','','0'),
('417','wdl_shopping','menu','','维权与告警','notice','','0','','','0'),
('418','wdl_shopping','home','','商城','list','','0','','','0'),
('419','wdl_shopping','profile','','我的订单','myorder','','0','','','0'),
('420','microb_shake','menu','','活动参与方式','entry','','0','','','0'),
('421','microb_shake','menu','','活动管理','activity','','0','','','0'),
('422','microb_shake','menu','','礼品设置','gifts','','0','','','0'),
('423','microb_shake','menu','','设备管理','devices','','0','','','0'),
('424','microb_shake','menu','','接口参数','api','','0','','','0'),
('425','feng_auction','cover','','拍卖首页','index','','0','','','0'),
('426','feng_auction','cover','','个人中心','profile','','0','','','0'),
('427','feng_auction','menu','','拍品管理','goods','','0','','','0'),
('428','feng_auction','menu','','充值记录','record','','0','','','0'),
('429','feng_auction','menu','','拍品发货','sendout','','0','','','0'),
('430','feng_auction','menu','','会员管理','member','','0','','','0'),
('431','feng_auction','menu','','提现管理','withdrawals','','0','','','0'),
('432','feng_auction','menu','','幻灯片管理','adv','','0','','','0'),
('433','feng_auction','home','','拍卖首页','index','','0','','','0'),
('434','feng_auction','home','','个人中心','profile','','0','','','0'),
('435','wdl_hchighguess','menu','','词语设置','words','','0','','','0'),
('436','feng_fightgroups','cover','','首页入口','index','','0','','','0'),
('437','feng_fightgroups','cover','','我的团','mygroup','','0','','','0'),
('438','feng_fightgroups','cover','','个人中心','person','','0','','','0'),
('439','feng_fightgroups','cover','','我的订单','myorder','','0','','','0'),
('440','feng_fightgroups','menu','','商品管理','goods','','0','','','0'),
('441','feng_fightgroups','menu','','分类管理','category','','0','','','0'),
('442','feng_fightgroups','menu','','幻灯片管理','adv','','0','','','0'),
('443','feng_fightgroups','menu','','订单管理','order','','0','','','0'),
('444','feng_fightgroups','menu','','打印机管理','print','','0','','','0'),
('445','demo_pia3','cover','','啪啪啪入口设置','Entry','','0','','','0'),
('446','weisrc_dragonboat','menu','','活动管理','manage','','0','','','0'),
('447','weisrc_dragonboat','home','getItemTiles','','','','0','','','0'),
('448','mon_orderform','menu','','商家管理','formManage','','0','','','0'),
('449','mon_orderform','menu','','模板消息配置','TemplateSetting','','0','','','0'),
('450','mon_orderform','menu','','支付参数配置','orderSetting','','0','','','0'),
('451','water_query','cover','','查询入口','index','','0','','','0'),
('452','water_query','menu','','信息录入','info','','0','','','0'),
('453','mx_ssgz','cover','','回复规则','manage','','1','','','0'),
('454','feng_recharge','cover','','充值入口','index','','0','','','0'),
('455','feng_recharge','menu','','充值记录','order','','0','','','0'),
('456','jdg_dream','menu','','梦想管理','manage','','0','','','0'),
('457','zh_zhibo','cover','','入口','index','','0','','','0'),
('458','yx_mishi','cover','','游戏设置','play','','0','','','0'),
('459','yx_stock','cover','','游戏设置','play','','0','','','0'),
('460','francin_lovehelper','cover','','写出你的小情书吧','saylove','','0','','','0'),
('461','francin_lovehelper','menu','','背景音乐文件管理','music','','0','','','0'),
('462','francin_lovehelper','menu','','背景图片管理','bgimage','','0','','','0'),
('463','bobo_love','cover','','七夕入口','index','','0','','','0'),
('464','hc_zqttt','cover','','萌萌跳跳兔','wesites','','0','','','0'),
('465','hc_zqttt','menu','','管理设置','setting','','0','','','0'),
('466','voldemort_moon','cover','','游戏入口','rule1','','0','','','0'),
('467','mon_egg','menu','','砸活动管理','eggManage','','0','','','0'),
('468','n1ce_love','cover','','来电入口','tel','','0','','','0'),
('469','meepo_fen','menu','','管理','index','','0','','','0'),
('470','water_query2','cover','','查询入口','index','','0','','','0'),
('471','water_query2','menu','','信息录入','info','','0','','','0'),
('472','jy_wei','menu','','职位管理','Position','','0','','','0'),
('473','jy_wei','menu','','关键字管理','Keyword','','0','','','0'),
('474','jy_wei','menu','','标签管理','Label','','0','','','0'),
('475','jy_wei','menu','','公司管理','Company','','0','','','0'),
('476','jy_wei','menu','','用户中心','Position','','0','','','0'),
('477','jy_wei','menu','','统计中心','Log','','0','','','0'),
('478','cut_zongzi','cover','','游戏入口','rule1','','0','','','0'),
('479','cut_zongzi','menu','','游戏设置','setting','','0','','','0'),
('480','cut_zongzi','menu','','参与记录','records','','0','','','0'),
('481','n1ce_newchat','menu','','客服聊天记录','Chatlog','','0','','','0'),
('482','fl_wsq_bmfw','menu','','申请管理','regList','','0','','','0'),
('483','fl_wsq_bmfw','menu','','商家管理','list','','0','','','0'),
('484','fl_wsq_bmfw','menu','','前台入口','homesetting','','0','','','0'),
('485','fl_wsq_bmfw','home','','周边商家','lists','','0','','','0'),
('486','zzplane_hhy','cover','','入口设置','from','','0','','','0'),
('487','zzplane_hhy','menu','','参数设置','setting','','0','','','0'),
('488','hong_kuaidi','rule','','添加规则','addrule','','0','','','0'),
('489','hong_kuaidi','menu','','广告设置','ads','','0','','','0'),
('490','lonaking_niulangfly','cover','','游戏设置','play','','0','','','0'),
('491','wmb_goshare','cover','','主题列表管理员入口','list','','0','','','0'),
('492','wmb_goshare','menu','','奖品信息管理','giftset','','0','','','0'),
('493','wmb_goshare','menu','','奖品兑换管理','membergift','','0','','','0'),
('494','wmb_goshare','menu','','奖品分组管理','giftgroupset','','0','','','0'),
('495','wmb_goshare','menu','','主题活动管理','themeset','','0','','','0'),
('496','yg_zongzi','cover','','粽子入口','import','','0','','','0'),
('497','bobo_dabai','cover','','大白治疗师入口设置','index','','0','','','0'),
('498','bobo_dabai','home','','大白治疗师','index','','0','','','0'),
('499','czt_qzz','cover','','切切粽子','index','','0','','','0'),
('500','astro_hhy','rule','','添加规则','addrule','','0','','','0'),
('501','bus_hhy','rule','','添加规则','addrule','','0','','','0'),
('502','enjoy_circle','cover','','朋友圈入口','entry','data','0','','','0'),
('503','enjoy_circle','menu','','活动设置','act','data','0','','','0'),
('504','enjoy_circle','menu','','话题管理','topic','data','0','','','0'),
('505','enjoy_circle','menu','','粉丝管理','fans','data','0','','','0'),
('506','ewei_takephotoa','menu','','活动管理','manage','','0','','','0'),
('507','ewei_takephotoa','menu','','系统设置','sysset','','0','','','0'),
('508','fl_dkf_khxx','menu','','插件入口','homesetting','','0','','','0'),
('509','guess_girl','cover','','游戏入口','play','','0','','','0'),
('510','hc_ybdzs','cover','','月饼大战','wesites','','0','','','0'),
('511','hc_ybdzs','menu','','管理设置','setting','','0','','','0'),
('512','junsion_qixiqueqiao','menu','','活动管理','manage','','0','','','0'),
('513','lions_zq','cover','','游戏入口','zqgame','','0','','','0'),
('514','lions_zq','menu','','参数设置','settings','','0','','','0'),
('515','lions_zq','menu','','得分记录','share','','0','','','0'),
('516','meepo_credit1','cover','','积分充值','index','','0','','','0'),
('517','name_hhy','rule','','添加规则','addrule','','0','','','0'),
('518','on3_voxpic','menu','','管理菜单','Indexsys','','0','','','0'),
('519','sinrch_dataosha','cover','','大逃杀入口','Battle','','0','','','0'),
('520','sinrch_dataosha','menu','','参数设置','setting','','0','','','0'),
('521','wdl_cube','cover','','游戏配置','play','','0','','','0'),
('522','scnace_weblm','cover','','校园快递','weblm','','0','','','0'),
('523','scnace_weblm','rule','','规则','rule','','0','','','0'),
('524','scnace_weblm','shortcut','','快捷功能','shortcut','','0','','','0'),
('525','sunshine_gaokaotoutiao','cover','','规则配置','index','','0','','','0'),
('526','sunshine_gaokaotoutiao','menu','','素材管理','manage','','0','','','0'),
('527','wang_huayu','cover','','首页','index','','0','','','0'),
('528','wdl_daoguo','cover','','游戏配置','play','','0','','','0'),
('529','wdl_damao','cover','','游戏配置','play','','0','','','0'),
('530','wdl_daqie','cover','','游戏配置','play','','0','','','0'),
('531','wdl_daweiwang','cover','','游戏配置','play','','0','','','0'),
('532','wdl_gongfumao','cover','','游戏设置','play','','0','','','0'),
('533','wdl_mazouri','cover','','游戏配置','play','','0','','','0'),
('534','wdl_luolicome','cover','','游戏配置','play','','0','','','0'),
('535','wdl_houzi','cover','','游戏配置','play','','0','','','0'),
('536','wdl_mishi','cover','','游戏配置','play','','0','','','0'),
('537','wdl_motianlou','cover','','游戏配置','play','','0','','','0'),
('538','wdl_nodie','cover','','游戏配置','play','','0','','','0'),
('539','wdl_qiexigua','cover','','游戏配置','play','','0','','','0'),
('540','wdl_sudujiqing','cover','','游戏配置','play','','0','','','0'),
('541','wdl_weizanxiu','menu','','进入微赞秀','index','','0','','','0'),
('542','quick_center','cover','','菜单中心入口','Center','','0','','','0'),
('543','quick_center','menu','','菜单中心','Center','','0','','','0'),
('544','quick_center','home','','菜单中心','Center','','0','','','0'),
('545','yg_supergrowth','cover','','超级成长入口','enter','','0','','','0'),
('546','yhc_ecard','cover','','入口设置','index','','0','','','0'),
('547','meepo_bbs','cover','','任务大厅','task','','0','','','0'),
('548','meepo_bbs','cover','','o2o店员申请','oto','','0','','','0'),
('549','meepo_bbs','cover','','版块入口','forum_cat','','0','','','0'),
('550','meepo_bbs','cover','','个人中心','home','','0','','','0'),
('551','meepo_bbs','cover','','社区首页','forum','','0','','','0'),
('552','meepo_bbs','cover','','积分兑换','activity_token','','0','','','0'),
('553','meepo_bbs','menu','','管理社区','index','','0','','','0'),
('565','water_super','cover','','客户服务入口','index','','0','','','0'),
('566','water_super','cover','','订单查询','counselor','','0','','','0'),
('567','water_super','cover','','工作人员入口','workorder','','0','','','0'),
('568','water_super','menu','','订单管理','order','','0','','','0'),
('569','water_super','menu','','城市管理','city','','0','','','0'),
('570','water_super','menu','','商品管理','goods','','0','','','0'),
('571','water_super','menu','','销售统计','baobiao','','0','','','0'),
('572','water_super','menu','','会员管理','member','','0','','','0'),
('573','water_super','menu','','员工管理','employee','','0','','','0'),
('574','water_super','menu','','商家设置','addshop','','0','','','0'),
('575','bmfloor','rule','','中奖名单','awardlist','','0','','','0'),
('576','hx_securityspro','menu','','防伪码列表','list','','0','','','0'),
('577','hx_securityspro','menu','','生成防伪码','create','','0','','','0'),
('578','hx_securityspro','menu','','防伪码导入','insert','','0','','','0'),
('579','hx_securityspro','menu','','防伪码导出','output','','0','','','0'),
('580','yobydashan','menu','','用户管理','fensi','','0','','','0'),
('581','yobydashan','profile','','搭讪消息','sms','','0','','','0'),
('582','wdl_quickspread','cover','','Top10排行榜','top','','0','','','0'),
('583','wdl_quickspread','cover','','查询推广结果','Follow','','0','','','0'),
('584','wdl_quickspread','cover','','积分查询','Credit','','0','','','0'),
('585','wdl_quickspread','menu','','传单管理','Spread','','0','','','0'),
('586','wdl_quickspread','home','','码上涨粉','Spread','','0','','','0'),
('587','broke','cover','','全民经纪人入口设置','index','','0','','','0'),
('588','broke','cover','','销售员入口设置','counselor','','0','','','0'),
('589','broke','cover','','经理入口设置','acmanager','','0','','','0'),
('590','broke','menu','','佣金管理','commission','','0','','','0'),
('591','broke','menu','','客户管理','customer','','0','','','0'),
('592','broke','menu','','经纪人管理','member','','0','','','0'),
('593','broke','menu','','销售人员管理','counselors','','0','','','0'),
('594','broke','menu','','经理管理','acmanagers','','0','','','0'),
('595','broke','menu','','产品管理','loupan','','0','','','0'),
('596','broke','menu','','身份类型管理','identity','','0','','','0'),
('597','broke','menu','','数据分析','stat','','0','','','0'),
('598','broke','menu','','初始设置','rule','','0','','','0'),
('599','scan_video','rule','','规则1','rule1','','0','','','0'),
('600','scan_video','menu','','门店管理','dptManage','','0','','','0'),
('601','scan_video','menu','','视频管理','videoManage','','0','','','0'),
('602','scan_video','menu','','二维码管理','qrManage','','0','','','0'),
('603','scan_video','menu','','操作说明','info','','0','','','0'),
('604','xf_vktv','menu','','KTV分店','classify','','0','','','0'),
('605','xf_vktv','menu','','KTV包厢','project','','0','','','0'),
('606','xf_vktv','menu','','宣传海报','poster','','0','','','0'),
('607','xf_vktv','menu','','客户点评','comments','','0','','','0'),
('608','xf_vktv','menu','','订单管理','orders','','0','','','0'),
('609','mon_wkj','menu','','砍价活动管理','kjManage','','0','','','0'),
('610','mon_wkj','menu','','参数配置','kjSetting','','0','','','0'),
('611','lvyou','cover','','微旅游入口','index','','0','','','0');
INSERT INTO ims_modules_bindings VALUES 
('612','lvyou','menu','','旅游简介','jianjie','','0','','','0'),
('613','lvyou','menu','','旅游海报','haibao','','0','','','0'),
('614','lvyou','menu','','景区管理','jingqu','','0','','','0'),
('615','lvyou','menu','','景点管理','jingdian','','0','','','0'),
('616','lvyou','menu','','风景相册','xiangce','','0','','','0'),
('617','lvyou','menu','','游客印象','yinxiang','','0','','','0'),
('618','lvyou','menu','','专家点评','dianping','','0','','','0'),
('619','hlzonyu','cover','','入口设置','index','','0','','','0'),
('620','hlzonyu','rule','','查看砍价排行榜','zonyuranklist','','0','','','0'),
('621','hlzonyu','rule','','查看助砍数据','zonyudatalist','','0','','','0'),
('622','hlzonyu','menu','','查看订单','order','','0','','','0'),
('623','cgt_qyhb','cover','','红包结果','enter','','0','','','0'),
('624','cgt_qyhb','cover','','红包入口','sendhb','','0','','','0'),
('625','cgt_qyhb','menu','','红包记录','manage','','0','','','0'),
('626','meepo_bigwall','rule','','审核内容','manage','','0','','','0'),
('627','meepo_bigwall','rule','','中奖名单','awardlist','','0','','','0'),
('628','meepo_bigwall','rule','','黑名单','blacklist','','0','','','0'),
('629','meepo_bigwall','rule','','投票结果','toupiao','','0','','','0'),
('630','meepo_bigwall','rule','','摇一摇结果','yyyres','','0','','','0'),
('631','meepo_bigwall','menu','','基本设置','set','','0','','','0'),
('632','meepo_bigwall','menu','','投票项目管理','checkvote','','0','','','0'),
('633','meepo_bigwall','menu','','抽奖项目管理','awardmanage','','0','','','0'),
('634','meepo_bigwall','home','gettiles','','','','0','','','0'),
('635','meepo_bigwall','home','','上墙内容列表','index','','0','','','0'),
('636','xc_article','menu','','文章管理','article','','0','','','0'),
('637','xc_article','menu','','文章分类','category','','0','','','0'),
('638','xc_article','menu','','分享点击记录','sharetrack','','0','','','0'),
('639','xc_article','menu','','帮助','help','','0','','','0'),
('640','czt_subscribe_redpack','menu','','说明','help','','0','','','0'),
('641','czt_subscribe_redpack','menu','','接口参数','api','','0','','','0'),
('642','czt_subscribe_redpack','menu','','红包设置','activity','','0','','','0'),
('643','czt_subscribe_redpack','menu','','发红包记录','record','','0','','','0'),
('644','feng_fightgroups','menu','','团管理','grouporder','','0','','','0'),
('645','feng_fightgroups','menu','','退款明细','refund','','0','','','0'),
('646','feng_fightgroups','menu','','批量发货','import','','0','','','0'),
('647','wdl_amovie','cover','','查询入口设置','index','','0','','','0'),
('648','mon_house','menu','','相册管理','picSetting','','0','','','0'),
('649','hx_zhongchou','menu','','新闻资讯','news','','0','','','0'),
('650','hx_zhongchou','profile','','支持项目','myorder','','0','','','0'),
('651','hx_zhongchou','profile','','关注项目','mycart','','0','','','0'),
('653','weisrc_feedback','menu','','留言管理','feedback','','0','','','0'),
('654','weisrc_feedback','menu','','参数设置','setting','','0','','','0'),
('655','weisrc_feedback','home','','留言板','index','','0','','','0'),
('656','aki_yzmye','menu','','发放流水','sendlist','','0','','','0'),
('657','aki_yzmye','menu','','验证码设置','codeset','','0','','','0'),
('658','lonaking_activity','cover','','活动引导','Index','','0','','','0'),
('659','lonaking_activity','menu','','活动管理','ActivityManage','','0','','','0'),
('660','lonaking_activity','menu','','报名记录','ActivityRecord','','0','','','0'),
('661','lonaking_fishjoy','cover','','游戏引导','Index','','0','','','0'),
('662','lonaking_fishjoy','menu','','用户管理','PlayerManage','','0','','','0'),
('663','lonaking_fishjoy','menu','','游戏记录','RecordManage','','0','','','0'),
('664','jing_guanzhu','cover','','功能入口','index','','0','','','0'),
('665','bm_qrsign','rule','','签到统计','record','','0','','','0'),
('666','bm_qrsign','rule','','开始抽奖','play','','0','','','0'),
('667','bm_qrsign','rule','','中奖记录','winner','','0','','','0'),
('668','bm_qrsign','rule','','支付记录','payed','','0','','','0'),
('669','bm_qrsign','home','getItemTiles','','','','0','','','0'),
('670','weini_rhino','menu','','活动管理','manage','','0','','','0'),
('671','xm_housekeep_we7','cover','getCoverItems','','','','0','','','0'),
('672','xm_housekeep_we7','cover','','入口设置','xmcover','','0','','','0'),
('673','xm_housekeep_we7','cover','','身份验证','validate','','0','','','0'),
('674','xm_housekeep_we7','menu','','员工管理','staff','','0','','','0'),
('675','xm_housekeep_we7','menu','','服务管理','type','','0','','','0'),
('676','xm_housekeep_we7','menu','','订单管理','order','','0','','','0'),
('677','xm_housekeep_we7','menu','','常见问题','question','','0','','','0'),
('678','xm_housekeep_we7','menu','','服务说明','service','','0','','','0'),
('679','xm_housekeep_we7','menu','','幻灯片','adv','','0','','','0'),
('680','xm_housekeep_we7','menu','','基础数据','base','','0','','','0'),
('681','xm_housekeep_we7','menu','','权限管理','power','','0','','','0'),
('682','xm_housekeep_we7','menu','','提成管理','cut','','0','','','0'),
('683','xm_housekeep_we7','menu','','用户列表','user','','0','','','0'),
('684','kim_financial','menu','','财务中心','FinancialCenter','','0','','','0'),
('685','feng_auction','menu','','拍品分类','category','','0','','','0'),
('686','feng_auction','home','getHomeTiles','','','','0','','','0'),
('687','yg_hcity','cover','','辛福入口','import','','0','','','0'),
('688','tim_cow','cover','','进入爱吹牛','Cover1','','0','','','0'),
('689','tim_cow','menu','','用户管理','User','','0','','','0'),
('690','tim_cow','menu','','全局设置','Set','','0','','','0'),
('691','amouse_friend_impress','cover','','匿名印象入口','index','','0','','','0'),
('692','amouse_friend_impress','menu','','会员管理','manages','','0','','','0'),
('693','amouse_article','menu','','文章评论管理','comment','','0','','','0'),
('694','yg_parkour','menu','','用户管理','Usermge','','0','','','0'),
('695','yg_asty','menu','','用户管理','Usermge','','0','','','0'),
('696','lonaking_bb','cover','','匹配B友','relation','','0','','','0'),
('697','lonaking_bb','menu','','标签管理','tagManage','','0','','','0'),
('698','ice_picwall','cover','','入口1','index','','0','','','0'),
('699','ice_picwall','menu','','照片墙管理','manage','','0','','','0'),
('700','enjoy_red','cover','','红包入口设置','entry','data','0','','','0'),
('701','enjoy_red','menu','','活动设置','basic','data','0','','','0'),
('702','enjoy_red','menu','','红包设置','red','data','0','','','0'),
('703','enjoy_red','menu','','红包记录','log','data','0','','','0'),
('704','fm_jiaoyu','cover','','首页入口设置','wapindex','','0','','','0'),
('705','fm_jiaoyu','menu','','学校管理','school','','0','','','0'),
('706','fm_jiaoyu','menu','','校区设置','area','','0','','','0'),
('707','fm_jiaoyu','menu','','分类设置','type','','0','','','0'),
('708','fm_jiaoyu','menu','','基本设置','basic','','0','','','0'),
('709','mon_jgg','menu','','活动管理','jggManage','','0','','','0'),
('710','mon_qmshake','menu','','摇一摇管理','qmshakeManage','','0','','','0'),
('711','dayu_yuyuepay','cover','','预约入口','index','','0','','','0'),
('712','dayu_yuyuepay','menu','','预约列表','display','','0','','','0'),
('713','dayu_yuyuepay','menu','','新建预约','post','','0','','','0'),
('714','dayu_yuyuepay','menu','','预约项目列表','yyxmdisplay','','0','','','0'),
('715','dayu_yuyuepay','menu','','新增预约项目','yyxmpost','','0','','','0'),
('716','dayu_yuyuepay','home','getHomeTiles','','','','0','','','0'),
('717','dayu_yuyuepay','profile','','我的预约','mydayu_yuyuepay','','0','','','0'),
('730','jy_coupons','cover','','入口','index','','0','','','0'),
('731','jy_coupons','menu','','用户管理','member','','0','','','0'),
('732','jy_coupons','menu','','卡券管理','coupons','','0','','','0'),
('733','jy_coupons','menu','','基本设置','setting','','0','','','0'),
('734','superman_getcash','menu','','提现管理','manage','','0','','','0'),
('735','superman_getcash','profile','','我要提现','getcash','','0','','','0'),
('736','superman_getcash','profile','','提现记录','cashlog','','0','','','0'),
('737','j_activity','cover','','活动列表','list','','0','','','0'),
('738','j_activity','rule','','活动管理','joiner','','0','','','0'),
('739','j_activity','home','getItemTiles','','','','0','','','0'),
('740','j_activity','home','','精彩活动','info','','0','','','0'),
('741','j_activity','profile','','活动记录','history','','0','','','0'),
('742','danwu_show','cover','','首页','index','','0','','','0'),
('743','danwu_show','menu','','粉丝管理','manage','','0','','','0'),
('744','danwu_show','menu','','图片管理','imagesmanage','','0','','','0'),
('745','mb_swish','cover','','创建语音祝福','build','','0','','','0'),
('746','mb_swish','menu','','模块介绍','entry','','0','','','0'),
('747','mb_swish','menu','','祝福列表','records','','0','','','0'),
('748','tp_goods','cover','','商品入口','inside','','0','','','0'),
('749','tp_goods','menu','','添加商品','add','','0','','','0'),
('750','tp_goods','menu','','商品列表','list','','0','','','0'),
('751','jer_da','menu','','用户分析','fans','','0','','','0'),
('752','jer_da','menu','','模块分析','module','','0','','','0'),
('753','jer_da','menu','','清除缓存','flush','','0','','','0'),
('754','jer_da','menu','','使用说明','synopsis','','0','','','0'),
('755','qw_yinpin','cover','','手机入口','yyl','','1','','','0'),
('756','qw_yinpin','menu','','音频列表','yinyue','','0','','','0'),
('757','junsion_poster','menu','','图文海报','poster','','0','','','0'),
('758','junsion_poster','menu','','积分海报','sposter','','0','','','0'),
('759','junsion_poster','menu','','分享海报','mposter','','0','','','0'),
('760','xiaofeng_cexpress','cover','','表白','index','','0','','','0'),
('761','xiaofeng_cexpress','menu','getMenuTiles','','','','0','','','0');


DROP TABLE IF EXISTS ims_mon_egg;
CREATE TABLE `ims_mon_egg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `starttime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `intro` text,
  `music` varchar(500) DEFAULT NULL,
  `banner_bg` varchar(1000) DEFAULT NULL,
  `bg_img` varchar(1000) DEFAULT NULL,
  `share_bg` varchar(1000) DEFAULT NULL,
  `day_count` int(10) DEFAULT NULL,
  `prize_limit` int(10) DEFAULT NULL,
  `dpassword` varchar(20) DEFAULT NULL,
  `follow_url` varchar(1000) DEFAULT NULL,
  `copyright` varchar(100) NOT NULL,
  `follow_dlg_tip` varchar(500) DEFAULT NULL,
  `follow_btn_name` varchar(20) DEFAULT NULL,
  `share_enable` int(1) DEFAULT '0',
  `share_times` int(10) DEFAULT '0',
  `share_award_count` int(10) DEFAULT '0',
  `new_icon` varchar(200) DEFAULT NULL,
  `new_content` varchar(200) DEFAULT NULL,
  `new_title` varchar(200) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `updatetime` int(10) DEFAULT NULL,
  `exchangeEnable` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_egg_prize;
CREATE TABLE `ims_mon_egg_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(100) DEFAULT NULL,
  `egid` int(10) DEFAULT NULL,
  `plevel` varchar(50) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `pimg` varchar(500) DEFAULT NULL,
  `ptype` int(1) DEFAULT NULL,
  `pb` int(10) DEFAULT '0',
  `jf` int(10) DEFAULT '0',
  `pcount` int(10) DEFAULT NULL,
  `display_order` int(3) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_egg_record;
CREATE TABLE `ims_mon_egg_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `egid` int(10) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(200) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `dhtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_egg_share;
CREATE TABLE `ims_mon_egg_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `egid` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(300) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_egg_user;
CREATE TABLE `ims_mon_egg_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `egid` int(10) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  `uname` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_fool;
CREATE TABLE `ims_mon_fool` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `follow_url` varchar(200) NOT NULL,
  `new_title` varchar(200) NOT NULL,
  `new_icon` varchar(200) NOT NULL,
  `new_content` varchar(200) NOT NULL,
  `share_title` varchar(200) NOT NULL,
  `share_icon` varchar(200) NOT NULL,
  `share_content` varchar(200) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_house;
CREATE TABLE `ims_mon_house` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `news_title` varchar(255) NOT NULL,
  `lpaddress` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `sltel` varchar(25) NOT NULL,
  `zxtel` varchar(25) NOT NULL,
  `news_icon` varchar(255) NOT NULL,
  `news_content` varchar(500) NOT NULL,
  `title` varchar(100) NOT NULL,
  `kptime` int(10) DEFAULT '0',
  `rztime` int(10) DEFAULT '0',
  `kfs` varchar(100) NOT NULL,
  `cover_img` varchar(200) NOT NULL,
  `overview_img` varchar(200) NOT NULL,
  `intro_img` varchar(200) NOT NULL,
  `intro` varchar(2000) DEFAULT NULL,
  `order_title` varchar(50) NOT NULL,
  `order_remark` varchar(100) NOT NULL,
  `share_icon` varchar(200) NOT NULL,
  `share_title` varchar(200) NOT NULL,
  `share_content` varchar(500) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  `dt_img` varchar(300) DEFAULT NULL,
  `dt_intro` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_house_agent;
CREATE TABLE `ims_mon_house_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `gname` varchar(255) NOT NULL,
  `headimgurl` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `workyear` int(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_hid` (`hid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_house_item;
CREATE TABLE `ims_mon_house_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `iname` varchar(255) NOT NULL,
  `icontent` varchar(255) NOT NULL,
  `sort` int(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_hid` (`hid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_house_order;
CREATE TABLE `ims_mon_house_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `uname` varchar(20) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  `tel` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_hid` (`hid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_house_pic_image;
CREATE TABLE `ims_mon_house_pic_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `pid` int(11) DEFAULT '0',
  `pre_img` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_house_pic_type;
CREATE TABLE `ims_mon_house_pic_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `pname` varchar(255) NOT NULL,
  `sort` int(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_house_timage;
CREATE TABLE `ims_mon_house_timage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `tid` int(11) DEFAULT '0',
  `pre_img` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_hid` (`hid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_house_type;
CREATE TABLE `ims_mon_house_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `tname` varchar(255) NOT NULL,
  `sort` int(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_hid` (`hid`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_jgg;
CREATE TABLE `ims_mon_jgg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `starttime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `rule` varchar(1000) DEFAULT NULL,
  `join_intro` varchar(1000) DEFAULT NULL,
  `day_play_count` int(3) DEFAULT '0',
  `follow_btn` varchar(50) DEFAULT '点击参加抽奖活动',
  `follow_welbtn` varchar(50) DEFAULT '欢迎参加微信九宫格',
  `follow_url` varchar(200) DEFAULT NULL,
  `copyright` varchar(100) NOT NULL,
  `prize_level_0` varchar(100) DEFAULT '没有中奖',
  `prize_name_0` varchar(100) NOT NULL,
  `prize_img_0` varchar(200) NOT NULL,
  `prize_p_0` int(3) NOT NULL,
  `prize_level_1` varchar(100) DEFAULT '一等奖',
  `prize_name_1` varchar(100) NOT NULL,
  `prize_img_1` varchar(200) NOT NULL,
  `prize_p_1` int(3) NOT NULL DEFAULT '0',
  `prize_num_1` int(10) NOT NULL,
  `prize_level_2` varchar(100) DEFAULT '二等奖',
  `prize_name_2` varchar(100) NOT NULL,
  `prize_img_2` varchar(200) NOT NULL,
  `prize_p_2` int(3) NOT NULL,
  `prize_num_2` int(10) NOT NULL DEFAULT '0',
  `prize_level_3` varchar(100) DEFAULT '三等奖',
  `prize_name_3` varchar(100) NOT NULL,
  `prize_img_3` varchar(200) NOT NULL,
  `prize_p_3` int(3) NOT NULL,
  `prize_num_3` int(10) NOT NULL DEFAULT '0',
  `prize_level_4` varchar(100) DEFAULT '四等奖',
  `prize_name_4` varchar(100) NOT NULL,
  `prize_img_4` varchar(200) NOT NULL,
  `prize_p_4` int(3) NOT NULL,
  `prize_num_4` int(10) NOT NULL DEFAULT '0',
  `prize_level_5` varchar(100) DEFAULT '五等奖',
  `prize_name_5` varchar(100) NOT NULL,
  `prize_img_5` varchar(200) NOT NULL,
  `prize_p_5` int(3) NOT NULL,
  `prize_num_5` int(10) NOT NULL DEFAULT '0',
  `prize_level_6` varchar(100) DEFAULT '六等奖',
  `prize_name_6` varchar(100) NOT NULL,
  `prize_img_6` varchar(200) NOT NULL,
  `prize_p_6` int(3) NOT NULL,
  `prize_num_6` int(10) NOT NULL DEFAULT '0',
  `prize_level_7` varchar(100) DEFAULT '七等奖',
  `prize_name_7` varchar(100) NOT NULL,
  `prize_img_7` varchar(200) NOT NULL,
  `prize_p_7` int(3) NOT NULL,
  `prize_num_7` int(10) NOT NULL DEFAULT '0',
  `award_count` int(10) DEFAULT '0',
  `new_title` varchar(200) DEFAULT NULL,
  `new_icon` varchar(200) DEFAULT NULL,
  `new_content` varchar(200) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `day_award_count` int(10) DEFAULT '0',
  `bg` varchar(1000) DEFAULT NULL,
  `bgcolor` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_jgg_sn;
CREATE TABLE `ims_mon_jgg_sn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `sn` varchar(500) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_jgg_user;
CREATE TABLE `ims_mon_jgg_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jid` int(10) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_jgg_user_award;
CREATE TABLE `ims_mon_jgg_user_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jid` int(10) NOT NULL,
  `uid` varchar(200) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `award_name` varchar(200) NOT NULL,
  `award_level` varchar(200) NOT NULL,
  `level` int(3) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `remark` varchar(200) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_jgg_user_record;
CREATE TABLE `ims_mon_jgg_user_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jid` int(10) NOT NULL,
  `uid` varchar(200) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `award_name` varchar(200) NOT NULL,
  `award_level` varchar(200) NOT NULL,
  `level` int(3) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_orderform;
CREATE TABLE `ims_mon_orderform` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(11) NOT NULL,
  `oname` varchar(200) DEFAULT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `odesc` text,
  `address` varchar(200) DEFAULT NULL,
  `p_tel` varchar(50) DEFAULT NULL,
  `p_desc` text,
  `lng` decimal(18,10) NOT NULL DEFAULT '0.0000000000',
  `lat` decimal(18,10) NOT NULL DEFAULT '0.0000000000',
  `location_p` varchar(100) NOT NULL,
  `location_c` varchar(100) NOT NULL,
  `location_a` varchar(100) NOT NULL,
  `p_title_pg` varchar(500) DEFAULT NULL,
  `p_titile_url` varchar(500) DEFAULT NULL,
  `copyright` varchar(50) DEFAULT NULL,
  `follow_url` varchar(200) DEFAULT NULL,
  `new_title` varchar(200) DEFAULT NULL,
  `new_icon` varchar(200) DEFAULT NULL,
  `new_content` varchar(200) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `createtime` int(10) DEFAULT NULL,
  `updatetime` int(10) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `emailenable` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_orderform_item;
CREATE TABLE `ims_mon_orderform_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) DEFAULT NULL,
  `iname` varchar(200) DEFAULT NULL,
  `ititle` varchar(500) DEFAULT NULL,
  `ititle_pg` varchar(500) DEFAULT NULL,
  `ititle_url` varchar(500) DEFAULT NULL,
  `y_price` float(6,2) DEFAULT NULL,
  `x_price` float(6,2) DEFAULT NULL,
  `i_desc` text,
  `i_summary` varchar(50) DEFAULT NULL,
  `o_tel` varchar(50) DEFAULT NULL,
  `pay_type` int(1) DEFAULT NULL,
  `o_num` int(3) DEFAULT NULL,
  `displayorder` int(3) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_orderform_order;
CREATE TABLE `ims_mon_orderform_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderno` varchar(100) DEFAULT NULL,
  `outno` varchar(300) DEFAULT NULL,
  `acid` varchar(100) DEFAULT NULL,
  `fid` int(10) DEFAULT NULL,
  `iid` int(10) DEFAULT NULL,
  `openid` varchar(200) NOT NULL,
  `nickname` varchar(300) DEFAULT NULL,
  `headimgurl` varchar(300) DEFAULT NULL,
  `uname` varchar(300) DEFAULT NULL,
  `utel` varchar(50) DEFAULT NULL,
  `ordertime` int(10) DEFAULT NULL,
  `paytime` int(10) DEFAULT NULL,
  `ordernum` int(3) DEFAULT NULL,
  `o_yprice` int(3) DEFAULT NULL,
  `o_xprice` int(3) DEFAULT NULL,
  `zf_price` int(3) DEFAULT NULL,
  `js_price` int(3) DEFAULT NULL,
  `pay_type` int(3) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_orderform_setting;
CREATE TABLE `ims_mon_orderform_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `appid` varchar(200) DEFAULT NULL,
  `appsecret` varchar(200) DEFAULT NULL,
  `mchid` varchar(100) DEFAULT NULL,
  `shkey` varchar(100) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_orderform_template;
CREATE TABLE `ims_mon_orderform_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `ordertid` varchar(500) DEFAULT NULL,
  `orderenable` int(1) DEFAULT NULL,
  `payenable` int(1) DEFAULT NULL,
  `paytid` varchar(500) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_qmshake;
CREATE TABLE `ims_mon_qmshake` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `starttime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `shake_follow_enable` int(1) DEFAULT NULL,
  `copyright` varchar(50) DEFAULT NULL,
  `randking_count` int(10) DEFAULT NULL,
  `follow_url` varchar(200) DEFAULT NULL,
  `new_title` varchar(200) DEFAULT NULL,
  `new_icon` varchar(200) DEFAULT NULL,
  `new_content` varchar(200) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `createtime` int(10) DEFAULT NULL,
  `updatetime` int(10) DEFAULT NULL,
  `rule` varchar(2000) DEFAULT NULL,
  `top_banner` varchar(500) DEFAULT NULL,
  `top_banner_title` varchar(100) DEFAULT NULL,
  `top_banner_show` int(1) DEFAULT '0',
  `top_banner_url` varchar(500) DEFAULT NULL,
  `follow_dlg_tip` varchar(500) DEFAULT NULL,
  `follow_btn_name` varchar(20) DEFAULT NULL,
  `shake_day_limit` int(3) DEFAULT '0',
  `prize_limit` int(3) DEFAULT '0',
  `total_limit` int(3) DEFAULT '0',
  `dpassword` varchar(20) DEFAULT NULL,
  `title_bg` varchar(300) DEFAULT NULL,
  `shake_bg` varchar(300) DEFAULT NULL,
  `index_bg` varchar(300) DEFAULT NULL,
  `share_bg` varchar(300) DEFAULT NULL,
  `share_enable` int(1) DEFAULT '0',
  `share_times` int(3) DEFAULT '0',
  `share_award_count` int(3) DEFAULT '0',
  `share_url` varchar(1000) DEFAULT NULL,
  `unstarttip` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_qmshake_prize;
CREATE TABLE `ims_mon_qmshake_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `p_summary` varchar(500) DEFAULT NULL,
  `pimg` varchar(250) DEFAULT NULL,
  `p_url` varchar(250) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `pcount` int(10) DEFAULT NULL,
  `left_count` int(10) DEFAULT NULL,
  `pb` int(10) DEFAULT '0',
  `display_order` int(3) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `tgs` varchar(250) DEFAULT NULL,
  `tgs_url` varchar(1000) DEFAULT NULL,
  `virtual_count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_qmshake_record;
CREATE TABLE `ims_mon_qmshake_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(200) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `djtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_qmshake_share;
CREATE TABLE `ims_mon_qmshake_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(300) DEFAULT NULL,
  `award_count` int(10) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_qmshake_user;
CREATE TABLE `ims_mon_qmshake_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) DEFAULT NULL,
  `openid` varchar(200) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_sign;
CREATE TABLE `ims_mon_sign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `follow_credit` int(10) NOT NULL,
  `follow_credit_allow` int(1) DEFAULT '0',
  `leave_credit_clear` int(1) DEFAULT '0',
  `sign_credit` int(11) DEFAULT '0',
  `sync_credit` int(1) DEFAULT '0',
  `rule` varchar(2000) DEFAULT NULL,
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `sin_suc_msg` varchar(200) DEFAULT NULL,
  `sin_suc_fail` varchar(200) DEFAULT NULL,
  `new_title` varchar(200) DEFAULT NULL,
  `new_icon` varchar(200) DEFAULT NULL,
  `new_content` varchar(200) DEFAULT NULL,
  `copyright` varchar(200) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_sign_award;
CREATE TABLE `ims_mon_sign_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned DEFAULT NULL,
  `uid` int(10) NOT NULL,
  `sign_type` int(2) NOT NULL,
  `serial_start_time` int(10) DEFAULT NULL,
  `serial_end_time` int(10) DEFAULT NULL,
  `serial_day` int(10) DEFAULT NULL,
  `credit` int(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_sign_link;
CREATE TABLE `ims_mon_sign_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned DEFAULT NULL,
  `sort` int(2) DEFAULT '0',
  `link_name` varchar(50) NOT NULL,
  `link_url` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_sign_record;
CREATE TABLE `ims_mon_sign_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `sid` int(10) DEFAULT '0',
  `sin_time` int(10) DEFAULT '0',
  `credit` int(10) NOT NULL,
  `sign_type` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_sign_serial;
CREATE TABLE `ims_mon_sign_serial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned DEFAULT NULL,
  `day` int(4) NOT NULL,
  `credit` int(10) DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_sign_token;
CREATE TABLE `ims_mon_sign_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `access_token` varchar(1000) NOT NULL,
  `expires_in` int(11) DEFAULT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_sign_user;
CREATE TABLE `ims_mon_sign_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL,
  `begin_sign_time` int(10) DEFAULT NULL,
  `end_sign_time` int(10) DEFAULT NULL,
  `openid` varchar(200) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `headimgurl` varchar(200) DEFAULT NULL,
  `serial_id` int(10) DEFAULT NULL,
  `credit` int(10) DEFAULT '0',
  `sin_count` int(10) DEFAULT '0',
  `sin_serial` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_wkj;
CREATE TABLE `ims_mon_wkj` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `starttime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `p_kc` int(10) DEFAULT '0',
  `p_y_price` float(10,2) DEFAULT NULL,
  `p_low_price` float(10,2) DEFAULT NULL,
  `yf_price` float(10,2) DEFAULT '0.00',
  `p_pic` varchar(200) DEFAULT NULL,
  `p_preview_pic` varchar(200) DEFAULT NULL,
  `follow_url` varchar(200) DEFAULT NULL,
  `copyright` varchar(100) NOT NULL,
  `new_title` varchar(200) DEFAULT NULL,
  `new_icon` varchar(200) DEFAULT NULL,
  `new_content` varchar(200) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `p_url` varchar(500) DEFAULT NULL,
  `copyright_url` varchar(500) DEFAULT NULL,
  `hot_tel` varchar(50) DEFAULT NULL,
  `p_intro` varchar(1000) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `kj_dialog_tip` varchar(1000) DEFAULT NULL,
  `rank_tip` varchar(1000) DEFAULT NULL,
  `u_fist_tip` varchar(1000) DEFAULT NULL,
  `u_already_tip` varchar(1000) DEFAULT NULL,
  `fk_fist_tip` varchar(1000) DEFAULT NULL,
  `fk_already_tip` varchar(1000) DEFAULT NULL,
  `kj_rule` varchar(1000) DEFAULT NULL,
  `pay_type` int(2) DEFAULT NULL,
  `p_model` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_wkj_firend;
CREATE TABLE `ims_mon_wkj_firend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `k_price` float(10,2) DEFAULT NULL,
  `kh_price` float(10,2) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_wkj_order;
CREATE TABLE `ims_mon_wkj_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `openid` varchar(200) DEFAULT NULL,
  `order_no` varchar(100) DEFAULT NULL,
  `wxorder_no` varchar(100) DEFAULT NULL,
  `y_price` float(10,2) DEFAULT NULL,
  `kh_price` float(10,2) DEFAULT NULL,
  `yf_price` float(10,2) DEFAULT NULL,
  `total_price` float(10,2) DEFAULT NULL,
  `pay_type` int(2) DEFAULT NULL,
  `p_model` varchar(1000) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `wxnotify` varchar(200) DEFAULT NULL,
  `notifytime` int(10) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_wkj_setting;
CREATE TABLE `ims_mon_wkj_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `appid` varchar(200) DEFAULT NULL,
  `appsecret` varchar(200) DEFAULT NULL,
  `mchid` varchar(100) DEFAULT NULL,
  `shkey` varchar(100) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_wkj_user;
CREATE TABLE `ims_mon_wkj_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` int(10) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `price` float(10,2) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_yjgz;
CREATE TABLE `ims_mon_yjgz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `banner_pic` varchar(300) NOT NULL,
  `banner_desc` varchar(1000) NOT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_mon_yjgz_item;
CREATE TABLE `ims_mon_yjgz_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `i_desc` varchar(500) NOT NULL,
  `i_url` varchar(300) NOT NULL,
  `sort` int(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_moncom_neighbors;
CREATE TABLE `ims_moncom_neighbors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `nname` varchar(200) NOT NULL,
  `banner_pic` varchar(200) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_music_reply;
CREATE TABLE `ims_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(300) NOT NULL DEFAULT '',
  `hqurl` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_news_reply;
CREATE TABLE `ims_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL DEFAULT '0',
  `author` varchar(64) NOT NULL,
  `createtime` int(10) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_nsign_add;
CREATE TABLE `ims_nsign_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `shop` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `thumb` text NOT NULL,
  `content` text NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_nsign_prize;
CREATE TABLE `ims_nsign_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `award` text NOT NULL,
  `time` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_nsign_record;
CREATE TABLE `ims_nsign_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` text NOT NULL,
  `today_rank` int(11) NOT NULL,
  `sign_time` int(11) NOT NULL,
  `last_sign_time` int(11) NOT NULL,
  `continue_sign_days` int(11) NOT NULL,
  `maxcontinue_sign_days` int(11) NOT NULL,
  `total_sign_num` int(11) NOT NULL,
  `maxtotal_sign_num` int(11) NOT NULL,
  `first_sign_days` int(11) NOT NULL,
  `maxfirst_sign_days` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_nsign_reply;
CREATE TABLE `ims_nsign_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `title` text NOT NULL,
  `picture` text NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_profile_fields;
CREATE TABLE `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `unchangeable` tinyint(1) NOT NULL DEFAULT '0',
  `showinregister` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

INSERT INTO ims_profile_fields VALUES 
('1','realname','1','真实姓名','','0','1','1','1'),
('2','nickname','1','昵称','','1','1','0','1'),
('3','avatar','1','头像','','1','0','0','0'),
('4','qq','1','QQ号','','0','0','0','1'),
('5','mobile','1','手机号码','','0','0','0','0'),
('6','vip','1','VIP级别','','0','0','0','0'),
('7','gender','1','性别','','0','0','0','0'),
('8','birthyear','1','出生生日','','0','0','0','0'),
('9','constellation','1','星座','','0','0','0','0'),
('10','zodiac','1','生肖','','0','0','0','0'),
('11','telephone','1','固定电话','','0','0','0','0'),
('12','idcard','1','证件号码','','0','0','0','0'),
('13','studentid','1','学号','','0','0','0','0'),
('14','grade','1','班级','','0','0','0','0'),
('15','address','1','邮寄地址','','0','0','0','0'),
('16','zipcode','1','邮编','','0','0','0','0'),
('17','nationality','1','国籍','','0','0','0','0'),
('18','resideprovince','1','居住地址','','0','0','0','0'),
('19','graduateschool','1','毕业学校','','0','0','0','0'),
('20','company','1','公司','','0','0','0','0'),
('21','education','1','学历','','0','0','0','0'),
('22','occupation','1','职业','','0','0','0','0'),
('23','position','1','职位','','0','0','0','0'),
('24','revenue','1','年收入','','0','0','0','0'),
('25','affectivestatus','1','情感状态','','0','0','0','0'),
('26','lookingfor','1',' 交友目的','','0','0','0','0'),
('27','bloodtype','1','血型','','0','0','0','0'),
('28','height','1','身高','','0','0','0','0'),
('29','weight','1','体重','','0','0','0','0'),
('30','alipay','1','支付宝帐号','','0','0','0','0'),
('31','msn','1','MSN','','0','0','0','0'),
('32','email','1','电子邮箱','','0','0','0','0'),
('33','taobao','1','阿里旺旺','','0','0','0','0'),
('34','site','1','主页','','0','0','0','0'),
('35','bio','1','自我介绍','','0','0','0','0'),
('36','interest','1','兴趣爱好','','0','0','0','0');


DROP TABLE IF EXISTS ims_qiyue_canvas;
CREATE TABLE `ims_qiyue_canvas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL DEFAULT '',
  `attach` varchar(200) NOT NULL DEFAULT '',
  `diggtop` int(10) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ischeck` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `viewnum` int(10) NOT NULL DEFAULT '0',
  `sharenum` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_qiyue_luckymoney;
CREATE TABLE `ims_qiyue_luckymoney` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `picurl` varchar(200) NOT NULL DEFAULT '',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `logourl` varchar(200) NOT NULL DEFAULT '',
  `musicurl` varchar(200) NOT NULL DEFAULT '',
  `ruletxt` varchar(300) NOT NULL DEFAULT '',
  `viewnum` int(11) DEFAULT '0',
  `fansnum` int(11) DEFAULT '0',
  `sharenum` int(11) DEFAULT '0',
  `share_imgurl` varchar(100) DEFAULT '',
  `share_title` varchar(100) DEFAULT '',
  `share_desc` varchar(200) DEFAULT '',
  `share_link` varchar(200) DEFAULT '',
  PRIMARY KEY (`rid`),
  KEY `uniacid` (`rid`,`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_qiyue_luckymoney_fans;
CREATE TABLE `ims_qiyue_luckymoney_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `uid` int(10) unsigned DEFAULT '0',
  `nickname` varchar(30) DEFAULT '',
  `avatar` varchar(250) DEFAULT '',
  `mobile` char(11) DEFAULT '',
  `viewnum` int(11) DEFAULT '0',
  `opennum` tinyint(5) NOT NULL DEFAULT '0',
  `friends` text NOT NULL,
  `prize` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_qiyue_qiuqian;
CREATE TABLE `ims_qiyue_qiuqian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL DEFAULT '',
  `filename` varchar(200) NOT NULL DEFAULT '',
  `myorder` tinyint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`id`,`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_qrcode;
CREATE TABLE `ims_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL DEFAULT '0',
  `qrcid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket` varchar(250) NOT NULL DEFAULT '',
  `expire` int(10) unsigned NOT NULL DEFAULT '0',
  `subnum` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `url` varchar(80) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrcid` (`qrcid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_qrcode_stat;
CREATE TABLE `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `qrcid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `scene_str` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_quick_center_module_bindings;
CREATE TABLE `ims_quick_center_module_bindings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `groupid` varchar(50) NOT NULL COMMENT '分组名称',
  `identifier` varchar(50) NOT NULL COMMENT '菜单标示符',
  `pidentifier` varchar(50) NOT NULL COMMENT '上级菜单标示符',
  `displayorder` int(11) NOT NULL COMMENT '显示顺序',
  `title` varchar(50) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `thumb` varchar(1000) NOT NULL,
  `module` varchar(1000) NOT NULL,
  `do` varchar(100) NOT NULL COMMENT '打开按钮的跳转链接',
  `callback` varchar(10240) NOT NULL,
  `rich_callback_enable` int(11) NOT NULL DEFAULT '0',
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_qw_yinpin;
CREATE TABLE `ims_qw_yinpin` (
  `uniacid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `yinpin` varchar(255) DEFAULT NULL,
  `disorder` int(11) DEFAULT '0',
  `status` int(1) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `xq` text NOT NULL,
  PRIMARY KEY (`id`,`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_qyhb_user;
CREATE TABLE `ims_qyhb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `user_id` varchar(100) NOT NULL COMMENT '用户id',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `user_image` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `ipaddr` varchar(30) DEFAULT NULL COMMENT '用户ip地址',
  `status` varchar(1) DEFAULT NULL COMMENT '是否发放红包',
  `num` int(11) DEFAULT '0',
  `referee` varchar(100) DEFAULT NULL COMMENT '推荐人id',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_recharge_adv;
CREATE TABLE `ims_recharge_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_recharge_order;
CREATE TABLE `ims_recharge_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `ordersn` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_research;
CREATE TABLE `ims_research` (
  `reid` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL,
  `content` text NOT NULL,
  `information` varchar(500) NOT NULL DEFAULT '',
  `thumb` varchar(200) NOT NULL DEFAULT '',
  `inhome` tinyint(4) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `starttime` int(10) NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `pretotal` int(10) unsigned NOT NULL DEFAULT '1',
  `noticeemail` varchar(50) NOT NULL DEFAULT '',
  `alltotal` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '预约总人数',
  `uyan` int(20) NOT NULL,
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '通知手机号码',
  PRIMARY KEY (`reid`),
  KEY `weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_research_data;
CREATE TABLE `ims_research_data` (
  `redid` bigint(20) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL,
  `rerid` int(11) NOT NULL,
  `refid` int(11) NOT NULL,
  `data` varchar(800) NOT NULL,
  PRIMARY KEY (`redid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_research_fields;
CREATE TABLE `ims_research_fields` (
  `refid` int(11) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `essential` tinyint(4) NOT NULL DEFAULT '0',
  `bind` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `displayorder` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`refid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_research_order;
CREATE TABLE `ims_research_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `rerid` int(11) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `mobile` bigint(50) NOT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `order_sn` varchar(20) NOT NULL,
  `price` decimal(11,2) DEFAULT '0.00',
  `status` tinyint(4) NOT NULL COMMENT '0已完成，1等待支付',
  `pay_type` tinyint(11) unsigned NOT NULL COMMENT '支付类型',
  `pay_pattern` int(1) DEFAULT '1' COMMENT '支付方式 1-在线付款，2-货到付款',
  `other` varchar(100) NOT NULL DEFAULT '',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_sn_uniacid` (`order_sn`,`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_research_reply;
CREATE TABLE `ims_research_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `reid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_research_rows;
CREATE TABLE `ims_research_rows` (
  `rerid` int(11) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rerid`),
  KEY `reid` (`reid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_rule;
CREATE TABLE `ims_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO ims_rule VALUES 
('1','0','城市天气','userapi','255','1'),
('2','0','百度百科','userapi','255','1'),
('3','0','即时翻译','userapi','255','1'),
('4','0','今日老黄历','userapi','255','1'),
('5','0','看新闻','userapi','255','1'),
('6','0','快递查询','userapi','255','1'),
('7','1','个人中心入口设置','cover','0','1'),
('8','1','微赞团队入口设置','cover','0','1');


DROP TABLE IF EXISTS ims_rule_keyword;
CREATE TABLE `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_content` (`content`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO ims_rule_keyword VALUES 
('1','1','0','userapi','^.+天气$','3','255','1'),
('2','2','0','userapi','^百科.+$','3','255','1'),
('3','2','0','userapi','^定义.+$','3','255','1'),
('4','3','0','userapi','^@.+$','3','255','1'),
('5','4','0','userapi','日历','1','255','1'),
('6','4','0','userapi','万年历','1','255','1'),
('7','4','0','userapi','黄历','1','255','1'),
('8','4','0','userapi','几号','1','255','1'),
('9','5','0','userapi','新闻','1','255','1'),
('10','6','0','userapi','^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$','3','255','1'),
('11','7','1','cover','个人中心','1','0','1'),
('12','8','1','cover','首页','1','0','1');


DROP TABLE IF EXISTS ims_scene_cube_app;
CREATE TABLE `ims_scene_cube_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `listorder` int(11) NOT NULL,
  `iden` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `title` varchar(300) NOT NULL DEFAULT '',
  `thumb` varchar(300) NOT NULL,
  `qrcode` varchar(300) NOT NULL,
  `author` varchar(300) NOT NULL,
  `series` varchar(50) NOT NULL,
  `isshow` tinyint(2) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO ims_scene_cube_app VALUES 
('1','0','style2','800','【再一次?极致诱惑】唤起你对性感的记忆','http://wx.yvkj.cn/attachment/images/1/2014/12/j0YfUxEXY3S3qKKZykQioTHioqMkhe.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/Ubwy8t5BWPHpW7TpP8TYY5PYp8EjRS.png','Scene App','微赞科技','1','0'),
('2','0','style4','800','我与自己久别重逢（EVERGREEN）','http://wx.yvkj.cn/attachment/images/1/2014/12/NoP2uo7u1IXZil7TT8uU181789aSJS.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/P0XRrm01GLD2d624Dy016l0l6890L1.png','Scene App','微赞科技','1','0'),
('3','0','style6','800','一场冰冷世界的革命','http://wx.yvkj.cn/attachment/images/1/2014/12/e91N18rB6BOG6d31R16k8Oi9Nr6bvR.png','http://wx.yvkj.cn/attachment/images/1/2014/12/xfMT3R33RZhTprKnzHEiyfnRRuIftH.png','Scene App','微赞科技','1','0'),
('4','0','style3','800','变形金刚4?绝迹重生','http://wx.yvkj.cn/attachment/images/1/2014/12/ES5X5F1MMDf1i41e111m51s5PDdIrG.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/IBGQ6hb5qgBDtGKk8m16W1zkM1p6wH.png','Scene App','微赞科技','1','0'),
('5','0','style7','800','iPhone6 再一次创造','http://wx.yvkj.cn/attachment/images/1/2014/12/GA3VVffFuJtXT225kMXUVrtVz6xuTT.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/n3N42iK3i2RqrR4r493Z1152e92f4T.png','Scene App','微赞科技','1','0'),
('6','0','style8','800','2014 NEW FUN 泳池趴','http://wx.yvkj.cn/attachment/images/1/2014/12/sVVIoZSOgg9O9AVGgOa8lisaSov3Gu.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/EA310BKa1oUuH145B24zkT4H2k4725.png','Scene App','微赞科技','1','1411316941'),
('7','0','style9','800','办公家具 就选优的！','http://wx.yvkj.cn/attachment/images/1/2014/12/HC4GSkNhMs4CXMSMSmq1u1EPSm3Qz1.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/hW5hPH88sk2gg8GCv8v51s7eiu8sI2.png','Scene App','微赞科技','1','1411372542'),
('8','0','custom','800','自定义场景','http://wx.yvkj.cn/attachment/images/1/2014/12/xSIVVg3JIv36O6GCrsgookvP3jOWOo.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/kTLGl3TT6lR538JO6ETJo36uvtgbBg.jpg','Scene App','微赞科技','1','1411372542'),
('9','0','style5','800','周年邀请函','http://wx.yvkj.cn/attachment/images/1/2014/12/r58jb4JXbp549pv1ZVNBJjhYpYPV4p.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/Yzf3Bn3bDnsnbaaBvbTk3KATkDnSsZ.png','Scene App','微赞科技','1','1418961963'),
('10','0','style10','800','飞跃彩虹','http://wx.yvkj.cn/attachment/images/1/2014/12/c2gAZa2GgA0afrGcGmZLM8rpfPGRPF.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/BW9Q2tjV0wI29cZ1Ts1Cq0c92s1S1w.png','Scene App','微赞科技','1','1418967102'),
('11','0','style12','800','九章别墅','http://wx.yvkj.cn/attachment/images/1/2014/12/iL0KI0B2SbsbCu12BucBeEpG1LPHuJ.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/rlUOEUUjulxzxoSb0Go9Bsr9gUogJA.png','Scene App','微赞科技','1','1418967212'),
('12','0','onefound','800','壹基金','http://wx.yvkj.cn/attachment/images/1/2014/12/oo1oYPy7J474y71E1OLP1jEoslojS7.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/sjTi9T9W42DOt2Z2xOWw72ZJi9gojJ.png','Scene App','微赞科技','1','1418970832'),
('13','0','employ','800','改变世界非你莫属','http://wx.yvkj.cn/attachment/images/1/2014/12/vRAx3d1GXu88Qa2xep3YpD19PplURZ.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/cT9gtVfVpedqyGJrz49fqt9Jqzy1bS.png','Scene App','微赞科技','1','1418971650'),
('14','0','style13','800','3D相册','http://wx.yvkj.cn/attachment/images/1/2014/12/cQ86tfRUbERZtBBrFZBRQqzf7qK0aK.jpg','http://wx.yvkj.cn/attachment/images/1/2014/12/lo6346qeV4jKWeqWnn34EfhYqkyJhN.png','Scene App','微赞科技','1','1418974137'),
('15','0','hammer','800','锤子手机','http://wx.yvkj.cn/attachment/images/1/2014/12/hgTWayViyBjL9Zr9ALYR5Rj9ygDQ5k.png','http://wx.yvkj.cn/attachment/images/1/2014/12/q49H4IHV9dy4iZh44d9I1IiLid4dHH.png','Scene App','微赞科技','1','1418975113');


DROP TABLE IF EXISTS ims_scene_cube_book;
CREATE TABLE `ims_scene_cube_book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0',
  `list_id` int(11) NOT NULL,
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `str1` varchar(200) NOT NULL DEFAULT '',
  `str2` varchar(200) NOT NULL DEFAULT '',
  `str3` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_scene_cube_comment;
CREATE TABLE `ims_scene_cube_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `from` varchar(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `from_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_scene_cube_list;
CREATE TABLE `ims_scene_cube_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `s_id` int(11) NOT NULL,
  `iden` varchar(50) NOT NULL,
  `cover` varchar(300) NOT NULL,
  `cover_title` varchar(50) NOT NULL,
  `cover_subtitle` varchar(50) DEFAULT NULL,
  `cover1` varchar(300) NOT NULL,
  `cover2` varchar(300) NOT NULL,
  `thumb` varchar(300) NOT NULL,
  `share_title` varchar(200) NOT NULL DEFAULT '',
  `share_thumb` varchar(300) NOT NULL DEFAULT '',
  `share_content` varchar(1000) NOT NULL,
  `share_cb_url` varchar(500) NOT NULL,
  `share_cb_tel` varchar(20) NOT NULL,
  `diyurl` varchar(100) NOT NULL DEFAULT '',
  `share_cover` varchar(300) NOT NULL DEFAULT '',
  `share_url` varchar(300) NOT NULL DEFAULT '',
  `share_txt` varchar(500) NOT NULL DEFAULT '',
  `share_button` varchar(300) NOT NULL,
  `share_tips` varchar(300) NOT NULL,
  `reply_title` varchar(50) NOT NULL,
  `reply_thumb` varchar(300) NOT NULL,
  `reply_description` varchar(1000) NOT NULL,
  `isadvanced` int(3) NOT NULL DEFAULT '0',
  `advanced_thumb` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL DEFAULT '',
  `emailtitle` varchar(100) NOT NULL,
  `first_type` tinyint(2) NOT NULL,
  `first_btn_select` varchar(10) NOT NULL,
  `first_btn_value` varchar(500) NOT NULL,
  `bg_music_switch` tinyint(4) NOT NULL,
  `bg_music_icon` tinyint(4) NOT NULL,
  `bg_music_url` varchar(300) NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `hits` int(10) NOT NULL,
  `shares` int(10) NOT NULL,
  `tongji` varchar(1000) NOT NULL,
  `isyuyue` tinyint(1) NOT NULL DEFAULT '0',
  `iscomment` tinyint(1) NOT NULL DEFAULT '0',
  `isdemo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_scene_cube_manage;
CREATE TABLE `ims_scene_cube_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `appnums` int(11) NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_scene_cube_page;
CREATE TABLE `ims_scene_cube_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `list_id` varchar(50) NOT NULL DEFAULT '',
  `listorder` int(11) NOT NULL,
  `m_type` tinyint(4) NOT NULL,
  `thumb` varchar(300) NOT NULL,
  `param` text NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_scene_cube_reply;
CREATE TABLE `ims_scene_cube_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `list_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shake_member;
CREATE TABLE `ims_shake_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `shakecount` int(10) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(500) NOT NULL DEFAULT '',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为不可摇奖，1为可摇奖',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_openid_replyid` (`openid`,`rid`),
  KEY `idx_replyid` (`rid`),
  KEY `idx_shakecount` (`rid`,`shakecount`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shake_reply;
CREATE TABLE `ims_shake_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `cover` varchar(255) NOT NULL DEFAULT '',
  `qrcode` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `rule` text NOT NULL,
  `speed` int(10) unsigned NOT NULL DEFAULT '3000',
  `speedandroid` int(10) unsigned NOT NULL DEFAULT '8000',
  `interval` int(10) unsigned NOT NULL DEFAULT '100',
  `countdown` tinyint(1) unsigned NOT NULL DEFAULT '10',
  `maxshake` int(10) unsigned NOT NULL DEFAULT '100',
  `maxwinner` int(10) unsigned NOT NULL DEFAULT '1',
  `maxjoin` int(10) unsigned NOT NULL,
  `joinprobability` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为未开始，1为进行中，2为已结束',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shangjia_ada;
CREATE TABLE `ims_shangjia_ada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=9288 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_adv;
CREATE TABLE `ims_shopping_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_cart;
CREATE TABLE `ims_shopping_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `goodsid` int(11) NOT NULL,
  `goodstype` tinyint(1) NOT NULL DEFAULT '1',
  `from_user` varchar(50) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `optionid` int(10) DEFAULT '0',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_openid` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_category;
CREATE TABLE `ims_shopping_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_dispatch;
CREATE TABLE `ims_shopping_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `dispatchname` varchar(50) DEFAULT '',
  `dispatchtype` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `firstprice` decimal(10,2) DEFAULT '0.00',
  `secondprice` decimal(10,2) DEFAULT '0.00',
  `firstweight` int(11) DEFAULT '0',
  `secondweight` int(11) DEFAULT '0',
  `express` int(11) DEFAULT '0',
  `description` text,
  `enabled` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_express;
CREATE TABLE `ims_shopping_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `express_name` varchar(50) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `express_price` varchar(10) DEFAULT '',
  `express_area` varchar(100) DEFAULT '',
  `express_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_feedback;
CREATE TABLE `ims_shopping_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为维权，2为告擎',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0未解决，1用户同意，2用户拒绝',
  `feedbackid` varchar(30) NOT NULL COMMENT '投诉单号',
  `transid` varchar(30) NOT NULL COMMENT '订单号',
  `reason` varchar(1000) NOT NULL COMMENT '理由',
  `solution` varchar(1000) NOT NULL COMMENT '期待解决方案',
  `remark` varchar(1000) NOT NULL COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_feedbackid` (`feedbackid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_transid` (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_goods;
CREATE TABLE `ims_shopping_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为实体，2为虚拟',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `unit` varchar(5) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `goodssn` varchar(50) NOT NULL DEFAULT '',
  `productsn` varchar(50) NOT NULL DEFAULT '',
  `marketprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `costprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `originalprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `total` int(10) unsigned NOT NULL DEFAULT '0',
  `totalcnf` int(11) DEFAULT '0' COMMENT '0 拍下减库存 1 付款减库存 2 永久不减',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `spec` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `maxbuy` int(11) DEFAULT '0',
  `usermaxbuy` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户最多购买数量',
  `hasoption` int(11) DEFAULT '0',
  `dispatch` int(11) DEFAULT '0',
  `thumb_url` text,
  `isnew` int(11) DEFAULT '0',
  `ishot` int(11) DEFAULT '0',
  `isdiscount` int(11) DEFAULT '0',
  `isrecommand` int(11) DEFAULT '0',
  `istime` int(11) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `viewcount` int(11) DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_goods_option;
CREATE TABLE `ims_shopping_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `productprice` decimal(10,2) DEFAULT '0.00',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `costprice` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `displayorder` int(11) DEFAULT '0',
  `specs` text,
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_goods_param;
CREATE TABLE `ims_shopping_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_order;
CREATE TABLE `ims_shopping_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `ordersn` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `sendtype` tinyint(1) unsigned NOT NULL COMMENT '1为快递，2为自提',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `goodstype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `addressid` int(10) unsigned NOT NULL,
  `address` varchar(1024) NOT NULL DEFAULT '' COMMENT '收货地址信息',
  `expresscom` varchar(30) NOT NULL DEFAULT '',
  `expresssn` varchar(50) NOT NULL DEFAULT '',
  `express` varchar(200) NOT NULL DEFAULT '',
  `goodsprice` decimal(10,2) DEFAULT '0.00',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `dispatch` int(10) DEFAULT '0',
  `paydetail` varchar(255) NOT NULL COMMENT '支付详情',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_order_goods;
CREATE TABLE `ims_shopping_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `goodsid` int(10) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(10) unsigned NOT NULL DEFAULT '1',
  `optionid` int(10) DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `optionname` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_product;
CREATE TABLE `ims_shopping_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NOT NULL,
  `productsn` varchar(50) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `marketprice` decimal(10,0) unsigned NOT NULL,
  `productprice` decimal(10,0) unsigned NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `spec` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodsid` (`goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_spec;
CREATE TABLE `ims_shopping_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `displaytype` tinyint(3) unsigned NOT NULL,
  `content` text NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_shopping_spec_item;
CREATE TABLE `ims_shopping_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `show` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_specid` (`specid`),
  KEY `indx_show` (`show`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_sinrch_dataosha_setting;
CREATE TABLE `ims_sinrch_dataosha_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `subscribe_num` varchar(255) CHARACTER SET utf8 NOT NULL,
  `subscribe_skill` varchar(255) CHARACTER SET utf8 NOT NULL,
  `subscribe_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `subscribe_game` varchar(255) CHARACTER SET utf8 NOT NULL,
  `share_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `share_desc` varchar(255) CHARACTER SET utf8 NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_site_article;
CREATE TABLE `ims_site_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL DEFAULT '0',
  `ishot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `template` varchar(300) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(500) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT '',
  `credit` varchar(255) NOT NULL DEFAULT '',
  `incontent` tinyint(1) NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_site_category;
CREATE TABLE `ims_site_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL DEFAULT '',
  `ishomepage` tinyint(1) NOT NULL DEFAULT '0',
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  `template` varchar(300) NOT NULL DEFAULT '',
  `templatefile` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_site_multi;
CREATE TABLE `ims_site_multi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `bindhost` varchar(255) NOT NULL,
  `quickmenu` varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `bindhost` (`bindhost`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO ims_site_multi VALUES 
('1','1','微赞团队','1','','1','','');


DROP TABLE IF EXISTS ims_site_nav;
CREATE TABLE `ims_site_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(50) NOT NULL DEFAULT '',
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL DEFAULT '',
  `position` tinyint(4) NOT NULL DEFAULT '1',
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(500) NOT NULL DEFAULT '',
  `css` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `categoryid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_site_page;
CREATE TABLE `ims_site_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_site_slide;
CREATE TABLE `ims_site_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `displayorder` tinyint(4) NOT NULL DEFAULT '0',
  `multiid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_site_styles;
CREATE TABLE `ims_site_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

INSERT INTO ims_site_styles VALUES 
('1','1','1','微站默认模板_gC5C');


DROP TABLE IF EXISTS ims_site_styles_vars;
CREATE TABLE `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_site_templates;
CREATE TABLE `ims_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(30) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `sections` int(10) unsigned NOT NULL,
  `version` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

INSERT INTO ims_site_templates VALUES 
('1','default','微站默认模板','由微赞提供默认微站模板套系','微赞团队','http://012wz.com','1','0',''),
('2','style_car','微站微汽车','由微赞提供微站微汽车','012微赞','http://bbs.b2ctui.com','other','0',''),
('3','style99','微赞微站模板99','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('4','style98','微赞微站模板98','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('5','style96','微赞微站模板96','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('6','style95','微赞微站模板95','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('7','style94','微赞微站模板94','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('8','style93','微赞微站模板93','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('9','style92','微赞微站模板92','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('10','style91','微赞模板91','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('11','style90','微赞模板90','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('12','style9','微赞style9','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','car','0','5.0'),
('13','style89','微赞模板89','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('14','style88','微赞模板88','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('15','style87','微赞模板87','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('16','style86','微赞模板86','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('17','style85','微赞模板85','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('18','style84','微赞模板84','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('19','style83','微赞模板83','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('20','style82','微赞模板82','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('21','style81','微赞模板81','由微赞提供默认微站模板套系，刷新看事例，请自行上传30*30px大小的png格式透明分类图片','WDL','http://bbs.b2ctui.com','other','0',''),
('22','style80','微赞模板80','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('23','style8','微赞style8','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','shoot','0','5.0'),
('24','style79','微赞模板79','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('25','style78','微赞模板78','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('26','style77','微赞模板77','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('27','style76','微赞模板76','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('28','style75','微赞模板75','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('29','style74','微赞模板74','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('30','style73','微赞模板73','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('31','style72','微赞模板72','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('32','style71','微赞模71','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('33','style70','微赞模板70','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('34','style7','微赞style7','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('35','style69','微赞模板69','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('36','style68','微赞模板68','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('37','style67','微赞模板67','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('38','style66','微赞模板66','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('39','style65','微赞模板65','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('40','style64','微赞模板64','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('41','style63','微赞模板63','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('42','style62','微赞模板62','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('43','style61','微赞模板61','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('44','style60','微赞模板60','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('45','style6','微赞style6','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('46','style59','微赞模板59','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('47','style58','微赞模板58','由微赞提供默认微站模板套系','WDL','http://bbs.b2ctui.com','other','0',''),
('48','style57','微赞style57','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('49','style56','微赞style56','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('50','style55','微赞style55','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('51','style54','微赞style54','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('52','style53','微赞style53','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('53','style52','微赞style52','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('54','style51','微赞style51','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('55','style50','微赞style50','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('56','style5','微赞style5','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','car','0','5.0'),
('57','style49','微赞style49','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('58','style48','微赞style48','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('59','style47','微赞style47','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('60','style46','微赞style46','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('61','style45','微赞style45','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('62','style44','微赞style44','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('63','style43','微赞style43','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('64','style42','微赞style42','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('65','style41','微赞style41','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('66','style40','微赞style40','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('67','style4','微赞style4','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','car','0','5.0'),
('68','style39','微赞style39','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('69','style38','微赞style38','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('70','style37','微赞style37','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('71','style36','微赞style36','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','medical','0',''),
('72','style35','微赞style35','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('73','style34','微赞style34','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('74','style33','微赞style33','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('75','style32','微赞style32','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0',''),
('76','style31','微赞style31','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','drink','0',''),
('77','style30','微赞style30','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('78','style3','微赞style3','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','4.0'),
('79','style29','微赞style29','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('80','style28','微赞style28','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('81','style27','微赞style27','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('82','style26','微赞style26','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('83','style25','微赞style25','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('84','style24','微赞style24','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('85','style23','微赞style23','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','4.0'),
('86','style22','微赞style22','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','4.0'),
('87','style21','微赞style21','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('88','style20','微赞style20','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('89','style2','微赞style2','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','cosmetology','0','5.0'),
('90','style19','微赞style19','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','drink','0','6.0'),
('91','style18','微赞style18','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','4.0'),
('92','style17','微赞style17','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('93','style16','微赞style16','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('94','style15','微赞style15','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','tourism','0','5.0'),
('95','style14','微赞style14','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','5.0'),
('96','style13','微赞style13','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','realty','0','5.0'),
('97','style12','微赞style12','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','often','0','4.0'),
('98','style118','微赞微站模板118','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('99','style117','微赞微站模板117','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('100','style116','微赞微站模板116','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('101','style113','微赞微站模板113','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('102','style112','微赞微站模板112','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('103','style111','微赞微站模板111','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('104','style110','微赞微站模板110','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('105','style11','微赞style11','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','shoot','0','5.0'),
('106','style108','微赞微站模板108','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('107','style107','微赞微站模板107','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('108','style106','微赞微站模板106','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('109','style105','微赞微站模板105','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('110','style104','微赞微站模板104','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('111','style103','微赞微站模板103','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('112','style102','微赞微站模板102','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('113','style101','微赞微站模板101','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('114','style100','微赞微站模板100','由微赞微站模板套系','weidongli Team','http://bbs.b2ctui.com','other','0',''),
('115','style10','微赞style10','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','shoot','0','5.0'),
('116','style1','微赞style1','由微赞提供默认微站模板套系','微赞','http://bbs.012wz.com','drink','0','4.0');


DROP TABLE IF EXISTS ims_solution_acl;
CREATE TABLE `ims_solution_acl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `module` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `eid` int(10) unsigned NOT NULL DEFAULT '0',
  `do` varchar(255) NOT NULL,
  `state` varchar(1000) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_eid` (`eid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stat_fans;
CREATE TABLE `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ims_stat_fans VALUES 
('1','33','1','0','9','20160212'),
('2','1','0','0','0','20160221');


DROP TABLE IF EXISTS ims_stat_keyword;
CREATE TABLE `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stat_msg_history;
CREATE TABLE `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stat_rule;
CREATE TABLE `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_exchange;
CREATE TABLE `ims_stonefish_bigwheel_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `awardingtype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '单独兑奖1统一兑奖2',
  `beihuo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启备货1开启0关闭',
  `beihuo_tips` varchar(20) DEFAULT '' COMMENT '备货提示词',
  `awardingpas` varchar(10) DEFAULT '' COMMENT '兑奖密码',
  `inventory` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖后库存1中奖减少2为兑奖后减少',
  `awardingstarttime` int(10) DEFAULT '0' COMMENT '兑奖开始时间',
  `awardingendtime` int(10) DEFAULT '0' COMMENT '兑奖结束时间',
  `awarding_tips` varchar(50) DEFAULT '' COMMENT '兑奖参数提示词',
  `awardingaddress` varchar(50) DEFAULT '' COMMENT '兑奖地点',
  `awardingtel` varchar(50) DEFAULT '' COMMENT '兑奖电话',
  `baidumaplng` varchar(10) DEFAULT '' COMMENT '兑奖导航',
  `baidumaplat` varchar(10) DEFAULT '' COMMENT '兑奖导航',
  `before` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖资料活动前还是中奖后1前2为后',
  `isrealname` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入姓名0为不需要1为需要',
  `ismobile` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入手机号0为不需要1为需要',
  `isqq` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入QQ号0为不需要1为需要',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入邮箱0为不需要1为需要',
  `isaddress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入地址0为不需要1为需要',
  `isgender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入性别0为不需要1为需要',
  `istelephone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入固定电话0为不需要1为需要',
  `isidcard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入证件号码0为不需要1为需要',
  `iscompany` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入公司名称0为不需要1为需要',
  `isoccupation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职业0为不需要1为需要',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职位0为不需要1为需要',
  `isfans` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0只保存本模块下1同步更新至官方FANS表',
  `isfansname` varchar(225) NOT NULL DEFAULT '真实姓名,手机号码,QQ号,邮箱,地址,性别,固定电话,证件号码,公司名称,职业,职位' COMMENT '显示字段名称',
  `tmplmsg_participate` int(11) DEFAULT '0' COMMENT '参与消息模板',
  `tmplmsg_winning` int(11) DEFAULT '0' COMMENT '中奖消息模板',
  `tmplmsg_exchange` int(11) DEFAULT '0' COMMENT '兑奖消息模板',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_fans;
CREATE TABLE `ims_stonefish_bigwheel_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT '联系QQ号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `idcard` varchar(30) NOT NULL DEFAULT '' COMMENT '证件号码',
  `company` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `occupation` varchar(30) NOT NULL DEFAULT '' COMMENT '职业',
  `position` varchar(30) NOT NULL DEFAULT '' COMMENT '职位',
  `inpoint` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '起始数',
  `outpoint` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已兑换数',
  `sharepoint` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分享助力',
  `sharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `share_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `sharetime` int(10) unsigned NOT NULL COMMENT '最后分享时间',
  `createtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `lasttime` int(10) unsigned NOT NULL COMMENT '最后参与时间',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `ticketid` int(11) DEFAULT '0' COMMENT '店员或商家网点ID',
  `ticketname` varchar(50) DEFAULT '' COMMENT '店员或商家网点名称',
  `zhongjiang` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否中奖',
  `xuni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟中奖',
  `todaynum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '今日参与次数',
  `totalnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总参与次数',
  `tosharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享使用次数',
  `awardnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '获奖次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁止',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_fansaward;
CREATE TABLE `ims_stonefish_bigwheel_fansaward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户openid',
  `prizeid` int(11) DEFAULT '0' COMMENT '奖品ID',
  `codesn` varchar(20) DEFAULT '0' COMMENT '中奖唯一码',
  `createtime` int(10) DEFAULT '0' COMMENT '领取时间',
  `consumetime` int(10) DEFAULT '0' COMMENT '使用时间',
  `openstatus` tinyint(1) DEFAULT '0' COMMENT '是否拆开',
  `zhongjiangtime` int(10) DEFAULT '0' COMMENT '中奖时间',
  `zhongjiang` tinyint(1) DEFAULT '0' COMMENT '是否中奖0未中奖1中奖2兑奖',
  `xuni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟中奖',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `ticketid` int(11) DEFAULT '0' COMMENT '店员或商家网点ID',
  `ticketname` varchar(50) DEFAULT '' COMMENT '店员或商家网点名称',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_prizeid` (`prizeid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_fanstmplmsg;
CREATE TABLE `ims_stonefish_bigwheel_fanstmplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户openid',
  `tmplmsgid` int(11) DEFAULT '0' COMMENT '消息模板ID',
  `tmplmsg` text NOT NULL COMMENT '发送内容',
  `createtime` int(10) DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_prizeid` (`tmplmsgid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_prize;
CREATE TABLE `ims_stonefish_bigwheel_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `prizetype` varchar(20) NOT NULL COMMENT '奖品类型真实虚拟积分等',
  `prizevalue` int(10) NOT NULL COMMENT '积分或实物以及虚拟价值',
  `prizerating` varchar(50) NOT NULL COMMENT '奖品等级',
  `prizename` varchar(50) NOT NULL COMMENT '奖品名称',
  `prizepic` varchar(255) NOT NULL COMMENT '奖品图片',
  `prizetotal` int(10) NOT NULL COMMENT '奖品数量',
  `prizedraw` int(10) NOT NULL COMMENT '中奖数量',
  `prizeren` int(10) NOT NULL COMMENT '每人最多中奖',
  `prizeday` int(10) NOT NULL COMMENT '每天最多发奖',
  `probalilty` varchar(5) NOT NULL COMMENT '中奖概率%',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `break` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '需要帮助人数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_prizemika;
CREATE TABLE `ims_stonefish_bigwheel_prizemika` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `prizeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖品ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `mikacodesn` varchar(100) NOT NULL COMMENT '密卡字符串',
  `virtual_value` int(10) NOT NULL COMMENT '积分或实物以及虚拟价值',
  `actionurl` varchar(200) NOT NULL COMMENT '激活地址',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否领取1为领取过',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_reply;
CREATE TABLE `ims_stonefish_bigwheel_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `templateid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动模板ID',
  `title` varchar(50) DEFAULT '' COMMENT '活动标题',
  `description` varchar(255) DEFAULT '' COMMENT '活动简介',
  `start_picurl` varchar(200) DEFAULT '' COMMENT '活动开始图片',
  `end_title` varchar(50) DEFAULT '' COMMENT '结束标题',
  `end_description` varchar(200) DEFAULT '' COMMENT '活动结束简介',
  `end_picurl` varchar(200) DEFAULT '' COMMENT '活动结束图片',
  `isshow` tinyint(1) DEFAULT '1' COMMENT '活动是否停止0为暂停1为活动中',
  `starttime` int(10) DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) DEFAULT '0' COMMENT '结束时间',
  `music` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否打开背景音乐',
  `musicurl` varchar(255) NOT NULL DEFAULT '' COMMENT '背景音乐地址',
  `mauto` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '音乐是否自动播放',
  `mloop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否循环播放',
  `issubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与类型0为任意1为关注粉丝2为会员',
  `visubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '助力类型',
  `fansnum` int(10) DEFAULT '0' COMMENT '参与人数',
  `viewnum` int(10) DEFAULT '0' COMMENT '访问次数',
  `prize_num` int(10) DEFAULT '0' COMMENT '奖品总数',
  `award_num` int(11) DEFAULT '0' COMMENT '每人最多获奖次数',
  `award_num_tips` varchar(100) DEFAULT '' COMMENT '超过中奖数量提示',
  `number_times` int(11) DEFAULT '0' COMMENT '每人最多参与次数',
  `number_times_tips` varchar(100) DEFAULT '' COMMENT '超过总次数提示',
  `day_number_times` int(11) DEFAULT '0' COMMENT '每人每天最多参与次数',
  `day_number_times_tips` varchar(100) DEFAULT '' COMMENT '超过每天次数提示',
  `viewawardnum` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '首页显示中奖人数',
  `viewranknum` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排行榜人数',
  `showprize` tinyint(1) DEFAULT '0' COMMENT '是否显示奖品',
  `prizeinfo` text NOT NULL COMMENT '奖品详细介绍',
  `awardtext` varchar(1000) DEFAULT '' COMMENT '中奖提示文字',
  `notawardtext` varchar(1000) DEFAULT '' COMMENT '没有中奖提示文字',
  `notprizetext` varchar(1000) DEFAULT '' COMMENT '没有奖品提示文字',
  `msgadpic` varchar(1000) DEFAULT '' COMMENT '消息提示广告图',
  `msgadpictime` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '消息提示时效',
  `tips` varchar(200) DEFAULT '' COMMENT '活动次数提示',
  `copyright` varchar(20) DEFAULT '' COMMENT '版权',
  `inpointstart` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '初始分值1',
  `inpointend` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '初始分值2',
  `power` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否获取助力者头像昵称1opneid 2头像昵称',
  `poweravatar` varchar(3) DEFAULT '0' COMMENT '头像大小',
  `powertype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '助力类型0访问助力1点击助力',
  `randompointstart` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '助力随机金额范围开始数',
  `randompointend` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '助力随机金额范围结束数',
  `addp` tinyint(1) DEFAULT '100' COMMENT '好友助力机率%',
  `limittype` tinyint(1) DEFAULT '0' COMMENT '限制类型0为只能一次1为每天一次',
  `totallimit` tinyint(1) DEFAULT '1' COMMENT '好友助力总次数制',
  `helptype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '互助0为互助1为禁止',
  `xuninum` int(10) unsigned NOT NULL DEFAULT '500' COMMENT '虚拟人数',
  `xuninumtime` int(10) unsigned NOT NULL DEFAULT '86400' COMMENT '虚拟间隔时间',
  `xuninuminitial` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '虚拟随机数值1',
  `xuninumending` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '虚拟随机数值2',
  `xuninum_time` int(10) unsigned NOT NULL COMMENT '虚拟更新时间',
  `adpic` varchar(255) DEFAULT '' COMMENT '活动页顶部广告图',
  `adpicurl` varchar(255) DEFAULT '' COMMENT '活动页顶部广告链接',
  `homepictime` tinyint(1) unsigned NOT NULL COMMENT '首页秒显图片显示时间',
  `homepictype` tinyint(1) unsigned NOT NULL COMMENT '首页广告类型1为每次2为每天3为每周4为仅1次',
  `homepic` varchar(225) NOT NULL COMMENT '首页秒显图片',
  `opportunity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与次数选项0活动设置1商户赠送2为积分购买',
  `opportunity_txt` text NOT NULL COMMENT '商户赠送/积分购买说明',
  `othermodule` varchar(50) DEFAULT '' COMMENT '其他模块',
  `credit_type` varchar(20) DEFAULT '' COMMENT '积分类型',
  `credit_value` int(11) DEFAULT '0' COMMENT '积分购买多少积分',
  `turntable` tinyint(1) DEFAULT '0' COMMENT '转盘类型0普通1为九宫格',
  `turntablenum` tinyint(1) DEFAULT '6' COMMENT '奖品数量',
  `bigwheelpic` varchar(225) NOT NULL COMMENT '转盘图',
  `bigwheelimg` varchar(225) NOT NULL COMMENT '指针图',
  `bigwheelimgan` varchar(225) NOT NULL COMMENT '九宫格按钮',
  `bigwheelimgbg` varchar(225) NOT NULL COMMENT '九宫格转动背景图',
  `prizeDeg` varchar(225) NOT NULL COMMENT '中奖角度设置',
  `lostDeg` varchar(225) NOT NULL COMMENT '未中奖角度设置',
  `againDeg` varchar(225) NOT NULL COMMENT '再来一次角度设置',
  `createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_share;
CREATE TABLE `ims_stonefish_bigwheel_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `acid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '子公众号ID',
  `help_url` varchar(255) DEFAULT '' COMMENT '帮助关注引导页',
  `share_url` varchar(255) DEFAULT '' COMMENT '参与关注引导页',
  `share_open_close` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启作用',
  `share_title` varchar(50) DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(100) DEFAULT '' COMMENT '分享简介',
  `share_txt` text NOT NULL COMMENT '参与活动规则',
  `share_img` varchar(255) NOT NULL COMMENT '分享朋友或朋友圈图',
  `share_anniu` varchar(255) NOT NULL COMMENT '分享朋友或朋友圈按钮或文字',
  `share_firend` varchar(255) NOT NULL COMMENT '助力按钮',
  `share_pic` varchar(255) NOT NULL COMMENT '分享弹出图片',
  `share_confirm` varchar(200) DEFAULT '' COMMENT '分享成功提示语',
  `share_confirmurl` varchar(255) DEFAULT '' COMMENT '分享成功跳转URL',
  `share_fail` varchar(200) DEFAULT '' COMMENT '分享失败提示语',
  `share_cancel` varchar(200) DEFAULT '' COMMENT '分享中途取消提示语',
  `sharetimes` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为每天次数2为总次数',
  `sharetype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分享赠送类型0分享立即赠送1分享成功赠送',
  `sharenumtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分享赠送机会类型0单独赠送机会1每人赠送机会2分享共计赠送',
  `sharenum` varchar(5) DEFAULT '0' COMMENT '分享赠送礼盒基数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_acid` (`acid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_sharedata;
CREATE TABLE `ims_stonefish_bigwheel_sharedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '分享人openid',
  `fromuser` varchar(50) NOT NULL DEFAULT '' COMMENT '访问人openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `visitorsip` varchar(15) NOT NULL DEFAULT '' COMMENT '访问IP',
  `visitorstime` int(10) unsigned NOT NULL COMMENT '访问时间',
  `point` decimal(10,2) DEFAULT '0.00' COMMENT '助力金额',
  `viewnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_template;
CREATE TABLE `ims_stonefish_bigwheel_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(20) DEFAULT '' COMMENT '模板名称',
  `thumb` varchar(255) DEFAULT '' COMMENT '模板缩略图',
  `fontsize` varchar(2) DEFAULT '12' COMMENT '文字大小',
  `bgimg` varchar(255) DEFAULT '' COMMENT '背景图',
  `bgcolor` varchar(7) DEFAULT '' COMMENT '背景色',
  `textcolor` varchar(7) DEFAULT '' COMMENT '文字色',
  `textcolorlink` varchar(7) DEFAULT '' COMMENT '链接文字色',
  `buttoncolor` varchar(7) DEFAULT '' COMMENT '按钮色',
  `buttontextcolor` varchar(7) DEFAULT '' COMMENT '按钮文字色',
  `rulecolor` varchar(7) DEFAULT '' COMMENT '规则框背景色',
  `ruletextcolor` varchar(7) DEFAULT '' COMMENT '规则框文字色',
  `navcolor` varchar(7) DEFAULT '' COMMENT '导航色',
  `navtextcolor` varchar(7) DEFAULT '' COMMENT '导航文字色',
  `navactioncolor` varchar(7) DEFAULT '' COMMENT '导航选中文字色',
  `watchcolor` varchar(7) DEFAULT '' COMMENT '弹出框背景色',
  `watchtextcolor` varchar(7) DEFAULT '' COMMENT '弹出框文字色',
  `awardcolor` varchar(7) DEFAULT '' COMMENT '兑奖框背景色',
  `awardtextcolor` varchar(7) DEFAULT '' COMMENT '兑奖框文字色',
  `awardscolor` varchar(7) DEFAULT '' COMMENT '兑奖框成功背景色',
  `awardstextcolor` varchar(7) DEFAULT '' COMMENT '兑奖框成功文字色',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_bigwheel_tmplmsg;
CREATE TABLE `ims_stonefish_bigwheel_tmplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `template_id` varchar(50) DEFAULT '' COMMENT '模板ID',
  `template_name` varchar(20) DEFAULT '' COMMENT '模板名称',
  `topcolor` varchar(7) DEFAULT '' COMMENT '通知文字色',
  `first` varchar(100) DEFAULT '' COMMENT '标题',
  `firstcolor` varchar(7) DEFAULT '' COMMENT '标题文字色',
  `keyword1` varchar(100) DEFAULT '' COMMENT '参数1',
  `keyword1code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword1color` varchar(7) DEFAULT '' COMMENT '参数1文字色',
  `keyword2` varchar(100) DEFAULT '' COMMENT '参数2',
  `keyword2code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword2color` varchar(7) DEFAULT '' COMMENT '参数2文字色',
  `keyword3` varchar(100) DEFAULT '' COMMENT '参数3',
  `keyword3code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword3color` varchar(7) DEFAULT '' COMMENT '参数3文字色',
  `keyword4` varchar(100) DEFAULT '' COMMENT '参数4',
  `keyword4code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword4color` varchar(7) DEFAULT '' COMMENT '参数4文字色',
  `keyword5` varchar(100) DEFAULT '' COMMENT '参数5',
  `keyword5code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword5color` varchar(7) DEFAULT '' COMMENT '参数5文字色',
  `keyword6` varchar(100) DEFAULT '' COMMENT '参数6',
  `keyword6code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword6color` varchar(7) DEFAULT '' COMMENT '参数6文字色',
  `keyword7` varchar(100) DEFAULT '' COMMENT '参数7',
  `keyword7code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword7color` varchar(7) DEFAULT '' COMMENT '参数7文字色',
  `keyword8` varchar(100) DEFAULT '' COMMENT '参数8',
  `keyword8code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword8color` varchar(7) DEFAULT '' COMMENT '参数8文字色',
  `keyword9` varchar(100) DEFAULT '' COMMENT '参数9',
  `keyword9code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword9color` varchar(7) DEFAULT '' COMMENT '参数9文字色',
  `keyword10` varchar(100) DEFAULT '' COMMENT '参数10',
  `keyword10code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword10color` varchar(7) DEFAULT '' COMMENT '参数10文字色',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `remarkcolor` varchar(7) DEFAULT '' COMMENT '备注文字色',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_banner;
CREATE TABLE `ims_stonefish_chailihe_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `bannerpic` varchar(255) NOT NULL COMMENT '幻灯图片',
  `bannerurl` varchar(255) NOT NULL COMMENT '幻灯链接',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_exchange;
CREATE TABLE `ims_stonefish_chailihe_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `awardingtype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '单独兑奖1统一兑奖2',
  `beihuo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启备货1开启0关闭',
  `beihuo_tips` varchar(20) DEFAULT '' COMMENT '备货提示词',
  `awardingpas` varchar(10) DEFAULT '' COMMENT '兑奖密码',
  `inventory` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖后库存1中奖减少2为兑奖后减少',
  `awardingstarttime` int(10) DEFAULT '0' COMMENT '兑奖开始时间',
  `awardingendtime` int(10) DEFAULT '0' COMMENT '兑奖结束时间',
  `awarding_tips` varchar(50) DEFAULT '' COMMENT '兑奖参数提示词',
  `awardingaddress` varchar(50) DEFAULT '' COMMENT '兑奖地点',
  `awardingtel` varchar(50) DEFAULT '' COMMENT '兑奖电话',
  `baidumaplng` varchar(10) DEFAULT '' COMMENT '兑奖导航',
  `baidumaplat` varchar(10) DEFAULT '' COMMENT '兑奖导航',
  `isexchange` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0领取礼盒时输入1中奖后输入',
  `isrealname` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入姓名0为不需要1为需要',
  `ismobile` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入手机号0为不需要1为需要',
  `isqq` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入QQ号0为不需要1为需要',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入邮箱0为不需要1为需要',
  `isaddress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入地址0为不需要1为需要',
  `isgender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入性别0为不需要1为需要',
  `istelephone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入固定电话0为不需要1为需要',
  `isidcard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入证件号码0为不需要1为需要',
  `iscompany` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入公司名称0为不需要1为需要',
  `isoccupation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职业0为不需要1为需要',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职位0为不需要1为需要',
  `isfans` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0只保存本模块下1同步更新至官方FANS表',
  `isfansname` varchar(225) NOT NULL DEFAULT '真实姓名,手机号码,QQ号,邮箱,地址,性别,固定电话,证件号码,公司名称,职业,职位' COMMENT '显示字段名称',
  `tmplmsg_participate` int(11) DEFAULT '0' COMMENT '参与消息模板',
  `tmplmsg_winning` int(11) DEFAULT '0' COMMENT '中奖消息模板',
  `tmplmsg_exchange` int(11) DEFAULT '0' COMMENT '兑奖消息模板',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_fans;
CREATE TABLE `ims_stonefish_chailihe_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT '联系QQ号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `idcard` varchar(30) NOT NULL DEFAULT '' COMMENT '证件号码',
  `company` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `occupation` varchar(30) NOT NULL DEFAULT '' COMMENT '职业',
  `position` varchar(30) NOT NULL DEFAULT '' COMMENT '职位',
  `sharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `share_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `sharetime` int(10) unsigned NOT NULL COMMENT '最后分享时间',
  `createtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `lasttime` int(10) unsigned NOT NULL COMMENT '最后参与时间',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `ticketid` int(11) DEFAULT '0' COMMENT '店员或商家网点ID',
  `ticketname` varchar(50) DEFAULT '' COMMENT '店员或商家网点名称',
  `zhongjiang` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否中奖',
  `xuni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟中奖',
  `todaynum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '今日参与次数',
  `totalnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总参与次数',
  `tosharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享使用次数',
  `awardnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '获奖次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁止',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_fansaward;
CREATE TABLE `ims_stonefish_chailihe_fansaward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户openid',
  `prizeid` int(11) DEFAULT '0' COMMENT '奖品ID',
  `liheid` int(11) DEFAULT '0' COMMENT '礼盒样式ID',
  `codesn` varchar(20) DEFAULT '0' COMMENT '中奖唯一码',
  `createtime` int(10) DEFAULT '0' COMMENT '领取时间',
  `consumetime` int(10) DEFAULT '0' COMMENT '使用时间',
  `sharenum` int(10) DEFAULT '0' COMMENT '拆开人数',
  `openstatus` tinyint(1) DEFAULT '0' COMMENT '是否拆开',
  `zhongjiangtime` int(10) DEFAULT '0' COMMENT '中奖时间',
  `zhongjiang` tinyint(1) DEFAULT '0' COMMENT '是否中奖0未中奖1中奖2兑奖',
  `xuni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟中奖',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `ticketid` int(11) DEFAULT '0' COMMENT '店员或商家网点ID',
  `ticketname` varchar(50) DEFAULT '' COMMENT '店员或商家网点名称',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_prizeid` (`prizeid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_fanstmplmsg;
CREATE TABLE `ims_stonefish_chailihe_fanstmplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户openid',
  `tmplmsgid` int(11) DEFAULT '0' COMMENT '消息模板ID',
  `tmplmsg` text NOT NULL COMMENT '发送内容',
  `createtime` int(10) DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_prizeid` (`tmplmsgid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_lihestyle;
CREATE TABLE `ims_stonefish_chailihe_lihestyle` (
  `liheid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(20) DEFAULT '' COMMENT '样式名称',
  `thumb1` varchar(255) DEFAULT '' COMMENT '礼盒展示图',
  `thumb2` varchar(255) DEFAULT '' COMMENT '礼盒拆开图',
  `thumb3` varchar(255) DEFAULT '' COMMENT '礼盒显示图',
  `shangjialogo` varchar(255) DEFAULT '' COMMENT '商家LOGO',
  `music` varchar(2) DEFAULT '' COMMENT '礼盒声音',
  PRIMARY KEY (`liheid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_prize;
CREATE TABLE `ims_stonefish_chailihe_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `liheid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '礼盒样式ID',
  `prizetype` varchar(20) NOT NULL COMMENT '奖品类型真实虚拟积分等',
  `prizevalue` int(10) NOT NULL COMMENT '积分或实物以及虚拟价值',
  `prizerating` varchar(50) NOT NULL COMMENT '奖品等级',
  `prizename` varchar(50) NOT NULL COMMENT '奖品名称',
  `prizepic` varchar(255) NOT NULL COMMENT '奖品图片',
  `prizetotal` int(10) NOT NULL COMMENT '奖品数量',
  `prizedraw` int(10) NOT NULL COMMENT '中奖数量',
  `prizeren` int(10) NOT NULL COMMENT '每人最多中奖',
  `prizeday` int(10) NOT NULL COMMENT '每天最多发奖',
  `probalilty` varchar(5) NOT NULL COMMENT '中奖概率%',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `break` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '需要帮助人数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_prizemika;
CREATE TABLE `ims_stonefish_chailihe_prizemika` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `prizeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖品ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `mikacodesn` varchar(100) NOT NULL COMMENT '密卡字符串',
  `virtual_value` int(10) NOT NULL COMMENT '积分或实物以及虚拟价值',
  `actionurl` varchar(200) NOT NULL COMMENT '激活地址',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否领取1为领取过',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_reply;
CREATE TABLE `ims_stonefish_chailihe_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `templateid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动模板ID',
  `slidevertical` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '多个礼盒切换效果2左右1上下',
  `tips` varchar(300) DEFAULT '' COMMENT '活动提示',
  `title` varchar(50) DEFAULT '' COMMENT '活动标题',
  `description` varchar(255) DEFAULT '' COMMENT '活动简介',
  `start_picurl` varchar(200) DEFAULT '' COMMENT '活动开始图片',
  `end_title` varchar(50) DEFAULT '' COMMENT '结束标题',
  `end_description` varchar(200) DEFAULT '' COMMENT '活动结束简介',
  `end_picurl` varchar(200) DEFAULT '' COMMENT '活动结束图片',
  `isshow` tinyint(1) DEFAULT '1' COMMENT '活动是否停止0为暂停1为活动中',
  `starttime` int(10) DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) DEFAULT '0' COMMENT '结束时间',
  `music` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否打开背景音乐',
  `musicurl` varchar(255) NOT NULL DEFAULT '' COMMENT '背景音乐地址',
  `mauto` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '音乐是否自动播放',
  `mloop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否循环播放',
  `issubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与类型0为任意1为关注粉丝2为会员',
  `visubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '助力类型',
  `fansnum` int(10) DEFAULT '0' COMMENT '参与人数',
  `viewnum` int(10) DEFAULT '0' COMMENT '访问次数',
  `prize_num` int(10) DEFAULT '0' COMMENT '奖品总数',
  `award_num` int(11) DEFAULT '0' COMMENT '每人最多获奖次数',
  `number_times` int(11) DEFAULT '0' COMMENT '每人最多参与次数',
  `day_number_times` int(11) DEFAULT '0' COMMENT '每人每天最多参与次数',
  `viewawardnum` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '首页显示中奖人数',
  `viewranknum` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排行榜人数',
  `showprize` tinyint(1) DEFAULT '0' COMMENT '是否显示奖品',
  `prizeinfo` text NOT NULL COMMENT '奖品详细介绍',
  `awardtext` varchar(1000) DEFAULT '' COMMENT '中奖提示文字',
  `notawardtext` varchar(1000) DEFAULT '' COMMENT '没有中奖提示文字',
  `noprizepic` varchar(1000) DEFAULT '' COMMENT '没有中奖提示图',
  `notprizetext` varchar(1000) DEFAULT '' COMMENT '没有奖品提示文字',
  `copyright` varchar(20) DEFAULT '' COMMENT '版权',
  `power` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否获取助力者头像昵称1opneid 2头像昵称',
  `poweravatar` varchar(3) DEFAULT '0' COMMENT '头像大小',
  `powertype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '助力类型0访问助力1点击助力',
  `limittype` tinyint(1) DEFAULT '0' COMMENT '限制类型0为只能一次1为每天一次',
  `totallimit` tinyint(1) DEFAULT '1' COMMENT '好友助力总次数制',
  `helptype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '互助0为互助1为禁止',
  `helpfans` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0全部用户1只能助力1人',
  `helplihe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0所有礼盒1单独礼盒',
  `xuninum` int(10) unsigned NOT NULL DEFAULT '500' COMMENT '虚拟人数',
  `xuninumtime` int(10) unsigned NOT NULL DEFAULT '86400' COMMENT '虚拟间隔时间',
  `xuninuminitial` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '虚拟随机数值1',
  `xuninumending` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '虚拟随机数值2',
  `xuninum_time` int(10) unsigned NOT NULL COMMENT '虚拟更新时间',
  `adpic` varchar(255) DEFAULT '' COMMENT '活动页顶部广告图',
  `adpicurl` varchar(255) DEFAULT '' COMMENT '活动页顶部广告链接',
  `homepictime` tinyint(1) unsigned NOT NULL COMMENT '首页秒显图片显示时间',
  `homepictype` tinyint(1) unsigned NOT NULL COMMENT '首页广告类型1为每次2为每天3为每周4为仅1次',
  `homepic` varchar(225) NOT NULL COMMENT '首页秒显图片',
  `opportunity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与次数选项0活动设置1商户赠送2为积分购买',
  `opportunity_txt` text NOT NULL COMMENT '商户赠送/积分购买说明',
  `credit_type` varchar(20) DEFAULT '' COMMENT '积分类型',
  `credit_value` int(11) DEFAULT '0' COMMENT '积分购买多少积分',
  `createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_share;
CREATE TABLE `ims_stonefish_chailihe_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `acid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '子公众号ID',
  `help_url` varchar(255) DEFAULT '' COMMENT '帮助关注引导页',
  `share_url` varchar(255) DEFAULT '' COMMENT '参与关注引导页',
  `share_open_close` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启作用',
  `share_title` varchar(50) DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(100) DEFAULT '' COMMENT '分享简介',
  `share_txt` text NOT NULL COMMENT '参与活动规则',
  `share_img` varchar(255) NOT NULL COMMENT '分享朋友或朋友圈图',
  `share_anniu` varchar(255) NOT NULL COMMENT '分享朋友或朋友圈按钮或文字',
  `share_firend` varchar(255) NOT NULL COMMENT '助力按钮',
  `share_pic` varchar(255) NOT NULL COMMENT '分享弹出图片',
  `share_confirm` varchar(200) DEFAULT '' COMMENT '分享成功提示语',
  `share_confirmurl` varchar(255) DEFAULT '' COMMENT '分享成功跳转URL',
  `share_fail` varchar(200) DEFAULT '' COMMENT '分享失败提示语',
  `share_cancel` varchar(200) DEFAULT '' COMMENT '分享中途取消提示语',
  `sharetimes` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为每天次数2为总次数',
  `sharetype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分享赠送类型0分享立即赠送1分享成功赠送',
  `sharenumtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分享赠送机会类型0单独赠送机会1每人赠送机会2分享共计赠送',
  `sharenum` int(11) DEFAULT '0' COMMENT '分享赠送礼盒基数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_acid` (`acid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_sharedata;
CREATE TABLE `ims_stonefish_chailihe_sharedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '礼盒记录ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '分享人openid',
  `fromuser` varchar(50) NOT NULL DEFAULT '' COMMENT '访问人openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `visitorsip` varchar(15) NOT NULL DEFAULT '' COMMENT '访问IP',
  `visitorstime` int(10) unsigned NOT NULL COMMENT '访问时间',
  `viewnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_template;
CREATE TABLE `ims_stonefish_chailihe_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(20) DEFAULT '' COMMENT '模板名称',
  `thumb` varchar(255) DEFAULT '' COMMENT '模板缩略图',
  `fontsize` varchar(2) DEFAULT '12' COMMENT '文字大小',
  `bgimg` varchar(255) DEFAULT '' COMMENT '背景图',
  `bgimglihe` varchar(255) DEFAULT '' COMMENT '领取礼盒背景图',
  `bgimgprize` varchar(255) DEFAULT '' COMMENT '中奖背景图',
  `bgcolor` varchar(7) DEFAULT '' COMMENT '背景色',
  `textcolor` varchar(7) DEFAULT '' COMMENT '文字色',
  `textcolorlink` varchar(7) DEFAULT '' COMMENT '链接文字色',
  `buttoncolor` varchar(7) DEFAULT '' COMMENT '按钮色',
  `buttontextcolor` varchar(7) DEFAULT '' COMMENT '按钮文字色',
  `rulecolor` varchar(7) DEFAULT '' COMMENT '规则框背景色',
  `ruletextcolor` varchar(7) DEFAULT '' COMMENT '规则框文字色',
  `navcolor` varchar(7) DEFAULT '' COMMENT '导航色',
  `navtextcolor` varchar(7) DEFAULT '' COMMENT '导航文字色',
  `navactioncolor` varchar(7) DEFAULT '' COMMENT '导航选中文字色',
  `watchcolor` varchar(7) DEFAULT '' COMMENT '弹出框背景色',
  `watchtextcolor` varchar(7) DEFAULT '' COMMENT '弹出框文字色',
  `awardcolor` varchar(7) DEFAULT '' COMMENT '兑奖框背景色',
  `awardtextcolor` varchar(7) DEFAULT '' COMMENT '兑奖框文字色',
  `awardscolor` varchar(7) DEFAULT '' COMMENT '兑奖框成功背景色',
  `awardstextcolor` varchar(7) DEFAULT '' COMMENT '兑奖框成功文字色',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_chailihe_tmplmsg;
CREATE TABLE `ims_stonefish_chailihe_tmplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `template_id` varchar(50) DEFAULT '' COMMENT '模板ID',
  `template_name` varchar(20) DEFAULT '' COMMENT '模板名称',
  `topcolor` varchar(7) DEFAULT '' COMMENT '通知文字色',
  `first` varchar(100) DEFAULT '' COMMENT '标题',
  `firstcolor` varchar(7) DEFAULT '' COMMENT '标题文字色',
  `keyword1` varchar(100) DEFAULT '' COMMENT '参数1',
  `keyword1code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword1color` varchar(7) DEFAULT '' COMMENT '参数1文字色',
  `keyword2` varchar(100) DEFAULT '' COMMENT '参数2',
  `keyword2code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword2color` varchar(7) DEFAULT '' COMMENT '参数2文字色',
  `keyword3` varchar(100) DEFAULT '' COMMENT '参数3',
  `keyword3code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword3color` varchar(7) DEFAULT '' COMMENT '参数3文字色',
  `keyword4` varchar(100) DEFAULT '' COMMENT '参数4',
  `keyword4code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword4color` varchar(7) DEFAULT '' COMMENT '参数4文字色',
  `keyword5` varchar(100) DEFAULT '' COMMENT '参数5',
  `keyword5code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword5color` varchar(7) DEFAULT '' COMMENT '参数5文字色',
  `keyword6` varchar(100) DEFAULT '' COMMENT '参数6',
  `keyword6code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword6color` varchar(7) DEFAULT '' COMMENT '参数6文字色',
  `keyword7` varchar(100) DEFAULT '' COMMENT '参数7',
  `keyword7code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword7color` varchar(7) DEFAULT '' COMMENT '参数7文字色',
  `keyword8` varchar(100) DEFAULT '' COMMENT '参数8',
  `keyword8code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword8color` varchar(7) DEFAULT '' COMMENT '参数8文字色',
  `keyword9` varchar(100) DEFAULT '' COMMENT '参数9',
  `keyword9code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword9color` varchar(7) DEFAULT '' COMMENT '参数9文字色',
  `keyword10` varchar(100) DEFAULT '' COMMENT '参数10',
  `keyword10code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword10color` varchar(7) DEFAULT '' COMMENT '参数10文字色',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `remarkcolor` varchar(7) DEFAULT '' COMMENT '备注文字色',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_luckynum;
CREATE TABLE `ims_stonefish_luckynum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `isshow` tinyint(1) DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `shareimg` varchar(255) DEFAULT '',
  `sharetitle` varchar(100) DEFAULT '',
  `sharedesc` varchar(300) DEFAULT '',
  `show_instruction` varchar(100) DEFAULT '',
  `time_instruction` varchar(100) DEFAULT '',
  `limit_instruction` varchar(100) DEFAULT '',
  `end_instruction` varchar(100) DEFAULT '',
  `awardnum_instruction` varchar(100) DEFAULT '',
  `award_instruction` varchar(100) DEFAULT '',
  `luckynumstart` int(10) unsigned NOT NULL DEFAULT '0',
  `luckynumfilter` varchar(100) NOT NULL DEFAULT '',
  `awardprompt` varchar(200) NOT NULL DEFAULT '',
  `currentprompt` varchar(200) NOT NULL DEFAULT '',
  `limittype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '参与限制0为无限制1为只能一次',
  `awardnum` tinyint(1) NOT NULL DEFAULT '0' COMMENT '中奖限制次数',
  `ticketinfo` varchar(50) DEFAULT '' COMMENT '兑奖参数提示词',
  `isrealname` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入姓名0为不需要1为需要',
  `ismobile` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入手机号0为不需要1为需要',
  `isqq` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入QQ号0为不需要1为需要',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入邮箱0为不需要1为需要',
  `isaddress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入地址0为不需要1为需要',
  `isgender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入性别0为不需要1为需要',
  `istelephone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入固定电话0为不需要1为需要',
  `isidcard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入证件号码0为不需要1为需要',
  `iscompany` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入公司名称0为不需要1为需要',
  `isoccupation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职业0为不需要1为需要',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职位0为不需要1为需要',
  `isfans` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0只保存本模块下1同步更新至官方FANS表',
  `isfansname` varchar(225) NOT NULL DEFAULT '真实姓名,手机号码,QQ号,邮箱,地址,性别,固定电话,证件号码,公司名称,职业,职位' COMMENT '显示字段名称',
  `sponsors1` varchar(50) DEFAULT '',
  `sponsors1link` varchar(255) DEFAULT '',
  `sponsors2` varchar(50) DEFAULT '',
  `sponsors2link` varchar(255) DEFAULT '',
  `sponsors3` varchar(50) DEFAULT '',
  `sponsors3link` varchar(255) DEFAULT '',
  `sponsors4` varchar(50) DEFAULT '',
  `sponsors4link` varchar(255) DEFAULT '',
  `sponsors5` varchar(50) DEFAULT '',
  `sponsors5link` varchar(255) DEFAULT '',
  `ruletext` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_luckynum_award;
CREATE TABLE `ims_stonefish_luckynum_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `numbers` text NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_luckynum_fans;
CREATE TABLE `ims_stonefish_luckynum_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `number` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL DEFAULT '0',
  `award_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT '联系QQ号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `idcard` varchar(30) NOT NULL DEFAULT '' COMMENT '证件号码',
  `company` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `occupation` varchar(30) NOT NULL DEFAULT '' COMMENT '职业',
  `position` varchar(30) NOT NULL DEFAULT '' COMMENT '职位',
  `zhongjiang` tinyint(1) NOT NULL DEFAULT '0',
  `xuni` tinyint(1) DEFAULT '0',
  `dateline` int(10) DEFAULT '0',
  `consumetime` int(10) DEFAULT '0',
  `awardingid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '兑奖地址ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid_number_UNIQUE` (`rid`,`number`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_planting_award;
CREATE TABLE `ims_stonefish_planting_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号ID',
  `rid` int(11) DEFAULT '0',
  `fid` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户ID',
  `prizeid` int(11) DEFAULT '0' COMMENT '奖品ID',
  `shengzhangid` tinyint(1) DEFAULT '0' COMMENT '种子生成级别',
  `prizename` varchar(50) DEFAULT '' COMMENT '奖品名称',
  `prizetype` varchar(10) DEFAULT '' COMMENT '类型',
  `description` varchar(200) DEFAULT '' COMMENT '描述',
  `createtime` int(10) DEFAULT '0' COMMENT '中奖时间',
  `consumetime` int(10) DEFAULT '0' COMMENT '领奖时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态0为未领取1为领取',
  `xuni` tinyint(1) DEFAULT '0',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `ticketid` int(11) DEFAULT '0' COMMENT '兑奖人ID',
  `ticketname` varchar(50) DEFAULT '' COMMENT '兑奖人姓名',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_planting_data;
CREATE TABLE `ims_stonefish_planting_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `fromuser` varchar(50) NOT NULL DEFAULT '' COMMENT '分享人openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `visitorsip` varchar(15) NOT NULL DEFAULT '' COMMENT '访问IP',
  `visitorstime` int(10) unsigned NOT NULL COMMENT '访问时间',
  `viewnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_planting_fans;
CREATE TABLE `ims_stonefish_planting_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号ID',
  `seedid` int(11) DEFAULT '0' COMMENT '种子ID',
  `fansID` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '' COMMENT '用户ID',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT '联系QQ号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `idcard` varchar(30) NOT NULL DEFAULT '' COMMENT '证件号码',
  `company` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `occupation` varchar(30) NOT NULL DEFAULT '' COMMENT '职业',
  `position` varchar(30) NOT NULL DEFAULT '' COMMENT '职位',
  `sharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `sharetime` int(10) DEFAULT '0' COMMENT '最后分享时间',
  `awardingid` int(10) DEFAULT '0' COMMENT '兑奖地址ID',
  `choujiang` tinyint(1) DEFAULT '0' COMMENT '抽奖状态',
  `last_time` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `zhongjiang` tinyint(1) DEFAULT '0',
  `xuni` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_planting_prize;
CREATE TABLE `ims_stonefish_planting_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号ID',
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `sharenum` int(10) DEFAULT '0' COMMENT '抽奖所需助力值',
  `prizetype` varchar(50) NOT NULL COMMENT '奖品类别',
  `prizename` varchar(50) NOT NULL COMMENT '奖品名称',
  `prizepro` double DEFAULT '0' COMMENT '奖品概率',
  `prizetotal` int(10) NOT NULL COMMENT '奖品数量',
  `prizedraw` int(10) NOT NULL COMMENT '中奖数量',
  `prizepic` varchar(255) NOT NULL COMMENT '奖品图片',
  `prizetxt` text NOT NULL COMMENT '奖品说明',
  `credit` int(10) NOT NULL COMMENT '积分',
  `credit_type` varchar(20) DEFAULT '' COMMENT '积分类型',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_planting_reply;
CREATE TABLE `ims_stonefish_planting_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) DEFAULT '' COMMENT '活动名称',
  `description` varchar(255) DEFAULT '' COMMENT '活动简介',
  `start_picurl` varchar(200) DEFAULT '' COMMENT '活动开始图片',
  `isshow` tinyint(1) DEFAULT '0',
  `award_times` int(11) DEFAULT '0' COMMENT '每人最多获奖次数',
  `award_type` tinyint(1) DEFAULT '0' COMMENT '抽奖机会1为保留0为越级',
  `ticket_information` varchar(200) DEFAULT '' COMMENT '兑奖信息',
  `starttime` int(10) DEFAULT '0' COMMENT '活动开始时间',
  `endtime` int(10) DEFAULT '0' COMMENT '活动结束时间',
  `end_theme` varchar(50) DEFAULT '' COMMENT '结束标题',
  `end_instruction` varchar(200) DEFAULT '' COMMENT '活动结束简介',
  `end_picurl` varchar(200) DEFAULT '' COMMENT '活动结束图片',
  `adpic` varchar(200) DEFAULT '' COMMENT '活动页顶部广告图',
  `adpicurl` varchar(200) DEFAULT '' COMMENT '活动页顶部广告链接',
  `total_num` int(11) DEFAULT '0' COMMENT '奖品数量(自动加)',
  `copyright` varchar(20) DEFAULT '' COMMENT '自定义版权',
  `show_num` tinyint(1) DEFAULT '0' COMMENT '是否显示奖品数量',
  `viewnum` int(11) DEFAULT '0' COMMENT '浏览次数',
  `fansnum` int(11) DEFAULT '0' COMMENT '参与人数',
  `seedid` varchar(100) NOT NULL COMMENT '种子集',
  `limittype` tinyint(1) DEFAULT '0' COMMENT '限制类型0为只能一次1为每天一次',
  `totallimit` tinyint(1) DEFAULT '1' COMMENT '好友助力总次数制',
  `awardnum` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '首页滚动中奖人数显示',
  `createtime` int(10) DEFAULT '0' COMMENT '活动创建时间',
  `ticketinfo` varchar(50) DEFAULT '' COMMENT '兑奖参数提示词',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `duijiangtype` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '库存类型1抽中减少2兑奖减少',
  `isrealname` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入姓名0为不需要1为需要',
  `ismobile` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入手机号0为不需要1为需要',
  `isqq` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入QQ号0为不需要1为需要',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入邮箱0为不需要1为需要',
  `isaddress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入地址0为不需要1为需要',
  `isgender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入性别0为不需要1为需要',
  `istelephone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入固定电话0为不需要1为需要',
  `isidcard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入证件号码0为不需要1为需要',
  `iscompany` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入公司名称0为不需要1为需要',
  `isoccupation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职业0为不需要1为需要',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职位0为不需要1为需要',
  `isfans` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0只保存本模块下1同步更新至官方FANS表',
  `isfansname` varchar(225) NOT NULL DEFAULT '真实姓名,手机号码,QQ号,邮箱,地址,性别,固定电话,证件号码,公司名称,职业,职位' COMMENT '显示字段名称',
  `xuninum` int(10) unsigned NOT NULL DEFAULT '500' COMMENT '虚拟人数',
  `xuninumtime` int(10) unsigned NOT NULL DEFAULT '86400' COMMENT '虚拟间隔时间',
  `xuninuminitial` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '虚拟随机数值1',
  `xuninumending` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '虚拟随机数值2',
  `xuninum_time` int(10) unsigned NOT NULL COMMENT '虚拟更新时间',
  `homepictime` int(3) unsigned NOT NULL COMMENT '首页秒显图片显示时间',
  `homepic` varchar(225) NOT NULL COMMENT '首页秒显图片',
  `opportunity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与选项 0任何人1关注粉丝2为商户赠送',
  `opportunity_txt` text NOT NULL COMMENT '商户赠送参数说明',
  `award_info` text NOT NULL COMMENT '奖品详细介绍',
  `credit_times` tinyint(1) DEFAULT '0',
  `credit_type` varchar(20) DEFAULT '',
  `showparameters` varchar(1000) NOT NULL COMMENT '显示界面参数：背景色、背景图以及文字色等',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_planting_seed;
CREATE TABLE `ims_stonefish_planting_seed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号ID',
  `seedname` varchar(50) NOT NULL DEFAULT '' COMMENT '种子名称',
  `seedimg` varchar(512) NOT NULL DEFAULT '' COMMENT '种子形象图',
  `seedad` varchar(150) NOT NULL DEFAULT '' COMMENT '种子介绍',
  `seedinfo` text NOT NULL COMMENT '种子介绍',
  `seedimg01` varchar(512) NOT NULL DEFAULT '' COMMENT '胚胎',
  `seedimg02` varchar(512) NOT NULL DEFAULT '' COMMENT '发芽',
  `seedimg03` varchar(512) NOT NULL DEFAULT '' COMMENT '生长',
  `seedimg04` varchar(512) NOT NULL DEFAULT '' COMMENT '发枝',
  `seedimg05` varchar(512) NOT NULL DEFAULT '' COMMENT '繁荣',
  `seedimg06` varchar(512) NOT NULL DEFAULT '' COMMENT '开花',
  `seedimg07` varchar(512) NOT NULL DEFAULT '' COMMENT '结果',
  `seedimg08` varchar(512) NOT NULL DEFAULT '' COMMENT '成熟',
  `seed01` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '胚胎量',
  `seed02` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '发芽量',
  `seed03` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '生长量',
  `seed04` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '发枝量',
  `seed05` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '繁荣量',
  `seed06` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '开花量',
  `seed07` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '开花量',
  `seed08` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '成熟量',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ims_stonefish_planting_seed VALUES 
('1','0','摇钱树-最好复制一个同样的种子进行活动','../addons/stonefish_planting/template/images/tree_00.png','摇钱树广告词','摇钱树种子详细说明','../addons/stonefish_planting/template/images/tree_0.png','../addons/stonefish_planting/template/images/tree_1.png','../addons/stonefish_planting/template/images/tree_2.png','../addons/stonefish_planting/template/images/tree_3.png','../addons/stonefish_planting/template/images/tree_4.png','../addons/stonefish_planting/template/images/tree_5.png','../addons/stonefish_planting/template/images/tree_6.png','../addons/stonefish_planting/template/images/tree_7.png','0','5','10','15','25','35','45','60');


DROP TABLE IF EXISTS ims_stonefish_planting_share;
CREATE TABLE `ims_stonefish_planting_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `acid` int(11) DEFAULT '0',
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号ID',
  `share_title` varchar(200) DEFAULT '',
  `share_desc` varchar(300) DEFAULT '',
  `share_url` varchar(255) DEFAULT '',
  `share_txt` text NOT NULL COMMENT '参与活动规则',
  `share_imgurl` varchar(255) NOT NULL COMMENT '分享朋友或朋友圈图',
  `share_picurl` varchar(255) NOT NULL COMMENT '分享图片按钮',
  `share_pic` varchar(255) NOT NULL COMMENT '分享弹出图片',
  `share_confirm` varchar(200) DEFAULT '' COMMENT '分享成功提示语',
  `share_fail` varchar(200) DEFAULT '' COMMENT '分享失败提示语',
  `share_cancel` varchar(200) DEFAULT '' COMMENT '分享中途取消提示语',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_planting_token;
CREATE TABLE `ims_stonefish_planting_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  `expires_in` int(11) DEFAULT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_redenvelope_award;
CREATE TABLE `ims_stonefish_redenvelope_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `fansID` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户ID',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `description` varchar(200) DEFAULT '' COMMENT '描述',
  `prizetype` varchar(10) DEFAULT '' COMMENT '类型',
  `prize` int(11) DEFAULT '0' COMMENT '奖品ID',
  `award_sn` varchar(50) DEFAULT '' COMMENT 'SN',
  `createtime` int(10) DEFAULT '0',
  `consumetime` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `xuni` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_redenvelope_data;
CREATE TABLE `ims_stonefish_redenvelope_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `fromuser` varchar(50) NOT NULL DEFAULT '' COMMENT '分享人openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `visitorsip` varchar(15) NOT NULL DEFAULT '' COMMENT '访问IP',
  `visitorstime` int(10) unsigned NOT NULL COMMENT '访问时间',
  `point` decimal(10,2) DEFAULT '0.00' COMMENT '助力金额',
  `viewnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_redenvelope_fans;
CREATE TABLE `ims_stonefish_redenvelope_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `fansID` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '' COMMENT '用户ID',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT '联系QQ号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `idcard` varchar(30) NOT NULL DEFAULT '' COMMENT '证件号码',
  `company` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `occupation` varchar(30) NOT NULL DEFAULT '' COMMENT '职业',
  `position` varchar(30) NOT NULL DEFAULT '' COMMENT '职位',
  `inpoint` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '起始金额',
  `outpoint` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已兑换金额',
  `sharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `sharetime` int(10) DEFAULT '0' COMMENT '最后分享时间',
  `awardingid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '兑奖地址ID',
  `last_time` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `zhongjiang` tinyint(1) DEFAULT '0',
  `xuni` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_redenvelope_prize;
CREATE TABLE `ims_stonefish_redenvelope_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `point` decimal(10,2) DEFAULT '0.00' COMMENT '奖品需要金额',
  `prizetype` varchar(50) NOT NULL COMMENT '奖品类别',
  `prizename` varchar(50) NOT NULL COMMENT '奖品名称',
  `prizepro` double DEFAULT '0' COMMENT '奖品概率',
  `prizetotal` int(10) NOT NULL COMMENT '奖品数量',
  `prizedraw` int(10) NOT NULL COMMENT '中奖数量',
  `prizepic` varchar(255) NOT NULL COMMENT '奖品图片',
  `prizetxt` text NOT NULL COMMENT '奖品说明',
  `credit` int(10) NOT NULL COMMENT '积分',
  `credit_type` varchar(20) DEFAULT '' COMMENT '积分类型',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_redenvelope_reply;
CREATE TABLE `ims_stonefish_redenvelope_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '' COMMENT '活动名称',
  `description` varchar(255) DEFAULT '' COMMENT '活动简介',
  `start_picurl` varchar(200) DEFAULT '' COMMENT '活动开始图片',
  `isshow` tinyint(1) DEFAULT '0',
  `envelope` tinyint(1) DEFAULT '0' COMMENT '红包类型0为实物奖品1为现金',
  `award_times` int(11) DEFAULT '0' COMMENT '每人最多获奖次数',
  `ticket_information` varchar(200) DEFAULT '' COMMENT '兑奖信息',
  `starttime` int(10) DEFAULT '0' COMMENT '活动开始时间',
  `endtime` int(10) DEFAULT '0' COMMENT '活动结束时间',
  `end_theme` varchar(50) DEFAULT '' COMMENT '结束标题',
  `end_instruction` varchar(200) DEFAULT '' COMMENT '活动结束简介',
  `end_picurl` varchar(200) DEFAULT '' COMMENT '活动结束图片',
  `adpic` varchar(200) DEFAULT '' COMMENT '活动页顶部广告图',
  `adpicurl` varchar(200) DEFAULT '' COMMENT '活动页顶部广告链接',
  `total_num` int(11) DEFAULT '0' COMMENT '奖品数量(自动加)',
  `sn_rename` varchar(20) DEFAULT '',
  `copyright` varchar(20) DEFAULT '' COMMENT '自定义版权',
  `show_num` tinyint(1) DEFAULT '0' COMMENT '是否显示奖品数量',
  `viewnum` int(11) DEFAULT '0' COMMENT '浏览次数',
  `awardnum` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '首页滚动中奖人数显示',
  `fansnum` int(11) DEFAULT '0' COMMENT '参与人数',
  `cardbg` varchar(255) NOT NULL COMMENT '抽奖卡片背景图片',
  `inpointstart` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '初始分值1',
  `inpointend` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '初始分值2',
  `randompointstart` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '助力随机金额范围开始数',
  `randompointend` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '助力随机金额范围结束数',
  `addp` tinyint(1) DEFAULT '100' COMMENT '好友帮助攒钱机率%',
  `limittype` tinyint(1) DEFAULT '0' COMMENT '限制类型0为只能一次1为每天一次',
  `totallimit` tinyint(1) DEFAULT '1' COMMENT '好友助力总次数制',
  `incomelimit` float(10,2) unsigned NOT NULL DEFAULT '10000.00' COMMENT '最高金额限制',
  `tixianlimit` float(10,2) unsigned NOT NULL DEFAULT '100.00' COMMENT '提现金额限制',
  `countlimit` int(5) NOT NULL COMMENT '活动总人数限制',
  `createtime` int(10) DEFAULT '0' COMMENT '活动创建时间',
  `share_acid` int(10) DEFAULT '0' COMMENT '默认分享公众号ID',
  `sharetip` varchar(100) NOT NULL COMMENT '分享提示内容',
  `fanpaitip` varchar(100) NOT NULL COMMENT '好友翻牌小提示',
  `awardtip` varchar(200) NOT NULL COMMENT '中奖小提示说明',
  `sharebtn` varchar(10) NOT NULL COMMENT '邀请好友攒钱文字',
  `fsharebtn` varchar(10) NOT NULL COMMENT '好友帮助邀请攒钱文字',
  `bgcolor` varchar(10) DEFAULT '' COMMENT '背景颜色',
  `fontcolor` varchar(10) DEFAULT '' COMMENT '文字颜色',
  `btncolor` varchar(10) DEFAULT '' COMMENT '按钮颜色',
  `btnfontcolor` varchar(10) DEFAULT '' COMMENT '按钮文字颜色',
  `txcolor` varchar(10) DEFAULT '' COMMENT '提现按钮颜色',
  `txfontcolor` varchar(10) DEFAULT '' COMMENT '提现按钮文字颜色',
  `rulebgcolor` varchar(10) DEFAULT '' COMMENT '规则框背景颜色',
  `ticketinfo` varchar(50) DEFAULT '' COMMENT '兑奖参数提示词',
  `isrealname` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入姓名0为不需要1为需要',
  `ismobile` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入手机号0为不需要1为需要',
  `isqq` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入QQ号0为不需要1为需要',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入邮箱0为不需要1为需要',
  `isaddress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入地址0为不需要1为需要',
  `isgender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入性别0为不需要1为需要',
  `istelephone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入固定电话0为不需要1为需要',
  `isidcard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入证件号码0为不需要1为需要',
  `iscompany` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入公司名称0为不需要1为需要',
  `isoccupation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职业0为不需要1为需要',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职位0为不需要1为需要',
  `isfans` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0只保存本模块下1同步更新至官方FANS表',
  `isfansname` varchar(225) NOT NULL DEFAULT '真实姓名,手机号码,QQ号,邮箱,地址,性别,固定电话,证件号码,公司名称,职业,职位' COMMENT '显示字段名称',
  `xuninum` int(10) unsigned NOT NULL DEFAULT '500' COMMENT '虚拟人数',
  `xuninumtime` int(10) unsigned NOT NULL DEFAULT '86400' COMMENT '虚拟间隔时间',
  `xuninuminitial` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '虚拟随机数值1',
  `xuninumending` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '虚拟随机数值2',
  `xuninum_time` int(10) unsigned NOT NULL COMMENT '虚拟更新时间',
  `homepictime` int(3) unsigned NOT NULL COMMENT '首页秒显图片显示时间',
  `homepic` varchar(225) NOT NULL COMMENT '首页秒显图片',
  `opportunity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与选项 0任何人1关注粉丝2为商户赠送',
  `opportunity_txt` text NOT NULL COMMENT '商户赠送参数说明',
  `award_info` text NOT NULL COMMENT '奖品详细介绍',
  `credit_times` tinyint(1) DEFAULT '0',
  `credit_type` varchar(20) DEFAULT '',
  `showparameters` varchar(1000) NOT NULL COMMENT '显示界面参数：背景色、背景图以及文字色等',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_redenvelope_share;
CREATE TABLE `ims_stonefish_redenvelope_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `acid` int(11) DEFAULT '0',
  `share_title` varchar(200) DEFAULT '',
  `share_desc` varchar(300) DEFAULT '',
  `share_url` varchar(255) DEFAULT '',
  `share_txt` text NOT NULL COMMENT '参与活动规则',
  `share_imgurl` varchar(255) NOT NULL COMMENT '分享朋友或朋友圈图',
  `share_picurl` varchar(255) NOT NULL COMMENT '分享图片按钮',
  `share_pic` varchar(255) NOT NULL COMMENT '分享弹出图片',
  `share_confirm` varchar(200) DEFAULT '' COMMENT '分享成功提示语',
  `share_fail` varchar(200) DEFAULT '' COMMENT '分享失败提示语',
  `share_cancel` varchar(200) DEFAULT '' COMMENT '分享中途取消提示语',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_acid` (`acid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_redenvelope_token;
CREATE TABLE `ims_stonefish_redenvelope_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  `expires_in` int(11) DEFAULT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_exchange;
CREATE TABLE `ims_stonefish_scratch_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `awardingtype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '单独兑奖1统一兑奖2',
  `beihuo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启备货1开启0关闭',
  `beihuo_tips` varchar(20) DEFAULT '' COMMENT '备货提示词',
  `awardingpas` varchar(10) DEFAULT '' COMMENT '兑奖密码',
  `inventory` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖后库存1中奖减少2为兑奖后减少',
  `awardingstarttime` int(10) DEFAULT '0' COMMENT '兑奖开始时间',
  `awardingendtime` int(10) DEFAULT '0' COMMENT '兑奖结束时间',
  `awarding_tips` varchar(50) DEFAULT '' COMMENT '兑奖参数提示词',
  `awardingaddress` varchar(50) DEFAULT '' COMMENT '兑奖地点',
  `awardingtel` varchar(50) DEFAULT '' COMMENT '兑奖电话',
  `baidumaplng` varchar(10) DEFAULT '' COMMENT '兑奖导航',
  `baidumaplat` varchar(10) DEFAULT '' COMMENT '兑奖导航',
  `before` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖资料活动前还是中奖后1前2为后',
  `isrealname` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入姓名0为不需要1为需要',
  `ismobile` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要输入手机号0为不需要1为需要',
  `isqq` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入QQ号0为不需要1为需要',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入邮箱0为不需要1为需要',
  `isaddress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入地址0为不需要1为需要',
  `isgender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入性别0为不需要1为需要',
  `istelephone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入固定电话0为不需要1为需要',
  `isidcard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入证件号码0为不需要1为需要',
  `iscompany` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入公司名称0为不需要1为需要',
  `isoccupation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职业0为不需要1为需要',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要输入职位0为不需要1为需要',
  `isfans` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0只保存本模块下1同步更新至官方FANS表',
  `isfansname` varchar(225) NOT NULL DEFAULT '真实姓名,手机号码,QQ号,邮箱,地址,性别,固定电话,证件号码,公司名称,职业,职位' COMMENT '显示字段名称',
  `tmplmsg_participate` int(11) DEFAULT '0' COMMENT '参与消息模板',
  `tmplmsg_winning` int(11) DEFAULT '0' COMMENT '中奖消息模板',
  `tmplmsg_exchange` int(11) DEFAULT '0' COMMENT '兑奖消息模板',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_fans;
CREATE TABLE `ims_stonefish_scratch_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT '联系QQ号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `idcard` varchar(30) NOT NULL DEFAULT '' COMMENT '证件号码',
  `company` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `occupation` varchar(30) NOT NULL DEFAULT '' COMMENT '职业',
  `position` varchar(30) NOT NULL DEFAULT '' COMMENT '职位',
  `inpoint` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '起始数',
  `outpoint` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已兑换数',
  `sharepoint` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分享助力',
  `sharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `share_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享量',
  `sharetime` int(10) unsigned NOT NULL COMMENT '最后分享时间',
  `createtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `lasttime` int(10) unsigned NOT NULL COMMENT '最后参与时间',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `ticketid` int(11) DEFAULT '0' COMMENT '店员或商家网点ID',
  `ticketname` varchar(50) DEFAULT '' COMMENT '店员或商家网点名称',
  `zhongjiang` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否中奖',
  `xuni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟中奖',
  `todaynum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '今日参与次数',
  `totalnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总参与次数',
  `tosharenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享使用次数',
  `awardnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '获奖次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁止',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_fansaward;
CREATE TABLE `ims_stonefish_scratch_fansaward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户openid',
  `prizeid` int(11) DEFAULT '0' COMMENT '奖品ID',
  `codesn` varchar(20) DEFAULT '0' COMMENT '中奖唯一码',
  `createtime` int(10) DEFAULT '0' COMMENT '领取时间',
  `consumetime` int(10) DEFAULT '0' COMMENT '使用时间',
  `openstatus` tinyint(1) DEFAULT '0' COMMENT '是否拆开',
  `zhongjiangtime` int(10) DEFAULT '0' COMMENT '中奖时间',
  `zhongjiang` tinyint(1) DEFAULT '0' COMMENT '是否中奖0未中奖1中奖2兑奖',
  `xuni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟中奖',
  `tickettype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '兑奖类型1为前端后台2为店员3为商家网点',
  `ticketid` int(11) DEFAULT '0' COMMENT '店员或商家网点ID',
  `ticketname` varchar(50) DEFAULT '' COMMENT '店员或商家网点名称',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_prizeid` (`prizeid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_fanstmplmsg;
CREATE TABLE `ims_stonefish_scratch_fanstmplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户openid',
  `tmplmsgid` int(11) DEFAULT '0' COMMENT '消息模板ID',
  `tmplmsg` text NOT NULL COMMENT '发送内容',
  `createtime` int(10) DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_prizeid` (`tmplmsgid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_prize;
CREATE TABLE `ims_stonefish_scratch_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `prizetype` varchar(20) NOT NULL COMMENT '奖品类型真实虚拟积分等',
  `prizevalue` int(10) NOT NULL COMMENT '积分或实物以及虚拟价值',
  `prizerating` varchar(50) NOT NULL COMMENT '奖品等级',
  `prizename` varchar(50) NOT NULL COMMENT '奖品名称',
  `prizepic` varchar(255) NOT NULL COMMENT '奖品图片',
  `prizetotal` int(10) NOT NULL COMMENT '奖品数量',
  `prizedraw` int(10) NOT NULL COMMENT '中奖数量',
  `prizeren` int(10) NOT NULL COMMENT '每人最多中奖',
  `prizeday` int(10) NOT NULL COMMENT '每天最多发奖',
  `probalilty` varchar(5) NOT NULL COMMENT '中奖概率%',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `break` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '需要帮助人数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_prizemika;
CREATE TABLE `ims_stonefish_scratch_prizemika` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `prizeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖品ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `mikacodesn` varchar(100) NOT NULL COMMENT '密卡字符串',
  `virtual_value` int(10) NOT NULL COMMENT '积分或实物以及虚拟价值',
  `actionurl` varchar(200) NOT NULL COMMENT '激活地址',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否领取1为领取过',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_reply;
CREATE TABLE `ims_stonefish_scratch_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `templateid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动模板ID',
  `title` varchar(50) DEFAULT '' COMMENT '活动标题',
  `description` varchar(255) DEFAULT '' COMMENT '活动简介',
  `start_picurl` varchar(200) DEFAULT '' COMMENT '活动开始图片',
  `end_title` varchar(50) DEFAULT '' COMMENT '结束标题',
  `end_description` varchar(200) DEFAULT '' COMMENT '活动结束简介',
  `end_picurl` varchar(200) DEFAULT '' COMMENT '活动结束图片',
  `isshow` tinyint(1) DEFAULT '1' COMMENT '活动是否停止0为暂停1为活动中',
  `starttime` int(10) DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) DEFAULT '0' COMMENT '结束时间',
  `music` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否打开背景音乐',
  `musicurl` varchar(255) NOT NULL DEFAULT '' COMMENT '背景音乐地址',
  `mauto` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '音乐是否自动播放',
  `mloop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否循环播放',
  `issubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与类型0为任意1为关注粉丝2为会员',
  `visubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '助力类型',
  `fansnum` int(10) DEFAULT '0' COMMENT '参与人数',
  `viewnum` int(10) DEFAULT '0' COMMENT '访问次数',
  `prize_num` int(10) DEFAULT '0' COMMENT '奖品总数',
  `award_num` int(11) DEFAULT '0' COMMENT '每人最多获奖次数',
  `award_num_tips` varchar(100) DEFAULT '' COMMENT '超过中奖数量提示',
  `number_times` int(11) DEFAULT '0' COMMENT '每人最多参与次数',
  `number_times_tips` varchar(100) DEFAULT '' COMMENT '超过总次数提示',
  `day_number_times` int(11) DEFAULT '0' COMMENT '每人每天最多参与次数',
  `day_number_times_tips` varchar(100) DEFAULT '' COMMENT '超过每天次数提示',
  `viewawardnum` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '首页显示中奖人数',
  `viewranknum` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排行榜人数',
  `showprize` tinyint(1) DEFAULT '0' COMMENT '是否显示奖品',
  `prizeinfo` text NOT NULL COMMENT '奖品详细介绍',
  `awardtext` varchar(1000) DEFAULT '' COMMENT '中奖提示文字',
  `notawardtext` varchar(1000) DEFAULT '' COMMENT '没有中奖提示文字',
  `notprizetext` varchar(1000) DEFAULT '' COMMENT '没有奖品提示文字',
  `tips` varchar(200) DEFAULT '' COMMENT '活动次数提示',
  `copyright` varchar(20) DEFAULT '' COMMENT '版权',
  `inpointstart` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '初始分值1',
  `inpointend` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '初始分值2',
  `power` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否获取助力者头像昵称1opneid 2头像昵称',
  `poweravatar` varchar(3) DEFAULT '0' COMMENT '头像大小',
  `powertype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '助力类型0访问助力1点击助力',
  `randompointstart` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '助力随机金额范围开始数',
  `randompointend` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '助力随机金额范围结束数',
  `addp` tinyint(1) DEFAULT '100' COMMENT '好友助力机率%',
  `limittype` tinyint(1) DEFAULT '0' COMMENT '限制类型0为只能一次1为每天一次',
  `totallimit` tinyint(1) DEFAULT '1' COMMENT '好友助力总次数制',
  `helptype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '互助0为互助1为禁止',
  `xuninum` int(10) unsigned NOT NULL DEFAULT '500' COMMENT '虚拟人数',
  `xuninumtime` int(10) unsigned NOT NULL DEFAULT '86400' COMMENT '虚拟间隔时间',
  `xuninuminitial` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '虚拟随机数值1',
  `xuninumending` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '虚拟随机数值2',
  `xuninum_time` int(10) unsigned NOT NULL COMMENT '虚拟更新时间',
  `adpic` varchar(255) DEFAULT '' COMMENT '活动页顶部广告图',
  `adpicurl` varchar(255) DEFAULT '' COMMENT '活动页顶部广告链接',
  `homepictime` tinyint(1) unsigned NOT NULL COMMENT '首页秒显图片显示时间',
  `homepictype` tinyint(1) unsigned NOT NULL COMMENT '首页广告类型1为每次2为每天3为每周4为仅1次',
  `homepic` varchar(225) NOT NULL COMMENT '首页秒显图片',
  `opportunity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与次数选项0活动设置1商户赠送2为积分购买',
  `opportunity_txt` text NOT NULL COMMENT '商户赠送/积分购买说明',
  `credit_type` varchar(20) DEFAULT '' COMMENT '积分类型',
  `credit_value` int(11) DEFAULT '0' COMMENT '积分购买多少积分',
  `createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_share;
CREATE TABLE `ims_stonefish_scratch_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `acid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '子公众号ID',
  `help_url` varchar(255) DEFAULT '' COMMENT '帮助关注引导页',
  `share_url` varchar(255) DEFAULT '' COMMENT '参与关注引导页',
  `share_open_close` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启作用',
  `share_title` varchar(50) DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(100) DEFAULT '' COMMENT '分享简介',
  `share_txt` text NOT NULL COMMENT '参与活动规则',
  `share_img` varchar(255) NOT NULL COMMENT '分享朋友或朋友圈图',
  `share_anniu` varchar(255) NOT NULL COMMENT '分享朋友或朋友圈按钮或文字',
  `share_firend` varchar(255) NOT NULL COMMENT '助力按钮',
  `share_pic` varchar(255) NOT NULL COMMENT '分享弹出图片',
  `share_confirm` varchar(200) DEFAULT '' COMMENT '分享成功提示语',
  `share_confirmurl` varchar(255) DEFAULT '' COMMENT '分享成功跳转URL',
  `share_fail` varchar(200) DEFAULT '' COMMENT '分享失败提示语',
  `share_cancel` varchar(200) DEFAULT '' COMMENT '分享中途取消提示语',
  `sharetimes` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为每天次数2为总次数',
  `sharetype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分享赠送类型0分享立即赠送1分享成功赠送',
  `sharenumtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分享赠送机会类型0单独赠送机会1每人赠送机会2分享共计赠送',
  `sharenum` varchar(5) DEFAULT '0' COMMENT '分享赠送礼盒基数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_acid` (`acid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_sharedata;
CREATE TABLE `ims_stonefish_scratch_sharedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `from_user` varchar(50) NOT NULL DEFAULT '' COMMENT '分享人openid',
  `fromuser` varchar(50) NOT NULL DEFAULT '' COMMENT '访问人openid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `visitorsip` varchar(15) NOT NULL DEFAULT '' COMMENT '访问IP',
  `visitorstime` int(10) unsigned NOT NULL COMMENT '访问时间',
  `point` decimal(10,2) DEFAULT '0.00' COMMENT '助力金额',
  `viewnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_template;
CREATE TABLE `ims_stonefish_scratch_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(20) DEFAULT '' COMMENT '模板名称',
  `thumb` varchar(255) DEFAULT '' COMMENT '模板缩略图',
  `fontsize` varchar(2) DEFAULT '12' COMMENT '文字大小',
  `bgimg` varchar(255) DEFAULT '' COMMENT '背景图',
  `bgcolor` varchar(7) DEFAULT '' COMMENT '背景色',
  `textcolor` varchar(7) DEFAULT '' COMMENT '文字色',
  `textcolorlink` varchar(7) DEFAULT '' COMMENT '链接文字色',
  `buttoncolor` varchar(7) DEFAULT '' COMMENT '按钮色',
  `buttontextcolor` varchar(7) DEFAULT '' COMMENT '按钮文字色',
  `rulecolor` varchar(7) DEFAULT '' COMMENT '规则框背景色',
  `ruletextcolor` varchar(7) DEFAULT '' COMMENT '规则框文字色',
  `navcolor` varchar(7) DEFAULT '' COMMENT '导航色',
  `navtextcolor` varchar(7) DEFAULT '' COMMENT '导航文字色',
  `navactioncolor` varchar(7) DEFAULT '' COMMENT '导航选中文字色',
  `watchcolor` varchar(7) DEFAULT '' COMMENT '弹出框背景色',
  `watchtextcolor` varchar(7) DEFAULT '' COMMENT '弹出框文字色',
  `awardcolor` varchar(7) DEFAULT '' COMMENT '兑奖框背景色',
  `awardtextcolor` varchar(7) DEFAULT '' COMMENT '兑奖框文字色',
  `awardscolor` varchar(7) DEFAULT '' COMMENT '兑奖框成功背景色',
  `awardstextcolor` varchar(7) DEFAULT '' COMMENT '兑奖框成功文字色',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_stonefish_scratch_tmplmsg;
CREATE TABLE `ims_stonefish_scratch_tmplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `template_id` varchar(50) DEFAULT '' COMMENT '模板ID',
  `template_name` varchar(20) DEFAULT '' COMMENT '模板名称',
  `topcolor` varchar(7) DEFAULT '' COMMENT '通知文字色',
  `first` varchar(100) DEFAULT '' COMMENT '标题',
  `firstcolor` varchar(7) DEFAULT '' COMMENT '标题文字色',
  `keyword1` varchar(100) DEFAULT '' COMMENT '参数1',
  `keyword1code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword1color` varchar(7) DEFAULT '' COMMENT '参数1文字色',
  `keyword2` varchar(100) DEFAULT '' COMMENT '参数2',
  `keyword2code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword2color` varchar(7) DEFAULT '' COMMENT '参数2文字色',
  `keyword3` varchar(100) DEFAULT '' COMMENT '参数3',
  `keyword3code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword3color` varchar(7) DEFAULT '' COMMENT '参数3文字色',
  `keyword4` varchar(100) DEFAULT '' COMMENT '参数4',
  `keyword4code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword4color` varchar(7) DEFAULT '' COMMENT '参数4文字色',
  `keyword5` varchar(100) DEFAULT '' COMMENT '参数5',
  `keyword5code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword5color` varchar(7) DEFAULT '' COMMENT '参数5文字色',
  `keyword6` varchar(100) DEFAULT '' COMMENT '参数6',
  `keyword6code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword6color` varchar(7) DEFAULT '' COMMENT '参数6文字色',
  `keyword7` varchar(100) DEFAULT '' COMMENT '参数7',
  `keyword7code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword7color` varchar(7) DEFAULT '' COMMENT '参数7文字色',
  `keyword8` varchar(100) DEFAULT '' COMMENT '参数8',
  `keyword8code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword8color` varchar(7) DEFAULT '' COMMENT '参数8文字色',
  `keyword9` varchar(100) DEFAULT '' COMMENT '参数9',
  `keyword9code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword9color` varchar(7) DEFAULT '' COMMENT '参数9文字色',
  `keyword10` varchar(100) DEFAULT '' COMMENT '参数10',
  `keyword10code` varchar(20) DEFAULT '' COMMENT '参数1字段',
  `keyword10color` varchar(7) DEFAULT '' COMMENT '参数10文字色',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `remarkcolor` varchar(7) DEFAULT '' COMMENT '备注文字色',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_str_config;
CREATE TABLE `ims_str_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `paytime_limit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_str_dish;
CREATE TABLE `ims_str_dish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `total` int(10) NOT NULL DEFAULT '0',
  `sailed` int(10) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `thumb` varchar(60) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_str_dish_category;
CREATE TABLE `ims_str_dish_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(20) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_str_dish_comment;
CREATE TABLE `ims_str_dish_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `oid` int(10) unsigned NOT NULL,
  `did` int(10) unsigned NOT NULL,
  `score` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `oid` (`oid`),
  KEY `did` (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_str_order;
CREATE TABLE `ims_str_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `num` tinyint(3) unsigned NOT NULL,
  `delivery_time` varchar(15) NOT NULL,
  `pay_type` varchar(15) NOT NULL,
  `dish` varchar(3000) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '2',
  `comment` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `print_nums` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid_sid` (`uniacid`,`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_str_order_print;
CREATE TABLE `ims_str_order_print` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oid` int(10) unsigned NOT NULL DEFAULT '0',
  `foid` varchar(50) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`),
  KEY `foid` (`foid`),
  KEY `uniacid` (`uniacid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_str_print;
CREATE TABLE `ims_str_print` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `print_no` varchar(30) NOT NULL,
  `key` varchar(30) NOT NULL,
  `print_nums` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `qrcode_link` varchar(100) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_str_store;
CREATE TABLE `ims_str_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `business_hours` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `send_price` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delivery_price` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delivery_time` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `serve_radius` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delivery_area` varchar(50) NOT NULL,
  `thumbs` varchar(1000) NOT NULL,
  `district` varchar(40) NOT NULL,
  `address` varchar(50) NOT NULL,
  `location_x` varchar(15) NOT NULL,
  `location_y` varchar(15) NOT NULL,
  `email_notice` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(30) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `notice_acid` int(10) unsigned NOT NULL DEFAULT '0',
  `groupid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_sunshine_gaokaotoutiao_member;
CREATE TABLE `ims_sunshine_gaokaotoutiao_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `openid` varchar(500) NOT NULL DEFAULT '',
  `realname` varchar(500) NOT NULL DEFAULT '',
  `place` text NOT NULL,
  `add_time` datetime NOT NULL,
  `type_id` int(10) NOT NULL DEFAULT '0' COMMENT 'sucai_id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_sunshine_gaokaotoutiao_sucai;
CREATE TABLE `ims_sunshine_gaokaotoutiao_sucai` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `img_url` varchar(500) NOT NULL DEFAULT '',
  `add_time` datetime NOT NULL,
  `is_del` enum('0','1') DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_super_securitycode_data_moban;
CREATE TABLE `ims_super_securitycode_data_moban` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `spec` varchar(20) DEFAULT NULL,
  `weight` varchar(20) DEFAULT NULL,
  `factory` varchar(500) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `creditname` varchar(20) NOT NULL,
  `creditnum` int(10) unsigned NOT NULL,
  `creditstatus` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `stime` int(10) unsigned NOT NULL,
  `createtime` decimal(11,0) NOT NULL,
  `num` int(10) NOT NULL,
  `tourl` varchar(500) DEFAULT NULL,
  `img_banner` varchar(500) DEFAULT NULL,
  `img_logo` varchar(500) DEFAULT NULL COMMENT '图片',
  `video` varchar(500) DEFAULT NULL COMMENT '视频',
  `buyurl` varchar(500) DEFAULT NULL COMMENT '购买链接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_super_securitycode_logs;
CREATE TABLE `ims_super_securitycode_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_super_securitycode_reply;
CREATE TABLE `ims_super_securitycode_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(10) NOT NULL,
  `Reply` varchar(1000) NOT NULL,
  `Integral` int(10) NOT NULL,
  `tnumber` int(10) NOT NULL,
  `Failure` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_superman_floor;
CREATE TABLE `ims_superman_floor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `awardprompt` text NOT NULL,
  `currentprompt` text NOT NULL,
  `floorprompt` text NOT NULL,
  `setting` text NOT NULL,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_superman_floor_award;
CREATE TABLE `ims_superman_floor_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `floors` varchar(1000) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_superman_floor_winner;
CREATE TABLE `ims_superman_floor_winner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `floor` int(4) unsigned NOT NULL DEFAULT '0',
  `uid` int(4) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL DEFAULT '0',
  `award_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `realname` varchar(128) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid_floor_UNIQUE` (`rid`,`floor`),
  KEY `indx_uniacid` (`uniacid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_superman_getcash;
CREATE TABLE `ims_superman_getcash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `realname` varchar(100) NOT NULL DEFAULT '',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `message` varchar(500) NOT NULL DEFAULT '',
  `reason` varchar(500) NOT NULL DEFAULT '',
  `order_no` varchar(100) NOT NULL DEFAULT '',
  `payment_no` varchar(100) NOT NULL DEFAULT '',
  `insert_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uniacid` (`uniacid`),
  KEY `from_user` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_survey;
CREATE TABLE `ims_survey` (
  `sid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `information` varchar(500) NOT NULL DEFAULT '',
  `thumb` varchar(200) NOT NULL DEFAULT '',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL,
  `pertotal` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `suggest_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`sid`),
  KEY `weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_survey_data;
CREATE TABLE `ims_survey_data` (
  `sdid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `srid` int(11) NOT NULL,
  `sfid` int(11) NOT NULL,
  `data` varchar(800) NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sdid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_survey_fields;
CREATE TABLE `ims_survey_fields` (
  `sfid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `essential` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bind` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sfid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_survey_reply;
CREATE TABLE `ims_survey_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_survey_rows;
CREATE TABLE `ims_survey_rows` (
  `srid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `suggest` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`srid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tb_add;
CREATE TABLE `ims_tb_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `remark1` text NOT NULL,
  `remark2` text NOT NULL,
  `remark3` text NOT NULL,
  `uniacid` int(11) NOT NULL,
  `show` int(11) NOT NULL,
  `text` text NOT NULL,
  `lian` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推广宝贝';



DROP TABLE IF EXISTS ims_tg_address;
CREATE TABLE `ims_tg_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(300) NOT NULL,
  `cname` varchar(30) NOT NULL COMMENT '收货人名称',
  `tel` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `county` varchar(20) NOT NULL COMMENT '县(区)',
  `detailed_address` varchar(225) NOT NULL COMMENT '详细地址',
  `uniacid` int(10) NOT NULL COMMENT '公众号id',
  `addtime` varchar(45) NOT NULL,
  `status` int(2) NOT NULL COMMENT '1为默认',
  `type` int(2) NOT NULL COMMENT '1公司，2家庭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_admin;
CREATE TABLE `ims_tg_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(30) NOT NULL COMMENT '管理员名称',
  `password` varchar(20) NOT NULL COMMENT '管理员密码',
  `email` varchar(60) NOT NULL COMMENT '邮箱',
  `tel` varchar(20) NOT NULL COMMENT '手机号',
  `uniacid` int(10) DEFAULT NULL COMMENT '公众号id',
  `openid` varchar(100) DEFAULT NULL COMMENT '用户openid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `openid` (`openid`),
  UNIQUE KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_adv;
CREATE TABLE `ims_tg_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_arealimit;
CREATE TABLE `ims_tg_arealimit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `arealimitname` varchar(56) NOT NULL,
  `areas` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_category;
CREATE TABLE `ims_tg_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_collect;
CREATE TABLE `ims_tg_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `openid` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_dispatch;
CREATE TABLE `ims_tg_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `dispatchname` varchar(50) DEFAULT '',
  `dispatchtype` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `firstprice` decimal(10,2) DEFAULT '0.00',
  `secondprice` decimal(10,2) DEFAULT '0.00',
  `firstweight` int(11) DEFAULT '0',
  `secondweight` int(11) DEFAULT '0',
  `express` varchar(250) DEFAULT '',
  `areas` text,
  `carriers` text,
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_goods;
CREATE TABLE `ims_tg_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gname` varchar(225) NOT NULL COMMENT '商品名称',
  `fk_typeid` int(10) unsigned NOT NULL COMMENT '所属分类id',
  `gsn` varchar(50) NOT NULL COMMENT '商品货号',
  `gnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `groupnum` int(10) unsigned NOT NULL COMMENT '最低拼团人数',
  `mprice` decimal(10,2) NOT NULL,
  `gprice` decimal(10,2) NOT NULL COMMENT '团购价',
  `oprice` decimal(10,2) NOT NULL COMMENT '单买价',
  `freight` decimal(10,2) NOT NULL,
  `gdesc` longtext NOT NULL COMMENT '商品简介',
  `gdesc1` varchar(100) DEFAULT NULL COMMENT '商品特点1',
  `gdesc2` varchar(100) DEFAULT NULL COMMENT '商品特点2',
  `gdesc3` varchar(100) DEFAULT NULL COMMENT '商品特点3',
  `gimg` varchar(225) DEFAULT NULL COMMENT '商品图片路径',
  `gubtime` int(10) unsigned NOT NULL COMMENT '商品上架时间',
  `isshow` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否上架',
  `salenum` int(10) unsigned NOT NULL COMMENT '销量',
  `ishot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否热卖',
  `displayorder` int(11) NOT NULL,
  `createtime` int(10) unsigned NOT NULL COMMENT '最后修改时间',
  `uniacid` int(10) NOT NULL COMMENT '公众号的id',
  `endtime` int(11) NOT NULL COMMENT '团购限时（小时数）',
  `yunfei_id` int(11) NOT NULL,
  `is_discount` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `is_hexiao` int(2) NOT NULL,
  `hexiao_id` varchar(225) NOT NULL,
  `is_share` int(2) NOT NULL,
  `gdetaile` longtext NOT NULL,
  `isnew` int(11) NOT NULL,
  `isrecommand` int(11) NOT NULL,
  `isdiscount` int(11) NOT NULL,
  `hasoption` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gname` (`gname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_goods_atlas;
CREATE TABLE `ims_tg_goods_atlas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `g_id` int(11) NOT NULL COMMENT '商品id',
  `thumb` varchar(145) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_goods_imgs;
CREATE TABLE `ims_tg_goods_imgs` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fk_gid` int(10) NOT NULL COMMENT '对应商品的id',
  `albumpath` varchar(225) NOT NULL COMMENT '图片路径',
  `uniacid` int(10) NOT NULL COMMENT '公众号id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_gid` (`fk_gid`),
  UNIQUE KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_goods_option;
CREATE TABLE `ims_tg_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `productprice` decimal(10,2) DEFAULT '0.00',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `costprice` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `displayorder` int(11) DEFAULT '0',
  `specs` text,
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_goods_param;
CREATE TABLE `ims_tg_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_goods_type;
CREATE TABLE `ims_tg_goods_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cname` varchar(30) NOT NULL COMMENT '分类名称',
  `pid` int(10) DEFAULT NULL COMMENT '上级分类的id',
  `uniacid` int(10) DEFAULT NULL COMMENT '公众号的id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_group;
CREATE TABLE `ims_tg_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupnumber` varchar(115) NOT NULL COMMENT '团编号',
  `goodsid` int(11) NOT NULL COMMENT '商品ID',
  `goodsname` varchar(1024) NOT NULL COMMENT '商品名称',
  `groupstatus` int(11) NOT NULL COMMENT '团状态',
  `neednum` int(11) NOT NULL COMMENT '所需人数',
  `lacknum` int(11) NOT NULL COMMENT '缺少人数',
  `starttime` varchar(225) NOT NULL COMMENT '开团时间',
  `endtime` varchar(225) NOT NULL COMMENT '到期时间',
  `uniacid` int(11) NOT NULL,
  `grouptype` int(11) NOT NULL COMMENT '1同2异3普通4单',
  `isshare` int(11) NOT NULL COMMENT '1分享2不分享',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_member;
CREATE TABLE `ims_tg_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号id',
  `openid` varchar(100) NOT NULL COMMENT '微信会员openID',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `addtime` varchar(45) NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_order;
CREATE TABLE `ims_tg_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` varchar(45) NOT NULL COMMENT '公众号',
  `gnum` int(11) NOT NULL COMMENT '购买数量',
  `openid` varchar(45) NOT NULL COMMENT '用户名',
  `ptime` varchar(45) NOT NULL COMMENT '支付成功时间',
  `orderno` varchar(45) NOT NULL COMMENT '订单编号',
  `price` varchar(45) NOT NULL COMMENT '价格',
  `status` int(9) NOT NULL COMMENT '订单状态0未支1支付，2已发货，3完成订单，9取消订单',
  `addressid` int(11) NOT NULL COMMENT '地址id',
  `g_id` int(11) NOT NULL COMMENT '商品id',
  `tuan_id` int(11) NOT NULL COMMENT '团id',
  `is_tuan` int(2) NOT NULL COMMENT '是否为团1为团0为单人',
  `createtime` varchar(45) NOT NULL COMMENT '订单生成时间',
  `pay_type` int(4) NOT NULL COMMENT '支付方式',
  `starttime` varchar(45) NOT NULL COMMENT '开始时间',
  `endtime` int(45) NOT NULL COMMENT '结束时间（小时）',
  `tuan_first` int(11) NOT NULL COMMENT '团长',
  `express` varchar(50) DEFAULT NULL COMMENT '快递公司名称',
  `expresssn` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `transid` varchar(50) NOT NULL,
  `remark` varchar(100) NOT NULL,
  `success` int(11) NOT NULL,
  `addname` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `goodsprice` varchar(45) NOT NULL,
  `pay_price` varchar(45) NOT NULL,
  `freight` varchar(45) NOT NULL,
  `credits` int(11) NOT NULL,
  `is_usecard` int(11) NOT NULL,
  `is_hexiao` int(2) NOT NULL,
  `hexiaoma` varchar(50) NOT NULL,
  `veropenid` varchar(200) NOT NULL,
  `sendtime` varchar(115) NOT NULL,
  `gettime` varchar(115) NOT NULL,
  `addresstype` int(11) NOT NULL,
  `optionid` int(11) NOT NULL,
  `checkpay` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_order_goods;
CREATE TABLE `ims_tg_order_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fk_orderid` int(10) NOT NULL COMMENT '订单id',
  `fk_goodid` int(10) NOT NULL COMMENT '商品id',
  `uniacid` int(10) NOT NULL COMMENT '公众号id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_orderid` (`fk_orderid`),
  UNIQUE KEY `fk_goodid` (`fk_goodid`),
  UNIQUE KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_order_print;
CREATE TABLE `ims_tg_order_print` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `pid` int(3) NOT NULL,
  `oid` int(10) NOT NULL,
  `foid` varchar(50) NOT NULL,
  `status` int(3) NOT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_print;
CREATE TABLE `ims_tg_print` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `print_no` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `member_code` varchar(50) NOT NULL,
  `print_nums` int(3) NOT NULL,
  `qrcode_link` varchar(100) NOT NULL,
  `status` int(3) NOT NULL,
  `mode` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_refund_record;
CREATE TABLE `ims_tg_refund_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transid` varchar(115) NOT NULL COMMENT '订单编号',
  `createtime` varchar(45) NOT NULL COMMENT '退款时间',
  `status` int(11) NOT NULL COMMENT '0未成功1成功',
  `type` int(11) NOT NULL COMMENT '1手机端2Web端3最后一人退款4部分退款',
  `goodsid` int(11) NOT NULL COMMENT '商品ID',
  `payfee` varchar(100) NOT NULL COMMENT '支付金额',
  `refundfee` varchar(100) NOT NULL COMMENT '退还金额',
  `refund_id` varchar(115) NOT NULL COMMENT '微信退款单号',
  `refundername` varchar(100) NOT NULL COMMENT '退款人姓名',
  `refundermobile` varchar(100) NOT NULL COMMENT '退款人电话',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `uniacid` int(11) NOT NULL,
  `orderid` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_rules;
CREATE TABLE `ims_tg_rules` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rulesname` varchar(40) NOT NULL COMMENT '规则名称',
  `rulesdetail` varchar(4000) DEFAULT NULL COMMENT '规则详情',
  `uniacid` int(10) NOT NULL COMMENT '公众号的id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rulesname` (`rulesname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_saler;
CREATE TABLE `ims_tg_saler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeid` varchar(225) DEFAULT '',
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `nickname` varchar(145) NOT NULL,
  `avatar` varchar(225) NOT NULL,
  `status` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_storeid` (`storeid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_spec;
CREATE TABLE `ims_tg_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `displaytype` tinyint(3) unsigned NOT NULL,
  `content` text NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_spec_item;
CREATE TABLE `ims_tg_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `show` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_specid` (`specid`),
  KEY `indx_show` (`show`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_store;
CREATE TABLE `ims_tg_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `storename` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `tel` varchar(255) DEFAULT '',
  `lat` varchar(255) DEFAULT '',
  `lng` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `createtime` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_user;
CREATE TABLE `ims_tg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tg_users;
CREATE TABLE `ims_tg_users` (
  `id` int(10) NOT NULL COMMENT '主键',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '用户密码',
  `email` varchar(60) NOT NULL COMMENT '邮箱',
  `tel` varchar(20) NOT NULL COMMENT '电话',
  `uniacid` int(10) NOT NULL COMMENT '公众号id',
  `openid` varchar(100) NOT NULL COMMENT '用户openid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `uniacid` (`uniacid`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_thinkidea_phonebook_category;
CREATE TABLE `ims_thinkidea_phonebook_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '行业名称',
  `parent_id` int(11) NOT NULL COMMENT '父id',
  `display` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `isshow` smallint(1) DEFAULT '1' COMMENT '是否显示',
  `dateline` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表';



DROP TABLE IF EXISTS ims_thinkidea_phonebook_info;
CREATE TABLE `ims_thinkidea_phonebook_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `zone` smallint(6) NOT NULL,
  `category` smallint(6) NOT NULL,
  `address` varchar(250) NOT NULL,
  `isauth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否认证',
  `coordinate` varchar(50) NOT NULL COMMENT '坐标',
  `dateline` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='电话本内容';



DROP TABLE IF EXISTS ims_thinkidea_phonebook_reply;
CREATE TABLE `ims_thinkidea_phonebook_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` smallint(6) NOT NULL,
  `weid` smallint(6) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_thinkidea_phonebook_zone;
CREATE TABLE `ims_thinkidea_phonebook_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL COMMENT '父id',
  `display` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `isshow` smallint(1) DEFAULT '1' COMMENT '是否显示',
  `dateline` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='区域表';



DROP TABLE IF EXISTS ims_thinkidea_rencai_adslider;
CREATE TABLE `ims_thinkidea_rencai_adslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '广告名称',
  `position` tinyint(1) NOT NULL COMMENT '幻灯、ad在的位置',
  `url` varchar(250) NOT NULL,
  `link` varchar(250) NOT NULL COMMENT '链接地址',
  `isshow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `display` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `dateline` int(11) NOT NULL DEFAULT '0',
  `exprtime` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`id`),
  KEY `weid` (`weid`,`position`,`isshow`,`display`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯、广告投放管理';



DROP TABLE IF EXISTS ims_thinkidea_rencai_apply_jobs;
CREATE TABLE `ims_thinkidea_rencai_apply_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL COMMENT '公众号',
  `person_id` int(11) NOT NULL COMMENT '求职者个人id',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `job_id` int(11) NOT NULL COMMENT '职位id',
  `dateline` int(11) NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`),
  KEY `weid` (`weid`,`person_id`,`job_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='求职者申请职位表';



DROP TABLE IF EXISTS ims_thinkidea_rencai_category;
CREATE TABLE `ims_thinkidea_rencai_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `isshow` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `display` smallint(1) NOT NULL DEFAULT '0' COMMENT '排序',
  `ishot` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否热门',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='职位分类表';



DROP TABLE IF EXISTS ims_thinkidea_rencai_company;
CREATE TABLE `ims_thinkidea_rencai_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `industry` smallint(1) DEFAULT NULL COMMENT '公司所属行业类别',
  `address` varchar(250) DEFAULT NULL COMMENT '公司地址',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `mobile` char(11) DEFAULT NULL COMMENT '手机',
  `scale` smallint(1) NOT NULL DEFAULT '0' COMMENT '规模',
  `type` tinyint(1) DEFAULT '0' COMMENT '企业类型',
  `description` text COMMENT '公司简介',
  `license` varchar(250) DEFAULT NULL COMMENT '公司营业执照',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过审核',
  `isauth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否认证',
  `view_resume_nums` smallint(6) NOT NULL DEFAULT '0' COMMENT '已经查看简历数',
  `view_resume_total` smallint(6) NOT NULL DEFAULT '0' COMMENT '查看简历数上限',
  `dateline` int(11) NOT NULL,
  `coordinate` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '企业封面',
  `position` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐位',
  PRIMARY KEY (`id`),
  KEY `weid_from_user` (`weid`,`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_thinkidea_rencai_industry;
CREATE TABLE `ims_thinkidea_rencai_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '行业名称',
  `parent_id` int(11) NOT NULL COMMENT '父id',
  `display` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `ishot` smallint(1) DEFAULT '0' COMMENT '是否热门',
  `isshow` smallint(1) DEFAULT '1' COMMENT '是否显示',
  `dateline` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行业分类表';



DROP TABLE IF EXISTS ims_thinkidea_rencai_job;
CREATE TABLE `ims_thinkidea_rencai_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `mid` int(11) NOT NULL COMMENT '企业id',
  `title` varchar(100) NOT NULL COMMENT '职位名称',
  `cid` int(11) NOT NULL COMMENT '职位类别id',
  `end_time` varchar(20) NOT NULL COMMENT '岗位截止日期',
  `payroll` smallint(6) NOT NULL COMMENT '薪资',
  `educational` tinyint(4) NOT NULL COMMENT '学历',
  `workexperience` tinyint(4) NOT NULL COMMENT '工作经验',
  `welfare` varchar(50) NOT NULL COMMENT '福利保障',
  `positiontype` tinyint(4) NOT NULL COMMENT '职位类型',
  `nums` int(11) NOT NULL COMMENT '招聘人数',
  `workaddress` varchar(50) NOT NULL COMMENT '工作地点',
  `description` varchar(255) NOT NULL COMMENT '职位信息描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `istop` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `ishot` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否热门',
  `expiration` int(11) NOT NULL DEFAULT '0' COMMENT '置顶过期时间',
  `dateline` int(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `weid_from_dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司职位信息';



DROP TABLE IF EXISTS ims_thinkidea_rencai_jobs_comments;
CREATE TABLE `ims_thinkidea_rencai_jobs_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` smallint(6) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL COMMENT '用户id可以是求职者也可以是招聘者',
  `jobid` int(11) DEFAULT NULL COMMENT '如果1jobid如果2resumeid',
  `content` varchar(250) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';



DROP TABLE IF EXISTS ims_thinkidea_rencai_member;
CREATE TABLE `ims_thinkidea_rencai_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '是1企业还是2个人',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态。是否可用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='注册用户表含企业、个人。作快速查询使用';



DROP TABLE IF EXISTS ims_thinkidea_rencai_person;
CREATE TABLE `ims_thinkidea_rencai_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `from_user` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(250) DEFAULT NULL,
  `sex` smallint(1) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `age` smallint(6) DEFAULT NULL,
  `educational` tinyint(1) DEFAULT NULL COMMENT '我的学历',
  `professional` varchar(50) DEFAULT NULL COMMENT '我的专业',
  `workexperience` smallint(6) DEFAULT NULL COMMENT '工作经验',
  `workaddress` varchar(50) DEFAULT NULL COMMENT '期望工作地点',
  `assessment` varchar(255) DEFAULT NULL COMMENT '自我评价',
  `istop` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶该简历',
  `expiration` int(11) NOT NULL DEFAULT '0',
  `dateline` int(11) NOT NULL,
  `views` int(11) NOT NULL COMMENT '被浏览数',
  `updatetime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `weid_from_user` (`weid`,`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='求职个人表';



DROP TABLE IF EXISTS ims_thinkidea_rencai_person_collect;
CREATE TABLE `ims_thinkidea_rencai_person_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL COMMENT '职位id',
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏职位表';



DROP TABLE IF EXISTS ims_thinkidea_rencai_person_resume;
CREATE TABLE `ims_thinkidea_rencai_person_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `weid` int(11) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `start_time` char(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` char(11) DEFAULT NULL COMMENT '结束时间',
  `wage` int(11) DEFAULT NULL COMMENT '税前工资',
  `work_description` text COMMENT '工作描述',
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人简历';



DROP TABLE IF EXISTS ims_thinkidea_rencai_reply;
CREATE TABLE `ims_thinkidea_rencai_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_thinkidea_rencai_share;
CREATE TABLE `ims_thinkidea_rencai_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_title` varchar(250) NOT NULL DEFAULT '0',
  `default_desc` varchar(250) NOT NULL DEFAULT '0',
  `default_pic` varchar(250) NOT NULL DEFAULT '0',
  `index_title` varchar(250) NOT NULL COMMENT '首页title',
  `index_desc` varchar(250) NOT NULL COMMENT '首页描述',
  `index_pic` varchar(250) NOT NULL,
  `zhao_title` varchar(250) NOT NULL COMMENT '招聘列表页title',
  `zhao_desc` varchar(250) NOT NULL COMMENT '招聘列表页描述',
  `zhao_pic` varchar(250) NOT NULL,
  `qiu_title` varchar(250) NOT NULL COMMENT '求职列表页title',
  `qiu_desc` varchar(250) NOT NULL COMMENT '求职列表页描述',
  `qiu_pic` varchar(250) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '统一公众号',
  `mobile_title` varchar(255) DEFAULT NULL COMMENT '手机端title',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置分享';



DROP TABLE IF EXISTS ims_thinkidea_secondmarket_category;
CREATE TABLE `ims_thinkidea_secondmarket_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目id',
  `weid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_thinkidea_secondmarket_goods;
CREATE TABLE `ims_thinkidea_secondmarket_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `title` varchar(20) NOT NULL,
  `rolex` varchar(30) NOT NULL,
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) NOT NULL,
  `realname` varchar(18) NOT NULL,
  `sex` int(1) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `description` longtext NOT NULL,
  `thumb1` varchar(200) DEFAULT NULL,
  `thumb2` varchar(200) DEFAULT NULL,
  `thumb3` varchar(200) DEFAULT NULL,
  `createtime` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_thinkidea_secondmarket_reply;
CREATE TABLE `ims_thinkidea_secondmarket_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `acid` int(11) NOT NULL,
  `title` text NOT NULL,
  `avatar` text NOT NULL,
  `description` text NOT NULL,
  `dateline` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tim_cowsetting;
CREATE TABLE `ims_tim_cowsetting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `index_intro` varchar(200) DEFAULT NULL,
  `counttime` int(5) DEFAULT NULL,
  `goods` varchar(10) DEFAULT NULL,
  `tips` varchar(200) NOT NULL,
  `rules` text,
  `share_title` varchar(100) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_tim_cowuser;
CREATE TABLE `ims_tim_cowuser` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_photo` varchar(200) NOT NULL,
  `user_score` int(10) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_uni_account;
CREATE TABLE `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `default_acid` int(10) unsigned NOT NULL,
  `rank` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

INSERT INTO ims_uni_account VALUES 
('1','-1','微赞团队','一个朝气蓬勃的团队','1','0');


DROP TABLE IF EXISTS ims_uni_account_group;
CREATE TABLE `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ims_uni_account_group VALUES 
('1','2','1');


DROP TABLE IF EXISTS ims_uni_account_menus;
CREATE TABLE `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `menuid` (`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_uni_account_modules;
CREATE TABLE `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=7297 DEFAULT CHARSET=utf8;

INSERT INTO ims_uni_account_modules VALUES 
('1','1','basic','1',''),
('2','1','news','1',''),
('3','1','music','1',''),
('4','1','userapi','1',''),
('5','1','recharge','1',''),
('6','1','hx_pictorial','1',''),
('8','1','hx_lottery','1',''),
('10','1','meepo_pai','1',''),
('12','1','hx_express','1',''),
('14','1','hx_cards','1',''),
('16','1','we7_business','1',''),
('18','1','we7_album','1',''),
('20','1','wl_heka','1',''),
('22','1','lxy_rtrouter','1',''),
('24','1','superman_floor','1',''),
('26','1','meepo_sexy','1',''),
('28','1','weihaom_wb','1',''),
('30','1','meepo_danmu','1',''),
('32','1','we7_research','1',''),
('34','1','we7_survey','1',''),
('36','1','ewei_vote','1',''),
('38','1','hl_bbb','1',''),
('40','1','hl_dqq','1',''),
('42','1','hl_zzz','1',''),
('44','1','hx_alert','1',''),
('46','1','qmteam_zerobuy','1',''),
('48','1','hx_dialect','1',''),
('50','1','we7_activity','1',''),
('52','1','lxy_marry','1',''),
('54','1','meepo_nsign','1',''),
('56','1','we7_car','1',''),
('58','1','we7_shake','1',''),
('60','1','ewei_exam','1',''),
('62','1','ewei_hotel','1',''),
('64','1','fwei_moneyimport','1',''),
('66','1','stonefish_bigwheel','1',''),
('68','1','scene_cube','1',''),
('70','1','qiyue_canvas','1',''),
('72','1','n1ce_picwether','1',''),
('74','1','weisrc_audio','1',''),
('76','1','we7_wxwall','1',''),
('78','1','weisrc_pano','1',''),
('80','1','iwobanji_xcpage','1',''),
('82','1','ykbl_robot','1',''),
('84','1','weisrc_invitative','1',''),
('86','1','we7_egg','1',''),
('88','1','weisrc_clubbigwheel','1',''),
('90','1','eso_share','1',''),
('92','1','mon_house','1',''),
('94','1','hx_zhongchou','1',''),
('96','1','zam_weimails','1',''),
('98','1','ewei_comeon','1',''),
('100','1','stonefish_scratch','1',''),
('102','1','hx_subscribe','1',''),
('104','1','jeffh_vwifi','1',''),
('106','1','zam_findlx','1',''),
('108','1','wkf_message','1',''),
('110','1','eso_sale','1',''),
('112','1','hx_voice','1',''),
('114','1','stonefish_luckynum','1',''),
('116','1','czt_zhuanfa','1',''),
('118','1','thinkidea_secondmarket','1',''),
('120','1','feng_duobao','1',''),
('122','1','weisrc_businesscenter','1',''),
('124','1','lxy_buildpro','1',''),
('126','1','microb_redpack','1',''),
('128','1','ewei_bonus','1',''),
('130','1','weisrc_truth','1',''),
('132','1','stonefish_chailihe','1',''),
('134','1','ewei_money','1',''),
('136','1','xfeng_community','1',''),
('138','1','jdg_luvwhispers','1',''),
('140','1','stonefish_redenvelope','1',''),
('142','1','czt_zwmm','1',''),
('144','1','ewei_couplet','1',''),
('146','1','mon_sign','1',''),
('148','1','qiyue_luckymoney','1',''),
('150','1','null_getvoice','1',''),
('152','1','qiyue_qiuqian','1',''),
('154','1','thinkidea_rencai','1',''),
('156','1','czt_voice','1',''),
('158','1','thinkidea_phonebook','1',''),
('160','1','str_takeout','1',''),
('162','1','weisrc_dish','1',''),
('164','1','eso_runman','1',''),
('166','1','mon_weishare','1',''),
('168','1','lee_tlvoice','1',''),
('170','1','zombie_fighting','1',''),
('172','1','ju_read','1',''),
('174','1','stonefish_planting','1',''),
('176','1','xhw_picvote','1',''),
('178','1','xhw_voice','1',''),
('180','1','xhw_face','1',''),
('182','1','super_securitycode','1',''),
('184','1','top_news','1',''),
('186','1','amouse_house','1',''),
('188','1','mon_yjgz','1',''),
('190','1','amouse_article','1',''),
('192','1','jufeng_wcy','1',''),
('194','1','mon_brand','1',''),
('196','1','lee_coreball','1',''),
('198','1','page_switch','1',''),
('200','1','mon_fool','1',''),
('202','1','amouse_weicard','1',''),
('204','1','ewei_dream','1',''),
('206','1','ewei_shangshi','1',''),
('208','1','meepo_weixiangqin','1',''),
('210','1','amouse_ecard','1',''),
('212','1','wdl_bigwheel','1',''),
('214','1','xwz_queue','1',''),
('216','1','meepo_begging','1',''),
('218','1','fm_photosvote','1',''),
('220','1','wdl_shopping','1',''),
('222','1','microb_shake','1',''),
('224','1','feng_auction','1',''),
('226','1','hl_periarthritis','1',''),
('228','1','wdl_hchighguess','1',''),
('230','1','feng_fightgroups','1',''),
('232','1','demo_pia3','1',''),
('234','1','weisrc_dragonboat','1',''),
('236','1','mon_orderform','1',''),
('238','1','water_query','1',''),
('240','1','mx_ssgz','1',''),
('242','1','feng_recharge','1',''),
('244','1','jdg_dream','1',''),
('246','1','zh_zhibo','1',''),
('248','1','yx_mishi','1',''),
('250','1','yx_stock','1',''),
('252','1','francin_lovehelper','1',''),
('254','1','bobo_love','1',''),
('256','1','hc_zqttt','1',''),
('258','1','voldemort_moon','1',''),
('260','1','mon_egg','1',''),
('262','1','n1ce_love','1',''),
('264','1','meepo_fen','1',''),
('266','1','water_query2','1',''),
('268','1','jy_wei','1',''),
('270','1','cut_zongzi','1',''),
('272','1','n1ce_newchat','1',''),
('274','1','fl_wsq_bmfw','1',''),
('276','1','zzplane_hhy','1',''),
('278','1','hong_kuaidi','1',''),
('280','1','lonaking_dwblessing','1',''),
('282','1','lonaking_niulangfly','1',''),
('284','1','wmb_goshare','1',''),
('286','1','yg_zongzi','1',''),
('288','1','bobo_dabai','1',''),
('290','1','czt_qzz','1',''),
('292','1','abc_basic','1',''),
('294','1','abc_news','1',''),
('296','1','astro_hhy','1',''),
('298','1','bus_hhy','1',''),
('300','1','enjoy_circle','1',''),
('302','1','bf_shell','1',''),
('304','1','ewei_takephotoa','1',''),
('306','1','find_hotel','1',''),
('308','1','fl_dkf_khxx','1',''),
('310','1','fl_gp','1',''),
('312','1','guess_girl','1',''),
('314','1','hc_ybdzs','1',''),
('316','1','hx_othermsg','1',''),
('318','1','ju_credit','1',''),
('320','1','junsion_qixiqueqiao','1',''),
('322','1','lions_zq','1',''),
('324','1','lonaking_express','1',''),
('326','1','meepo_credit1','1',''),
('328','1','n1ce_chatmore','1',''),
('330','1','nace_catch','1',''),
('332','1','name_hhy','1',''),
('334','1','on3_voxpic','1',''),
('336','1','sinrch_dataosha','1',''),
('338','1','netbuffer_idsearch','1',''),
('340','1','scnace_lm','1',''),
('342','1','wdl_cube','1',''),
('344','1','scnace_weblm','1',''),
('346','1','sunshine_gaokaotoutiao','1',''),
('348','1','wang_huayu','1',''),
('350','1','wdl_daoguo','1',''),
('352','1','wdl_damao','1',''),
('354','1','wdl_daqie','1',''),
('356','1','wdl_daweiwang','1',''),
('358','1','wdl_gongfumao','1',''),
('360','1','wdl_mazouri','1',''),
('362','1','wdl_luolicome','1',''),
('364','1','wdl_houzi','1',''),
('366','1','wdl_mishi','1',''),
('368','1','wdl_motianlou','1',''),
('370','1','wdl_nodie','1',''),
('372','1','wdl_qiexigua','1',''),
('374','1','we7_fance','1',''),
('376','1','wdl_sudujiqing','1',''),
('378','1','wdl_weizanxiu','1',''),
('380','1','quick_center','1',''),
('382','1','yg_supergrowth','1',''),
('384','1','yhc_onenavi','1',''),
('386','1','yhc_ecard','1',''),
('388','1','meepo_bbs','1',''),
('392','1','water_super','1',''),
('394','1','bmfloor','1',''),
('396','1','hx_securityspro','1',''),
('398','1','yobydashan','1',''),
('400','1','wdl_quickspread','1',''),
('402','1','broke','1',''),
('403','1','scan_video','1',''),
('406','1','xf_vktv','1',''),
('408','1','mon_wkj','1',''),
('410','1','lvyou','1',''),
('412','1','hlzonyu','1',''),
('414','1','cgt_qyhb','1',''),
('416','1','meepo_bigwall','1',''),
('418','1','xc_article','1',''),
('1455','1','czt_subscribe_redpack','1',''),
('1873','1','wdl_amovie','1',''),
('4176','1','weisrc_feedback','1',''),
('4187','1','aki_yzmye','1',''),
('4198','1','lonaking_activity','1',''),
('4209','1','lonaking_flash','1',''),
('4220','1','lonaking_fishjoy','1',''),
('4231','1','jing_guanzhu','1',''),
('4242','1','bm_qrsign','1',''),
('4253','1','weini_rhino','1',''),
('4264','1','xm_housekeep_we7','1',''),
('4275','1','kim_financial','1',''),
('4505','1','q_3354988381_xuyuan','1',''),
('4507','1','yg_hcity','1',''),
('4509','1','tim_cow','1',''),
('4511','1','amouse_friend_impress','1',''),
('6966','1','yg_parkour','1',''),
('6978','1','yg_asty','1',''),
('6990','1','lonaking_bb','1',''),
('7002','1','jing_ns','1',''),
('7014','1','ice_picwall','1',''),
('7273','1','dayu_yuyuepay','1',''),
('7026','1','enjoy_red','1',''),
('7271','1','mon_qmshake','1',''),
('7269','1','mon_jgg','1',''),
('7267','1','fm_jiaoyu','1',''),
('7277','1','jy_coupons','1',''),
('7279','1','superman_getcash','1',''),
('7281','1','j_activity','1',''),
('7283','1','danwu_show','1',''),
('7285','1','mb_swish','1',''),
('7287','1','tp_goods','1',''),
('7289','1','jer_da','1',''),
('7291','1','qw_yinpin','1',''),
('7293','1','junsion_poster','1',''),
('7295','1','xiaofeng_cexpress','1','');


DROP TABLE IF EXISTS ims_uni_account_users;
CREATE TABLE `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`uid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO ims_uni_account_users VALUES 
('1','1','1','manager');


DROP TABLE IF EXISTS ims_uni_group;
CREATE TABLE `ims_uni_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `modules` varchar(10000) NOT NULL,
  `templates` varchar(5000) NOT NULL DEFAULT '',
  `uniacid` int(10) unsigned NOT NULL,
  `price` decimal(11,2) DEFAULT '0.00' COMMENT '套餐价格',
  `hide` int(1) DEFAULT '0' COMMENT '是否隐藏 0-否 1-是',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ims_uni_group VALUES 
('1','体验套餐服务','a:220:{i:0;s:12:\"hx_pictorial\";i:1;s:10:\"hx_lottery\";i:2;s:9:\"meepo_pai\";i:3;s:10:\"hx_express\";i:4;s:8:\"hx_cards\";i:5;s:12:\"we7_business\";i:6;s:9:\"we7_album\";i:7;s:7:\"wl_heka\";i:8;s:12:\"lxy_rtrouter\";i:9;s:14:\"superman_floor\";i:10;s:10:\"meepo_sexy\";i:11;s:10:\"weihaom_wb\";i:12;s:11:\"meepo_danmu\";i:13;s:12:\"we7_research\";i:14;s:10:\"we7_survey\";i:15;s:9:\"ewei_vote\";i:16;s:6:\"hl_bbb\";i:17;s:6:\"hl_dqq\";i:18;s:6:\"hl_zzz\";i:19;s:8:\"hx_alert\";i:20;s:14:\"qmteam_zerobuy\";i:21;s:10:\"hx_dialect\";i:22;s:12:\"we7_activity\";i:23;s:9:\"lxy_marry\";i:24;s:11:\"meepo_nsign\";i:25;s:7:\"we7_car\";i:26;s:9:\"we7_shake\";i:27;s:9:\"ewei_exam\";i:28;s:10:\"ewei_hotel\";i:29;s:16:\"fwei_moneyimport\";i:30;s:18:\"stonefish_bigwheel\";i:31;s:10:\"scene_cube\";i:32;s:12:\"qiyue_canvas\";i:33;s:14:\"n1ce_picwether\";i:34;s:12:\"weisrc_audio\";i:35;s:10:\"we7_wxwall\";i:36;s:11:\"weisrc_pano\";i:37;s:15:\"iwobanji_xcpage\";i:38;s:10:\"ykbl_robot\";i:39;s:17:\"weisrc_invitative\";i:40;s:7:\"we7_egg\";i:41;s:19:\"weisrc_clubbigwheel\";i:42;s:9:\"eso_share\";i:43;s:9:\"mon_house\";i:44;s:12:\"hx_zhongchou\";i:45;s:12:\"zam_weimails\";i:46;s:11:\"ewei_comeon\";i:47;s:17:\"stonefish_scratch\";i:48;s:12:\"hx_subscribe\";i:49;s:11:\"jeffh_vwifi\";i:50;s:10:\"zam_findlx\";i:51;s:11:\"wkf_message\";i:52;s:8:\"eso_sale\";i:53;s:8:\"hx_voice\";i:54;s:18:\"stonefish_luckynum\";i:55;s:11:\"czt_zhuanfa\";i:56;s:22:\"thinkidea_secondmarket\";i:57;s:11:\"feng_duobao\";i:58;s:21:\"weisrc_businesscenter\";i:59;s:12:\"lxy_buildpro\";i:60;s:14:\"microb_redpack\";i:61;s:10:\"ewei_bonus\";i:62;s:12:\"weisrc_truth\";i:63;s:18:\"stonefish_chailihe\";i:64;s:10:\"ewei_money\";i:65;s:15:\"xfeng_community\";i:66;s:15:\"jdg_luvwhispers\";i:67;s:21:\"stonefish_redenvelope\";i:68;s:8:\"czt_zwmm\";i:69;s:12:\"ewei_couplet\";i:70;s:8:\"mon_sign\";i:71;s:16:\"qiyue_luckymoney\";i:72;s:13:\"null_getvoice\";i:73;s:13:\"qiyue_qiuqian\";i:74;s:16:\"thinkidea_rencai\";i:75;s:9:\"czt_voice\";i:76;s:19:\"thinkidea_phonebook\";i:77;s:11:\"str_takeout\";i:78;s:11:\"weisrc_dish\";i:79;s:10:\"eso_runman\";i:80;s:12:\"mon_weishare\";i:81;s:11:\"lee_tlvoice\";i:82;s:15:\"zombie_fighting\";i:83;s:7:\"ju_read\";i:84;s:18:\"stonefish_planting\";i:85;s:11:\"xhw_picvote\";i:86;s:9:\"xhw_voice\";i:87;s:8:\"xhw_face\";i:88;s:18:\"super_securitycode\";i:89;s:8:\"top_news\";i:90;s:12:\"amouse_house\";i:91;s:8:\"mon_yjgz\";i:92;s:14:\"amouse_article\";i:93;s:10:\"jufeng_wcy\";i:94;s:9:\"mon_brand\";i:95;s:12:\"lee_coreball\";i:96;s:11:\"page_switch\";i:97;s:8:\"mon_fool\";i:98;s:14:\"amouse_weicard\";i:99;s:10:\"ewei_dream\";i:100;s:13:\"ewei_shangshi\";i:101;s:17:\"meepo_weixiangqin\";i:102;s:12:\"amouse_ecard\";i:103;s:12:\"wdl_bigwheel\";i:104;s:9:\"xwz_queue\";i:105;s:13:\"meepo_begging\";i:106;s:13:\"fm_photosvote\";i:107;s:12:\"wdl_shopping\";i:108;s:12:\"microb_shake\";i:109;s:12:\"feng_auction\";i:110;s:16:\"hl_periarthritis\";i:111;s:15:\"wdl_hchighguess\";i:112;s:16:\"feng_fightgroups\";i:113;s:9:\"demo_pia3\";i:114;s:17:\"weisrc_dragonboat\";i:115;s:13:\"mon_orderform\";i:116;s:11:\"water_query\";i:117;s:7:\"mx_ssgz\";i:118;s:13:\"feng_recharge\";i:119;s:9:\"jdg_dream\";i:120;s:8:\"zh_zhibo\";i:121;s:8:\"yx_mishi\";i:122;s:8:\"yx_stock\";i:123;s:18:\"francin_lovehelper\";i:124;s:9:\"bobo_love\";i:125;s:8:\"hc_zqttt\";i:126;s:14:\"voldemort_moon\";i:127;s:7:\"mon_egg\";i:128;s:9:\"n1ce_love\";i:129;s:9:\"meepo_fen\";i:130;s:12:\"water_query2\";i:131;s:6:\"jy_wei\";i:132;s:10:\"cut_zongzi\";i:133;s:12:\"n1ce_newchat\";i:134;s:11:\"fl_wsq_bmfw\";i:135;s:11:\"zzplane_hhy\";i:136;s:11:\"hong_kuaidi\";i:137;s:19:\"lonaking_dwblessing\";i:138;s:19:\"lonaking_niulangfly\";i:139;s:11:\"wmb_goshare\";i:140;s:9:\"yg_zongzi\";i:141;s:10:\"bobo_dabai\";i:142;s:7:\"czt_qzz\";i:143;s:9:\"abc_basic\";i:144;s:8:\"abc_news\";i:145;s:9:\"astro_hhy\";i:146;s:7:\"bus_hhy\";i:147;s:12:\"enjoy_circle\";i:148;s:8:\"bf_shell\";i:149;s:15:\"ewei_takephotoa\";i:150;s:10:\"find_hotel\";i:151;s:11:\"fl_dkf_khxx\";i:152;s:5:\"fl_gp\";i:153;s:10:\"guess_girl\";i:154;s:8:\"hc_ybdzs\";i:155;s:11:\"hx_othermsg\";i:156;s:9:\"ju_credit\";i:157;s:19:\"junsion_qixiqueqiao\";i:158;s:8:\"lions_zq\";i:159;s:16:\"lonaking_express\";i:160;s:13:\"meepo_credit1\";i:161;s:13:\"n1ce_chatmore\";i:162;s:10:\"nace_catch\";i:163;s:8:\"name_hhy\";i:164;s:10:\"on3_voxpic\";i:165;s:15:\"sinrch_dataosha\";i:166;s:18:\"netbuffer_idsearch\";i:167;s:9:\"scnace_lm\";i:168;s:8:\"wdl_cube\";i:169;s:12:\"scnace_weblm\";i:170;s:22:\"sunshine_gaokaotoutiao\";i:171;s:10:\"wang_huayu\";i:172;s:10:\"wdl_daoguo\";i:173;s:12:\"wdl_qiexigua\";i:174;s:9:\"we7_fance\";i:175;s:14:\"wdl_sudujiqing\";i:176;s:13:\"wdl_weizanxiu\";i:177;s:12:\"quick_center\";i:178;s:14:\"yg_supergrowth\";i:179;s:11:\"yhc_onenavi\";i:180;s:9:\"yhc_ecard\";i:181;s:9:\"meepo_bbs\";i:182;s:9:\"ewei_shop\";i:183;s:11:\"water_super\";i:184;s:7:\"bmfloor\";i:185;s:15:\"hx_securityspro\";i:186;s:10:\"yobydashan\";i:187;s:15:\"wdl_quickspread\";i:188;s:5:\"broke\";i:189;s:10:\"scan_video\";i:190;s:7:\"mon_wkj\";i:191;s:8:\"cgt_qyhb\";i:192;s:13:\"meepo_bigwall\";i:193;s:10:\"xc_article\";i:194;s:21:\"czt_subscribe_redpack\";i:195;s:10:\"wdl_amovie\";i:196;s:15:\"weisrc_feedback\";i:197;s:9:\"aki_yzmye\";i:198;s:17:\"lonaking_activity\";i:199;s:14:\"lonaking_flash\";i:200;s:16:\"lonaking_fishjoy\";i:201;s:12:\"jing_guanzhu\";i:202;s:9:\"bm_qrsign\";i:203;s:11:\"weini_rhino\";i:204;s:16:\"xm_housekeep_we7\";i:205;s:13:\"kim_financial\";i:206;s:19:\"q_3354988381_xuyuan\";i:207;s:8:\"yg_hcity\";i:208;s:7:\"tim_cow\";i:209;s:21:\"amouse_friend_impress\";i:210;s:10:\"yg_parkour\";i:211;s:7:\"yg_asty\";i:212;s:11:\"lonaking_bb\";i:213;s:7:\"jing_ns\";i:214;s:11:\"ice_picwall\";i:215;s:9:\"enjoy_red\";i:216;s:9:\"fm_jiaoyu\";i:217;s:7:\"mon_jgg\";i:218;s:11:\"mon_qmshake\";i:219;s:13:\"dayu_yuyuepay\";}','a:115:{i:0;s:1:\"2\";i:1;s:1:\"3\";i:2;s:1:\"4\";i:3;s:1:\"5\";i:4;s:1:\"6\";i:5;s:1:\"7\";i:6;s:1:\"8\";i:7;s:1:\"9\";i:8;s:2:\"10\";i:9;s:2:\"11\";i:10;s:2:\"12\";i:11;s:2:\"13\";i:12;s:2:\"14\";i:13;s:2:\"15\";i:14;s:2:\"16\";i:15;s:2:\"17\";i:16;s:2:\"18\";i:17;s:2:\"19\";i:18;s:2:\"20\";i:19;s:2:\"21\";i:20;s:2:\"22\";i:21;s:2:\"23\";i:22;s:2:\"24\";i:23;s:2:\"25\";i:24;s:2:\"26\";i:25;s:2:\"27\";i:26;s:2:\"28\";i:27;s:2:\"29\";i:28;s:2:\"30\";i:29;s:2:\"31\";i:30;s:2:\"32\";i:31;s:2:\"33\";i:32;s:2:\"34\";i:33;s:2:\"35\";i:34;s:2:\"36\";i:35;s:2:\"37\";i:36;s:2:\"38\";i:37;s:2:\"39\";i:38;s:2:\"40\";i:39;s:2:\"41\";i:40;s:2:\"42\";i:41;s:2:\"43\";i:42;s:2:\"44\";i:43;s:2:\"45\";i:44;s:2:\"46\";i:45;s:2:\"47\";i:46;s:2:\"48\";i:47;s:2:\"49\";i:48;s:2:\"50\";i:49;s:2:\"51\";i:50;s:2:\"52\";i:51;s:2:\"53\";i:52;s:2:\"54\";i:53;s:2:\"55\";i:54;s:2:\"56\";i:55;s:2:\"57\";i:56;s:2:\"58\";i:57;s:2:\"59\";i:58;s:2:\"60\";i:59;s:2:\"61\";i:60;s:2:\"62\";i:61;s:2:\"63\";i:62;s:2:\"64\";i:63;s:2:\"65\";i:64;s:2:\"66\";i:65;s:2:\"67\";i:66;s:2:\"68\";i:67;s:2:\"69\";i:68;s:2:\"70\";i:69;s:2:\"71\";i:70;s:2:\"72\";i:71;s:2:\"73\";i:72;s:2:\"74\";i:73;s:2:\"75\";i:74;s:2:\"76\";i:75;s:2:\"77\";i:76;s:2:\"78\";i:77;s:2:\"79\";i:78;s:2:\"80\";i:79;s:2:\"81\";i:80;s:2:\"82\";i:81;s:2:\"83\";i:82;s:2:\"84\";i:83;s:2:\"85\";i:84;s:2:\"86\";i:85;s:2:\"87\";i:86;s:2:\"88\";i:87;s:2:\"89\";i:88;s:2:\"90\";i:89;s:2:\"91\";i:90;s:2:\"92\";i:91;s:2:\"93\";i:92;s:2:\"94\";i:93;s:2:\"95\";i:94;s:2:\"96\";i:95;s:2:\"97\";i:96;s:2:\"98\";i:97;s:2:\"99\";i:98;s:3:\"100\";i:99;s:3:\"101\";i:100;s:3:\"102\";i:101;s:3:\"103\";i:102;s:3:\"104\";i:103;s:3:\"105\";i:104;s:3:\"106\";i:105;s:3:\"107\";i:106;s:3:\"108\";i:107;s:3:\"109\";i:108;s:3:\"110\";i:109;s:3:\"111\";i:110;s:3:\"112\";i:111;s:3:\"113\";i:112;s:3:\"114\";i:113;s:3:\"115\";i:114;s:3:\"116\";}','0','0.00','0');


DROP TABLE IF EXISTS ims_uni_payorder;
CREATE TABLE `ims_uni_payorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(200) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0-未付款 1-已付款',
  `money` decimal(10,2) DEFAULT NULL,
  `pay_time` int(10) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `order_time` int(10) DEFAULT NULL,
  `credittype` varchar(20) DEFAULT NULL,
  `pay_type` int(1) DEFAULT '0',
  `order_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_uni_settings;
CREATE TABLE `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL DEFAULT '',
  `oauth` varchar(100) NOT NULL DEFAULT '',
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL DEFAULT '',
  `creditnames` varchar(500) NOT NULL DEFAULT '',
  `creditbehaviors` varchar(500) NOT NULL DEFAULT '',
  `welcome` varchar(60) NOT NULL DEFAULT '',
  `default` varchar(60) NOT NULL DEFAULT '',
  `default_message` varchar(1000) NOT NULL DEFAULT '',
  `shortcuts` varchar(5000) NOT NULL DEFAULT '',
  `payment` varchar(2000) NOT NULL DEFAULT '',
  `stat` varchar(300) NOT NULL,
  `menuset` text NOT NULL,
  `default_site` int(10) unsigned DEFAULT '0',
  `sync` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(1000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `groupdata` varchar(100) NOT NULL DEFAULT '',
  `bootstrap` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO ims_uni_settings VALUES 
('1','a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}','a:2:{s:6:\"status\";s:1:\"0\";s:7:\"account\";s:1:\"0\";}','a:1:{s:6:\"status\";i:0;}','a:2:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}s:4:\"mail\";a:5:{s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:4:\"smtp\";a:4:{s:4:\"type\";s:3:\"163\";s:6:\"server\";s:0:\"\";s:4:\"port\";s:0:\"\";s:8:\"authmode\";s:1:\"0\";}s:6:\"sender\";s:0:\"\";s:9:\"signature\";s:0:\"\";}}','a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','','','a:4:{s:6:\"credit\";a:1:{s:6:\"switch\";b:0;}s:6:\"alipay\";a:4:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";}s:6:\"wechat\";a:5:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";}s:8:\"delivery\";a:1:{s:6:\"switch\";b:0;}}','','','1','','0','','','0','','');


DROP TABLE IF EXISTS ims_uni_verifycode;
CREATE TABLE `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_userapi_cache;
CREATE TABLE `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_userapi_reply;
CREATE TABLE `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL DEFAULT '',
  `apiurl` varchar(300) NOT NULL DEFAULT '',
  `token` varchar(32) NOT NULL DEFAULT '',
  `default_text` varchar(100) NOT NULL DEFAULT '',
  `cachetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO ims_userapi_reply VALUES 
('1','1','\"城市名+天气\", 如: \"北京天气\"','weather.php','','','0'),
('2','2','\"百科+查询内容\" 或 \"定义+查询内容\", 如: \"百科姚明\", \"定义自行车\"','baike.php','','','0'),
('3','3','\"@查询内容(中文或英文)\"','translate.php','','','0'),
('4','4','\"日历\", \"万年历\", \"黄历\"或\"几号\"','calendar.php','','','0'),
('5','5','\"新闻\"','news.php','','','0'),
('6','6','\"快递+单号\", 如: \"申通1200041125\"','express.php','','','0');


DROP TABLE IF EXISTS ims_users;
CREATE TABLE `ims_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `joindate` int(10) unsigned NOT NULL DEFAULT '0',
  `joinip` varchar(15) NOT NULL DEFAULT '',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(15) NOT NULL DEFAULT '',
  `remark` varchar(500) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `credit1` decimal(11,2) DEFAULT '0.00' COMMENT '用户积分',
  `credit2` decimal(11,2) DEFAULT '0.00' COMMENT '交易币',
  `viptime` varchar(13) NOT NULL DEFAULT '',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

INSERT INTO ims_users VALUES 
('1','0','admin','19f551644ee041802c8eb970507403a453fa8259','b84802cb','0','1448703154','','1456138871','101.107.59.225','','0','0','0.00','0.00','','0');


DROP TABLE IF EXISTS ims_users_credits_record;
CREATE TABLE `ims_users_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL DEFAULT '',
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户购买记录表\r\n模块开发QQ:800083075';



DROP TABLE IF EXISTS ims_users_failed_login;
CREATE TABLE `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_username` (`ip`,`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_users_group;
CREATE TABLE `ims_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL DEFAULT '',
  `maxaccount` int(10) unsigned NOT NULL DEFAULT '0',
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  `discount` decimal(11,2) DEFAULT NULL COMMENT '打折',
  `maxsize` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO ims_users_group VALUES 
('1','体验用户组','a:2:{i:0;i:1;i:1;i:-1;}','1','1','7','0.00','0.00'),
('2','白金用户组','a:1:{i:0;i:1;}','2','2','0','0.00','0.00'),
('3','黄金用户组','a:1:{i:0;i:1;}','3','3','0','0.00','0.00');


DROP TABLE IF EXISTS ims_users_invitation;
CREATE TABLE `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_users_packages;
CREATE TABLE `ims_users_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `record_id` int(11) DEFAULT NULL COMMENT '消费记录ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `package` int(11) DEFAULT NULL COMMENT '套餐ID',
  `buy_time` int(11) DEFAULT '0' COMMENT '购买时间',
  `expiration_time` int(11) DEFAULT '0' COMMENT '到期时间',
  `status` int(1) DEFAULT '0' COMMENT '状态 0 - 待付款 1-已付款',
  PRIMARY KEY (`id`),
  KEY `uid_package` (`uid`,`package`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户购买的套餐\r\n模块开发QQ:800083075';



DROP TABLE IF EXISTS ims_users_permission;
CREATE TABLE `ims_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_users_profile;
CREATE TABLE `ims_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `avatar` varchar(100) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birthyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `birthmonth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `constellation` varchar(10) NOT NULL DEFAULT '',
  `zodiac` varchar(5) NOT NULL DEFAULT '',
  `telephone` varchar(15) NOT NULL DEFAULT '',
  `idcard` varchar(30) NOT NULL DEFAULT '',
  `studentid` varchar(50) NOT NULL DEFAULT '',
  `grade` varchar(10) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(10) NOT NULL DEFAULT '',
  `nationality` varchar(30) NOT NULL DEFAULT '',
  `resideprovince` varchar(30) NOT NULL DEFAULT '',
  `residecity` varchar(30) NOT NULL DEFAULT '',
  `residedist` varchar(30) NOT NULL DEFAULT '',
  `graduateschool` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(50) NOT NULL DEFAULT '',
  `education` varchar(10) NOT NULL DEFAULT '',
  `occupation` varchar(30) NOT NULL DEFAULT '',
  `position` varchar(30) NOT NULL DEFAULT '',
  `revenue` varchar(10) NOT NULL DEFAULT '',
  `affectivestatus` varchar(30) NOT NULL DEFAULT '',
  `lookingfor` varchar(255) NOT NULL DEFAULT '',
  `bloodtype` varchar(5) NOT NULL DEFAULT '',
  `height` varchar(5) NOT NULL DEFAULT '',
  `weight` varchar(5) NOT NULL DEFAULT '',
  `alipay` varchar(30) NOT NULL DEFAULT '',
  `msn` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `taobao` varchar(30) NOT NULL DEFAULT '',
  `site` varchar(30) NOT NULL DEFAULT '',
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_video_reply;
CREATE TABLE `ims_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_vktv_classify;
CREATE TABLE `ims_vktv_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `ser_window` varchar(30) NOT NULL,
  `department_id` int(11) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `ser_picurl` varchar(200) NOT NULL,
  `ser_info` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_vktv_comments;
CREATE TABLE `ims_vktv_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `lead_name` varchar(30) NOT NULL,
  `lead_position` varchar(30) NOT NULL,
  `lead_picurl` varchar(100) NOT NULL,
  `info` varchar(300) NOT NULL,
  `department_id` int(11) NOT NULL,
  `comm_content` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_vktv_poster;
CREATE TABLE `ims_vktv_poster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `thurl` varchar(200) NOT NULL COMMENT '相册url',
  `title` varchar(30) NOT NULL,
  `thumb` varchar(2000) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宣传海报';



DROP TABLE IF EXISTS ims_vktv_project;
CREATE TABLE `ims_vktv_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `ser_name` varchar(30) NOT NULL,
  `classify_id` int(11) NOT NULL,
  `classify_picurl` varchar(100) NOT NULL,
  `kbox` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `project_info` varchar(300) NOT NULL,
  `ishow` int(1) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_vktv_reply;
CREATE TABLE `ims_vktv_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `weid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `picurl` varchar(500) NOT NULL,
  `info_picurl` varchar(500) NOT NULL,
  `order_picurl` varchar(500) NOT NULL,
  `order_info` varchar(500) NOT NULL,
  `cosmtment_phone` varchar(12) NOT NULL,
  `address` varchar(100) NOT NULL,
  `cosmtment_info` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_vktv_reservation;
CREATE TABLE `ims_vktv_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `truename` varchar(20) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `ser_name` varchar(30) NOT NULL,
  `info` varchar(100) NOT NULL,
  `createtime` int(11) NOT NULL,
  `remate` int(1) NOT NULL COMMENT '订单状态',
  `reid` int(11) NOT NULL COMMENT '服务类型ID',
  `kfinfo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_voice_reply;
CREATE TABLE `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_vote_fans;
CREATE TABLE `ims_vote_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(50) DEFAULT '',
  `rid` int(11) DEFAULT '0',
  `votes` varchar(255) DEFAULT '',
  `votetime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_votetime` (`votetime`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_vote_option;
CREATE TABLE `ims_vote_option` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `content` text,
  `vote_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_vote_reply;
CREATE TABLE `ims_vote_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) DEFAULT '0',
  `weid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `votetype` tinyint(4) DEFAULT '0',
  `votetotal` int(10) DEFAULT '0',
  `status` int(10) DEFAULT '0',
  `votenum` int(10) DEFAULT '0',
  `votetimes` int(10) DEFAULT '0',
  `votelimit` int(10) DEFAULT '0',
  `viewnum` int(10) DEFAULT '0',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `isimg` int(10) DEFAULT '0',
  `isshow` int(10) DEFAULT '0',
  `share_title` varchar(200) DEFAULT '',
  `share_desc` varchar(300) DEFAULT '',
  `share_url` varchar(100) DEFAULT '',
  `share_txt` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_query2_info;
CREATE TABLE `ims_water_query2_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `info` varchar(500) NOT NULL,
  `infophoto` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_query_info;
CREATE TABLE `ims_water_query_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `info` varchar(500) NOT NULL,
  `infophoto` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_address;
CREATE TABLE `ims_water_super_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `customername` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `customercity` varchar(100) NOT NULL,
  `customerarea` varchar(100) NOT NULL,
  `xiangxdz` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_areas;
CREATE TABLE `ims_water_super_areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `cityid` int(11) NOT NULL,
  `areaname` varchar(50) NOT NULL COMMENT '名称',
  `areaunicode` varchar(200) NOT NULL COMMENT '名称的Unicode码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_cardnumber;
CREATE TABLE `ims_water_super_cardnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `themecode` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=612 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_citys;
CREATE TABLE `ims_water_super_citys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `cityname` varchar(20) NOT NULL,
  `cityinfo` varchar(500) NOT NULL,
  `cityphoto` varchar(200) NOT NULL,
  `cityunicode` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_coupon;
CREATE TABLE `ims_water_super_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `money` int(10) NOT NULL,
  `start_date` date NOT NULL COMMENT '启用日期',
  `end_date` date NOT NULL COMMENT '截止日期',
  `status` int(2) NOT NULL COMMENT '状态',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_coupon_record;
CREATE TABLE `ims_water_super_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `coupon_id` int(10) unsigned NOT NULL COMMENT '优惠券id',
  `status` int(2) NOT NULL COMMENT '状态',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_employees;
CREATE TABLE `ims_water_super_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `employeename` varchar(100) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `employeestate` int(2) NOT NULL,
  `sumorders` int(11) NOT NULL,
  `workstate` int(2) NOT NULL,
  `cityid` int(11) NOT NULL,
  `areaid` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_express;
CREATE TABLE `ims_water_super_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `orderstate` varchar(10) NOT NULL,
  `expresstime` datetime NOT NULL,
  `employeename` varchar(100) NOT NULL,
  `employeeid` int(11) NOT NULL,
  `employeetel` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_goods;
CREATE TABLE `ims_water_super_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `goodsname` varchar(50) NOT NULL,
  `goodsprice` float(10,2) NOT NULL,
  `goodsinfo` varchar(100) NOT NULL,
  `goodsphoto` varchar(100) NOT NULL,
  `isjj` int(11) NOT NULL DEFAULT '1',
  `danwei` varchar(10) NOT NULL DEFAULT '件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_members;
CREATE TABLE `ims_water_super_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `vipnumber` varchar(100) DEFAULT NULL,
  `cardnumber` varchar(100) NOT NULL,
  `membername` varchar(50) NOT NULL COMMENT '用户姓名',
  `sex` varchar(50) NOT NULL COMMENT '性别',
  `tel` varchar(20) NOT NULL COMMENT '电话',
  `balance` float(10,2) NOT NULL COMMENT '余额',
  `real_cost` float(10,2) NOT NULL COMMENT '实际消费累计',
  `coupon_cost` float(10,2) NOT NULL COMMENT '优惠券消费金额累计',
  `createtime` datetime NOT NULL,
  `coupons` varchar(50) NOT NULL COMMENT '优惠券',
  `memberstate` int(2) NOT NULL,
  `jifen` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=612 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_orders;
CREATE TABLE `ims_water_super_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `workopenid` varchar(100) NOT NULL,
  `ordercode` varchar(200) NOT NULL,
  `ordertime` datetime NOT NULL,
  `fuwuriqi` varchar(100) NOT NULL,
  `fuwushijian` varchar(100) NOT NULL,
  `addressid` int(11) NOT NULL,
  `customername` varchar(200) NOT NULL,
  `customertel` varchar(100) NOT NULL,
  `customercity` varchar(100) NOT NULL,
  `customerarea` varchar(100) NOT NULL,
  `xiangxdz` varchar(1000) NOT NULL,
  `ordertype` varchar(20) NOT NULL,
  `orderstate` int(2) NOT NULL,
  `ordercost` decimal(10,2) NOT NULL,
  `paytype` int(2) NOT NULL,
  `paystate` int(2) NOT NULL,
  `paytime` datetime NOT NULL,
  `transid` varchar(100) DEFAULT NULL,
  `detail` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_rnumber;
CREATE TABLE `ims_water_super_rnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_water_super_shop;
CREATE TABLE `ims_water_super_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `shopname` varchar(200) NOT NULL,
  `indexad` varchar(200) NOT NULL,
  `xc3` varchar(200) DEFAULT NULL,
  `sltts` varchar(500) NOT NULL,
  `sltxc` varchar(200) NOT NULL,
  `xc2` varchar(200) DEFAULT NULL,
  `xc1` varchar(200) DEFAULT NULL,
  `kefutel` varchar(100) NOT NULL,
  `creater` varchar(100) NOT NULL,
  `cardlogo` varchar(512) NOT NULL,
  `czlogo` varchar(512) NOT NULL,
  `fanwei` varchar(500) NOT NULL,
  `fanuniacidesc` varchar(1000) NOT NULL,
  `fuwupic` varchar(512) NOT NULL,
  `jiamupic` varchar(512) NOT NULL,
  `cityunicode` varchar(1000) NOT NULL,
  `areaunicode` varchar(1000) NOT NULL,
  `addemployeepwd` varchar(100) NOT NULL,
  `needaudit` int(2) NOT NULL,
  `dangmf` int(2) NOT NULL,
  `weixf` int(2) NOT NULL,
  `zhifb` int(2) NOT NULL,
  `kefuwx` varchar(50) NOT NULL,
  `goodsinfourl` varchar(500) NOT NULL,
  `smsdx` int(2) NOT NULL,
  `mbxx` int(2) NOT NULL,
  `smsuid` varchar(50) NOT NULL,
  `smspwd` varchar(50) NOT NULL,
  `unewordermid` varchar(200) NOT NULL,
  `utopayordermid` varchar(200) NOT NULL,
  `upayordermid` varchar(200) NOT NULL,
  `wnewordermid` varchar(200) NOT NULL,
  `ddzt0` varchar(50) NOT NULL,
  `ddzt1` varchar(50) NOT NULL,
  `ddzt2` varchar(50) NOT NULL,
  `ddzt3` varchar(50) NOT NULL,
  `ddzt4` varchar(50) NOT NULL,
  `ddzt5` varchar(50) NOT NULL,
  `fuwuname` varchar(50) NOT NULL,
  `isygdj` int(11) NOT NULL DEFAULT '0',
  `recharge` varchar(100) NOT NULL,
  `yjfkurl` varchar(100) NOT NULL,
  `smsyzmb` varchar(100) NOT NULL,
  `imglb1` varchar(200) NOT NULL,
  `imglb2` varchar(200) NOT NULL,
  `imglb3` varchar(200) NOT NULL,
  `imgurl1` varchar(500) NOT NULL,
  `imgurl2` varchar(500) NOT NULL,
  `imgurl3` varchar(500) NOT NULL,
  `template` varchar(50) NOT NULL DEFAULT 'index',
  `pczjs` varchar(500) NOT NULL,
  `pfwfw` varchar(500) NOT NULL,
  `pxctp1` varchar(500) NOT NULL,
  `pxctp2` varchar(500) NOT NULL,
  `iswww` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_hchighguess_images;
CREATE TABLE `ims_wdl_hchighguess_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `wid` int(10) unsigned NOT NULL COMMENT '词条ID',
  `rid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `image` varchar(255) DEFAULT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_hchighguess_member;
CREATE TABLE `ims_wdl_hchighguess_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `avatar` varchar(255) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_hchighguess_reply;
CREATE TABLE `ims_wdl_hchighguess_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `description` text,
  `sharetitle` varchar(255) DEFAULT NULL,
  `sharecover` varchar(255) DEFAULT NULL,
  `sharedescription` text,
  `gzurl` varchar(255) DEFAULT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_hchighguess_selectlog;
CREATE TABLE `ims_wdl_hchighguess_selectlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `wid` int(10) unsigned NOT NULL,
  `imgid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `image` varchar(255) DEFAULT NULL,
  `word` varchar(20) DEFAULT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_hchighguess_words;
CREATE TABLE `ims_wdl_hchighguess_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `word` varchar(20) DEFAULT NULL,
  `words` varchar(100) DEFAULT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isopen` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_active_channel;
CREATE TABLE `ims_wdl_quickspread_active_channel` (
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(100) NOT NULL,
  `channel` int(10) NOT NULL,
  PRIMARY KEY (`weid`,`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_blacklist;
CREATE TABLE `ims_wdl_quickspread_blacklist` (
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `weid` int(10) unsigned NOT NULL,
  `access_time` int(10) unsigned NOT NULL,
  `hit` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`from_user`,`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_channel;
CREATE TABLE `ims_wdl_quickspread_channel` (
  `channel` int(10) NOT NULL AUTO_INCREMENT,
  `active` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(1024) NOT NULL,
  `thumb` varchar(1024) NOT NULL,
  `bg` varchar(1024) NOT NULL,
  `desc` varchar(1024) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `bgparam` varchar(10240) NOT NULL,
  `click_credit` int(10) NOT NULL COMMENT '未关注的用户关注,送分享者积分',
  `sub_click_credit` int(10) NOT NULL COMMENT '未关注的用户关注,送上线积分',
  `newbie_credit` int(10) NOT NULL COMMENT '通过本渠道关注微信号，送新用户大礼包积分',
  `weid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_credit;
CREATE TABLE `ims_wdl_quickspread_credit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `credit` int(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_fans;
CREATE TABLE `ims_wdl_quickspread_fans` (
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(100) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`weid`,`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_follow;
CREATE TABLE `ims_wdl_quickspread_follow` (
  `weid` int(10) unsigned NOT NULL,
  `leader` varchar(100) NOT NULL,
  `follower` varchar(100) NOT NULL,
  `channel` int(10) NOT NULL DEFAULT '0' COMMENT '渠道唯一标示符',
  `credit` int(10) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`weid`,`leader`,`follower`,`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_iptable;
CREATE TABLE `ims_wdl_quickspread_iptable` (
  `weid` int(10) unsigned NOT NULL,
  `ip` varchar(64) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `track_id` varchar(50) NOT NULL DEFAULT '',
  `track_type` varchar(20) NOT NULL DEFAULT '',
  `from_user` int(10) unsigned NOT NULL,
  `spreadid` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `access_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ip`,`weid`,`spreadid`,`access_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_qr;
CREATE TABLE `ims_wdl_quickspread_qr` (
  `weid` int(10) unsigned NOT NULL,
  `scene_id` varchar(50) NOT NULL,
  `qr_url` varchar(1024) NOT NULL,
  `media_id` varchar(1024) NOT NULL,
  `createtime` int(11) NOT NULL,
  `channel` int(10) NOT NULL DEFAULT '0' COMMENT '渠道唯一标示符',
  `from_user` varchar(100) NOT NULL,
  PRIMARY KEY (`weid`,`scene_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_scene_id;
CREATE TABLE `ims_wdl_quickspread_scene_id` (
  `weid` int(10) unsigned NOT NULL,
  `scene_id` int(10) NOT NULL,
  PRIMARY KEY (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_spread;
CREATE TABLE `ims_wdl_quickspread_spread` (
  `spreadid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `poster_img` varchar(1024) NOT NULL,
  `preview_img` varchar(1024) NOT NULL,
  `background` varchar(1024) NOT NULL,
  `register_button` varchar(640) NOT NULL,
  `fillform_button` varchar(640) NOT NULL,
  `fillform_url` varchar(640) NOT NULL,
  `pos_top` int(10) unsigned NOT NULL,
  `pos_left` int(10) unsigned NOT NULL,
  `timestart` int(10) unsigned NOT NULL,
  `timeend` int(10) unsigned NOT NULL,
  `share_title` varchar(64) NOT NULL,
  `share_award` varchar(64) NOT NULL,
  `timelinetext` varchar(640) NOT NULL,
  `buttonimg` varchar(640) NOT NULL,
  `share_content` mediumtext NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click_credit` int(10) unsigned NOT NULL DEFAULT '0',
  `share_credit` int(10) unsigned NOT NULL DEFAULT '0',
  `fillform_credit` int(10) unsigned NOT NULL DEFAULT '0',
  `max_credit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spreadid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_quickspread_user;
CREATE TABLE `ims_wdl_quickspread_user` (
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `weid` int(10) unsigned NOT NULL,
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(256) NOT NULL DEFAULT '',
  `memo` varchar(1024) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`from_user`,`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wdl_weizanxiu_reply;
CREATE TABLE `ims_wdl_weizanxiu_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `thumb` varchar(60) NOT NULL,
  `author` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `share_url` varchar(255) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL,
  `share_title` varchar(255) DEFAULT NULL,
  `share_description` varchar(255) DEFAULT NULL,
  `share_thumb` varchar(255) DEFAULT NULL,
  `share_302` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_album;
CREATE TABLE `ims_we7car_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `isview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_album_photo;
CREATE TABLE `ims_we7car_album_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `albumid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `ispreview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid` (`weid`),
  KEY `ims_albumid_order` (`albumid`,`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_brand;
CREATE TABLE `ims_we7car_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `listorder` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `officialweb` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `createtime` int(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_weid_order` (`weid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_care;
CREATE TABLE `ims_we7car_care` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `brand_id` int(10) unsigned NOT NULL,
  `brand_cn` varchar(50) NOT NULL,
  `series_id` int(10) unsigned NOT NULL,
  `series_cn` varchar(50) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `type_cn` varchar(50) NOT NULL,
  `car_note` varchar(50) NOT NULL,
  `car_no` varchar(50) NOT NULL,
  `car_userName` varchar(50) NOT NULL,
  `car_mobile` varchar(15) NOT NULL,
  `car_startTime` int(10) unsigned NOT NULL,
  `car_photo` varchar(100) NOT NULL,
  `car_insurance_lastDate` int(10) unsigned NOT NULL,
  `car_insurance_lastCost` mediumint(10) unsigned NOT NULL,
  `car_care_mileage` int(11) NOT NULL,
  `car_care_lastDate` int(10) unsigned NOT NULL,
  `car_care_lastCost` mediumint(10) unsigned NOT NULL,
  `createtime` int(10) NOT NULL,
  `isshow` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid` (`weid`),
  KEY `ims_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_message_list;
CREATE TABLE `ims_we7car_message_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `fid` int(11) DEFAULT '0',
  `isshow` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid` (`weid`),
  KEY `ims_fid_time` (`fid`,`create_time`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_message_set;
CREATE TABLE `ims_we7car_message_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `isshow` tinyint(1) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_news;
CREATE TABLE `ims_we7car_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL DEFAULT '0',
  `ishot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `template` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '来源',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ims_category_id` (`category_id`),
  KEY `ims_weid` (`weid`),
  KEY `ims_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_news_category;
CREATE TABLE `ims_we7car_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `title` varchar(50) NOT NULL COMMENT '分类名称',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '分类描述',
  `thumb` varchar(60) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid_title` (`weid`,`title`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_order_data;
CREATE TABLE `ims_we7car_order_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `srid` int(11) NOT NULL,
  `sfid` int(11) NOT NULL,
  `data` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ims_sid` (`sid`),
  KEY `ims_srid` (`srid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_order_fields;
CREATE TABLE `ims_we7car_order_fields` (
  `fid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`fid`),
  KEY `ims_sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_order_list;
CREATE TABLE `ims_we7car_order_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL,
  `yytype` tinyint(11) NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `brand` int(10) unsigned NOT NULL,
  `brand_cn` varchar(15) NOT NULL,
  `serie` int(10) unsigned NOT NULL,
  `serie_cn` varchar(15) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `type_cn` varchar(15) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `createtime` int(10) NOT NULL,
  `note` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_sid` (`sid`),
  KEY `ims_createtime` (`createtime`),
  KEY `ims_dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_order_set;
CREATE TABLE `ims_we7car_order_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `yytype` tinyint(2) NOT NULL,
  `pertotal` tinyint(3) unsigned NOT NULL,
  `description` varchar(500) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `location_x` float NOT NULL,
  `location_y` float NOT NULL,
  `topbanner` varchar(150) DEFAULT NULL,
  `isshow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `note` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid` (`weid`),
  KEY `ims_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_series;
CREATE TABLE `ims_we7car_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `listorder` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `subtitle` varchar(20) NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `createtime` int(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid_order` (`weid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_services;
CREATE TABLE `ims_we7car_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `listorder` int(11) NOT NULL,
  `kefuname` varchar(50) NOT NULL,
  `headthumb` varchar(200) NOT NULL,
  `kefutel` varchar(20) NOT NULL,
  `pre_sales` tinyint(2) NOT NULL,
  `aft_sales` tinyint(2) NOT NULL,
  `description` text NOT NULL,
  `createtime` int(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_set;
CREATE TABLE `ims_we7car_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `address` varchar(60) NOT NULL,
  `opentime` varchar(60) NOT NULL,
  `pre_consult` varchar(60) NOT NULL,
  `aft_consult` varchar(60) NOT NULL,
  `thumbArr` varchar(500) NOT NULL,
  `weicar_logo` varchar(200) NOT NULL,
  `shop_logo` varchar(200) NOT NULL,
  `guanhuai_thumb` varchar(200) NOT NULL,
  `typethumb` varchar(70) NOT NULL,
  `yuyue1thumb` varchar(70) NOT NULL,
  `yuyue2thumb` varchar(70) NOT NULL,
  `kefuthumb` varchar(70) NOT NULL,
  `messagethumb` varchar(70) NOT NULL,
  `carethumb` varchar(70) NOT NULL,
  `status` int(1) NOT NULL,
  `isshow` tinyint(1) NOT NULL,
  `tools` varchar(50) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_we7car_type;
CREATE TABLE `ims_we7car_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listorder` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `weid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pyear` varchar(10) NOT NULL,
  `price1` varchar(50) NOT NULL,
  `price2` varchar(50) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `thumbArr` varchar(500) NOT NULL,
  `description` varchar(512) NOT NULL DEFAULT '' COMMENT '品牌描述',
  `output` varchar(10) NOT NULL,
  `gearnum` varchar(10) NOT NULL,
  `gear_box` varchar(30) NOT NULL,
  `xiangceid` int(11) NOT NULL,
  `createtime` int(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_weid_order` (`weid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wechat_attachment;
CREATE TABLE `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wechat_news;
CREATE TABLE `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `attach_id` (`attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weihaom_wb_reply;
CREATE TABLE `ims_weihaom_wb_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `description` text,
  `title1` varchar(255) DEFAULT NULL,
  `description1` text,
  `fimg` varchar(255) DEFAULT NULL,
  `bimg` varchar(255) DEFAULT NULL,
  `bgmusic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weihaom_wb_user;
CREATE TABLE `ims_weihaom_wb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `score` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weilvyou_dianping;
CREATE TABLE `ims_weilvyou_dianping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `xingming` varchar(30) NOT NULL DEFAULT '',
  `zhiwei` varchar(50) NOT NULL DEFAULT '',
  `jianjie1` varchar(255) NOT NULL DEFAULT '',
  `jianjie2` varchar(255) NOT NULL DEFAULT '',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weilvyou_haibao;
CREATE TABLE `ims_weilvyou_haibao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `img1` varchar(255) NOT NULL DEFAULT '',
  `img2` varchar(255) NOT NULL DEFAULT '',
  `img3` varchar(255) NOT NULL DEFAULT '',
  `img4` varchar(255) NOT NULL DEFAULT '',
  `img5` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weilvyou_jianjie;
CREATE TABLE `ims_weilvyou_jianjie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `top_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头部图片',
  `location_x` float unsigned NOT NULL,
  `location_y` float unsigned NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `jianjie_1` text NOT NULL COMMENT '服务理念简介',
  `jianjie_2` text NOT NULL COMMENT '旅游区简介',
  `jianjie_3` text NOT NULL COMMENT '服务配套',
  `mobile` varchar(30) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weilvyou_jingdian;
CREATE TABLE `ims_weilvyou_jingdian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jid` int(10) unsigned NOT NULL DEFAULT '0',
  `weid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `jianjie1` varchar(255) DEFAULT NULL,
  `jianjie2` varchar(255) DEFAULT NULL,
  `jianjie3` varchar(255) DEFAULT NULL,
  `sort` mediumint(8) unsigned DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `dateline` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weilvyou_jingqu;
CREATE TABLE `ims_weilvyou_jingqu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `jianjie` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weilvyou_xiangce;
CREATE TABLE `ims_weilvyou_xiangce` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `jianjie` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weilvyou_yinxiang;
CREATE TABLE `ims_weilvyou_yinxiang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jid` int(10) unsigned NOT NULL DEFAULT '0',
  `weid` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user` varchar(60) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weini_rhino_fans;
CREATE TABLE `ims_weini_rhino_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '' COMMENT '用户ID',
  `nickname` varchar(50) DEFAULT '' COMMENT '用户昵称',
  `headimgurl` varchar(500) DEFAULT '' COMMENT '用户头像',
  `realname` varchar(50) DEFAULT '' COMMENT '登记姓名',
  `phone` varchar(20) DEFAULT '' COMMENT '登记手机',
  `best_score` int(11) DEFAULT '0' COMMENT '单次最高分数',
  `total_score` int(11) DEFAULT '0' COMMENT '累计分数',
  `total_times` int(11) DEFAULT '0' COMMENT '总次数',
  `today_times` int(11) DEFAULT '0' COMMENT '今天次数',
  `lastplay_date` int(11) DEFAULT '0' COMMENT '最后游戏时间',
  `totalshare_times` int(11) DEFAULT '0' COMMENT '总分享次数',
  `todayshare_times` int(11) DEFAULT '0' COMMENT '今日分享次数',
  `sharelottery_times` int(11) DEFAULT '0' COMMENT '分享获得游戏次数',
  `lastshare_date` int(10) DEFAULT '0' COMMENT '最后一次分享时间',
  `isblack` tinyint(1) DEFAULT '0' COMMENT '是否列入黑名单',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weini_rhino_record;
CREATE TABLE `ims_weini_rhino_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '0',
  `score` int(11) DEFAULT '0',
  `playtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weini_rhino_reply;
CREATE TABLE `ims_weini_rhino_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `weid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '' COMMENT '图文回复标题',
  `description` varchar(255) DEFAULT '' COMMENT '图文回复描述',
  `rule` text COMMENT '游戏规则',
  `bg` varchar(500) DEFAULT '' COMMENT '游戏页面背景',
  `picture` varchar(500) DEFAULT '' COMMENT '图文回复封面',
  `end_title` varchar(50) DEFAULT '' COMMENT '游戏活动结束时图文回复标题',
  `end_description` varchar(200) DEFAULT '' COMMENT '游戏活动结束时图文回复描述',
  `end_picurl` varchar(500) DEFAULT '' COMMENT '游戏活动结束时图文回复封面',
  `starttime` int(10) DEFAULT '0' COMMENT '游戏活动开始时间',
  `endtime` int(10) DEFAULT '0' COMMENT '游戏活动结束时间',
  `total_times` int(11) DEFAULT '0' COMMENT '总游戏次数上限',
  `totaldayplay_times` int(11) DEFAULT '0' COMMENT '每天游戏次数上限',
  `totaldayshare_times` int(11) DEFAULT '0' COMMENT '每天分享次数上限',
  `sharelottery_times` int(11) DEFAULT '0' COMMENT '每次分享后奖励游戏次数',
  `viewnum` int(11) DEFAULT '0' COMMENT '游戏活动浏览量',
  `sharenum` int(11) DEFAULT '0' COMMENT '游戏活动分享量',
  `gametime` int(11) DEFAULT '15' COMMENT '游戏时间',
  `showusernum` int(11) DEFAULT '20' COMMENT '显示名次上限',
  `share_title` varchar(200) DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(300) DEFAULT '' COMMENT '分享描述',
  `share_image` varchar(500) DEFAULT '' COMMENT '分享图标',
  `share_url` varchar(100) DEFAULT '' COMMENT '分享链接',
  `follow_url` varchar(100) DEFAULT '' COMMENT '引导关注链接',
  `gameovertext` varchar(300) DEFAULT '' COMMENT '游戏无剩余次数提示语',
  `tips1text` varchar(50) DEFAULT '' COMMENT '游戏结束后提示语1',
  `tips2text` varchar(50) DEFAULT '' COMMENT '游戏结束后提示语2',
  `tips3text` varchar(50) DEFAULT '' COMMENT '游戏结束后提示语3',
  `signtext` varchar(50) DEFAULT '' COMMENT '游戏得分单位',
  `isneedfollow` tinyint(1) DEFAULT '1' COMMENT '是否需要关注',
  `awardtip` varchar(500) DEFAULT '' COMMENT '领奖提示语',
  `copyright` varchar(100) DEFAULT '' COMMENT '页面版权文字',
  `copyrighturl` varchar(500) DEFAULT '' COMMENT '页面版权链接',
  `status` tinyint(1) DEFAULT '0' COMMENT '游戏状态',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weischool_cexpress;
CREATE TABLE `ims_weischool_cexpress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `receiver` varchar(15) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `content` varchar(500) NOT NULL,
  `createtime` int(11) NOT NULL,
  `cexpress_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weishare;
CREATE TABLE `ims_weishare` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL COMMENT '活动标题',
  `thumb` varchar(100) NOT NULL COMMENT '活动图片',
  `description` varchar(100) NOT NULL COMMENT '活动描述',
  `image` varchar(100) NOT NULL COMMENT '背景图片',
  `max` int(11) NOT NULL COMMENT '得分极限',
  `start` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分值',
  `step` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '助力积分',
  `steprandom` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '助力随机积分',
  `steptype` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '助力随机积分方式',
  `rule` text NOT NULL COMMENT '规则',
  `url` varchar(250) NOT NULL COMMENT '引导关注素材',
  `count` int(11) NOT NULL COMMENT '领卡数量限制',
  `background` varchar(100) NOT NULL COMMENT '背景颜色',
  `tip` varchar(100) NOT NULL COMMENT '提示语',
  `unit` varchar(100) NOT NULL COMMENT '单位',
  `cardname` varchar(100) NOT NULL COMMENT '卡片名称',
  `helplimit` int(11) NOT NULL COMMENT '每天助力限制次数',
  `totallimit` int(11) NOT NULL COMMENT '总得助力次数',
  `limittype` int(1) NOT NULL COMMENT '限制类型',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  `endtime` int(11) unsigned NOT NULL COMMENT '日期',
  `shareIcon` varchar(200) NOT NULL COMMENT '分享图标',
  `shareTitle` varchar(200) NOT NULL,
  `shareContent` varchar(200) NOT NULL,
  `copyright` varchar(100) NOT NULL COMMENT '版权',
  `showu` varchar(1) NOT NULL DEFAULT '0',
  `sortcount` varchar(100) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weishare_firend;
CREATE TABLE `ims_weishare_firend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '分享用户的id',
  `sid` int(10) NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weishare_reply;
CREATE TABLE `ims_weishare_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `sid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `new_title` varchar(100) NOT NULL COMMENT '图文标题',
  `new_pic` varchar(100) NOT NULL COMMENT '图文图片',
  `new_desc` varchar(100) NOT NULL COMMENT '图文描述',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weishare_setting;
CREATE TABLE `ims_weishare_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `appid` varchar(200) NOT NULL COMMENT 'appid',
  `secret` varchar(200) NOT NULL COMMENT 'secret',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weishare_user;
CREATE TABLE `ims_weishare_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `tel` varchar(50) NOT NULL,
  `income` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  `helpcount` int(11) DEFAULT '0' COMMENT '助力次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_audio_music;
CREATE TABLE `ims_weisrc_audio_music` (
  `mid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `url` varchar(500) NOT NULL COMMENT '歌曲链接',
  `title` char(255) NOT NULL COMMENT '歌曲名称',
  `cover` varchar(500) NOT NULL COMMENT '唱片封面',
  `singer` char(255) NOT NULL COMMENT '歌手',
  `intro` char(255) NOT NULL COMMENT '解说',
  `collect` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `displayorder` int(11) DEFAULT '0',
  `dateline` int(11) DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_audio_music_user;
CREATE TABLE `ims_weisrc_audio_music_user` (
  `did` mediumint(8) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `openid` char(255) NOT NULL,
  `mid` mediumint(8) NOT NULL,
  `title` char(255) NOT NULL,
  `cover` char(255) NOT NULL,
  `singer` char(255) NOT NULL,
  `intro` char(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_audio_setting;
CREATE TABLE `ims_weisrc_audio_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) DEFAULT '' COMMENT '版权名称',
  `bg` varchar(500) DEFAULT '' COMMENT '背景图',
  `bg_rand` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '随机背景',
  `bg_setting` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '随机背景',
  `bg_url` varchar(500) DEFAULT '' COMMENT '自定义背景图',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_businesscenter_category;
CREATE TABLE `ims_weisrc_businesscenter_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `cityid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `logo` varchar(500) DEFAULT '' COMMENT '商家logo',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isfirst` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_businesscenter_city;
CREATE TABLE `ims_weisrc_businesscenter_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '城市名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_businesscenter_feedback;
CREATE TABLE `ims_weisrc_businesscenter_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL COMMENT '公众号ID',
  `storeid` int(11) NOT NULL COMMENT '商家ID',
  `parentid` int(11) DEFAULT '0' COMMENT '父级ID',
  `from_user` varchar(100) DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `content` varchar(600) DEFAULT NULL,
  `top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `dateline` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_businesscenter_news;
CREATE TABLE `ims_weisrc_businesscenter_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `title` varchar(200) NOT NULL DEFAULT '',
  `thumb` varchar(500) NOT NULL DEFAULT '',
  `summary` varchar(1000) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `address` varchar(200) NOT NULL DEFAULT '',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `url` varchar(200) NOT NULL DEFAULT '',
  `isfirst` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在首页显示',
  `top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶',
  `mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '加入方式 0:后台 1:申请',
  `checked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_businesscenter_setting;
CREATE TABLE `ims_weisrc_businesscenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '所属帐号',
  `title` varchar(100) NOT NULL DEFAULT '',
  `bg` varchar(500) NOT NULL DEFAULT '',
  `announcement` text NOT NULL COMMENT '公告',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '地址',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `place` varchar(200) NOT NULL DEFAULT '',
  `lat` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lng` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `location_p` varchar(100) NOT NULL DEFAULT '' COMMENT '省',
  `location_c` varchar(100) NOT NULL DEFAULT '' COMMENT '市',
  `location_a` varchar(100) NOT NULL DEFAULT '' COMMENT '区',
  `pagesize` int(10) unsigned NOT NULL DEFAULT '5' COMMENT '每页显示数据量',
  `topcolor` varchar(20) NOT NULL DEFAULT '' COMMENT '顶部字体颜色',
  `topbgcolor` varchar(20) NOT NULL DEFAULT '' COMMENT '顶部字体颜色',
  `announcebordercolor` varchar(20) NOT NULL DEFAULT '' COMMENT '公告边框颜色',
  `announcebgcolor` varchar(20) NOT NULL DEFAULT '' COMMENT '公告背景颜色',
  `announcecolor` varchar(20) NOT NULL DEFAULT '' COMMENT '公告字体颜色',
  `storestitlecolor` varchar(20) NOT NULL DEFAULT '' COMMENT '商家名称颜色',
  `storesstatuscolor` varchar(20) NOT NULL DEFAULT '' COMMENT '商家状态颜色',
  `showcity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示城市选择',
  `settled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启入驻',
  `feedback_show_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `feedback_check_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '留言是否需要审核',
  `scroll_announce` varchar(500) NOT NULL DEFAULT '' COMMENT '公告',
  `scroll_announce_speed` tinyint(2) unsigned NOT NULL DEFAULT '6' COMMENT '公告滚动速度',
  `scroll_announce_link` varchar(500) NOT NULL DEFAULT '' COMMENT '公告链接',
  `scroll_announce_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示顶部公告',
  `copyright` varchar(500) NOT NULL DEFAULT '' COMMENT '底部版权',
  `copyright_link` varchar(500) NOT NULL DEFAULT '' COMMENT '底部版权链接',
  `menuname1` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单1名称',
  `menulink1` varchar(500) NOT NULL DEFAULT '' COMMENT '菜单1链接',
  `menuname2` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单2名称',
  `menulink2` varchar(500) NOT NULL DEFAULT '' COMMENT '菜单2链接',
  `menuname3` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单3名称',
  `menulink3` varchar(500) NOT NULL DEFAULT '' COMMENT '菜单3链接',
  `appid` varchar(300) NOT NULL DEFAULT '' COMMENT 'appid',
  `secret` varchar(300) NOT NULL DEFAULT '' COMMENT 'secret',
  `dateline` int(10) unsigned NOT NULL,
  `share_title` varchar(100) NOT NULL DEFAULT '',
  `share_image` varchar(500) NOT NULL DEFAULT '',
  `share_desc` varchar(200) NOT NULL DEFAULT '',
  `share_cancel` varchar(200) NOT NULL DEFAULT '',
  `share_url` varchar(200) NOT NULL DEFAULT '',
  `share_num` int(10) NOT NULL DEFAULT '0',
  `follow_url` varchar(200) NOT NULL DEFAULT '',
  `statistics` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_businesscenter_slide;
CREATE TABLE `ims_weisrc_businesscenter_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `cityid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `title` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  `storeid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `isfirst` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在首页显示',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_businesscenter_stores;
CREATE TABLE `ims_weisrc_businesscenter_stores` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL DEFAULT '0' COMMENT '公众号id',
  `cityid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `pcate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类别id',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类别id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `description` text,
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '微站网址',
  `site_name` varchar(100) NOT NULL DEFAULT '' COMMENT '微站按钮名称',
  `site_url` varchar(200) NOT NULL DEFAULT '' COMMENT '微站网址',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '折扣按钮名称',
  `shop_url` varchar(400) NOT NULL DEFAULT '' COMMENT '折扣链接',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT '商家logo',
  `qrcode` varchar(200) NOT NULL DEFAULT '' COMMENT '商家logo',
  `qrcode_url` varchar(400) NOT NULL DEFAULT '' COMMENT '素材链接',
  `qrcode_description` varchar(200) NOT NULL DEFAULT '' COMMENT '二维码文字提示',
  `services` varchar(200) NOT NULL DEFAULT '' COMMENT '服务范围',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `discounts` varchar(200) NOT NULL COMMENT '会员折扣',
  `consume` varchar(20) NOT NULL COMMENT '人均消费',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '级别',
  `place` varchar(200) NOT NULL DEFAULT '',
  `lat` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lng` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `hours` varchar(200) NOT NULL DEFAULT '' COMMENT '营业时间',
  `starttime` varchar(10) NOT NULL DEFAULT '09:00' COMMENT '开始时间',
  `endtime` varchar(10) NOT NULL DEFAULT '18:00' COMMENT '结束时间',
  `location_p` varchar(100) NOT NULL DEFAULT '' COMMENT '省',
  `location_c` varchar(100) NOT NULL DEFAULT '' COMMENT '市',
  `location_a` varchar(100) NOT NULL DEFAULT '' COMMENT '区',
  `isfirst` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页推荐',
  `top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐商家，相当于置顶',
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `businesslicense` varchar(200) NOT NULL DEFAULT '' COMMENT '营业执照',
  `mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '加入方式 0:后台 1:申请入驻',
  `checked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在手机端显示',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `updatetime` int(10) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `time_enable1` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用营业时间1',
  `time_enable2` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用营业时间2',
  `time_enable3` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用营业时间3',
  `starttime2` varchar(10) NOT NULL DEFAULT '09:00' COMMENT '开始时间',
  `endtime2` varchar(10) NOT NULL DEFAULT '18:00' COMMENT '结束时间',
  `starttime3` varchar(10) NOT NULL DEFAULT '09:00' COMMENT '开始时间',
  `endtime3` varchar(10) NOT NULL DEFAULT '18:00' COMMENT '结束时间',
  `share_title` varchar(100) NOT NULL DEFAULT '',
  `share_desc` varchar(200) NOT NULL DEFAULT '',
  `share_cancel` varchar(200) NOT NULL DEFAULT '',
  `share_url` varchar(200) NOT NULL DEFAULT '',
  `share_num` int(10) NOT NULL DEFAULT '0',
  `follow_url` varchar(200) NOT NULL DEFAULT '',
  `isvip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '时间限制',
  `vip_start` int(10) NOT NULL DEFAULT '0',
  `vip_end` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_address;
CREATE TABLE `ims_weisrc_dish_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=403 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_area;
CREATE TABLE `ims_weisrc_dish_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '区域名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_blacklist;
CREATE TABLE `ims_weisrc_dish_blacklist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(100) DEFAULT '' COMMENT '用户ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_openid` (`from_user`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_cart;
CREATE TABLE `ims_weisrc_dish_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `goodsid` int(11) NOT NULL,
  `goodstype` tinyint(1) NOT NULL DEFAULT '1',
  `price` varchar(10) NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_category;
CREATE TABLE `ims_weisrc_dish_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `storeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_collection;
CREATE TABLE `ims_weisrc_dish_collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_email_setting;
CREATE TABLE `ims_weisrc_dish_email_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `email_enable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启邮箱提醒',
  `email_host` varchar(50) DEFAULT '' COMMENT '邮箱服务器',
  `email_send` varchar(100) DEFAULT NULL,
  `email_pwd` varchar(20) DEFAULT '' COMMENT '邮箱密码',
  `email_user` varchar(100) DEFAULT '' COMMENT '发信人名称',
  `email` varchar(100) DEFAULT NULL,
  `email_business_tpl` varchar(200) DEFAULT '' COMMENT '商户接收内容模板',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_goods;
CREATE TABLE `ims_weisrc_dish_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `storeid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `unitname` varchar(5) NOT NULL DEFAULT '份',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `taste` varchar(1000) NOT NULL DEFAULT '' COMMENT '口味',
  `isspecial` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `marketprice` varchar(10) NOT NULL DEFAULT '',
  `productprice` varchar(10) NOT NULL DEFAULT '',
  `credit` int(10) NOT NULL DEFAULT '0',
  `subcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被点次数',
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_intelligent;
CREATE TABLE `ims_weisrc_dish_intelligent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `storeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` int(10) NOT NULL DEFAULT '0' COMMENT '适用人数',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '菜品',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_mealtime;
CREATE TABLE `ims_weisrc_dish_mealtime` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `begintime` varchar(20) DEFAULT '09:00' COMMENT '开始时间',
  `endtime` varchar(20) DEFAULT '18:00' COMMENT '结束时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_nave;
CREATE TABLE `ims_weisrc_dish_nave` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `type` int(10) NOT NULL DEFAULT '-1' COMMENT '链接类型 -1:自定义 1:首页2:门店3:菜单列表4:我的菜单',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '导航名称',
  `link` varchar(200) NOT NULL DEFAULT '' COMMENT '导航链接',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_order;
CREATE TABLE `ims_weisrc_dish_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `storeid` int(10) unsigned NOT NULL COMMENT '门店id',
  `from_user` varchar(50) NOT NULL,
  `ordersn` varchar(30) NOT NULL COMMENT '订单号',
  `totalnum` tinyint(4) DEFAULT NULL COMMENT '总数量',
  `totalprice` varchar(10) NOT NULL COMMENT '总金额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1取消状态，0普通状态，1为确认付款方式，2为成功',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1余额，2在线，3到付',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `address` varchar(250) NOT NULL DEFAULT '' COMMENT '地址',
  `tel` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `reply` varchar(1000) NOT NULL DEFAULT '' COMMENT '回复',
  `meal_time` varchar(50) NOT NULL DEFAULT '' COMMENT '就餐时间',
  `counts` tinyint(4) DEFAULT '0' COMMENT '预订人数',
  `seat_type` tinyint(1) DEFAULT '0' COMMENT '位置类型1大厅2包间',
  `carports` tinyint(3) DEFAULT '0' COMMENT '车位',
  `dining_mode` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用餐类型 1:到店 2:外卖',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `tables` varchar(10) NOT NULL DEFAULT '' COMMENT '桌号',
  `print_sta` tinyint(1) DEFAULT '-1' COMMENT '打印状态',
  `sign` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1拒绝，0未处理，1已处理',
  `isfinish` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `goodsprice` decimal(10,2) DEFAULT '0.00',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `isemail` tinyint(1) NOT NULL DEFAULT '0',
  `issms` tinyint(1) NOT NULL DEFAULT '0',
  `istpl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_order_goods;
CREATE TABLE `ims_weisrc_dish_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `goodsid` int(10) unsigned NOT NULL,
  `price` varchar(10) NOT NULL,
  `total` int(10) unsigned NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_print_order;
CREATE TABLE `ims_weisrc_dish_print_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `print_usr` varchar(50) DEFAULT '',
  `print_status` tinyint(1) DEFAULT '-1',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_print_setting;
CREATE TABLE `ims_weisrc_dish_print_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `title` varchar(200) DEFAULT '',
  `print_status` tinyint(1) NOT NULL,
  `print_type` tinyint(1) NOT NULL,
  `print_usr` varchar(50) DEFAULT '',
  `print_nums` tinyint(3) DEFAULT '1',
  `print_top` varchar(40) DEFAULT '',
  `print_bottom` varchar(40) DEFAULT '',
  `dateline` int(10) DEFAULT '0',
  `qrcode_status` tinyint(1) NOT NULL DEFAULT '0',
  `qrcode_url` varchar(200) DEFAULT '',
  `type` varchar(50) DEFAULT 'hongxin',
  `member_code` varchar(100) DEFAULT '' COMMENT '商户代码',
  `feyin_key` varchar(100) DEFAULT '' COMMENT 'api密钥',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_reply;
CREATE TABLE `ims_weisrc_dish_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '入口类型',
  `storeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入口门店',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加日期',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_setting;
CREATE TABLE `ims_weisrc_dish_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) DEFAULT '' COMMENT '网站名称',
  `thumb` varchar(200) DEFAULT '' COMMENT '背景图',
  `storeid` int(10) unsigned NOT NULL DEFAULT '0',
  `entrance_type` tinyint(1) unsigned NOT NULL COMMENT '入口类型1:首页2门店列表3菜品列表4我的菜单',
  `entrance_storeid` tinyint(1) unsigned NOT NULL COMMENT '入口门店id',
  `order_enable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订餐开启',
  `dining_mode` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用餐类型 1:到店 2:外卖',
  `dateline` int(10) DEFAULT '0',
  `istplnotice` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否模版通知',
  `tplneworder` varchar(200) DEFAULT '' COMMENT '模板id',
  `tpluser` text COMMENT '通知用户',
  `searchword` varchar(1000) DEFAULT '' COMMENT '搜索关键字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_sms_checkcode;
CREATE TABLE `ims_weisrc_dish_sms_checkcode` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(100) DEFAULT '' COMMENT '用户ID',
  `mobile` varchar(30) DEFAULT '' COMMENT '手机',
  `checkcode` varchar(100) DEFAULT '' COMMENT '验证码',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态 0未使用1已使用',
  `dateline` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_sms_setting;
CREATE TABLE `ims_weisrc_dish_sms_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `sms_enable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `sms_verify_enable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启短信验证提醒',
  `sms_username` varchar(20) DEFAULT '' COMMENT '平台帐号',
  `sms_pwd` varchar(20) DEFAULT '' COMMENT '平台密码',
  `sms_mobile` varchar(20) DEFAULT '' COMMENT '商户接收短信手机',
  `sms_verify_tpl` varchar(120) DEFAULT '' COMMENT '验证短信模板',
  `sms_business_tpl` varchar(120) DEFAULT '' COMMENT '商户短信模板',
  `sms_user_tpl` varchar(120) DEFAULT '' COMMENT '用户短信模板',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_store_setting;
CREATE TABLE `ims_weisrc_dish_store_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `order_enable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订餐开启',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_stores;
CREATE TABLE `ims_weisrc_dish_stores` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL DEFAULT '0' COMMENT '公众号id',
  `areaid` int(10) NOT NULL DEFAULT '0' COMMENT '区域id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT '商家logo',
  `info` varchar(1000) NOT NULL DEFAULT '' COMMENT '简短描述',
  `content` text NOT NULL COMMENT '简介',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `location_p` varchar(100) NOT NULL DEFAULT '' COMMENT '省',
  `location_c` varchar(100) NOT NULL DEFAULT '' COMMENT '市',
  `location_a` varchar(100) NOT NULL DEFAULT '' COMMENT '区',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `place` varchar(200) NOT NULL DEFAULT '',
  `lat` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lng` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `password` varchar(20) NOT NULL DEFAULT '' COMMENT '登录密码',
  `hours` varchar(200) NOT NULL DEFAULT '' COMMENT '营业时间',
  `recharging_password` varchar(20) NOT NULL DEFAULT '' COMMENT '充值密码',
  `thumb_url` varchar(1000) DEFAULT NULL,
  `enable_wifi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有wifi',
  `enable_card` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否能刷卡',
  `enable_room` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有包厢',
  `enable_park` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有停车',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在手机端显示',
  `is_meal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否店内点餐',
  `is_delivery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否外卖订餐',
  `sendingprice` varchar(10) NOT NULL DEFAULT '' COMMENT '起送价格',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `updatetime` int(10) NOT NULL DEFAULT '0',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '搜索页显示',
  `freeprice` decimal(10,2) DEFAULT '0.00',
  `begintime` varchar(20) DEFAULT '09:00' COMMENT '开始时间',
  `announce` varchar(1000) NOT NULL DEFAULT '' COMMENT '通知',
  `endtime` varchar(20) DEFAULT '18:00' COMMENT '结束时间',
  `consume` varchar(20) NOT NULL COMMENT '人均消费',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '级别',
  `is_rest` tinyint(1) NOT NULL DEFAULT '0',
  `typeid` int(10) NOT NULL DEFAULT '0' COMMENT '商家类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dish_type;
CREATE TABLE `ims_weisrc_dish_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dragonboat_fans;
CREATE TABLE `ims_weisrc_dragonboat_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '' COMMENT '用户ID',
  `nickname` varchar(50) DEFAULT '',
  `headimgurl` varchar(500) DEFAULT '',
  `username` varchar(50) DEFAULT '',
  `tel` varchar(20) DEFAULT '' COMMENT '登记信息(手机等)',
  `credit` decimal(10,2) DEFAULT '0.00' COMMENT '单次最高分数',
  `totalcredit` decimal(10,2) DEFAULT '0.00' COMMENT '累计分数',
  `totalnum` int(11) DEFAULT '0' COMMENT '总次数',
  `todaynum` int(11) DEFAULT '0' COMMENT '今天次数',
  `lasttime` int(11) DEFAULT '0' COMMENT '最后游戏时间',
  `sharenum` int(11) DEFAULT '0' COMMENT '总分享次数',
  `sharelotterynum` int(11) DEFAULT '0' COMMENT '分享抽奖次数',
  `todaysharenum` int(11) DEFAULT '0' COMMENT '今日分享次数',
  `lastsharetime` int(10) DEFAULT '0',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=557 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dragonboat_record;
CREATE TABLE `ims_weisrc_dragonboat_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `from_user` varchar(50) DEFAULT '0' COMMENT '用户ID',
  `fansid` int(11) DEFAULT '0',
  `credit` int(10) DEFAULT '0',
  `dateline` int(10) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=14291 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_dragonboat_reply;
CREATE TABLE `ims_weisrc_dragonboat_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `weid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `content` varchar(200) DEFAULT '',
  `rule` text,
  `award` text,
  `bg` varchar(500) DEFAULT '',
  `logo` varchar(500) DEFAULT '',
  `start_picurl` varchar(500) DEFAULT '',
  `end_theme` varchar(50) DEFAULT '',
  `end_instruction` varchar(200) DEFAULT '',
  `end_picurl` varchar(500) DEFAULT '',
  `banner` varchar(200) DEFAULT '',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `number_times` int(11) DEFAULT '0' COMMENT '总游戏次数',
  `most_num_times` int(11) DEFAULT '0' COMMENT '每天游戏次数',
  `daysharenum` int(11) DEFAULT '0' COMMENT '日分享次数',
  `sharelotterynum` int(11) DEFAULT '0' COMMENT '分享后奖励次数',
  `viewnum` int(11) DEFAULT '0',
  `sharenum` int(11) DEFAULT '0',
  `gametime` int(11) DEFAULT '15',
  `gamelevel` int(11) DEFAULT '3',
  `cover` varchar(500) DEFAULT '',
  `showusernum` int(11) DEFAULT '20',
  `share_title` varchar(200) DEFAULT '',
  `share_url` varchar(100) DEFAULT '',
  `share_desc` varchar(300) DEFAULT '',
  `share_image` varchar(500) DEFAULT '',
  `follow_url` varchar(100) DEFAULT '',
  `follow_title` varchar(100) DEFAULT '',
  `copyright` varchar(100) DEFAULT '',
  `copyrighturl` varchar(200) DEFAULT '',
  `isneedfollow` tinyint(1) DEFAULT '1',
  `mode` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_feedback_feedback;
CREATE TABLE `ims_weisrc_feedback_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT '0',
  `from_user` varchar(100) DEFAULT '',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0为第一级',
  `nickname` varchar(100) DEFAULT '',
  `username` varchar(100) DEFAULT '',
  `headimgurl` varchar(500) DEFAULT '',
  `content` varchar(200) DEFAULT '' COMMENT '回复内容',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_feedback_setting;
CREATE TABLE `ims_weisrc_feedback_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT '0',
  `title` varchar(100) DEFAULT '' COMMENT '网站名称',
  `pagesize` int(10) unsigned DEFAULT '10' COMMENT '每页显示数量 默认为10',
  `topimgurl` varchar(500) DEFAULT '' COMMENT '顶部图片',
  `pagecolor` varchar(50) DEFAULT '' COMMENT '页面色调',
  `ischeck` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要审核',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_invitative_activity;
CREATE TABLE `ims_weisrc_invitative_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned DEFAULT '0',
  `weid` int(10) unsigned DEFAULT '0',
  `reply_title` varchar(100) DEFAULT '图文标题',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `thumb` varchar(500) NOT NULL DEFAULT '' COMMENT '封面',
  `title` varchar(100) DEFAULT '' COMMENT '活动标题',
  `content` text NOT NULL COMMENT '活动介绍',
  `organizers` varchar(100) DEFAULT '' COMMENT '举办者',
  `bg` varchar(500) DEFAULT '' COMMENT '背景',
  `cardtype` tinyint(1) DEFAULT '1' COMMENT '卡片类型',
  `cardbg` varchar(500) DEFAULT '' COMMENT '卡片背景',
  `thumbs` varchar(1000) DEFAULT '' COMMENT '活动图片',
  `musicurl` varchar(500) DEFAULT '' COMMENT '音乐链接',
  `tel` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `place` varchar(200) NOT NULL DEFAULT '',
  `lat` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lng` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `displayorder` int(11) DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_weid` (`weid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_invitative_reply;
CREATE TABLE `ims_weisrc_invitative_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `activityid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_invitative_user;
CREATE TABLE `ims_weisrc_invitative_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT '0',
  `from_user` varchar(100) DEFAULT '',
  `activityid` int(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(100) DEFAULT '',
  `headimgurl` varchar(500) DEFAULT '',
  `username` varchar(100) DEFAULT '' COMMENT '用户名称',
  `tel` varchar(50) DEFAULT '' COMMENT '联系电话',
  `company` varchar(200) DEFAULT '' COMMENT '公司',
  `position` varchar(200) DEFAULT '' COMMENT '职位',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_pano_reply;
CREATE TABLE `ims_weisrc_pano_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL DEFAULT '0',
  `weid` int(10) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `picture` varchar(200) NOT NULL,
  `picture1` varchar(200) NOT NULL,
  `picture2` varchar(200) NOT NULL,
  `picture3` varchar(200) NOT NULL,
  `picture4` varchar(200) NOT NULL,
  `picture5` varchar(200) NOT NULL,
  `picture6` varchar(200) NOT NULL,
  `music` varchar(400) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_truth_question;
CREATE TABLE `ims_weisrc_truth_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT '0',
  `from_user` varchar(100) DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_truth_reply;
CREATE TABLE `ims_weisrc_truth_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT '0',
  `qid` int(10) unsigned DEFAULT '0',
  `from_user` varchar(100) DEFAULT '',
  `parentid` int(10) unsigned DEFAULT '0',
  `parentopenid` varchar(100) DEFAULT '',
  `nickname` varchar(100) DEFAULT '',
  `headimgurl` varchar(500) DEFAULT '',
  `content` varchar(200) DEFAULT '' COMMENT '回复内容',
  `sharecount` int(10) unsigned DEFAULT '0' COMMENT '分享次数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_truth_setting;
CREATE TABLE `ims_weisrc_truth_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT '0',
  `title` varchar(100) DEFAULT '' COMMENT '网站名称',
  `share_title` varchar(100) NOT NULL DEFAULT '',
  `share_image` varchar(500) NOT NULL DEFAULT '',
  `share_desc` varchar(200) NOT NULL DEFAULT '',
  `share_cancel` varchar(200) NOT NULL DEFAULT '',
  `share_url` varchar(200) NOT NULL DEFAULT '',
  `share_num` int(10) NOT NULL DEFAULT '0',
  `follow_url` varchar(200) NOT NULL DEFAULT '',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weisrc_truth_share;
CREATE TABLE `ims_weisrc_truth_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT '0',
  `qid` int(10) unsigned DEFAULT '0',
  `from_user` varchar(100) DEFAULT '',
  `parentid` int(10) unsigned DEFAULT '0',
  `parentopenid` varchar(100) DEFAULT '',
  `nickname` varchar(100) DEFAULT '',
  `headimgurl` varchar(500) DEFAULT '',
  `content` varchar(200) DEFAULT '' COMMENT '回复内容',
  `sharecount` int(10) unsigned DEFAULT '0' COMMENT '分享次数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `dateline` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_awardlist;
CREATE TABLE `ims_weixin_awardlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `displayid` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `weid` int(10) NOT NULL COMMENT '主公众号',
  `luck_name` varchar(100) NOT NULL DEFAULT '' COMMENT '奖品名称',
  `luckid` int(10) NOT NULL DEFAULT '0' COMMENT '奖项活动ID来此关键词的rid也是按人数抽奖的id',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '此项奖品的已经中奖人数',
  `tag_name` varchar(100) NOT NULL DEFAULT '' COMMENT '第几等奖',
  `tagNum` int(10) NOT NULL DEFAULT '0' COMMENT '奖品数量',
  `num_exclude` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否准许按人数抽奖的时候重复中奖',
  `tag_exclude` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否准许按第几等奖抽奖的时候重复中奖',
  `nd` varchar(500) DEFAULT NULL COMMENT '内定抽奖粉丝ID字符串',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_cookie;
CREATE TABLE `ims_weixin_cookie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cookie` text NOT NULL,
  `cookies` text NOT NULL,
  `token` int(11) NOT NULL,
  `weid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO ims_weixin_cookie VALUES 
('1','s:441:\"data_bizuin=3092590437; Path=/; Secure; HttpOnly; data_ticket=AgblO6AowgtswIyQzucaA/MBAwFgMIfckiQ76cqGG6E=; Path=/; Secure; HttpOnly; slave_user=gh_4d235d3225de; Path=/; Secure; HttpOnly; slave_sid=RHl6TExabVRPb05mUzB5Y29FazdkdThnUVRjeVNfUmlKQlB6Uk9wa2ZncnVfa1NlbWJ3M2ZzY2NIX3FwaFZLZlNCZjhtVmk4dHN5Mm5DS1hFcndhNDZFYTl3dkpoV08yVG9WU1pKRlgxSEdwNHJKNW5mQlhxNlFob1h5VmFUYm8=; Path=/; Secure; HttpOnly; bizuin=3092590437; Path=/; Secure; HttpOnly\";','meepo','2018323023','32');


DROP TABLE IF EXISTS ims_weixin_flag;
CREATE TABLE `ims_weixin_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `fakeid` varchar(100) NOT NULL,
  `flag` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `avatar` text NOT NULL,
  `content` text NOT NULL,
  `sex` varchar(255) NOT NULL,
  `cjstatu` tinyint(4) NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL COMMENT '用户当前所在的微信墙话题',
  `isjoin` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否正在加入话题',
  `isblacklist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否是黑名单',
  `lastupdate` int(10) unsigned NOT NULL COMMENT '用户最后发表时间',
  `verify` varchar(10) NOT NULL,
  `status` int(1) NOT NULL,
  `othid` int(10) NOT NULL,
  `sign` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否已经签到',
  `signtime` int(12) NOT NULL DEFAULT '0' COMMENT '用户签到时间',
  `getaward` int(12) NOT NULL DEFAULT '0',
  `msgid` varchar(12) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `realname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_luckuser;
CREATE TABLE `ims_weixin_luckuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL COMMENT '主公众号',
  `awardid` int(10) NOT NULL DEFAULT '0' COMMENT '奖项活动ID',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '中奖时间',
  `openid` varchar(200) NOT NULL DEFAULT '' COMMENT '粉丝标识',
  `bypername` varchar(200) DEFAULT NULL COMMENT '默认为空，只要选择了按人数才能有值',
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_shake_data;
CREATE TABLE `ims_weixin_shake_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `avatar` text NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_shake_toshake;
CREATE TABLE `ims_weixin_shake_toshake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `avatar` text NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_vote;
CREATE TABLE `ims_weixin_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` text NOT NULL,
  `res` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_wall;
CREATE TABLE `ims_weixin_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `messageid` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `content` text NOT NULL,
  `nickname` text NOT NULL,
  `avatar` text NOT NULL,
  `ret` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `image` text NOT NULL,
  `type` varchar(10) NOT NULL COMMENT '发表内容类型',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `createtime` int(10) NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '用户当前所在的微信墙话题',
  `isblacklist` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_wall_num;
CREATE TABLE `ims_weixin_wall_num` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL COMMENT '用户当前所在的微信墙话题',
  `num` int(11) NOT NULL,
  `weid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_weixin_wall_reply;
CREATE TABLE `ims_weixin_wall_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL COMMENT '规则ID',
  `weid` int(10) NOT NULL,
  `enter_tips` varchar(300) NOT NULL DEFAULT '' COMMENT '进入提示',
  `subit_tips` varchar(300) NOT NULL DEFAULT '' COMMENT '首次关注进入提示',
  `quit_tips` varchar(300) NOT NULL DEFAULT '' COMMENT '退出提示',
  `send_tips` varchar(300) NOT NULL DEFAULT '' COMMENT '发表提示',
  `quit_command` varchar(10) NOT NULL DEFAULT '' COMMENT '退出指令',
  `timeout` int(10) NOT NULL DEFAULT '0' COMMENT '超时时间',
  `isshow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `lurumobile` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `chaoshi_tips` varchar(300) NOT NULL DEFAULT '' COMMENT '发表提示',
  `isopen` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '摇一摇状态',
  `votetitle` varchar(300) NOT NULL DEFAULT '' COMMENT '投票标题',
  `votepower` varchar(300) NOT NULL DEFAULT '' COMMENT '投票页面版权',
  `yyyzhuti` varchar(300) NOT NULL DEFAULT '' COMMENT '摇一摇主题',
  `cjname` varchar(300) NOT NULL DEFAULT '' COMMENT '抽奖名字',
  `cjimgurl` varchar(300) NOT NULL DEFAULT '' COMMENT '抽奖主题图片',
  `loginpass` varchar(300) NOT NULL DEFAULT '' COMMENT '主持人登录密码',
  `indexstyle` varchar(300) NOT NULL DEFAULT '' COMMENT '风格',
  `danmutime` int(10) NOT NULL DEFAULT '20' COMMENT '弹幕时间',
  `refreshtime` int(10) NOT NULL DEFAULT '0' COMMENT '刷新时间',
  `yyyendtime` int(10) NOT NULL DEFAULT '0' COMMENT '摇一摇结束总摇晃数目',
  `yyyshowperson` int(10) NOT NULL DEFAULT '0' COMMENT '摇一摇结果显示人数',
  `voterefreshtime` int(10) NOT NULL DEFAULT '0' COMMENT 'tp刷新时间',
  `qdqshow` int(10) NOT NULL DEFAULT '0' COMMENT '签到墙是否显示',
  `yyyshow` int(10) NOT NULL DEFAULT '0' COMMENT '摇一摇是否显示',
  `ddpshow` int(10) NOT NULL DEFAULT '0' COMMENT '对对碰是否显示',
  `tpshow` int(10) NOT NULL DEFAULT '0' COMMENT '投票是否显示',
  `cjshow` int(10) NOT NULL DEFAULT '0' COMMENT '抽奖是否显示',
  `danmushow` int(10) NOT NULL DEFAULT '0' COMMENT '抽奖是否显示',
  `cjnum_tag` int(10) NOT NULL DEFAULT '0' COMMENT '按人数抽奖是否开启',
  `cjnum_exclude` int(10) NOT NULL DEFAULT '0' COMMENT '按人数抽奖是否可以重复中奖',
  `cjtag_exclude` int(10) NOT NULL DEFAULT '0' COMMENT '按人数抽奖是否可以重复中奖',
  `defaultshow` int(10) NOT NULL DEFAULT '2' COMMENT '默认打开哪面墙',
  `yyyrealman` int(10) NOT NULL DEFAULT '0' COMMENT '真实人数',
  `yyybgimg` varchar(300) NOT NULL COMMENT '摇一摇背景',
  `danmubgimg` varchar(300) NOT NULL COMMENT '弹幕背景',
  `saywords` varchar(300) NOT NULL COMMENT '摇一摇背景',
  `signwords` varchar(300) NOT NULL COMMENT '摇一摇背景',
  `cjwords` varchar(300) NOT NULL COMMENT '摇一摇背景',
  `votewords` varchar(300) NOT NULL COMMENT '摇一摇背景',
  `ddpwords` varchar(300) NOT NULL COMMENT '摇一摇背景',
  `danmuwords` varchar(300) NOT NULL COMMENT '弹幕标题',
  `toplogo` varchar(300) NOT NULL COMMENT '弹幕标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wmb_goshare_convert;
CREATE TABLE `ims_wmb_goshare_convert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `themeid` int(11) NOT NULL,
  `themename` varchar(200) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `giftid` int(11) NOT NULL,
  `giftname` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `codetime` varchar(100) NOT NULL,
  `istake` int(2) NOT NULL,
  `cookieid` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wmb_goshare_cookie;
CREATE TABLE `ims_wmb_goshare_cookie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `themeid` int(11) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `cookieid` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wmb_goshare_gift;
CREATE TABLE `ims_wmb_goshare_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `themeid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(200) NOT NULL,
  `stdname` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `needscore` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wmb_goshare_giftgroup;
CREATE TABLE `ims_wmb_goshare_giftgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `themeid` int(11) NOT NULL,
  `themename` varchar(200) NOT NULL,
  `groupname` varchar(100) NOT NULL,
  `groupstate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wmb_goshare_member;
CREATE TABLE `ims_wmb_goshare_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `themeid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `cookieid` varchar(200) NOT NULL,
  `helpid` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wmb_goshare_theme;
CREATE TABLE `ims_wmb_goshare_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(200) NOT NULL,
  `themename` varchar(100) NOT NULL,
  `headtitle` varchar(200) NOT NULL,
  `themetitle` varchar(1000) NOT NULL,
  `themelogo` varchar(512) NOT NULL,
  `undertaker` varchar(200) NOT NULL,
  `ad1` varchar(200) NOT NULL,
  `ad1content` varchar(1000) NOT NULL,
  `ad2` varchar(200) NOT NULL,
  `ad2content` varchar(1000) NOT NULL,
  `ad3` varchar(200) NOT NULL,
  `ad3content` varchar(1000) NOT NULL,
  `ad3pic` varchar(512) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `place` varchar(200) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `begintime` date NOT NULL,
  `endtime` date NOT NULL,
  `footpic` varchar(512) NOT NULL,
  `overtitle` varchar(1000) NOT NULL,
  `sharepic` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wmb_goshare_transmit;
CREATE TABLE `ims_wmb_goshare_transmit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `themeid` int(11) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `helpid` varchar(200) NOT NULL,
  `cookieid` varchar(200) NOT NULL,
  `helpcookid` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_area;
CREATE TABLE `ims_wx_school_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '区域名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `ssort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_banners;
CREATE TABLE `ims_wx_school_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `uniacid` int(10) unsigned NOT NULL,
  `schoolid` int(11) DEFAULT '0',
  `bannername` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_bbsreply;
CREATE TABLE `ims_wx_school_bbsreply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `uniacid` int(10) unsigned NOT NULL,
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '微信头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `tid` varchar(125) NOT NULL COMMENT '帖子的ID',
  `tfrom_user` varchar(255) NOT NULL DEFAULT '' COMMENT '帖子作者的openid',
  `reply_id` varchar(125) NOT NULL COMMENT '回复评论帖子的ID',
  `from_user` varchar(255) NOT NULL DEFAULT '' COMMENT '回复评论帖子的openid',
  `to_reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '回复评论的id',
  `rfrom_user` varchar(255) NOT NULL DEFAULT '' COMMENT '被回复的评论的作者的openid',
  `content` text NOT NULL COMMENT '评论回复内容',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否已删除 0-否 1-是',
  `status` tinyint(2) DEFAULT '0' COMMENT '是否审核 0-否 1-是',
  `storey` int(11) NOT NULL DEFAULT '0' COMMENT '绝对楼层',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT '回复IP',
  `iparr` varchar(200) NOT NULL DEFAULT '' COMMENT 'IP区域',
  `createtime` int(11) NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_cat;
CREATE TABLE `ims_wx_school_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分校id',
  `name` char(50) NOT NULL,
  `icon` char(150) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL,
  `is_show` enum('1','0') NOT NULL,
  `url` varchar(300) NOT NULL,
  `system` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_classify;
CREATE TABLE `ims_wx_school_classify` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分校id',
  `sname` varchar(50) NOT NULL,
  `ssort` int(5) NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `type` char(20) NOT NULL,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_cookbook;
CREATE TABLE `ims_wx_school_cookbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分校id',
  `weid` int(10) unsigned NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `begintime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `monday` text NOT NULL,
  `tuesday` text NOT NULL,
  `wednesday` text NOT NULL,
  `thursday` text NOT NULL,
  `friday` text NOT NULL,
  `saturday` text NOT NULL,
  `sunday` text NOT NULL,
  `ishow` int(1) NOT NULL DEFAULT '1' COMMENT '1:显示,2隐藏,默认1',
  `sort` int(11) NOT NULL DEFAULT '1',
  `type` varchar(15) NOT NULL DEFAULT '',
  `headpic` varchar(200) NOT NULL DEFAULT '',
  `infos` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_index;
CREATE TABLE `ims_wx_school_index` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL DEFAULT '0' COMMENT '公众号id',
  `areaid` int(10) NOT NULL DEFAULT '0' COMMENT '区域id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT '学校logo',
  `thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '图文消息缩略图',
  `info` varchar(1000) NOT NULL DEFAULT '' COMMENT '简短描述',
  `content` text NOT NULL COMMENT '简介',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `location_p` varchar(100) NOT NULL DEFAULT '' COMMENT '省',
  `location_c` varchar(100) NOT NULL DEFAULT '' COMMENT '市',
  `location_a` varchar(100) NOT NULL DEFAULT '' COMMENT '区',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `place` varchar(200) NOT NULL DEFAULT '',
  `lat` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lng` decimal(18,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `password` varchar(20) NOT NULL DEFAULT '' COMMENT '登录密码',
  `hours` varchar(200) NOT NULL DEFAULT '' COMMENT '营业时间',
  `recharging_password` varchar(20) NOT NULL DEFAULT '' COMMENT '充值密码',
  `thumb_url` varchar(1000) DEFAULT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在手机端显示',
  `ssort` tinyint(3) NOT NULL DEFAULT '0',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '搜索页显示',
  `gonggao` varchar(1000) NOT NULL DEFAULT '' COMMENT '通知',
  `is_rest` tinyint(1) NOT NULL DEFAULT '0',
  `typeid` int(10) NOT NULL DEFAULT '0' COMMENT '学校类型',
  `style1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用新模版',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_kcbiao;
CREATE TABLE `ims_wx_school_kcbiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分校id',
  `weid` int(10) unsigned NOT NULL,
  `tid` int(11) NOT NULL COMMENT '所属教师ID',
  `kcid` int(11) NOT NULL COMMENT '所属课程ID',
  `nub` int(11) NOT NULL COMMENT '第几堂课或第几讲',
  `bj_id` int(11) NOT NULL,
  `km_id` int(11) NOT NULL,
  `xq_id` int(11) NOT NULL,
  `sd_id` int(11) NOT NULL,
  `date` int(10) unsigned NOT NULL COMMENT '开课日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_reply;
CREATE TABLE `ims_wx_school_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `schoolid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_score;
CREATE TABLE `ims_wx_school_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分校id',
  `xq_id` int(11) NOT NULL,
  `bj_id` int(11) NOT NULL,
  `qh_id` int(11) NOT NULL,
  `km_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `my_score` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_students;
CREATE TABLE `ims_wx_school_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分校id',
  `xq_id` int(11) NOT NULL,
  `area_addr` varchar(200) NOT NULL DEFAULT '',
  `ck_id` int(11) NOT NULL,
  `bj_id` int(11) NOT NULL,
  `birthdate` int(10) unsigned NOT NULL,
  `sex` int(1) NOT NULL,
  `createdate` int(10) unsigned NOT NULL,
  `seffectivetime` int(10) unsigned NOT NULL,
  `stheendtime` int(10) unsigned NOT NULL,
  `jf_statu` int(11) DEFAULT NULL,
  `mobile` char(11) NOT NULL,
  `homephone` char(16) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `localdate_id` char(20) NOT NULL DEFAULT '',
  `note` varchar(50) NOT NULL DEFAULT '',
  `amount` int(11) NOT NULL,
  `area` varchar(50) NOT NULL,
  `weid` int(10) unsigned NOT NULL,
  `wecha_id` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_tcourse;
CREATE TABLE `ims_wx_school_tcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分校id',
  `weid` int(10) unsigned NOT NULL,
  `tid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '课程名称',
  `dagang` text NOT NULL COMMENT '课程大纲',
  `start` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end` int(10) unsigned NOT NULL COMMENT '结束时间',
  `minge` int(11) NOT NULL COMMENT '名额限制',
  `adrr` varchar(100) NOT NULL DEFAULT '' COMMENT '授课地址或教室',
  `km_id` int(11) NOT NULL,
  `bj_id` int(11) NOT NULL,
  `xq_id` int(11) NOT NULL,
  `sd_id` int(11) NOT NULL,
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_teachers;
CREATE TABLE `ims_wx_school_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分校id',
  `weid` int(10) unsigned NOT NULL,
  `tname` varchar(50) NOT NULL,
  `birthdate` int(10) unsigned NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mobile` char(11) NOT NULL,
  `email` char(50) NOT NULL,
  `sex` int(1) NOT NULL,
  `km_id1` int(11) NOT NULL COMMENT '授课科目1',
  `km_id2` int(11) NOT NULL COMMENT '授课科目2',
  `bj_id1` int(11) NOT NULL COMMENT '授课班级1',
  `bj_id2` int(11) NOT NULL COMMENT '授课班级2',
  `bj_id3` int(11) NOT NULL COMMENT '授课班级3',
  `xq_id1` int(11) NOT NULL COMMENT '授课年级1',
  `xq_id2` int(11) NOT NULL COMMENT '授课年级2',
  `xq_id3` int(11) NOT NULL COMMENT '授课年级3',
  `jiontime` int(10) unsigned NOT NULL,
  `info` text NOT NULL COMMENT '教学成果',
  `jinyan` text NOT NULL COMMENT '教学经验',
  `headinfo` text NOT NULL COMMENT '教学特点',
  `thumb` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_school_type;
CREATE TABLE `ims_wx_school_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `ssort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wx_tuijian;
CREATE TABLE `ims_wx_tuijian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `guanzhuUrl` varchar(255) NOT NULL DEFAULT '' COMMENT '引导关注',
  `type` varchar(1) NOT NULL DEFAULT '1',
  `clickNum` int(10) unsigned NOT NULL DEFAULT '0',
  `ipclient` varchar(50) NOT NULL DEFAULT '' COMMENT 'ip',
  `thumb` varchar(500) NOT NULL DEFAULT '' COMMENT '缩略图',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hot` int(1) NOT NULL COMMENT '是否热门 0默认 1热门',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wxcard_reply;
CREATE TABLE `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wxwall_award;
CREATE TABLE `ims_wxwall_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wxwall_members;
CREATE TABLE `ims_wxwall_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user` varchar(50) NOT NULL COMMENT '用户的唯一身份ID',
  `avatar` varchar(255) NOT NULL COMMENT '粉丝头像',
  `rid` int(10) unsigned NOT NULL COMMENT '用户当前所在的微信墙话题',
  `isjoin` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否正在加入话题',
  `isblacklist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否是黑名单',
  `lastupdate` int(10) unsigned NOT NULL COMMENT '用户最后发表时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wxwall_message;
CREATE TABLE `ims_wxwall_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `from_user` varchar(50) NOT NULL COMMENT '用户的唯一ID',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '用户发表的内容',
  `type` varchar(10) NOT NULL COMMENT '发表内容类型',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_wxwall_reply;
CREATE TABLE `ims_wxwall_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `acid` int(10) NOT NULL,
  `enter_tips` varchar(300) NOT NULL DEFAULT '' COMMENT '进入提示',
  `quit_tips` varchar(300) NOT NULL DEFAULT '' COMMENT '退出提示',
  `send_tips` varchar(300) NOT NULL DEFAULT '' COMMENT '发表提示',
  `quit_command` varchar(10) NOT NULL DEFAULT '' COMMENT '退出指令',
  `timeout` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '超时时间',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `background` varchar(255) NOT NULL DEFAULT '',
  `syncwall` varchar(2000) NOT NULL DEFAULT '' COMMENT '第三方墙',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xc_article_adv_cache;
CREATE TABLE `ims_xc_article_adv_cache` (
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `adv_on_off` varchar(10) NOT NULL DEFAULT 'off',
  `adv_top` text NOT NULL,
  `adv_status` text NOT NULL,
  `adv_bottom` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xc_article_article;
CREATE TABLE `ims_xc_article_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL DEFAULT '0',
  `ishot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pcate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类',
  `template` varchar(300) NOT NULL DEFAULT '' COMMENT '内容模板目录',
  `templatefile` varchar(300) NOT NULL DEFAULT '' COMMENT '内容模板文件',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `thumb` varchar(1024) NOT NULL DEFAULT '' COMMENT '内容配图',
  `sharethumb` varchar(1024) NOT NULL DEFAULT '' COMMENT '分享缩率图',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '来源',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `recommendation` text NOT NULL COMMENT '推荐ID列表',
  `recommendation_source` varchar(20) NOT NULL COMMENT '推荐来源user自定义rand随机none没有',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(500) NOT NULL DEFAULT '',
  `redirect_url` varchar(500) NOT NULL DEFAULT '',
  `share_credit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享积分奖励',
  `click_credit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击积分奖励',
  `max_credit` int(10) NOT NULL DEFAULT '0' COMMENT '积分奖励上限',
  `per_user_credit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个用户送积分上限，0表示不限制',
  `praise_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `read_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adv_on_off` varchar(10) NOT NULL DEFAULT 'off',
  `adv_top` text NOT NULL,
  `adv_status` text NOT NULL,
  `adv_bottom` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xc_article_article_category;
CREATE TABLE `ims_xc_article_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联导航id',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '分类图标',
  `thumb` varchar(1024) NOT NULL DEFAULT '' COMMENT '分类图片',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '分类描述',
  `template` varchar(300) NOT NULL DEFAULT '' COMMENT '分类模板目录',
  `templatefile` varchar(300) NOT NULL DEFAULT '' COMMENT '分类模板文件',
  `linkurl` varchar(500) NOT NULL DEFAULT '',
  `ishomepage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xc_article_article_reply;
CREATE TABLE `ims_xc_article_article_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `articleid` int(11) NOT NULL,
  `isfill` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xc_article_share_track;
CREATE TABLE `ims_xc_article_share_track` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `clicker_id` varchar(100) NOT NULL DEFAULT '',
  `shareby` varchar(100) NOT NULL DEFAULT '',
  `track_type` varchar(100) NOT NULL DEFAULT '',
  `track_sub_type` varchar(100) NOT NULL DEFAULT '',
  `track_msg` varchar(100) NOT NULL DEFAULT '',
  `detail_id` varchar(50) NOT NULL DEFAULT '' COMMENT '具体来源',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章标题',
  `extra` varchar(50) NOT NULL COMMENT '附加信息',
  `access_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_activity;
CREATE TABLE `ims_xcommunity_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `regionid` varchar(500) NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `enddate` varchar(30) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `number` int(11) NOT NULL DEFAULT '1',
  `content` varchar(2000) NOT NULL,
  `status` int(1) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  `resnumber` int(11) unsigned NOT NULL COMMENT '报名人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_admap;
CREATE TABLE `ims_xcommunity_admap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `regionid` int(11) NOT NULL,
  `adid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_announcement;
CREATE TABLE `ims_xcommunity_announcement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `regionid` int(10) unsigned NOT NULL COMMENT '小区编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `createtime` int(10) unsigned NOT NULL,
  `starttime` int(11) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '结束时间',
  `status` tinyint(1) NOT NULL COMMENT '状态 1禁用，2启用',
  `enable` tinyint(1) NOT NULL COMMENT '模板类型',
  `datetime` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL COMMENT '通知范围',
  `reason` varchar(100) NOT NULL COMMENT '通知范围',
  `remark` varchar(100) NOT NULL COMMENT '通知备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发布公告';



DROP TABLE IF EXISTS ims_xcommunity_business;
CREATE TABLE `ims_xcommunity_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `qq` int(11) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` int(1) unsigned NOT NULL COMMENT '0未审核，1审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_carpool;
CREATE TABLE `ims_xcommunity_carpool` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `seat` int(2) unsigned NOT NULL,
  `sprice` int(10) unsigned NOT NULL,
  `month` int(2) unsigned NOT NULL,
  `yday` int(2) unsigned NOT NULL,
  `contact` varchar(50) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `start_position` varchar(100) NOT NULL,
  `end_position` varchar(100) NOT NULL,
  `startMinute` int(10) unsigned NOT NULL,
  `startSeconds` int(10) unsigned NOT NULL,
  `license_number` varchar(100) NOT NULL,
  `car_model` varchar(100) NOT NULL,
  `car_brand` varchar(100) NOT NULL,
  `content` varchar(300) NOT NULL,
  `enable` int(1) NOT NULL COMMENT '1开启,0关闭',
  `createtime` int(10) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_fled;
CREATE TABLE `ims_xcommunity_fled` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `title` varchar(20) NOT NULL,
  `rolex` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `yprice` int(10) NOT NULL,
  `zprice` int(10) NOT NULL,
  `realname` varchar(18) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `description` varchar(100) NOT NULL,
  `regionid` int(10) NOT NULL,
  `createtime` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `images` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_member;
CREATE TABLE `ims_xcommunity_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL COMMENT '小区编号',
  `openid` varchar(50) NOT NULL,
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `mobile` varchar(15) NOT NULL COMMENT '手机号',
  `regionname` varchar(50) NOT NULL COMMENT '小区名称',
  `address` varchar(100) NOT NULL COMMENT '楼栋门牌',
  `remark` varchar(1000) NOT NULL COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `manage_status` tinyint(1) unsigned NOT NULL COMMENT '授权管理员',
  PRIMARY KEY (`id`),
  KEY `idx_openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='注册用户';



DROP TABLE IF EXISTS ims_xcommunity_nav;
CREATE TABLE `ims_xcommunity_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `pcate` int(10) NOT NULL,
  `title` varchar(30) NOT NULL COMMENT '菜单标题',
  `url` varchar(1000) NOT NULL COMMENT '菜单链接',
  `styleid` int(10) NOT NULL COMMENT '风格id',
  `status` int(1) NOT NULL COMMENT '状态',
  `icon` varchar(50) NOT NULL COMMENT '系统图标',
  `bgcolor` varchar(20) NOT NULL COMMENT '背景颜色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_navextension;
CREATE TABLE `ims_xcommunity_navextension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `navurl` varchar(100) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `content` text NOT NULL COMMENT '说明',
  `cate` int(1) NOT NULL,
  `bgcolor` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_notice_setting;
CREATE TABLE `ims_xcommunity_notice_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `template_id_1` varchar(100) NOT NULL,
  `template_id_2` varchar(100) NOT NULL,
  `template_id_3` varchar(100) NOT NULL,
  `template_id_4` varchar(100) NOT NULL,
  `template_id_5` varchar(100) NOT NULL,
  `template_id_6` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='公告模板消息ID设置';



DROP TABLE IF EXISTS ims_xcommunity_phone;
CREATE TABLE `ims_xcommunity_phone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `regionid` int(10) unsigned NOT NULL COMMENT '小区编号',
  `weid` int(11) unsigned NOT NULL COMMENT '公众号',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `phone` varchar(50) NOT NULL COMMENT '号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常用电话';



DROP TABLE IF EXISTS ims_xcommunity_property;
CREATE TABLE `ims_xcommunity_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `topPicture` varchar(255) NOT NULL COMMENT '照片',
  `mcommunity` varchar(255) NOT NULL COMMENT '微小区URL',
  `content` varchar(2000) NOT NULL COMMENT '内容',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物业介绍';



DROP TABLE IF EXISTS ims_xcommunity_propertyfree;
CREATE TABLE `ims_xcommunity_propertyfree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `username` varchar(30) NOT NULL,
  `homenumber` varchar(15) NOT NULL,
  `profree` varchar(10) NOT NULL,
  `tcf` varchar(10) NOT NULL,
  `gtsf` varchar(10) NOT NULL,
  `gtdf` varchar(10) NOT NULL,
  `protimeid` int(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` int(1) unsigned NOT NULL COMMENT '1代表缴费，0代表未缴费',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_protime;
CREATE TABLE `ims_xcommunity_protime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `protime` varchar(30) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_region;
CREATE TABLE `ims_xcommunity_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `linkmen` varchar(50) NOT NULL COMMENT '联系人',
  `linkway` varchar(50) NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='添加小区信息';



DROP TABLE IF EXISTS ims_xcommunity_reply;
CREATE TABLE `ims_xcommunity_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `reportid` int(10) unsigned NOT NULL COMMENT '报告ID',
  `isreply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是回复',
  `content` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_report;
CREATE TABLE `ims_xcommunity_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL COMMENT '用户身份',
  `weid` int(11) unsigned NOT NULL COMMENT '公众号ID',
  `regionid` int(10) unsigned NOT NULL COMMENT '小区编号',
  `type` tinyint(1) NOT NULL COMMENT '1为报修，2为投诉',
  `category` varchar(50) NOT NULL DEFAULT '' COMMENT '类目',
  `content` varchar(255) NOT NULL COMMENT '投诉内容',
  `requirement` varchar(1000) NOT NULL,
  `createtime` int(11) unsigned NOT NULL COMMENT '投诉日期',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态,1已解决,0未解决,2为用户取消',
  `newmsg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有新信息',
  `rank` tinyint(3) unsigned NOT NULL COMMENT '评级 1满意，2一般，3不满意',
  `comment` varchar(1000) NOT NULL,
  `resolve` varchar(1000) NOT NULL COMMENT '处理结果',
  `resolver` varchar(50) NOT NULL COMMENT '处理人',
  `resolvetime` int(10) NOT NULL COMMENT '处理时间',
  `images` text,
  `print_sta` int(3) NOT NULL COMMENT '打印状态',
  PRIMARY KEY (`id`),
  KEY `idx_weid_regionid` (`weid`,`regionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_res;
CREATE TABLE `ims_xcommunity_res` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(100) NOT NULL,
  `truename` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `num` int(2) unsigned NOT NULL,
  `rid` int(11) unsigned NOT NULL,
  `sex` varchar(6) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_search;
CREATE TABLE `ims_xcommunity_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `sname` varchar(30) NOT NULL,
  `surl` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_service;
CREATE TABLE `ims_xcommunity_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `servicecategory` int(10) unsigned NOT NULL COMMENT '生活服务大分类 1家政服务，2租赁服务',
  `servicesmallcategory` varchar(50) NOT NULL COMMENT '生活服务小分类',
  `requirement` varchar(255) NOT NULL COMMENT '精准要求,如保洁需要填写 平米大小',
  `remark` varchar(500) NOT NULL COMMENT '备注',
  `contacttype` int(10) unsigned NOT NULL COMMENT '联系类型:1.随时联系;2.白天联系;3:晚上联系;4:自定义',
  `contactdesc` varchar(255) NOT NULL COMMENT '联系描述',
  `status` int(10) unsigned NOT NULL COMMENT '状态',
  `createtime` int(10) unsigned NOT NULL,
  `images` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_servicecategory;
CREATE TABLE `ims_xcommunity_servicecategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `description` varchar(50) NOT NULL COMMENT '分类描述',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO ims_xcommunity_servicecategory VALUES 
('1','','家政服务','','0','0','1'),
('2','','租赁服务','','0','0','1'),
('3','','报修类型','','0','0','1'),
('4','','投诉类型','','0','0','1'),
('5','','二手交易类型','','0','0','1');


DROP TABLE IF EXISTS ims_xcommunity_shopping_address;
CREATE TABLE `ims_xcommunity_shopping_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL,
  `address` varchar(300) NOT NULL,
  `isdefault` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `regionid` int(11) unsigned NOT NULL COMMENT '当前小区ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_cart;
CREATE TABLE `ims_xcommunity_shopping_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `goodsid` int(11) NOT NULL,
  `goodstype` tinyint(1) NOT NULL DEFAULT '1',
  `from_user` varchar(50) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `optionid` int(10) DEFAULT '0',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_openid` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_category;
CREATE TABLE `ims_xcommunity_shopping_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `regionid` varchar(1000) NOT NULL COMMENT '小区ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='超市商品分类';



DROP TABLE IF EXISTS ims_xcommunity_shopping_dispatch;
CREATE TABLE `ims_xcommunity_shopping_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `dispatchname` varchar(50) DEFAULT '',
  `dispatchtype` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `firstprice` decimal(10,2) DEFAULT '0.00',
  `secondprice` decimal(10,2) DEFAULT '0.00',
  `firstweight` int(11) DEFAULT '0',
  `secondweight` int(11) DEFAULT '0',
  `express` int(11) DEFAULT '0',
  `description` text,
  `regionid` varchar(1000) NOT NULL COMMENT '小区ID',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_express;
CREATE TABLE `ims_xcommunity_shopping_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `express_name` varchar(50) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `express_price` varchar(10) DEFAULT '',
  `express_area` varchar(100) DEFAULT '',
  `express_url` varchar(255) DEFAULT '',
  `regionid` varchar(1000) NOT NULL COMMENT '小区ID',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_feedback;
CREATE TABLE `ims_xcommunity_shopping_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为维权，2为告擎',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0未解决，1用户同意，2用户拒绝',
  `feedbackid` varchar(30) NOT NULL COMMENT '投诉单号',
  `transid` varchar(30) NOT NULL COMMENT '订单号',
  `reason` varchar(1000) NOT NULL COMMENT '理由',
  `solution` varchar(1000) NOT NULL COMMENT '期待解决方案',
  `remark` varchar(1000) NOT NULL COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_feedbackid` (`feedbackid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_transid` (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_goods;
CREATE TABLE `ims_xcommunity_shopping_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为实体，2为虚拟',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `unit` varchar(5) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `goodssn` varchar(50) NOT NULL DEFAULT '',
  `productsn` varchar(50) NOT NULL DEFAULT '',
  `marketprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `costprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `originalprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `total` int(10) NOT NULL DEFAULT '0',
  `totalcnf` int(11) DEFAULT '0' COMMENT '0 拍下减库存 1 付款减库存 2 永久不减',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `spec` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit` int(11) DEFAULT '0',
  `maxbuy` int(11) DEFAULT '0',
  `hasoption` int(11) DEFAULT '0',
  `dispatch` int(11) DEFAULT '0',
  `thumb_url` text,
  `isnew` int(11) DEFAULT '0',
  `ishot` int(11) DEFAULT '0',
  `isdiscount` int(11) DEFAULT '0',
  `isrecommand` int(11) DEFAULT '0',
  `istime` int(11) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `viewcount` int(11) DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `regionid` varchar(1000) NOT NULL COMMENT '小区ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_goods_option;
CREATE TABLE `ims_xcommunity_shopping_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `productprice` decimal(10,2) DEFAULT '0.00',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `costprice` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `displayorder` int(11) DEFAULT '0',
  `specs` text,
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_goods_param;
CREATE TABLE `ims_xcommunity_shopping_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_order;
CREATE TABLE `ims_xcommunity_shopping_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `ordersn` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `sendtype` tinyint(1) unsigned NOT NULL COMMENT '1为快递，2为自提',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `goodstype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `addressid` int(10) unsigned NOT NULL,
  `expresscom` varchar(30) NOT NULL DEFAULT '',
  `expresssn` varchar(50) NOT NULL DEFAULT '',
  `express` varchar(200) NOT NULL DEFAULT '',
  `goodsprice` decimal(10,2) DEFAULT '0.00',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `dispatch` int(10) DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `regionid` int(11) unsigned NOT NULL COMMENT '当前小区ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_order_goods;
CREATE TABLE `ims_xcommunity_shopping_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `goodsid` int(10) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(10) unsigned NOT NULL DEFAULT '1',
  `optionid` int(10) DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `optionname` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_product;
CREATE TABLE `ims_xcommunity_shopping_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NOT NULL,
  `productsn` varchar(50) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `marketprice` decimal(10,0) unsigned NOT NULL,
  `productprice` decimal(10,0) unsigned NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `spec` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodsid` (`goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_slide;
CREATE TABLE `ims_xcommunity_shopping_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `regionid` varchar(1000) NOT NULL COMMENT '小区ID',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_spec;
CREATE TABLE `ims_xcommunity_shopping_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `displaytype` tinyint(3) unsigned NOT NULL,
  `content` text NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_shopping_spec_item;
CREATE TABLE `ims_xcommunity_shopping_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `show` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_specid` (`specid`),
  KEY `indx_show` (`show`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_sjdp;
CREATE TABLE `ims_xcommunity_sjdp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL,
  `regionid` varchar(50) NOT NULL,
  `sjname` varchar(30) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `contactname` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `shopdesc` varchar(500) NOT NULL,
  `businnesstime` varchar(20) NOT NULL,
  `businessurl` varchar(100) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_slide;
CREATE TABLE `ims_xcommunity_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_template;
CREATE TABLE `ims_xcommunity_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='模板设置';



DROP TABLE IF EXISTS ims_xcommunity_verifycode;
CREATE TABLE `ims_xcommunity_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xcommunity_wechat_notice;
CREATE TABLE `ims_xcommunity_wechat_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `fansopenid` varchar(30) NOT NULL,
  `repair_status` int(1) NOT NULL,
  `report_status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='微信设置';



DROP TABLE IF EXISTS ims_xfcommunity_images;
CREATE TABLE `ims_xfcommunity_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) DEFAULT NULL,
  `file` longtext,
  `type` int(11) NOT NULL COMMENT '报修1，租赁2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xhw_face;
CREATE TABLE `ims_xhw_face` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 NOT NULL,
  `picurl` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `grade` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_xhw_face_link;
CREATE TABLE `ims_xhw_face_link` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `weid` int(20) NOT NULL,
  `link` varchar(500) CHARACTER SET utf8 NOT NULL,
  `number` int(10) NOT NULL,
  `api_key` varchar(100) NOT NULL,
  `api_secret` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_xhw_picvote;
CREATE TABLE `ims_xhw_picvote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `smalltext` varchar(300) NOT NULL,
  `share_title` varchar(500) NOT NULL,
  `share_desc` varchar(500) NOT NULL,
  `follow_url` varchar(300) NOT NULL,
  `rule_url` varchar(500) NOT NULL,
  `bgcolor` varchar(20) NOT NULL,
  `rule` text NOT NULL,
  `submit_url` varchar(500) NOT NULL,
  `starttime` int(20) NOT NULL,
  `endtime` int(20) NOT NULL,
  `logo` varchar(500) NOT NULL,
  `imgnum` int(10) NOT NULL,
  `mynum` int(10) NOT NULL COMMENT '投票上限',
  `cnzz` varchar(500) NOT NULL,
  `pass` int(10) NOT NULL,
  `anum` int(10) NOT NULL,
  `bnum` int(10) NOT NULL,
  `adpic` varchar(500) NOT NULL,
  `adlink` varchar(500) NOT NULL,
  `ad` varchar(5000) NOT NULL,
  `adpass` int(10) NOT NULL,
  `adimg` varchar(5000) NOT NULL,
  `adimglink` varchar(5000) NOT NULL,
  `adaimg` text NOT NULL,
  `imagnum` int(10) NOT NULL,
  `adiamglink` text NOT NULL,
  `day` int(10) NOT NULL,
  `hot` int(10) NOT NULL,
  `sharenum` int(10) NOT NULL,
  `viewnum` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xhw_picvote_log;
CREATE TABLE `ims_xhw_picvote_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL COMMENT '项目ID',
  `openid` varchar(100) CHARACTER SET utf8 NOT NULL,
  `numid` int(10) NOT NULL COMMENT '被投票ID',
  `time` int(20) NOT NULL,
  `ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_xhw_picvote_reg;
CREATE TABLE `ims_xhw_picvote_reg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL COMMENT '项目ID',
  `weid` int(10) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `openid` varchar(500) CHARACTER SET utf8 NOT NULL,
  `nickname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `avatar` varchar(500) CHARACTER SET utf8 NOT NULL,
  `phone` text CHARACTER SET utf8 NOT NULL,
  `pass` int(10) NOT NULL,
  `num` int(11) NOT NULL COMMENT '赞',
  `sharenum` int(10) NOT NULL COMMENT '朋友圈浏览次数',
  `time` int(12) NOT NULL,
  `img` varchar(5000) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`(333))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_xhw_picvote_setting;
CREATE TABLE `ims_xhw_picvote_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `jssdkpass` int(10) NOT NULL,
  `openidpass` int(10) NOT NULL,
  `followpass` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_xhw_voice;
CREATE TABLE `ims_xhw_voice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `smalltext` varchar(300) NOT NULL,
  `share_title` varchar(500) NOT NULL,
  `share_desc` varchar(500) NOT NULL,
  `follow_url` varchar(300) NOT NULL,
  `rule_url` varchar(500) NOT NULL,
  `submit_url` varchar(500) NOT NULL,
  `rules_url` varchar(500) NOT NULL,
  `starttime` int(20) NOT NULL,
  `endtime` int(20) NOT NULL,
  `logo` varchar(500) NOT NULL,
  `mynum` int(10) NOT NULL COMMENT '投票上限',
  `cnzz` varchar(500) NOT NULL,
  `adpic` varchar(500) NOT NULL,
  `adlink` varchar(500) NOT NULL,
  `ad` varchar(5000) NOT NULL,
  `adpass` int(10) NOT NULL,
  `anum` int(10) NOT NULL,
  `bnum` int(10) NOT NULL,
  `adimg` varchar(5000) NOT NULL,
  `adimglink` varchar(5000) NOT NULL,
  `day` int(10) NOT NULL,
  `hot` int(10) NOT NULL,
  `sharenum` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xhw_voice_log;
CREATE TABLE `ims_xhw_voice_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL COMMENT '项目ID',
  `openid` varchar(100) CHARACTER SET utf8 NOT NULL,
  `numid` int(10) NOT NULL COMMENT '被投票ID',
  `time` int(20) NOT NULL,
  `ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_xhw_voice_reg;
CREATE TABLE `ims_xhw_voice_reg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL COMMENT '项目ID',
  `weid` int(10) NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 NOT NULL,
  `mediaid` varchar(500) CHARACTER SET utf8 NOT NULL,
  `mp3` varchar(500) CHARACTER SET utf8 NOT NULL,
  `openid` varchar(500) CHARACTER SET utf8 NOT NULL,
  `nickname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `avatar` varchar(500) CHARACTER SET utf8 NOT NULL,
  `phone` text NOT NULL,
  `pass` int(10) NOT NULL,
  `num` int(11) NOT NULL COMMENT '赞',
  `sharenum` int(10) NOT NULL COMMENT '朋友圈浏览次数',
  `time` int(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`(333))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_xhw_voice_setting;
CREATE TABLE `ims_xhw_voice_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `appid` varchar(100) CHARACTER SET utf8 NOT NULL,
  `appsecret` varchar(100) CHARACTER SET utf8 NOT NULL,
  `accesskey` varchar(100) CHARACTER SET utf8 NOT NULL,
  `secretkey` varchar(100) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `link` varchar(100) NOT NULL,
  `settingpass` int(10) NOT NULL,
  `openidpass` int(10) NOT NULL,
  `followpass` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_xm_housekeep_adv;
CREATE TABLE `ims_xm_housekeep_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `link` varchar(300) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `top` int(11) NOT NULL,
  `addtime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_base;
CREATE TABLE `ims_xm_housekeep_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `yyopenid` varchar(100) DEFAULT NULL,
  `bili` float DEFAULT NULL,
  `lead` varchar(100) DEFAULT NULL,
  `sbili` float DEFAULT NULL,
  `comment1` varchar(500) DEFAULT NULL,
  `comment2` varchar(500) DEFAULT NULL,
  `comment3` varchar(500) DEFAULT NULL,
  `msg1` varchar(100) DEFAULT NULL,
  `hello1` varchar(500) DEFAULT NULL,
  `remark1` varchar(500) DEFAULT NULL,
  `msg2` varchar(100) DEFAULT NULL,
  `hello2` varchar(500) DEFAULT NULL,
  `remark2` varchar(500) DEFAULT NULL,
  `msg3` varchar(100) DEFAULT NULL,
  `hello3` varchar(500) DEFAULT NULL,
  `remark3` varchar(500) DEFAULT NULL,
  `msg4` varchar(100) DEFAULT NULL,
  `hello4` varchar(500) DEFAULT NULL,
  `remark4` varchar(500) DEFAULT NULL,
  `msg5` varchar(100) DEFAULT NULL,
  `hello5` varchar(500) DEFAULT NULL,
  `remark5` varchar(500) DEFAULT NULL,
  `share_title` varchar(500) DEFAULT NULL,
  `share_icon` varchar(100) DEFAULT NULL,
  `share_content` varchar(500) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_comment;
CREATE TABLE `ims_xm_housekeep_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `openid` varchar(80) DEFAULT NULL,
  `staff_id` varchar(100) DEFAULT NULL,
  `xing` int(11) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_cutlog;
CREATE TABLE `ims_xm_housekeep_cutlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `orderformid` int(11) DEFAULT NULL,
  `waiterid` int(11) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `closemoney` float DEFAULT NULL,
  `cut` float DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `staff_openid` varchar(100) DEFAULT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `staff_mobile` varchar(100) DEFAULT NULL,
  `flag` int(11) DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_givecut;
CREATE TABLE `ims_xm_housekeep_givecut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` varchar(80) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `openid` varchar(80) DEFAULT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `cut` float DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_orderform;
CREATE TABLE `ims_xm_housekeep_orderform` (
  `orderformid` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT NULL,
  `openid` varchar(80) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `ftime` datetime DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `mark` varchar(500) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  `waiterid` int(11) DEFAULT '0',
  `paitime` datetime DEFAULT NULL,
  `closemoney` float DEFAULT NULL,
  `closetime` datetime DEFAULT NULL,
  `xing` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderformid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_project;
CREATE TABLE `ims_xm_housekeep_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  `jianjie` varchar(500) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `price` varchar(500) DEFAULT NULL,
  `price_con` varchar(8000) NOT NULL,
  `istop1` int(11) DEFAULT NULL,
  `istop2` int(11) DEFAULT NULL,
  `typeorder` int(11) DEFAULT NULL,
  `addtime` varchar(100) NOT NULL,
  `updatetime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_question;
CREATE TABLE `ims_xm_housekeep_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` varchar(8000) NOT NULL,
  `addtime` varchar(100) NOT NULL,
  `updatetime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_service;
CREATE TABLE `ims_xm_housekeep_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` varchar(8000) NOT NULL,
  `addtime` varchar(100) NOT NULL,
  `updatetime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_staff;
CREATE TABLE `ims_xm_housekeep_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `qrcode` varchar(200) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `ticket` varchar(200) DEFAULT NULL,
  `accept` int(11) DEFAULT '0',
  `cutmoney` float DEFAULT '0',
  `getmoney` float DEFAULT '0',
  `addtime` varchar(100) NOT NULL,
  `updatetime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_type;
CREATE TABLE `ims_xm_housekeep_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `top` int(11) DEFAULT '0',
  `addtime` varchar(500) DEFAULT NULL,
  `updatetime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xm_housekeep_userfrom;
CREATE TABLE `ims_xm_housekeep_userfrom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `openid` varchar(80) DEFAULT NULL,
  `fromopenid` varchar(80) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xwz_queue_data;
CREATE TABLE `ims_xwz_queue_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `typeid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `number` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `giveuptime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xwz_queue_fans;
CREATE TABLE `ims_xwz_queue_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `nickname` varchar(255) DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) DEFAULT '' COMMENT '头像',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 -1 黑名单 0 正常',
  `suc` int(11) DEFAULT '0' COMMENT '取号次数',
  `past` int(11) DEFAULT '0' COMMENT '过号次数',
  `cancel` int(11) DEFAULT '0' COMMENT '取消次数',
  `createtime` int(11) DEFAULT '0' COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`),
  KEY `idx_status` (`status`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xwz_queue_manager;
CREATE TABLE `ims_xwz_queue_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `username` varchar(100) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xwz_queue_reply;
CREATE TABLE `ims_xwz_queue_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `thumb` varchar(200) DEFAULT '',
  `heading` varchar(255) DEFAULT '',
  `smallheading` varchar(255) DEFAULT '',
  `tel` varchar(255) DEFAULT '',
  `followurl` varchar(255) DEFAULT '',
  `intro` text,
  `status` tinyint(1) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `beforenum` int(11) DEFAULT '0',
  `screenbg` varchar(255) DEFAULT '',
  `qrcode` varchar(1000) DEFAULT '',
  `qrcodetype` tinyint(3) DEFAULT '0',
  `templateid` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_xwz_queue_type;
CREATE TABLE `ims_xwz_queue_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT '0',
  `tag` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `num` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_rid` (`rid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_asty_info;
CREATE TABLE `ims_yg_asty_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `nickname` varchar(1000) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  `logoopenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_asty_oauth;
CREATE TABLE `ims_yg_asty_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `appid` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS ims_yg_asty_recomd;
CREATE TABLE `ims_yg_asty_recomd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `asnum` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_asty_reply;
CREATE TABLE `ims_yg_asty_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `sharepic` varchar(500) NOT NULL,
  `sharedesc` varchar(255) NOT NULL,
  `sharetitle` varchar(10) NOT NULL,
  `indexbg` varchar(255) NOT NULL,
  `lovers_3` varchar(255) DEFAULT NULL,
  `lovers_2` varchar(255) DEFAULT NULL,
  `lovers_1` varchar(255) DEFAULT NULL,
  `lovers_0` varchar(255) DEFAULT NULL COMMENT '被按',
  `single_3` varchar(255) DEFAULT NULL,
  `single_2` varchar(255) DEFAULT NULL,
  `single_1` varchar(255) DEFAULT NULL,
  `single_0` varchar(255) DEFAULT NULL,
  `blood` varchar(500) DEFAULT NULL COMMENT '按完',
  `pnum` int(10) DEFAULT '0',
  `addnum` int(10) DEFAULT NULL COMMENT '转发增加次数',
  `turng` int(10) DEFAULT NULL COMMENT '是否转发加次数',
  `createtime` int(11) DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `follelink` varchar(1000) DEFAULT NULL,
  `forward` int(12) DEFAULT NULL,
  `leftpic` varchar(500) DEFAULT NULL,
  `rightpic` varchar(500) DEFAULT NULL,
  `gametime` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_asty_user;
CREATE TABLE `ims_yg_asty_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `openid` varchar(200) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  `asnum` int(11) DEFAULT '0' COMMENT '分数',
  `time` int(15) DEFAULT NULL COMMENT '添加时间',
  `count` int(11) DEFAULT '0' COMMENT '次数',
  `comparetime` int(11) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `forward` int(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_hcity_info;
CREATE TABLE `ims_yg_hcity_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `nickname` varchar(1000) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  `logoopenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_hcity_oauth;
CREATE TABLE `ims_yg_hcity_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `appid` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS ims_yg_hcity_reply;
CREATE TABLE `ims_yg_hcity_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `sharepic` varchar(500) NOT NULL,
  `sharedesc` varchar(255) NOT NULL,
  `sharetitle` varchar(10) NOT NULL,
  `indexmsg` varchar(255) NOT NULL COMMENT '首页提示',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `lpyl1` varchar(500) DEFAULT NULL COMMENT '老婆的',
  `lpyl2` varchar(500) DEFAULT NULL COMMENT '老婆2',
  `lzren` varchar(500) DEFAULT NULL COMMENT '老丈人',
  `zmniang` varchar(500) DEFAULT NULL COMMENT '丈母娘',
  `myyl` varchar(255) DEFAULT NULL COMMENT '我的',
  `actkh` varchar(500) DEFAULT NULL COMMENT '活动口号',
  `actlink` varchar(255) DEFAULT NULL COMMENT '活动链接',
  `createtime` int(10) unsigned NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `lpylpic` varchar(500) DEFAULT NULL,
  `lzrenpic` varchar(500) DEFAULT NULL,
  `zmniangpic` varchar(500) DEFAULT NULL,
  `lzrenname` varchar(255) DEFAULT NULL,
  `lpylname` varchar(255) DEFAULT NULL,
  `zmniangname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_parkour_info;
CREATE TABLE `ims_yg_parkour_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `nickname` varchar(1000) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  `logoopenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_parkour_oauth;
CREATE TABLE `ims_yg_parkour_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `appid` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS ims_yg_parkour_recomd;
CREATE TABLE `ims_yg_parkour_recomd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `asnum` float(11,1) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_parkour_reply;
CREATE TABLE `ims_yg_parkour_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `sharepic` varchar(500) NOT NULL,
  `sharedesc` varchar(255) NOT NULL,
  `sharetitle` varchar(10) NOT NULL,
  `indexbg` varchar(255) NOT NULL,
  `rule` varchar(500) DEFAULT NULL COMMENT '按完',
  `pnum` int(10) DEFAULT '0',
  `addnum` int(10) DEFAULT NULL COMMENT '转发增加次数',
  `turng` int(10) DEFAULT NULL COMMENT '是否转发加次数',
  `createtime` int(11) DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `follelink` varchar(1000) DEFAULT NULL,
  `forward` int(12) DEFAULT NULL,
  `phbbg` varchar(500) DEFAULT NULL,
  `gamebg` varchar(500) DEFAULT NULL,
  `gametime` int(20) DEFAULT NULL,
  `isfolle` int(20) DEFAULT NULL,
  `resultbg` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yg_parkour_user;
CREATE TABLE `ims_yg_parkour_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `openid` varchar(200) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  `asnum` float(11,1) DEFAULT '0.0' COMMENT '分数',
  `time` int(15) DEFAULT NULL COMMENT '添加时间',
  `count` int(11) DEFAULT '0' COMMENT '次数',
  `comparetime` int(11) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `forward` int(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yhc_ecard;
CREATE TABLE `ims_yhc_ecard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(300) DEFAULT NULL,
  `company` varchar(300) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `ext` text,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yhc_ecard_collect;
CREATE TABLE `ims_yhc_ecard_collect` (
  `cardid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`cardid`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yhc_ecard_pocket;
CREATE TABLE `ims_yhc_ecard_pocket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(300) DEFAULT NULL,
  `company` varchar(300) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `remote` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yhc_onenavi;
CREATE TABLE `ims_yhc_onenavi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `lat` varchar(20) DEFAULT NULL COMMENT '坐标经度',
  `lng` varchar(20) DEFAULT NULL COMMENT '坐标维度',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yobydashan_friend;
CREATE TABLE `ims_yobydashan_friend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL,
  `fromuser` varchar(60) DEFAULT NULL COMMENT '我的id',
  `wid` varchar(10) DEFAULT NULL COMMENT '朋友id',
  `yname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yobydashan_sms;
CREATE TABLE `ims_yobydashan_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(144) DEFAULT NULL COMMENT '字数',
  `createtime` int(10) DEFAULT NULL,
  `fromuser` varchar(64) DEFAULT NULL,
  `touser` varchar(64) DEFAULT NULL,
  `isread` tinyint(1) DEFAULT '0',
  `weid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_yobydashan_user;
CREATE TABLE `ims_yobydashan_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT NULL COMMENT '微信编号',
  `wid` varchar(10) DEFAULT NULL COMMENT '聊天编号',
  `sex` tinyint(1) DEFAULT '0',
  `yname` varchar(30) DEFAULT NULL COMMENT '姓名',
  `xi` varchar(100) DEFAULT NULL COMMENT '年级与系别',
  `fromuser` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_zam_chatlog;
CREATE TABLE `ims_zam_chatlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) NOT NULL,
  `toopenid` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `tousername` varchar(100) NOT NULL,
  `content` varchar(300) NOT NULL,
  `createtime` int(12) NOT NULL,
  `weid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_zam_cookie;
CREATE TABLE `ims_zam_cookie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cookie` text NOT NULL,
  `cookies` text NOT NULL,
  `token` int(11) NOT NULL,
  `weid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS ims_zam_userinfo;
CREATE TABLE `ims_zam_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `avatar` text NOT NULL,
  `sex` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `area` varchar(20) NOT NULL,
  `banji` varchar(50) NOT NULL,
  `createtime` int(12) NOT NULL,
  `jointime` int(12) NOT NULL,
  `fakeid` varchar(100) NOT NULL,
  `msgid` varchar(12) NOT NULL,
  `chattime` int(100) NOT NULL,
  `isblacklist` tinyint(1) NOT NULL,
  `weid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_zerobuy_code;
CREATE TABLE `ims_zerobuy_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `did` int(10) unsigned NOT NULL COMMENT '活动详情ID',
  `uid` int(10) unsigned NOT NULL,
  `jointime` int(10) NOT NULL COMMENT '参与时间',
  `code` char(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='参与号码表';



DROP TABLE IF EXISTS ims_zerobuy_detail;
CREATE TABLE `ims_zerobuy_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `lid` int(10) unsigned NOT NULL COMMENT '商品ID',
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `title` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-即将进行，2-正在进行，3-已结束，未开奖，4-已开奖，5-已开奖，无人中奖',
  `starttime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL,
  `zerobuy_price` varchar(10) NOT NULL,
  `join_num` int(10) unsigned NOT NULL COMMENT '参与人数',
  `exchange` smallint(4) unsigned NOT NULL COMMENT '积分兑换比例',
  `draw_code` char(5) NOT NULL COMMENT '开奖码',
  `win_code` char(5) NOT NULL COMMENT '中奖码',
  `winner_uid` int(10) unsigned NOT NULL COMMENT '中奖用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动详情';



DROP TABLE IF EXISTS ims_zerobuy_list;
CREATE TABLE `ims_zerobuy_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` varchar(10) NOT NULL,
  `use_nums` int(11) NOT NULL COMMENT '活动次数',
  `thumb` varchar(100) NOT NULL,
  `info` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `inventory` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动商品清单';



DROP TABLE IF EXISTS ims_zerobuy_rule;
CREATE TABLE `ims_zerobuy_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `rule` text NOT NULL,
  `rule_draw` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-相对规则，1-绝对规则',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动规则';



DROP TABLE IF EXISTS ims_zzz_reply;
CREATE TABLE `ims_zzz_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `uniacid` int(10) unsigned NOT NULL,
  `picture` varchar(100) NOT NULL COMMENT '活动图片',
  `description` text NOT NULL COMMENT '活动描述',
  `rule` text NOT NULL COMMENT '活动描述',
  `periodlottery` smallint(10) unsigned NOT NULL DEFAULT '1' COMMENT '0为无周期',
  `maxlottery` tinyint(3) unsigned NOT NULL COMMENT '系统每天赠送次数',
  `guzhuurl` varchar(255) NOT NULL DEFAULT '',
  `prace_times` int(10) NOT NULL DEFAULT '100',
  `title` varchar(100) NOT NULL DEFAULT '',
  `bgurl` varchar(255) NOT NULL DEFAULT '',
  `bigunit` varchar(50) NOT NULL DEFAULT '',
  `smallunit` varchar(50) NOT NULL DEFAULT '',
  `start_time` int(10) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '1600000000',
  `sharevalue` int(10) unsigned NOT NULL COMMENT '分享赠送体力',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_zzz_share;
CREATE TABLE `ims_zzz_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `fanid` int(10) unsigned NOT NULL COMMENT '粉丝ID',
  `sharefid` int(10) unsigned NOT NULL COMMENT '分享者ID',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`,`fanid`,`sharefid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_zzz_user;
CREATE TABLE `ims_zzz_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL DEFAULT '0',
  `fanid` int(10) unsigned NOT NULL COMMENT '粉丝ID',
  `count` int(10) NOT NULL DEFAULT '0',
  `points` int(10) NOT NULL DEFAULT '0',
  `friendcount` int(10) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  `sharevalue` int(10) unsigned NOT NULL COMMENT '分享获得体力',
  PRIMARY KEY (`id`),
  KEY `idx_fanid` (`fanid`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ims_zzz_winner;
CREATE TABLE `ims_zzz_winner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `point` int(10) unsigned NOT NULL DEFAULT '0',
  `fanid` int(10) unsigned NOT NULL COMMENT '粉丝ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未领奖，1不需要领奖，2已领奖',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '获奖日期',
  PRIMARY KEY (`id`),
  KEY `idx_fanid` (`fanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



----WeiZan MySQL Dump End