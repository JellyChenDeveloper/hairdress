<?php
/**
 * FileName:IndexController.php
 * Created by JellyChen
 * Date: 2018/2/13 下午1:41
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\wechat\controller;

use cmf\controller\HomeBaseController;
use app\wechat\service\WechatService;
use think\Config;
use think\Session;

class IndexController extends HomeBaseController {

    public function index() {

        $user = WechatService::instance()->getUserInfo();
        cmf_update_current_user($user->toArray());
        Session::set(Config::get('we_chat.WX_LOGIN_SESSION_KEY'), 1);

        /**
         * TODO: 判断该用户是否存在，如果存在则取出相关信息，否则注册一个用户
         */

        $this->redirect(url('hair/index/index'));
    }
}