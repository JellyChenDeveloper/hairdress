DROP TABLE IF EXISTS `wechat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `wx_openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `wx_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `wx_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '微信用户头像',
  `country` varchar(255) NOT NULL DEFAULT '' COMMENT '国',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:普通会员;2:代理',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `activation_key` varchar(255) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `has_payed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户状态;0:未支付,1:已支付',
  `user_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`wx_openid`),
  KEY `user_nickname` (`wx_nickname`),
  KEY `mobile` (`wx_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';
/*!40101 SET character_set_client = @saved_cs_client */;