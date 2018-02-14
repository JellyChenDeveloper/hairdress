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
use app\wechat\model\WechatUserModel;

class IndexController extends HomeBaseController {

    public function index() {

        if (!cmf_is_user_login()) {
            $user    = WechatService::instance()->getUserInfo();
            $wx_user = WechatUserModel::get(['wx_openid' => $user->getId()]);
            if (is_null($wx_user)) {
                $wx_user              = new WechatUserModel();
                $original             = $user->getOriginal();
                $wx_user->wx_openid   = $user->getId();
                $wx_user->wx_nickname = $user->getNickname();
                $wx_user->wx_avatar   = $user->getAvatar();
                $wx_user->sex         = $original['sex'];
                $wx_user->country     = $original['country'];
                $wx_user->province    = $original['province'];
                $wx_user->city        = $original['city'];
                $wx_user->create_time = time();

                $wx_user->save();
            } else {
                $wx_user->last_login_time = time();
                $wx_user->last_login_ip   = get_client_ip(0, true);
            }
            cmf_update_current_user($wx_user->toArray());
            Session::set(Config::get('we_chat.WX_LOGIN_SESSION_KEY'), 1);
        }

        /**
         * TODO: 判断该用户是否存在，如果存在则取出相关信息，否则注册一个用户
         */

        $this->redirect(url('hair/index/index'));
    }
}