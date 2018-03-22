DROP TABLE IF EXISTS `hair_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_transfer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信用户openid',
  `partner_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商户订单号',
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否强制校验姓名:0-否,1-是',
  `re_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户真实姓名',
  `amount` float NOT NULL DEFAULT '0' COMMENT '企业付款金额，单位为分',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作说明信息',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `trans_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态:0:已删除,1:申请返现中,2:管理员已审批,3:成功返现',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0:已删除,1:正常',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='返现表';
/*!40101 SET character_set_client = @saved_cs_client */;