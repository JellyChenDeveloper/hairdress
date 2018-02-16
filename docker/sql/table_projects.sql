DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `proj_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `proj_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '项目指示图，暂未使用',
  `prog_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '项目状态;0:已删除,1:正常',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `prog_status` (`prog_status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='项目列表';
/*!40101 SET character_set_client = @saved_cs_client */;