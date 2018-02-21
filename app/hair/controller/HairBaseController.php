<?php
/**
 * FileName:HairBaseController.php
 * Created by JellyChen
 * Date: 2018/2/10 下午6:07
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

use cmf\controller\HomeBaseController;
use app\common\service\WechatService;
use app\common\model\WechatUserModel;

class HairBaseController extends HomeBaseController {

    /**
     * @var \app\common\service\WechatService
     */
    protected $wecharService;

    public function _initialize() {
        parent::_initialize();
        $this->wecharService = WechatService::instance();
        if ($this->request->action() != strtolower('wxAuth')) {
            $this->userLogin();
        }
    }

    public function _initializeView() {
        parent::_initializeView();

        $viewReplaceStr                  = config('view_replace_str');
        $pub_path                        = $viewReplaceStr['__TMPL__'] . '/hair/public/assets';
        $viewReplaceStr['__WE_JS__']     = $pub_path . "/js";
        $viewReplaceStr['__WE_CSS__']    = $pub_path . "/css";
        $viewReplaceStr['__WE_LIB__']    = $pub_path . "/lib";
        $viewReplaceStr['__WE_IMAGES__'] = $pub_path . "/images";

        config('view_replace_str', $viewReplaceStr);
    }

    /**
     * 检测当前用户是否登录，如未登录则自动申请微信网页授权
     */
    public function userWxLogin() {
        if (!$this->wecharService->checkWxAuth()) {
            $this->wecharService->auth();

            return false;
        }

        return true;
    }

    /**
     * 判断该用户是否存在，如果存在则取出相关信息，否则注册一个用户
     * 检测当前用户是否存在数据库中，如未存在则注册，如存在则获取信息保存在session中
     */
    public function userLogin() {
        if (!cmf_get_current_user_id()) {
            if (cmf_is_user_wx_login()) {
                $user    = $this->wecharService->getWxUserInfo();
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
//                    $wx_user->create_time = time();
//                    $wx_user->update_time = time();

                    $wx_user->save();
                } else {
                    $wx_user->last_login_time = time();
                    $wx_user->last_login_ip   = get_client_ip(0, true);
                }
                cmf_update_current_user($wx_user->toArray());
            } else {
                $this->userWxLogin();
            }
        }

        return cmf_get_current_user();
    }
}