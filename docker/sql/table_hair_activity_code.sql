DROP TABLE IF EXISTS `hair_activity_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_activity_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '绑定的用户id',
  `count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '使用次数',
  `code` int(10) unsigned NOT NULL COMMENT '激活码：8位数',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '级别:0-无意义,1-一级激活码,2-二级激活码',
  `rate` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '分配比率，百分之几',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0:已隐藏,1:正常',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='激活码表';
/*!40101 SET character_set_client = @saved_cs_client */;