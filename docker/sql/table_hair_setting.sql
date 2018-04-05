DROP TABLE IF EXISTS `hair_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `software_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '软件名称',
  `software_price` float NOT NULL DEFAULT '0' COMMENT '软件价格',
  `content` text COMMENT '首页内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0:已删除,1:正常',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置表';
/*!40101 SET character_set_client = @saved_cs_client */;