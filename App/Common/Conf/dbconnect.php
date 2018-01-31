<?php
/**
 * Created by PhpStorm.
 * User: jellychen
 * Date: 2017/2/20
 * Time: 16:04
 */
$common_config = array();

$offline_config = array(
    // 显示页面Trace信息
    'SHOW_PAGE_TRACE' => true,
    //默认数据库配置信息
    'DB_TYPE'         => 'mysql', // 数据库类型
    'DB_HOST'         => '192.168.1.242', // 服务器地址
    //    'DB_HOST' => '203.100.94.221', // 服务器地址
    'DB_NAME'         => 'msb_crm', // 数据库名
    'DB_USER'         => 'root', // 用户名
    'DB_PWD'          => '4Wjytha}gzv3Accxcvwf', // 密码
    'DB_PORT'         => 3306, // 端口
    'DB_PARAMS'       => array(), // 数据库连接参数
    'DB_PREFIX'       => 'crm_', // 数据库表前缀
    'DB_CHARSET'      => 'utf8', // 字符集
    'DB_DEBUG'        => true, // 数据库调试模式 开启后可以记录SQL日志
);

$online_config = array(
    // 显示页面Trace信息
    'SHOW_PAGE_TRACE' => false,
    //默认数据库配置信息
    'DB_TYPE'         => 'mysql', // 数据库类型
    'DB_HOST'         => 'rdsyvryvzyvryvz.mysql.rds.aliyuncs.com', // 服务器地址
    'DB_NAME'         => 'msb_crm', // 数据库名
    'DB_USER'         => 'msb_crm', // 用户名
    'DB_PWD'          => 'msb_crm', // 密码
    'DB_PORT'         => 3306, // 端口
    'DB_PARAMS'       => array(), // 数据库连接参数
    'DB_PREFIX'       => 'crm_', // 数据库表前缀
    'DB_CHARSET'      => 'utf8', // 字符集
    'DB_DEBUG'        => true, // 数据库调试模式 开启后可以记录SQL日志
);

if (APP_ENV_STATUS) {
    return array_merge($common_config, $online_config);
} else {
    return array_merge($common_config, $offline_config);
}
