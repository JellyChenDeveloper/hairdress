<?php
/**
 * FileName:we_chat.php
 * Created by JellyChen
 * Date: 2018/2/10 下午8:04
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

if (defined('ENV_LOC')) {
    $app_id = 'wx0a27e7e0e626f8ea';
    $secret = '222a7a2e27a670e6ab6cada48cdd7b14';
    define('TEST_OPENID', 'odJLRt4ITX2siPTPbiN3LNUJAxUI');
} elseif (defined('ENV_DEV')) {
    $app_id = 'wxa804ed68b68f6499';
    $secret = 'a9ae0f963cf6489c110b62cf8b80ee77';
} else {
    $app_id = '';
    $secret = '';
}

return [
    'WX_LOGIN_SESSION_KEY' => 'wx_login',
    'wx_sdk_config'        => [
        'app_id'        => $app_id,
        'secret'        => $secret,
        // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
        'response_type' => 'array',

        'log' => [
            'level' => 'debug',
            'file'  => __DIR__ . '/wechat.log',
        ],
    ],
];