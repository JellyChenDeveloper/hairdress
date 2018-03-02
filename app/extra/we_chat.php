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
    $app_id = 'wxe6a9662f8eea0ee4';
    $secret = 'cfd4f10fd1b254fbe0ab2840676af682';
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

        /**
         * 日志配置
         *
         * level: 日志级别, 可选为：
         *         debug/info/notice/warning/error/critical/alert/emergency
         * permission：日志文件权限(可选)，默认为null（若为null值,monolog会取0644）
         * file：日志文件位置(绝对路径!!!)，要求可写权限
         */
        'log'           => [
            'level' => 'debug',
            'file'  => ROOT_PATH . 'runtime/wechat/easywechat.log',
        ],
        /**
         * OAuth 配置
         *
         * scopes：公众平台（snsapi_userinfo / snsapi_base），开放平台：snsapi_login
         * callback：OAuth授权完成后的回调页地址
         */
        'oauth'         => [
            'scopes'   => ['snsapi_userinfo',],
            'callback' => think\Url::build('hair/index/wxAuth'),
        ],
        /**
         * 微信支付
         */
        'payment'       => [
            'merchant_id' => 'your-mch-id',
            'key'         => 'key-for-signature',
            'cert_path'   => ROOT_PATH . 'public/certs/wechat/apiclient_cert.pem', // XXX: 绝对路径！！！！
            'key_path'    => ROOT_PATH . 'public/certs/wechat/apiclient_key.pem',      // XXX: 绝对路径！！！！
            'notify_url'  => '默认的订单回调地址',       // 你也可以在下单时单独设置来想覆盖它
            // 'device_info'     => '013467007045764',
            // 'sub_app_id'      => '',
            // 'sub_merchant_id' => '',
            // ...
        ],
    ],
];