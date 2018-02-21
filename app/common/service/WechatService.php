<?php
/**
 * FileName:WechatService.php
 * Created by JellyChen
 * Date: 2018/2/13 下午12:51
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\service;

use EasyWeChat\Factory;

class WechatService {

    /** @var \app\common\service\WechatService null */
    static private $_instance = null;

    private $authconfig = array();

    static public function instance() {
        if (!self::$_instance instanceof WechatService) {
            self::$_instance = new self();
        }

        return self::$_instance;
    }

    private function __construct() {
        $this->authconfig = config('we_chat.wx_sdk_config');
    }

    /**
     * 进行微信网页授权
     */
    public function auth() {
        $this->authconfig['oauth'] = array(
            'scopes'   => ['snsapi_userinfo',],
            'callback' => url('hair/index/wxAuth'),
        );

        $app      = Factory::officialAccount($this->authconfig);
        $oauth    = $app->oauth;
        $response = $oauth->redirect();

        $response->send();
    }

    /**
     * 检测微信是否已授权
     */
    public function checkWxAuth() {
        return session('?' . config('we_chat.WX_LOGIN_SESSION_KEY'));
    }

    /**
     * 获取微信用户信息
     *
     * @todo 删除下方调试缓存文件及代码同目录缓存文件
     *
     * @return $this|\Overtrue\Socialite\User
     */
    public function getWxUserInfo() {
        $app  = Factory::officialAccount($this->authconfig);
        $user = $app->oauth->user();
        file_put_contents(__DIR__ . "/qwdoi.txt", var_export($user->toArray(), true) . "\r\n", FILE_APPEND);

        return $user;
    }
}