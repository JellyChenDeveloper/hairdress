<?php
/**
 * FileName:admin.php
 * Created by JellyChen
 * Date: 2018/1/31 下午9:52
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

// 应用入口文件
header('Content-type:text/html;charset=utf-8');

// 检测PHP环境
if (version_compare(PHP_VERSION, '5.3.0', '<')) die('require PHP > 5.3.0 !');

define('APP_ENV_STATUS', false);
// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
if (APP_ENV_STATUS) {
    define('APP_DEBUG', true);
} else {
    define('APP_DEBUG', true);
}

// 定义应用目录
define('APP_PATH', './App/');
define('TP_PATH', './ThinkPHP/');
define('ROOT_PATH', __DIR__);
define('BIND_MODULE', 'Admin');

// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';