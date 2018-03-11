DROP TABLE IF EXISTS `hair_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '项目缩略图，暂未使用',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '项目状态;0:已删除,1:正常',
  `order` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '项目排序，0-10000，从小到大',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='项目列表';
/*!40101 SET character_set_client = @saved_cs_client */;