-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: hairdress
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `hairdress`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hairdress` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hairdress`;

--
-- Table structure for table `cmf_admin_menu`
--

DROP TABLE IF EXISTS `cmf_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_admin_menu`
--

LOCK TABLES `cmf_admin_menu` WRITE;
/*!40000 ALTER TABLE `cmf_admin_menu` DISABLE KEYS */;
INSERT INTO `cmf_admin_menu` VALUES (1,0,1,1,10000,'admin','User','index','','管理员','newspaper-o','管理员管理'),(2,0,1,1,10000,'hair','AdminWxUserInfo','index','','微信用户','wechat','微信用户管理'),(3,0,1,1,10000,'hair','AdminOrder','index','','订单管理','envelope-o','订单管理'),(4,0,1,1,10000,'hair','AdminElement','index','','组件管理','cubes',''),(5,0,1,1,10000,'hair','AdminActivityCode','index','','激活码管理','check-square-o',''),(6,0,1,1,10000,'hair','AdminTransfer','index','','返现管理','credit-card',''),(7,0,1,1,10000,'hair','AdminCourse','Index','','教程管理','book','教程管理'),(8,0,1,1,10000,'hair','AdminSetting','index','','系统设置','','');
/*!40000 ALTER TABLE `cmf_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_asset`
--

DROP TABLE IF EXISTS `cmf_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_asset`
--

LOCK TABLES `cmf_asset` WRITE;
/*!40000 ALTER TABLE `cmf_asset` DISABLE KEYS */;
INSERT INTO `cmf_asset` VALUES (1,1,135981,1520766038,1,0,'684aa9260df541590bd0da84bf6ae9a16a51c3c1c86e6856f1a441268d8b3f9f','WX20180303-031235@2x.png','admin/20180311/224ff53a28298b0479f561922545e9ca.png','684aa9260df541590bd0da84bf6ae9a1','7ce8b5481a0592a05ae80c7b554484f63f6d50b3','png',NULL),(2,1,114000,1520948993,1,0,'d6da0b65f10f07f66d18256c9e489f6719098120b0b56f9bc9041e0d81983553','QQ20180309-003448@2x.png','admin/20180313/ce7a6aab1a2dc18b89e7998abdc559ab.png','d6da0b65f10f07f66d18256c9e489f67','16537aa33c7003bcdd7027859a2555bce92e120c','png',NULL),(3,1,111260,1520949011,1,0,'5c5076d2c3ba9588b6b3129cc9e39719c794dcc8371a357a39cd1cc6d23caa7c','f4aa5983b3f74d469fe24574039a7b48.jpg','admin/20180313/b91b13a8a88cadeb3bd966b0927ec4cf.jpg','5c5076d2c3ba9588b6b3129cc9e39719','ad5a6c26bfa06852f413a5ca7c68faecb15549b7','jpg',NULL);
/*!40000 ALTER TABLE `cmf_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_auth_access`
--

DROP TABLE IF EXISTS `cmf_auth_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_auth_access`
--

LOCK TABLES `cmf_auth_access` WRITE;
/*!40000 ALTER TABLE `cmf_auth_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_auth_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_auth_rule`
--

DROP TABLE IF EXISTS `cmf_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_auth_rule`
--

LOCK TABLES `cmf_auth_rule` WRITE;
/*!40000 ALTER TABLE `cmf_auth_rule` DISABLE KEYS */;
INSERT INTO `cmf_auth_rule` VALUES (1,1,'admin','admin_url','admin/Hook/index','','钩子管理',''),(2,1,'admin','admin_url','admin/Hook/plugins','','钩子插件管理',''),(3,1,'admin','admin_url','admin/Hook/pluginListOrder','','钩子插件排序',''),(4,1,'admin','admin_url','admin/Hook/sync','','同步钩子',''),(5,1,'admin','admin_url','admin/Link/index','','友情链接',''),(6,1,'admin','admin_url','admin/Link/add','','添加友情链接',''),(7,1,'admin','admin_url','admin/Link/addPost','','添加友情链接提交保存',''),(8,1,'admin','admin_url','admin/Link/edit','','编辑友情链接',''),(9,1,'admin','admin_url','admin/Link/editPost','','编辑友情链接提交保存',''),(10,1,'admin','admin_url','admin/Link/delete','','删除友情链接',''),(11,1,'admin','admin_url','admin/Link/listOrder','','友情链接排序',''),(12,1,'admin','admin_url','admin/Link/toggle','','友情链接显示隐藏',''),(13,1,'admin','admin_url','admin/Mailer/index','','邮箱配置',''),(14,1,'admin','admin_url','admin/Mailer/indexPost','','邮箱配置提交保存',''),(15,1,'admin','admin_url','admin/Mailer/template','','邮件模板',''),(16,1,'admin','admin_url','admin/Mailer/templatePost','','邮件模板提交',''),(17,1,'admin','admin_url','admin/Mailer/test','','邮件发送测试',''),(18,1,'admin','admin_url','admin/Menu/index','','后台菜单',''),(19,1,'admin','admin_url','admin/Menu/lists','','所有菜单',''),(20,1,'admin','admin_url','admin/Menu/add','','后台菜单添加',''),(21,1,'admin','admin_url','admin/Menu/addPost','','后台菜单添加提交保存',''),(22,1,'admin','admin_url','admin/Menu/edit','','后台菜单编辑',''),(23,1,'admin','admin_url','admin/Menu/editPost','','后台菜单编辑提交保存',''),(24,1,'admin','admin_url','admin/Menu/delete','','后台菜单删除',''),(25,1,'admin','admin_url','admin/Menu/listOrder','','后台菜单排序',''),(26,1,'admin','admin_url','admin/Menu/getActions','','导入新后台菜单',''),(27,1,'admin','admin_url','admin/Nav/index','','导航管理',''),(28,1,'admin','admin_url','admin/Nav/add','','添加导航',''),(29,1,'admin','admin_url','admin/Nav/addPost','','添加导航提交保存',''),(30,1,'admin','admin_url','admin/Nav/edit','','编辑导航',''),(31,1,'admin','admin_url','admin/Nav/editPost','','编辑导航提交保存',''),(32,1,'admin','admin_url','admin/Nav/delete','','删除导航',''),(33,1,'admin','admin_url','admin/NavMenu/index','','导航菜单',''),(34,1,'admin','admin_url','admin/NavMenu/add','','添加导航菜单',''),(35,1,'admin','admin_url','admin/NavMenu/addPost','','添加导航菜单提交保存',''),(36,1,'admin','admin_url','admin/NavMenu/edit','','编辑导航菜单',''),(37,1,'admin','admin_url','admin/NavMenu/editPost','','编辑导航菜单提交保存',''),(38,1,'admin','admin_url','admin/NavMenu/delete','','删除导航菜单',''),(39,1,'admin','admin_url','admin/NavMenu/listOrder','','导航菜单排序',''),(40,1,'admin','admin_url','admin/Plugin/default','','插件中心',''),(41,1,'admin','admin_url','admin/Plugin/index','','插件列表',''),(42,1,'admin','admin_url','admin/Plugin/toggle','','插件启用禁用',''),(43,1,'admin','admin_url','admin/Plugin/setting','','插件设置',''),(44,1,'admin','admin_url','admin/Plugin/settingPost','','插件设置提交',''),(45,1,'admin','admin_url','admin/Plugin/install','','插件安装',''),(46,1,'admin','admin_url','admin/Plugin/update','','插件更新',''),(47,1,'admin','admin_url','admin/Plugin/uninstall','','卸载插件',''),(48,1,'admin','admin_url','admin/Rbac/index','','角色管理',''),(49,1,'admin','admin_url','admin/Rbac/roleAdd','','添加角色',''),(50,1,'admin','admin_url','admin/Rbac/roleAddPost','','添加角色提交',''),(51,1,'admin','admin_url','admin/Rbac/roleEdit','','编辑角色',''),(52,1,'admin','admin_url','admin/Rbac/roleEditPost','','编辑角色提交',''),(53,1,'admin','admin_url','admin/Rbac/roleDelete','','删除角色',''),(54,1,'admin','admin_url','admin/Rbac/authorize','','设置角色权限',''),(55,1,'admin','admin_url','admin/Rbac/authorizePost','','角色授权提交',''),(56,1,'admin','admin_url','admin/RecycleBin/index','','回收站',''),(57,1,'admin','admin_url','admin/RecycleBin/restore','','回收站还原',''),(58,1,'admin','admin_url','admin/RecycleBin/delete','','回收站彻底删除',''),(59,1,'admin','admin_url','admin/Route/index','','URL美化',''),(60,1,'admin','admin_url','admin/Route/add','','添加路由规则',''),(61,1,'admin','admin_url','admin/Route/addPost','','添加路由规则提交',''),(62,1,'admin','admin_url','admin/Route/edit','','路由规则编辑',''),(63,1,'admin','admin_url','admin/Route/editPost','','路由规则编辑提交',''),(64,1,'admin','admin_url','admin/Route/delete','','路由规则删除',''),(65,1,'admin','admin_url','admin/Route/ban','','路由规则禁用',''),(66,1,'admin','admin_url','admin/Route/open','','路由规则启用',''),(67,1,'admin','admin_url','admin/Route/listOrder','','路由规则排序',''),(68,1,'admin','admin_url','admin/Route/select','','选择URL',''),(69,1,'admin','admin_url','admin/Setting/default','','设置',''),(70,1,'admin','admin_url','admin/Setting/site','','网站信息',''),(71,1,'admin','admin_url','admin/Setting/sitePost','','网站信息设置提交',''),(72,1,'admin','admin_url','admin/Setting/password','','密码修改',''),(73,1,'admin','admin_url','admin/Setting/passwordPost','','密码修改提交',''),(74,1,'admin','admin_url','admin/Setting/upload','','上传设置',''),(75,1,'admin','admin_url','admin/Setting/uploadPost','','上传设置提交',''),(76,1,'admin','admin_url','admin/Setting/clearCache','','清除缓存',''),(77,1,'admin','admin_url','admin/Slide/index','','幻灯片管理',''),(78,1,'admin','admin_url','admin/Slide/add','','添加幻灯片',''),(79,1,'admin','admin_url','admin/Slide/addPost','','添加幻灯片提交',''),(80,1,'admin','admin_url','admin/Slide/edit','','编辑幻灯片',''),(81,1,'admin','admin_url','admin/Slide/editPost','','编辑幻灯片提交',''),(82,1,'admin','admin_url','admin/Slide/delete','','删除幻灯片',''),(83,1,'admin','admin_url','admin/SlideItem/index','','幻灯片页面列表',''),(84,1,'admin','admin_url','admin/SlideItem/add','','幻灯片页面添加',''),(85,1,'admin','admin_url','admin/SlideItem/addPost','','幻灯片页面添加提交',''),(86,1,'admin','admin_url','admin/SlideItem/edit','','幻灯片页面编辑',''),(87,1,'admin','admin_url','admin/SlideItem/editPost','','幻灯片页面编辑提交',''),(88,1,'admin','admin_url','admin/SlideItem/delete','','幻灯片页面删除',''),(89,1,'admin','admin_url','admin/SlideItem/ban','','幻灯片页面隐藏',''),(90,1,'admin','admin_url','admin/SlideItem/cancelBan','','幻灯片页面显示',''),(91,1,'admin','admin_url','admin/SlideItem/listOrder','','幻灯片页面排序',''),(92,1,'admin','admin_url','admin/Storage/index','','文件存储',''),(93,1,'admin','admin_url','admin/Storage/settingPost','','文件存储设置提交',''),(94,1,'admin','admin_url','admin/Theme/index','','模板管理',''),(95,1,'admin','admin_url','admin/Theme/install','','安装模板',''),(96,1,'admin','admin_url','admin/Theme/uninstall','','卸载模板',''),(97,1,'admin','admin_url','admin/Theme/installTheme','','模板安装',''),(98,1,'admin','admin_url','admin/Theme/update','','模板更新',''),(99,1,'admin','admin_url','admin/Theme/active','','启用模板',''),(100,1,'admin','admin_url','admin/Theme/files','','模板文件列表',''),(101,1,'admin','admin_url','admin/Theme/fileSetting','','模板文件设置',''),(102,1,'admin','admin_url','admin/Theme/fileArrayData','','模板文件数组数据列表',''),(103,1,'admin','admin_url','admin/Theme/fileArrayDataEdit','','模板文件数组数据添加编辑',''),(104,1,'admin','admin_url','admin/Theme/fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存',''),(105,1,'admin','admin_url','admin/Theme/fileArrayDataDelete','','模板文件数组数据删除',''),(106,1,'admin','admin_url','admin/Theme/settingPost','','模板文件编辑提交保存',''),(107,1,'admin','admin_url','admin/Theme/dataSource','','模板文件设置数据源',''),(108,1,'admin','admin_url','admin/User/default','','管理组',''),(109,1,'admin','admin_url','admin/User/index','','管理员',''),(110,1,'admin','admin_url','admin/User/add','','管理员添加',''),(111,1,'admin','admin_url','admin/User/addPost','','管理员添加提交',''),(112,1,'admin','admin_url','admin/User/edit','','管理员编辑',''),(113,1,'admin','admin_url','admin/User/editPost','','管理员编辑提交',''),(114,1,'admin','admin_url','admin/User/userInfo','','个人信息',''),(115,1,'admin','admin_url','admin/User/userInfoPost','','管理员个人信息修改提交',''),(116,1,'admin','admin_url','admin/User/delete','','管理员删除',''),(117,1,'admin','admin_url','admin/User/ban','','停用管理员',''),(118,1,'admin','admin_url','admin/User/cancelBan','','启用管理员',''),(119,1,'hair','admin_url','hair/AdminCourse/Index','','教程管理',''),(120,1,'portal','admin_url','portal/AdminArticle/add','','添加文章',''),(121,1,'portal','admin_url','portal/AdminArticle/addPost','','添加文章提交',''),(122,1,'portal','admin_url','portal/AdminArticle/edit','','编辑文章',''),(123,1,'portal','admin_url','portal/AdminArticle/editPost','','编辑文章提交',''),(124,1,'portal','admin_url','portal/AdminArticle/delete','','文章删除',''),(125,1,'portal','admin_url','portal/AdminArticle/publish','','文章发布',''),(126,1,'portal','admin_url','portal/AdminArticle/top','','文章置顶',''),(127,1,'portal','admin_url','portal/AdminArticle/recommend','','文章推荐',''),(128,1,'portal','admin_url','portal/AdminArticle/listOrder','','文章排序',''),(129,1,'portal','admin_url','portal/AdminCategory/index','','分类管理',''),(130,1,'portal','admin_url','portal/AdminCategory/add','','添加文章分类',''),(131,1,'portal','admin_url','portal/AdminCategory/addPost','','添加文章分类提交',''),(132,1,'portal','admin_url','portal/AdminCategory/edit','','编辑文章分类',''),(133,1,'portal','admin_url','portal/AdminCategory/editPost','','编辑文章分类提交',''),(134,1,'portal','admin_url','portal/AdminCategory/select','','文章分类选择对话框',''),(135,1,'portal','admin_url','portal/AdminCategory/listOrder','','文章分类排序',''),(136,1,'portal','admin_url','portal/AdminCategory/delete','','删除文章分类',''),(137,1,'portal','admin_url','portal/AdminIndex/default','','门户管理',''),(138,1,'portal','admin_url','portal/AdminPage/index','','页面管理',''),(139,1,'portal','admin_url','portal/AdminPage/add','','添加页面',''),(140,1,'portal','admin_url','portal/AdminPage/addPost','','添加页面提交',''),(141,1,'portal','admin_url','portal/AdminPage/edit','','编辑页面',''),(142,1,'portal','admin_url','portal/AdminPage/editPost','','编辑页面提交',''),(143,1,'portal','admin_url','portal/AdminPage/delete','','删除页面',''),(144,1,'portal','admin_url','portal/AdminTag/index','','文章标签',''),(145,1,'portal','admin_url','portal/AdminTag/add','','添加文章标签',''),(146,1,'portal','admin_url','portal/AdminTag/addPost','','添加文章标签提交',''),(147,1,'portal','admin_url','portal/AdminTag/upStatus','','更新标签状态',''),(148,1,'portal','admin_url','portal/AdminTag/delete','','删除文章标签',''),(149,1,'user','admin_url','user/AdminAsset/index','','资源管理',''),(150,1,'user','admin_url','user/AdminAsset/delete','','删除文件',''),(151,1,'user','admin_url','user/AdminIndex/default','','用户管理',''),(152,1,'user','admin_url','user/AdminIndex/default1','','用户组',''),(153,1,'user','admin_url','user/AdminIndex/index','','本站用户',''),(154,1,'user','admin_url','user/AdminIndex/ban','','本站用户拉黑',''),(155,1,'user','admin_url','user/AdminIndex/cancelBan','','本站用户启用',''),(156,1,'user','admin_url','user/AdminOauth/index','','第三方用户',''),(157,1,'user','admin_url','user/AdminOauth/delete','','删除第三方用户绑定',''),(158,1,'user','admin_url','user/AdminUserAction/index','','用户操作管理',''),(159,1,'user','admin_url','user/AdminUserAction/edit','','编辑用户操作',''),(160,1,'user','admin_url','user/AdminUserAction/editPost','','编辑用户操作提交',''),(161,1,'user','admin_url','user/AdminUserAction/sync','','同步用户操作',''),(162,1,'hair','admin_url','hair/AdminWxUserInfo/index','','微信用户',''),(163,1,'hair','admin_url','hair/AdminOrder/index','','订单管理',''),(164,1,'portal','admin_url','portal/AdminIndex/index','','文章列表',''),(165,1,'admin','admin_url','admin/Element/default','','组件管理',''),(166,1,'hair','admin_url','hair/AdminElement/index','','组件管理',''),(167,1,'admin','admin_url','admin/Order/default','','订单管理',''),(168,1,'admin','admin_url','admin/Order/detail','','订单详情',''),(169,1,'admin','admin_url','admin/System/default','','系统设置',''),(170,1,'admin','admin_url','admin/System/index','','系统列表',''),(171,1,'admin','admin_url','admin/WxUserInfo/default','','微信用户管理',''),(172,1,'admin','admin_url','admin/WxUserInfo/edit','','编辑用户',''),(173,1,'admin','admin_url','admin/WxUserInfo/editPost','','微信用户编辑提交',''),(174,1,'hair','admin_url','hair/AdminActivityCode/index','','激活码管理',''),(175,1,'hair','admin_url','hair/AdminTransfer/index','','返现管理',''),(176,1,'protal','admin_url','protal/AdminArticle/Index','','教程管理',''),(177,1,'hair','admin_url','hair/AdminSetting/index','','系统设置','');
/*!40000 ALTER TABLE `cmf_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_comment`
--

DROP TABLE IF EXISTS `cmf_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_comment`
--

LOCK TABLES `cmf_comment` WRITE;
/*!40000 ALTER TABLE `cmf_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_hook`
--

DROP TABLE IF EXISTS `cmf_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_hook`
--

LOCK TABLES `cmf_hook` WRITE;
/*!40000 ALTER TABLE `cmf_hook` DISABLE KEYS */;
INSERT INTO `cmf_hook` VALUES (1,1,0,'应用初始化','app_init','cmf','应用初始化'),(2,1,0,'应用开始','app_begin','cmf','应用开始'),(3,1,0,'模块初始化','module_init','cmf','模块初始化'),(4,1,0,'控制器开始','action_begin','cmf','控制器开始'),(5,1,0,'视图输出过滤','view_filter','cmf','视图输出过滤'),(6,1,0,'应用结束','app_end','cmf','应用结束'),(7,1,0,'日志write方法','log_write','cmf','日志write方法'),(8,1,0,'输出结束','response_end','cmf','输出结束'),(9,1,0,'后台控制器初始化','admin_init','cmf','后台控制器初始化'),(10,1,0,'前台控制器初始化','home_init','cmf','前台控制器初始化'),(11,1,1,'发送手机验证码','send_mobile_verification_code','cmf','发送手机验证码'),(12,3,0,'模板 body标签开始','body_start','','模板 body标签开始'),(13,3,0,'模板 head标签结束前','before_head_end','','模板 head标签结束前'),(14,3,0,'模板底部开始','footer_start','','模板底部开始'),(15,3,0,'模板底部开始之前','before_footer','','模板底部开始之前'),(16,3,0,'模板底部结束之前','before_footer_end','','模板底部结束之前'),(17,3,0,'模板 body 标签结束之前','before_body_end','','模板 body 标签结束之前'),(18,3,0,'模板左边栏开始','left_sidebar_start','','模板左边栏开始'),(19,3,0,'模板左边栏结束之前','before_left_sidebar_end','','模板左边栏结束之前'),(20,3,0,'模板右边栏开始','right_sidebar_start','','模板右边栏开始'),(21,3,0,'模板右边栏结束之前','before_right_sidebar_end','','模板右边栏结束之前'),(22,3,1,'评论区','comment','','评论区'),(23,3,1,'留言区','guestbook','','留言区'),(24,2,0,'后台首页仪表盘','admin_dashboard','admin','后台首页仪表盘'),(25,4,0,'后台模板 head标签结束前','admin_before_head_end','','后台模板 head标签结束前'),(26,4,0,'后台模板 body 标签结束之前','admin_before_body_end','','后台模板 body 标签结束之前'),(27,2,0,'后台登录页面','admin_login','admin','后台登录页面'),(28,1,1,'前台模板切换','switch_theme','cmf','前台模板切换'),(29,3,0,'主要内容之后','after_content','','主要内容之后'),(30,2,0,'文章显示之前','portal_before_assign_article','portal','文章显示之前'),(31,2,0,'后台文章保存之后','portal_admin_after_save_article','portal','后台文章保存之后'),(32,2,1,'获取上传界面','fetch_upload_view','user','获取上传界面'),(33,3,0,'主要内容之前','before_content','cmf','主要内容之前'),(34,1,0,'日志写入完成','log_write_done','cmf','日志写入完成'),(35,1,1,'后台模板切换','switch_admin_theme','cmf','后台模板切换');
/*!40000 ALTER TABLE `cmf_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_hook_plugin`
--

DROP TABLE IF EXISTS `cmf_hook_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_hook_plugin`
--

LOCK TABLES `cmf_hook_plugin` WRITE;
/*!40000 ALTER TABLE `cmf_hook_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_hook_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_link`
--

DROP TABLE IF EXISTS `cmf_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_link`
--

LOCK TABLES `cmf_link` WRITE;
/*!40000 ALTER TABLE `cmf_link` DISABLE KEYS */;
INSERT INTO `cmf_link` VALUES (1,1,1,8,'thinkcmf官网','http://www.thinkcmf.com','ThinkCMF','','_blank','');
/*!40000 ALTER TABLE `cmf_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_mylog`
--

DROP TABLE IF EXISTS `cmf_mylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_mylog` (
  `id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(11) unsigned NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `server` text,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_mylog`
--

LOCK TABLES `cmf_mylog` WRITE;
/*!40000 ALTER TABLE `cmf_mylog` DISABLE KEYS */;
INSERT INTO `cmf_mylog` VALUES (8,1519456881,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/4G Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'114.242.248.213\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'114.242.248.213\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'35012\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'t=2\',\n  \'REQUEST_URI\' => \'/index.php?t=2\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519456881.8710001,\n  \'REQUEST_TIME\' => 1519456881,\n)','/index.php?t=2'),(9,1519456881,'','array (\n  \'HTTP_ACCEPT\' => \'text/vnd.wap.wml,text/html,application/vnd.wap.xhtml+xml,application/xhtml+xml\',\n  \'HTTP_ACCEPT_CHARSET\' => \'gb2312,iso8859-1,utf-8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip,deflate\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'CONTENT_LENGTH\' => \'0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_Q_UA\' => \'KQB22_GA/220020&KMTT_3/200020&JV2&151920&SunMicrosystemswtk&0&4309&V3\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9b4) Gecko/2008030317 Firefox/3.0b4\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'111.30.142.78\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'52506\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519456881.8870001,\n  \'REQUEST_TIME\' => 1519456881,\n)','/'),(10,1519456885,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/4G Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'114.242.248.213\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'114.242.248.213\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'47471\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519456885.8670001,\n  \'REQUEST_TIME\' => 1519456885,\n)','/index.php'),(11,1519459381,'','array (\n  \'HTTP_HOST\' => \'blog.jellychen.cn\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\',\n  \'HTTP_FROM\' => \'googlebot(at)googlebot.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip,deflate,br\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at blog.jellychen.cn Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'blog.jellychen.cn\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'66.249.66.136\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'49056\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519459381.0050001,\n  \'REQUEST_TIME\' => 1519459381,\n)','/'),(12,1519459909,'','array (\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1\',\n  \'HTTP_CACHE_CONTROL\' => \'no-cache\',\n  \'HTTP_PRAGMA\' => \'no-cache\',\n  \'HTTP_HOST\' => \'aliyun.jellychen.cn\',\n  \'HTTP_ACCEPT\' => \'text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at aliyun.jellychen.cn Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'aliyun.jellychen.cn\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'106.11.227.204\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'33734\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519459909.3929999,\n  \'REQUEST_TIME\' => 1519459909,\n)','/'),(13,1519459952,'','array (\n  \'HTTP_HOST\' => \'test.jellychen.cn\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-cn,zh-tw\',\n  \'HTTP_IF_NONE_MATCH\' => \'\"@NULL@\"\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT\' => \'*/*\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at test.jellychen.cn Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'test.jellychen.cn\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.125.71.95\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'19421\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519459952.3169999,\n  \'REQUEST_TIME\' => 1519459952,\n)','/'),(14,1519462112,'','array (\n  \'HTTP_HOST\' => \'test.jellychen.cn\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-cn,zh-tw\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT\' => \'*/*\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at test.jellychen.cn Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'test.jellychen.cn\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'220.181.108.163\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'34939\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519462112.365,\n  \'REQUEST_TIME\' => 1519462112,\n)','/'),(15,1519462141,'','array (\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:36.0) Gecko/20100101 Firefox/36.0\',\n  \'HTTP_CACHE_CONTROL\' => \'no-cache\',\n  \'HTTP_PRAGMA\' => \'no-cache\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_ACCEPT\' => \'text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'121.42.241.32\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'38797\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519462141.1589999,\n  \'REQUEST_TIME\' => 1519462141,\n)','/'),(16,1519463395,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1801080 MicroMessenger/6.5.7 Language/zh_CN webview/15193757395493349 webdebugger port/52696\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh;q=0.8\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=v6olv8bos8jknbs5ad6fcktip3; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56604\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519463395.823,\n  \'REQUEST_TIME\' => 1519463395,\n)','/index.php'),(17,1519463397,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_CACHE_CONTROL\' => \'max-age=0\',\n  \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1801080 MicroMessenger/6.5.7 Language/zh_CN webview/15193757395493349 webdebugger port/52696\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh;q=0.8\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=v6olv8bos8jknbs5ad6fcktip3; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56622\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'code=021qOZjU0HAzxX1klLkU0kMQjU0qOZj4&state=f5f7cc62040a8816c32e183102205823\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html?code=021qOZjU0HAzxX1klLkU0kMQjU0qOZj4&state=f5f7cc62040a8816c32e183102205823\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519463397.592,\n  \'REQUEST_TIME\' => 1519463397,\n)','/index.php/hair/index/wxauth.html?code=021qOZjU0HAzxX1klLkU0kMQjU0qOZj4&state=f5f7cc62040a8816c32e183102205823'),(18,1519463398,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_CACHE_CONTROL\' => \'max-age=0\',\n  \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1801080 MicroMessenger/6.5.7 Language/zh_CN webview/15193757395493349 webdebugger port/52696\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh;q=0.8\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=v6olv8bos8jknbs5ad6fcktip3; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56622\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519463398.007,\n  \'REQUEST_TIME\' => 1519463398,\n)','/index.php'),(19,1519463414,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1801080 MicroMessenger/6.5.7 Language/zh_CN webview/15193757395493349 webdebugger port/52696\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh;q=0.8\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=v6olv8bos8jknbs5ad6fcktip3; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56658\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/project/index.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/project/index.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/project/index.html\',\n  \'PHP_SELF\' => \'/index.php/hair/project/index.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519463414.6960001,\n  \'REQUEST_TIME\' => 1519463414,\n)','/index.php/hair/project/index.html'),(20,1519463436,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh;q=0.9\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56688\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519463436.402,\n  \'REQUEST_TIME\' => 1519463436,\n)','/index.php'),(21,1519463483,'','array (\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (iPhone; CPU iPhone OS 10_2_1 like Mac OS X) AppleWebKit/602.4.6 (KHTML, like Gecko) Mobile/14D27 MicroMessenger/6.5.5 NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'*/*\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'121.51.32.144\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'42003\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/project/index.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/project/index.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/project/index.html\',\n  \'PHP_SELF\' => \'/index.php/hair/project/index.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519463483.1989999,\n  \'REQUEST_TIME\' => 1519463483,\n)','/index.php/hair/project/index.html'),(22,1519464327,'','array (\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1\',\n  \'HTTP_CACHE_CONTROL\' => \'no-cache\',\n  \'HTTP_PRAGMA\' => \'no-cache\',\n  \'HTTP_HOST\' => \'bt.jellychen.cn\',\n  \'HTTP_ACCEPT\' => \'text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at bt.jellychen.cn Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'bt.jellychen.cn\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'106.11.225.77\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'49599\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519464327.757,\n  \'REQUEST_TIME\' => 1519464327,\n)','/'),(23,1519465311,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'42734\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519465311.385,\n  \'REQUEST_TIME\' => 1519465311,\n)','/index.php'),(24,1519465311,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'33756\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'code=001eiBcn19cuZj0FhKan19nScn1eiBcx&state=2bc35e7b481a2d692e48040f09c61b23\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html?code=001eiBcn19cuZj0FhKan19nScn1eiBcx&state=2bc35e7b481a2d692e48040f09c61b23\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465311.8970001,\n  \'REQUEST_TIME\' => 1519465311,\n)','/index.php/hair/index/wxauth.html?code=001eiBcn19cuZj0FhKan19nScn1eiBcx&state=2bc35e7b481a2d692e48040f09c61b23'),(25,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'35781\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'code=011VLmVZ0y99KY16W1TZ0mSDVZ0VLmVM&state=2bc35e7b481a2d692e48040f09c61b23\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html?code=011VLmVZ0y99KY16W1TZ0mSDVZ0VLmVM&state=2bc35e7b481a2d692e48040f09c61b23\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.062,\n  \'REQUEST_TIME\' => 1519465312,\n)','/index.php/hair/index/wxauth.html?code=011VLmVZ0y99KY16W1TZ0mSDVZ0VLmVM&state=2bc35e7b481a2d692e48040f09c61b23'),(26,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/vnd.wap.wml,text/html,application/vnd.wap.xhtml+xml,application/xhtml+xml\',\n  \'HTTP_ACCEPT_CHARSET\' => \'gb2312,iso8859-1,utf-8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip,deflate\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'CONTENT_LENGTH\' => \'0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_Q_UA\' => \'KQB22_GA/220020&KMTT_3/200020&JV2&151920&SunMicrosystemswtk&0&4309&V3\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9b4) Gecko/2008030317 Firefox/3.0b4\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'111.30.142.233\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'65243\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.0910001,\n  \'REQUEST_TIME\' => 1519465312,\n)','/'),(27,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/vnd.wap.wml,text/html,application/vnd.wap.xhtml+xml,application/xhtml+xml\',\n  \'HTTP_ACCEPT_CHARSET\' => \'gb2312,iso8859-1,utf-8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip,deflate\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'CONTENT_LENGTH\' => \'0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_Q_UA\' => \'KQB22_GA/220020&KMTT_3/200020&JV2&151920&SunMicrosystemswtk&0&4309&V3\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9b4) Gecko/2008030317 Firefox/3.0b4\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.48\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'42876\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.0869999,\n  \'REQUEST_TIME\' => 1519465312,\n)','/'),(28,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'36005\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.5369999,\n  \'REQUEST_TIME\' => 1519465312,\n)','/index.php/hair/index/wxauth.html'),(29,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'35997\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.625,\n  \'REQUEST_TIME\' => 1519465312,\n)','/index.php/hair/index/wxauth.html'),(30,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'36223\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.7019999,\n  \'REQUEST_TIME\' => 1519465312,\n)','/index.php/hair/index/wxauth.html'),(31,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'36437\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.7809999,\n  \'REQUEST_TIME\' => 1519465312,\n)','/index.php/hair/index/wxauth.html'),(32,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'36609\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.858,\n  \'REQUEST_TIME\' => 1519465312,\n)','/index.php/hair/index/wxauth.html'),(33,1519465312,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'36776\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465312.9289999,\n  \'REQUEST_TIME\' => 1519465312,\n)','/index.php/hair/index/wxauth.html'),(34,1519465313,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'36954\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.003,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(35,1519465313,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'37142\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.079,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(36,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.2479999,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(37,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.316,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(38,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.381,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(39,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.4460001,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(40,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.506,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(41,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.5869999,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(42,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.661,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(43,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.747,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(44,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.825,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(45,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.901,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(46,1519465313,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465313.983,\n  \'REQUEST_TIME\' => 1519465313,\n)','/index.php/hair/index/wxauth.html'),(47,1519465314,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.0599999,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(48,1519465314,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.1429999,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(49,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'37550\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.326,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(50,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'37353\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.415,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(51,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'40373\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.494,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(52,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'40558\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.572,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(53,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'40742\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.655,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(54,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'40893\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.734,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(55,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'41115\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.822,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(56,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'41261\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.8989999,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(57,1519465314,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'41457\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465314.987,\n  \'REQUEST_TIME\' => 1519465314,\n)','/index.php/hair/index/wxauth.html'),(58,1519465315,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'41655\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465315.075,\n  \'REQUEST_TIME\' => 1519465315,\n)','/index.php/hair/index/wxauth.html'),(59,1519465315,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'41853\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465315.1689999,\n  \'REQUEST_TIME\' => 1519465315,\n)','/index.php/hair/index/wxauth.html'),(60,1519465315,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'42062\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465315.2579999,\n  \'REQUEST_TIME\' => 1519465315,\n)','/index.php/hair/index/wxauth.html'),(61,1519465315,'','array (\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate,qzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'42283\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465315.3399999,\n  \'REQUEST_TIME\' => 1519465315,\n)','/index.php/hair/index/wxauth.html'),(62,1519465315,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465315.622,\n  \'REQUEST_TIME\' => 1519465315,\n)','/index.php/hair/index/wxauth.html'),(63,1519465315,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465315.9630001,\n  \'REQUEST_TIME\' => 1519465315,\n)','/index.php/hair/index/wxauth.html'),(64,1519465316,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465316.0250001,\n  \'REQUEST_TIME\' => 1519465316,\n)','/index.php/hair/index/wxauth.html'),(65,1519465316,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465316.0969999,\n  \'REQUEST_TIME\' => 1519465316,\n)','/index.php/hair/index/wxauth.html'),(66,1519465316,'','array (\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_CONNECTION\' => \'keep-alive\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_ACCEPT\' => \'image/webp,image/wxpic,image/sharpp,image/apng,image/*,*/*;q=0.8\',\n  \'HTTP_REFERER\' => \'http://wechat.yikaoshuju.com/index.php/hair/index/wxauth.html\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'61.48.110.44\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'56492\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/index/wxauth.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/index/wxauth.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/index/wxauth.html\',\n  \'PHP_SELF\' => \'/index.php/hair/index/wxauth.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465316.1619999,\n  \'REQUEST_TIME\' => 1519465316,\n)','/index.php/hair/index/wxauth.html'),(67,1519465317,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'42703\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PHP_SELF\' => \'/index.php\',\n  \'REQUEST_TIME_FLOAT\' => 1519465317.9400001,\n  \'REQUEST_TIME\' => 1519465317,\n)','/index.php'),(68,1519465321,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'49589\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/project/index.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/project/index.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/project/index.html\',\n  \'PHP_SELF\' => \'/index.php/hair/project/index.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465321.658,\n  \'REQUEST_TIME\' => 1519465321,\n)','/index.php/hair/project/index.html'),(69,1519465326,'','array (\n  \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,image/wxpic,image/sharpp,image/apng,*/*;q=0.8\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip\',\n  \'HTTP_ACCEPT_LANGUAGE\' => \'zh-CN,zh-CN;q=0.8,en-US;q=0.6\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_COOKIE\' => \'thinkphp_show_page_trace=0|0; PHPSESSID=tbgjue7ga08p74dm7e5jfa4503; thinkphp_show_page_trace=0|0\',\n  \'HTTP_HOST\' => \'wechat.yikaoshuju.com\',\n  \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Linux; Android 8.0; DUK-AL20 Build/HUAWEIDUK-AL20; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 MicroMessenger/6.6.3.1260(0x26060339) NetType/WIFI Language/zh_CN\',\n  \'HTTP_X_FORWARDED_FOR\' => \'61.48.110.44\',\n  \'HTTP_X_FORWARDED_FOR_POUND\' => \'61.48.110.44\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at wechat.yikaoshuju.com Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\',\n  \'SERVER_NAME\' => \'wechat.yikaoshuju.com\',\n  \'SERVER_ADDR\' => \'172.31.89.229\',\n  \'SERVER_PORT\' => \'80\',\n  \'REMOTE_ADDR\' => \'123.151.77.132\',\n  \'DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'CONTEXT_PREFIX\' => \'\',\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/hairdress/public/\',\n  \'SERVER_ADMIN\' => \'451453325@qq.com\',\n  \'SCRIPT_FILENAME\' => \'/var/www/hairdress/public/index.php\',\n  \'REMOTE_PORT\' => \'58126\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'QUERY_STRING\' => \'\',\n  \'REQUEST_URI\' => \'/index.php/hair/project/index.html\',\n  \'SCRIPT_NAME\' => \'/index.php\',\n  \'PATH_INFO\' => \'/hair/project/index.html\',\n  \'PATH_TRANSLATED\' => \'/var/www/hairdress/public/hair/project/index.html\',\n  \'PHP_SELF\' => \'/index.php/hair/project/index.html\',\n  \'REQUEST_TIME_FLOAT\' => 1519465326.546,\n  \'REQUEST_TIME\' => 1519465326,\n)','/index.php/hair/project/index.html');
/*!40000 ALTER TABLE `cmf_mylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_nav`
--

DROP TABLE IF EXISTS `cmf_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_nav`
--

LOCK TABLES `cmf_nav` WRITE;
/*!40000 ALTER TABLE `cmf_nav` DISABLE KEYS */;
INSERT INTO `cmf_nav` VALUES (1,1,'主导航','主导航'),(2,0,'底部导航','');
/*!40000 ALTER TABLE `cmf_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_nav_menu`
--

DROP TABLE IF EXISTS `cmf_nav_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_nav_menu`
--

LOCK TABLES `cmf_nav_menu` WRITE;
/*!40000 ALTER TABLE `cmf_nav_menu` DISABLE KEYS */;
INSERT INTO `cmf_nav_menu` VALUES (1,1,0,1,0,'首页','','home','','0-1');
/*!40000 ALTER TABLE `cmf_nav_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_option`
--

DROP TABLE IF EXISTS `cmf_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_option`
--

LOCK TABLES `cmf_option` WRITE;
/*!40000 ALTER TABLE `cmf_option` DISABLE KEYS */;
INSERT INTO `cmf_option` VALUES (1,1,'site_info','{\"site_name\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_title\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_icp\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\",\"urlmode\":\"1\",\"html_suffix\":\"\",\"mobile_tpl_enabled\":\"1\"}'),(2,1,'cmf_settings','{\"open_registration\":\"0\",\"banned_usernames\":\"\"}'),(3,1,'cdn_settings','{\"cdn_static_root\":\"\"}'),(4,1,'admin_settings','{\"admin_password\":\"\",\"admin_style\":\"flatadmin\"}'),(5,1,'admin_dashboard_widgets','[{\"name\":\"MainContributors\",\"is_system\":1},{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"CmfHub\",\"is_system\":1},{\"name\":\"Custom1\",\"is_system\":1},{\"name\":\"Custom2\",\"is_system\":1},{\"name\":\"Custom3\",\"is_system\":1},{\"name\":\"Custom4\",\"is_system\":1},{\"name\":\"Custom5\",\"is_system\":1}]');
/*!40000 ALTER TABLE `cmf_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_plugin`
--

DROP TABLE IF EXISTS `cmf_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_plugin`
--

LOCK TABLES `cmf_plugin` WRITE;
/*!40000 ALTER TABLE `cmf_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_portal_category`
--

DROP TABLE IF EXISTS `cmf_portal_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_portal_category`
--

LOCK TABLES `cmf_portal_category` WRITE;
/*!40000 ALTER TABLE `cmf_portal_category` DISABLE KEYS */;
INSERT INTO `cmf_portal_category` VALUES (1,0,0,1,0,10000,'asd','3wr','0-1','','','','list','article','{\"thumbnail\":\"\"}');
/*!40000 ALTER TABLE `cmf_portal_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_portal_category_post`
--

DROP TABLE IF EXISTS `cmf_portal_category_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_portal_category_post`
--

LOCK TABLES `cmf_portal_category_post` WRITE;
/*!40000 ALTER TABLE `cmf_portal_category_post` DISABLE KEYS */;
INSERT INTO `cmf_portal_category_post` VALUES (1,2,1,10000,1);
/*!40000 ALTER TABLE `cmf_portal_category_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_portal_post`
--

DROP TABLE IF EXISTS `cmf_portal_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_portal_post`
--

LOCK TABLES `cmf_portal_post` WRITE;
/*!40000 ALTER TABLE `cmf_portal_post` DISABLE KEYS */;
INSERT INTO `cmf_portal_post` VALUES (1,0,2,1,1,1,1,0,0,0,0,0,1517988967,1517988967,1517988900,0,'rtsg','Q','FEWfwzv','','&lt;p&gt;fr45qg45gtw&lt;/p&gt;',NULL,'{\"thumbnail\":\"\",\"template\":\"page\"}'),(2,0,1,1,1,1,1,0,0,0,0,0,1517989008,1517989008,1517988989,0,'u67r5','7r68i75d','45y','4u6','&lt;p&gt;4ye65y&lt;/p&gt;',NULL,'{\"thumbnail\":\"\",\"template\":\"\"}');
/*!40000 ALTER TABLE `cmf_portal_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_portal_tag`
--

DROP TABLE IF EXISTS `cmf_portal_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_portal_tag`
--

LOCK TABLES `cmf_portal_tag` WRITE;
/*!40000 ALTER TABLE `cmf_portal_tag` DISABLE KEYS */;
INSERT INTO `cmf_portal_tag` VALUES (1,1,0,0,'7r68i75d');
/*!40000 ALTER TABLE `cmf_portal_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_portal_tag_post`
--

DROP TABLE IF EXISTS `cmf_portal_tag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_portal_tag_post`
--

LOCK TABLES `cmf_portal_tag_post` WRITE;
/*!40000 ALTER TABLE `cmf_portal_tag_post` DISABLE KEYS */;
INSERT INTO `cmf_portal_tag_post` VALUES (1,1,2,1);
/*!40000 ALTER TABLE `cmf_portal_tag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_recycle_bin`
--

DROP TABLE IF EXISTS `cmf_recycle_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_recycle_bin`
--

LOCK TABLES `cmf_recycle_bin` WRITE;
/*!40000 ALTER TABLE `cmf_recycle_bin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_recycle_bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_role`
--

DROP TABLE IF EXISTS `cmf_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_role`
--

LOCK TABLES `cmf_role` WRITE;
/*!40000 ALTER TABLE `cmf_role` DISABLE KEYS */;
INSERT INTO `cmf_role` VALUES (1,0,1,1329633709,1329633709,0,'超级管理员','拥有网站最高管理员权限！'),(2,0,1,1329633709,1329633709,0,'普通管理员','权限由最高管理员分配！');
/*!40000 ALTER TABLE `cmf_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_role_user`
--

DROP TABLE IF EXISTS `cmf_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_role_user`
--

LOCK TABLES `cmf_role_user` WRITE;
/*!40000 ALTER TABLE `cmf_role_user` DISABLE KEYS */;
INSERT INTO `cmf_role_user` VALUES (1,1,2);
/*!40000 ALTER TABLE `cmf_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_route`
--

DROP TABLE IF EXISTS `cmf_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_route`
--

LOCK TABLES `cmf_route` WRITE;
/*!40000 ALTER TABLE `cmf_route` DISABLE KEYS */;
INSERT INTO `cmf_route` VALUES (1,5000,1,2,'portal/List/index?id=1','ewfgt'),(2,4999,1,2,'portal/Article/index?cid=1','ewfgt/:id');
/*!40000 ALTER TABLE `cmf_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_slide`
--

DROP TABLE IF EXISTS `cmf_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_slide`
--

LOCK TABLES `cmf_slide` WRITE;
/*!40000 ALTER TABLE `cmf_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_slide_item`
--

DROP TABLE IF EXISTS `cmf_slide_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_slide_item`
--

LOCK TABLES `cmf_slide_item` WRITE;
/*!40000 ALTER TABLE `cmf_slide_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_slide_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_theme`
--

DROP TABLE IF EXISTS `cmf_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_theme`
--

LOCK TABLES `cmf_theme` WRITE;
/*!40000 ALTER TABLE `cmf_theme` DISABLE KEYS */;
INSERT INTO `cmf_theme` VALUES (1,0,0,0,0,'simpleboot3','simpleboot3','1.0.2','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF模板','ThinkCMF默认模板');
/*!40000 ALTER TABLE `cmf_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_theme_file`
--

DROP TABLE IF EXISTS `cmf_theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_theme_file`
--

LOCK TABLES `cmf_theme_file` WRITE;
/*!40000 ALTER TABLE `cmf_theme_file` DISABLE KEYS */;
INSERT INTO `cmf_theme_file` VALUES (1,0,10,'simpleboot3','文章页','portal/Article/index','portal/article','文章页模板文件','{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}',NULL),(2,0,10,'simpleboot3','联系我们页','portal/Page/index','portal/contact','联系我们页模板文件','{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}','{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}',NULL),(3,0,5,'simpleboot3','首页','portal/Index/index','portal/index','首页模板文件','{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL),(4,0,10,'simpleboot3','文章列表页','portal/List/index','portal/list','文章列表模板文件','{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL),(5,0,10,'simpleboot3','单页面','portal/Page/index','portal/page','单页面模板文件','{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL),(6,0,10,'simpleboot3','搜索页面','portal/search/index','portal/search','搜索模板文件','{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}','{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}',NULL),(7,1,0,'simpleboot3','模板全局配置','public/Config','public/config','模板全局配置文件','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}',NULL),(8,1,1,'simpleboot3','导航条','public/Nav','public/nav','导航条模板文件','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}',NULL);
/*!40000 ALTER TABLE `cmf_theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_third_party_user`
--

DROP TABLE IF EXISTS `cmf_third_party_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_third_party_user`
--

LOCK TABLES `cmf_third_party_user` WRITE;
/*!40000 ALTER TABLE `cmf_third_party_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_third_party_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user`
--

DROP TABLE IF EXISTS `cmf_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user`
--

LOCK TABLES `cmf_user` WRITE;
/*!40000 ALTER TABLE `cmf_user` DISABLE KEYS */;
INSERT INTO `cmf_user` VALUES (1,1,0,0,1522084951,0,0,0.00,1517667595,1,'admin','###b0e6dcf3e0cc1923339b92d115e6bcc1','admin','1@1.com','','','','172.21.0.1','','',NULL),(2,1,0,0,1520075935,0,0,0.00,0,0,'admin2','###949505e3c19e695eefbb70fb3197dfc4','','3@3.com','','','','172.21.0.1','','',NULL);
/*!40000 ALTER TABLE `cmf_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user_action`
--

DROP TABLE IF EXISTS `cmf_user_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user_action`
--

LOCK TABLES `cmf_user_action` WRITE;
/*!40000 ALTER TABLE `cmf_user_action` DISABLE KEYS */;
INSERT INTO `cmf_user_action` VALUES (1,1,1,1,2,1,'用户登录','login','user','');
/*!40000 ALTER TABLE `cmf_user_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user_action_log`
--

DROP TABLE IF EXISTS `cmf_user_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user_action_log`
--

LOCK TABLES `cmf_user_action_log` WRITE;
/*!40000 ALTER TABLE `cmf_user_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_user_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user_balance_log`
--

DROP TABLE IF EXISTS `cmf_user_balance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user_balance_log`
--

LOCK TABLES `cmf_user_balance_log` WRITE;
/*!40000 ALTER TABLE `cmf_user_balance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_user_balance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user_favorite`
--

DROP TABLE IF EXISTS `cmf_user_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user_favorite`
--

LOCK TABLES `cmf_user_favorite` WRITE;
/*!40000 ALTER TABLE `cmf_user_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_user_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user_login_attempt`
--

DROP TABLE IF EXISTS `cmf_user_login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user_login_attempt`
--

LOCK TABLES `cmf_user_login_attempt` WRITE;
/*!40000 ALTER TABLE `cmf_user_login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_user_login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user_score_log`
--

DROP TABLE IF EXISTS `cmf_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user_score_log`
--

LOCK TABLES `cmf_user_score_log` WRITE;
/*!40000 ALTER TABLE `cmf_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user_token`
--

DROP TABLE IF EXISTS `cmf_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user_token`
--

LOCK TABLES `cmf_user_token` WRITE;
/*!40000 ALTER TABLE `cmf_user_token` DISABLE KEYS */;
INSERT INTO `cmf_user_token` VALUES (1,1,1533219600,1517667600,'ea6b9f065a3fd8c6a901dd76c823949a7a0b00e5787626e7eaacf237ddec90dd','web'),(2,2,1535627935,1520075935,'f1a68072101b50b490206c82164fb3c74bcf13138cd5b3307ff7522f086f359c','web');
/*!40000 ALTER TABLE `cmf_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_verification_code`
--

DROP TABLE IF EXISTS `cmf_verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_verification_code`
--

LOCK TABLES `cmf_verification_code` WRITE;
/*!40000 ALTER TABLE `cmf_verification_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_verification_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair_activity_code`
--

DROP TABLE IF EXISTS `hair_activity_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_activity_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '绑定的用户id',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '激活码：8位数',
  `verify` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码，4位',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '级别:0-无意义,1-一级激活码,2-二级激活码',
  `rate` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '分配比率，百分之几',
  `rate2` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '二级分配比率，百分之几',
  `count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '使用次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0:已隐藏,1:正常',
  `list_order` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '排序，0-10000，从小到大',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='激活码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair_activity_code`
--

LOCK TABLES `hair_activity_code` WRITE;
/*!40000 ALTER TABLE `hair_activity_code` DISABLE KEYS */;
INSERT INTO `hair_activity_code` VALUES (1,0,0,'88888888','8888',1,25,5,5,1,10000,NULL,1521914654,1521914654,0);
/*!40000 ALTER TABLE `hair_activity_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair_course`
--

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
  `price` float NOT NULL DEFAULT '0' COMMENT '价格',
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

--
-- Dumping data for table `hair_course`
--

LOCK TABLES `hair_course` WRITE;
/*!40000 ALTER TABLE `hair_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `hair_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair_element`
--

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

--
-- Table structure for table `hair_order`
--

DROP TABLE IF EXISTS `hair_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `element_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '组件id',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信用户openid',
  `body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品描述',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品详情',
  `out_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商户订单号',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信订单号',
  `total_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标价金额',
  `spbill_create_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '终端IP',
  `prepay_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '预支付交易会话标识',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单类型:0-工具订单,1-组件订单,2-教程订单',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0:已删除,1:正常',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair_order`
--

LOCK TABLES `hair_order` WRITE;
/*!40000 ALTER TABLE `hair_order` DISABLE KEYS */;
INSERT INTO `hair_order` VALUES (1,1,0,'oM4l11OFSG5h0yjtHJuhJoaVudmc','美发工具-付费开通','美发工具','14995093622018032502053889883235','','1','','wx20180325020539695131b8aa0753920170',0,0,1,NULL,1521914739,1521914739,0),(2,1,0,'oM4l11OFSG5h0yjtHJuhJoaVudmc','美发工具-付费开通','美发工具','14995093622018032502055431398560','4200000071201803255027413795','1','','wx20180325020555501e529d5a0858766885',0,1521914766,1,NULL,1521914755,1521914766,0),(3,2,0,'oM4l11Da4XmP_5F6eiuy-Z-JHRSI','美发工具-付费开通','美发工具','14995093622018032514061051943963','4200000077201803255336323189','1','','wx20180325140611192c4ad8620245690515',0,1521957990,1,NULL,1521957971,1521957990,0),(4,3,0,'oM4l11EOzI7EKmG0E4PInGoSUtDQ','美发工具-付费开通','美发工具','14995093622018032717404476538143','4200000079201803276683708385','1','','wx20180327174048581b70d0290114271165',0,1522143663,1,NULL,1522143648,1522143663,0),(5,4,0,'oM4l11Opnos6GMOPUylYeKXFAXQU','付费开通','制图软件','14995093622018040819270655879040','','1','','wx0819270759789267e58b4a434152610273',0,0,1,NULL,1523186827,1523186827,0),(6,4,0,'oM4l11Opnos6GMOPUylYeKXFAXQU','付费开通','制图软件','14995093622018040819443045586407','','1','','wx08194430694499a35dcd64892501925074',0,0,1,NULL,1523187870,1523187870,0),(7,4,0,'oM4l11Opnos6GMOPUylYeKXFAXQU','付费开通','制图软件','14995093622018040919583805948895','','1','','wx091958390327040ff51ba6830357506991',0,0,1,NULL,1523275119,1523275119,0);
/*!40000 ALTER TABLE `hair_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair_pages`
--

DROP TABLE IF EXISTS `hair_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `project_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '项目id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '页面url',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '页面缩略图',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '页面状态;0:已删除,1:正常',
  `list_order` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '图片排序，0-10000，从小到大',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='项目详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair_pages`
--

LOCK TABLES `hair_pages` WRITE;
/*!40000 ALTER TABLE `hair_pages` DISABLE KEYS */;
INSERT INTO `hair_pages` VALUES (1,1,1,'页面','page/20180409/cabb70c9823dc25d8ac26fcc37349529.png','',1,10000,NULL,1521914794,1523274998,0),(2,2,2,'经典1','page/20180326/781b6fdf3aecd7fda9c7742534ae68b9.png','',1,10000,NULL,1521958077,1522036933,0),(3,3,3,'页面','','',1,10000,NULL,1522143674,1522143674,0),(4,2,4,'1','','',1,10000,NULL,1522976531,1522976531,0),(5,2,2,'經典2','','',1,10000,NULL,1523188047,1523188047,0),(6,2,2,'經典3','','',1,10000,NULL,1523271035,1523271035,0);
/*!40000 ALTER TABLE `hair_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair_projects`
--

DROP TABLE IF EXISTS `hair_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '项目缩略图，暂未使用',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '项目状态;0:已删除,1:正常',
  `list_order` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '项目排序，0-10000，从小到大',
  `more` text COMMENT '扩展属性',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='项目列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair_projects`
--

LOCK TABLES `hair_projects` WRITE;
/*!40000 ALTER TABLE `hair_projects` DISABLE KEYS */;
INSERT INTO `hair_projects` VALUES (1,1,'项目','',1,10000,NULL,1521914789,1521914789,0),(2,2,'经典','',1,10000,NULL,1521958025,1521958025,0),(3,3,'项目','',1,10000,NULL,1522143668,1522143668,0),(4,2,'经典2','',1,10000,NULL,1522976512,1522976512,0);
/*!40000 ALTER TABLE `hair_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair_setting`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair_setting`
--

LOCK TABLES `hair_setting` WRITE;
/*!40000 ALTER TABLE `hair_setting` DISABLE KEYS */;
INSERT INTO `hair_setting` VALUES (1,'制图软件',365,'\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　3月16日凌晨，中国交建二航局仅耗时1小时，就成功整体移除上海S26公路入城段北翟高架桥落地段，该段桥梁长67.5米、宽18米，重达3050吨——这是世界上单体最大重量桥梁快速移除工程！&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img class=&quot;normal&quot; width=&quot;400px&quot; data-loadfunc=&quot;0&quot; src=&quot;https://t10.baidu.com/it/u=2923301925,2907163600&amp;amp;fm=173&amp;amp;app=12&amp;amp;f=GIF?w=400&amp;amp;h=225&amp;amp;s=6C64C94E8B60BF664045981B03005081&quot; data-loaded=&quot;0&quot; style=&quot;border: 0px; display: block; margin: 0px auto;&quot;&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　由于该拆除区域位于上海城市副中心，离虹桥机场、虹桥火车站及上海国家会展中心近，面临拆除难度要求高、拆除工期短、组织管理难度大等诸多困难。&lt;/p&gt;\n',1,NULL,1522921699,1522923176,0);
/*!40000 ALTER TABLE `hair_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair_transfer`
--

DROP TABLE IF EXISTS `hair_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_transfer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信用户openid',
  `partner_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商户订单号',
  `enc_true_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `enc_bank_no` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `bank_code` varchar(255) NOT NULL DEFAULT '' COMMENT '银行编号',
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

--
-- Dumping data for table `hair_transfer`
--

LOCK TABLES `hair_transfer` WRITE;
/*!40000 ALTER TABLE `hair_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `hair_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair_wechat_user`
--

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
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `activation_key` varchar(255) NOT NULL DEFAULT '' COMMENT '激活码,user_type=1时有效',
  `has_payed` float unsigned NOT NULL DEFAULT '0' COMMENT '支付状态;0:未支付,1:已支付',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:普通会员;2:代理',
  `code_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '绑定的激活码id',
  `enc_true_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `enc_bank_no` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `bank_code` varchar(255) NOT NULL DEFAULT '' COMMENT '银行编号',
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair_wechat_user`
--

LOCK TABLES `hair_wechat_user` WRITE;
/*!40000 ALTER TABLE `hair_wechat_user` DISABLE KEYS */;
INSERT INTO `hair_wechat_user` VALUES (1,'oM4l11OFSG5h0yjtHJuhJoaVudmc','Jelly_国栋',1,'http://thirdwx.qlogo.cn/mmopen/vi_32/iauibgHxdsiaHkBKib1j59avyCLp5dYRWyIDc2a7zhS1FInN96NV6NIXJIWmzjYs2Yr551GpSUoYkAWY5zrr7R0HdA/132','中国','北京','朝阳','13111111111','88888888',1,1,0,'','','',1,0,'',NULL,1521914584,1521914766,0),(2,'oM4l11Da4XmP_5F6eiuy-Z-JHRSI','北京J-design贾雨锦13141434567',1,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqgXEJT7g6Gda8JbcZ2j1Eiab9cS6MOaFicaibdhPibCc1ib5sus8A08GMwCicSibp8kuSWbc97nicq0YCccA/132','中国','','','13141434567','88888888',1,1,0,'','','',1,0,'',NULL,1521957936,1521957990,0),(3,'oM4l11EOzI7EKmG0E4PInGoSUtDQ','勇哥',1,'http://thirdwx.qlogo.cn/mmopen/vi_32/ekiaNr29pZLgias5hZyWhCTmXEpZ9tBYlaZ3hYoL0UwqZVs3Z0KcuvsFvqIk1CDBvRliaFJCibUz4e1Mqic7NfmjDAA/132','中国','湖北','天门','13829707081','88888888',1,1,0,'','','',1,0,'',NULL,1522143615,1522143663,0),(4,'oM4l11Opnos6GMOPUylYeKXFAXQU','黃福生',0,'http://thirdwx.qlogo.cn/mmopen/vi_32/3w76ugCm36WaBRR4CU9s2FNCicGWibr5sDUX1GPyibLpgFNIs8nZBb5vicCtKEIzcWJiatiajtrkHLsbmc1JDYAibsmKQ/132','','','','13141434567','88888888',0,1,0,'','','',1,0,'',NULL,1523182162,1523186823,0);
/*!40000 ALTER TABLE `hair_wechat_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-15  9:00:50
