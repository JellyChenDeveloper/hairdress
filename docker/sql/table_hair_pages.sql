DROP TABLE IF EXISTS `hair_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `project_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '项目id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '页面url',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '页面状态;0:已删除,1:正常',
  `order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片排序，0-999，从小到大',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='项目详情表';
/*!40101 SET character_set_client = @saved_cs_client */;