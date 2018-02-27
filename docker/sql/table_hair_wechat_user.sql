DROP TABLE IF EXISTS `hair_wechat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_wechat_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `wx_openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `wx_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `wx_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '微信用户头像',
  `country` varchar(255) NOT NULL DEFAULT '' COMMENT '国',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:普通会员;2:代理',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `activation_key` varchar(255) NOT NULL DEFAULT '' COMMENT '激活码,user_type=1时有效',
  `has_payed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态;0:未支付,1:已支付',
  `agent_activation_key` varchar(255) NOT NULL DEFAULT '' COMMENT '代理激活码,user_type=2时有效',
  `agent_work_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '代理推广人数,user_type=2时有效',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:已删除,1:正常',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `wx_openid` (`wx_openid`),
  KEY `wx_nickname` (`wx_nickname`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';
/*!40101 SET character_set_client = @saved_cs_client */;