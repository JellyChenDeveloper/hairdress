DROP TABLE IF EXISTS `hair_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_element` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组件名称',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组件别名',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组件',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组件缩略图',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '组件类型:0-头像,1-工具,2-功能组件',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定:0-否,1-是',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否免费:0-否,1-是',
  `price` float NOT NULL DEFAULT '0' COMMENT '价格',
  `list_order` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '排序，0-10000，从小到大',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0:已隐藏,1:正常',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组件表';
/*!40101 SET character_set_client = @saved_cs_client */;