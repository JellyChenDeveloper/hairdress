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
    $app_id              = 'wxe6a9662f8eea0ee4';
    $secret              = 'cfd4f10fd1b254fbe0ab2840676af682';
    $mch_id              = '1499509362';
    $key                 = 'klp4h9BxsP5LF8NsXdy2YgKMRNFoWjzk';
    $cert_path           = ROOT_PATH . 'data/cert/apiclient_cert.pem';
    $key_path            = ROOT_PATH . 'data/cert/apiclient_key.pem';
    $rsa_public_key_path = ROOT_PATH . 'data/cert/public-1499509362.pem';
} else {
    $app_id              = 'wx10123deab0cdb210';
    $secret              = '6edcf086ccb2953ace564633ef908ca4';
    $mch_id              = '1499509362';
    $key                 = 'klp4h9BxsP5LF8NsXdy2YgKMRNFoWjzk';
    $cert_path           = ROOT_PATH . 'data/cert/apiclient_cert.pem';
    $key_path            = ROOT_PATH . 'data/cert/apiclient_key.pem';
    $rsa_public_key_path = ROOT_PATH . 'data/cert/public-1499509362.pem';
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
            'file'  => ROOT_PATH . 'data/runtime/wechat/easywechat.log',
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
            'app_id'              => $app_id,
            'mch_id'              => $mch_id,
            'key'                 => $key,
            'cert_path'           => $cert_path, // XXX: 绝对路径！！！！
            'key_path'            => $key_path, // XXX: 绝对路径！！！！
            'rsa_public_key_path' => $rsa_public_key_path,
            'notify_url'          => think\Url::build('hair/pay/notify', '', true, true),     // 你也可以在下单时单独设置来想覆盖它
        ],
    ],
];