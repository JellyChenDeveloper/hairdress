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
  `price` float NOT NULL DEFAULT '0' COMMENT '价格',
  `list_order` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '排序，0-10000，从小到大',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0:已隐藏,1:正常',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='组件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair_element`
--

LOCK TABLES `hair_element` WRITE;
/*!40000 ALTER TABLE `hair_element` DISABLE KEYS */;
INSERT INTO `hair_element` VALUES (1,'画笔','drawpanel','','',2,0,0,10000,1,NULL,1523780329,1523781457,0),(2,'发片','hairpiece','','',2,0,0,10000,1,NULL,1523780329,1523782221,0),(3,'发片2','hairpiece2','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(4,'分区线','partline','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(5,'弧线','arc','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(6,'直线','line','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(7,'S线','Sline','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(8,'S虚线','SIline','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(9,'箭头','arrow','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(10,'虚箭头','iarrow','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(11,'圆形','circle','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(12,'正方形','square','','',2,0,0,10000,1,NULL,1523780329,1523780329,0),(13,'三角形','triangle','','',2,0,0,10000,1,NULL,1523780329,1523780329,0);
/*!40000 ALTER TABLE `hair_element` ENABLE KEYS */;
UNLOCK TABLES;