DROP TABLE IF EXISTS `hair_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text COMMENT '文章内容',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '页面缩略图',
  `content_filtered` text COMMENT '处理过的文章内容',
  `hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `price` FLOAT NOT NULL DEFAULT '0' COMMENT '价格',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `list_order` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '排序，0-10000，从小到大',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0:删除,1:正常',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `ctime_id` (`create_time`,`id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教程表';
/*!40101 SET character_set_client = @saved_cs_client */;