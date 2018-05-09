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

class HairBaseController extends HomeBaseController {

    /**
     * @var \app\common\service\WechatService
     */
    protected $wecharService;

    protected $user_id;

    protected $user;

    protected $setting;

    public function _initialize() {
        parent::_initialize();
        $this->wecharService = WechatService::instance();
        $this->setting       = model('Setting')->get(1);
        $this->assign('setting', $this->setting);
        $lang = $this->request->param('lang');
        if(!empty($lang)){
            setcookie('think_var', $lang, 0, '/');
        }
        if ($this->request->path() != strtolower('hair/index/wxauth')) {
            $this->user    = $this->userLogin();
            $this->user_id = cmf_get_current_user_id();
        }
        if ($this->user_id) {
            if (!($this->request->module() == 'hair' && ($this->request->controller() == 'Index' || $this->request->controller() == 'Promote'))) {
                if (!cmf_user_has_register()) {
                    session('register.from_url', $this->request->url(true));
                    $this->redirect(url('hair/index/register'));
                } elseif (!cmf_user_has_payed()) {
                    if (!($this->request->module() == 'hair' && ($this->request->controller() == 'Pay' || $this->request->controller() == 'Course'))) {
                        session('wx_pay.from_url', $this->request->url(true));
                        $this->redirect(url('hair/pay/toolPay'));
                    }
                }
            }
        }
    }

    public function _initializeView() {
        parent::_initializeView();

        $viewReplaceStr                   = config('view_replace_str');
        $pub_path                         = $viewReplaceStr['__TMPL__'] . '/hair/public/assets';
        $viewReplaceStr['__WE_JS__']      = $pub_path . "/js";
        $viewReplaceStr['__WE_CSS__']     = $pub_path . "/css";
        $viewReplaceStr['__WE_LIB__']     = $pub_path . "/lib";
        $viewReplaceStr['__WE_IMAGES__']  = $pub_path . "/images";
        $viewReplaceStr['__PAGE_TOOLS__'] = $pub_path . "/page_tools";

        config('view_replace_str', $viewReplaceStr);
    }

    /**
     * 判断该用户是否存在，如果存在则取出相关信息，否则注册一个用户
     * 检测当前用户是否存在数据库中，如未存在则注册，如存在则获取信息保存在session中
     */
    public function userLogin() {
        if (!$this->wecharService->checkWxAuth()) {
            $tool_code = $this->request->param('tool_code');
            if (!empty($tool_code)) {
                session('wx_auth_callback_tool_code', $tool_code);
            }
            session('wx_auth_callback_url', $this->request->url());
            $this->wecharService->auth();

            return false;
        } else {
            if (!session('?wx_openid')) {
                $user    = $this->wecharService->getWxUserInfo();
                $wx_user = model('WechatUser')->get(['wx_openid' => $user->getId()]);
                session('wx_openid', $user->getId());
                if (is_null($wx_user)) {
                    $wx_user              = model('WechatUser');
                    $original             = $user->getOriginal();
                    $wx_user->wx_openid   = $user->getId();
                    $wx_user->wx_nickname = $user->getNickname();
                    $wx_user->wx_avatar   = $user->getAvatar();
                    $wx_user->sex         = $original['sex'];
                    $wx_user->country     = $original['country'];
                    $wx_user->province    = $original['province'];
                    $wx_user->city        = $original['city'];
                    $tool_code            = session('wx_auth_callback_tool_code');
                    if (!empty($tool_code)) {
                        $wx_user->activation_key = $tool_code;
                        model('ActivityCode')->get(['code' => $tool_code])->setInc('count');
                    }
                } else {
                    $wx_user->last_login_time = time();
                    $wx_user->last_login_ip   = get_client_ip(0, true);
                }
                $wx_user->save();
                cmf_update_current_user($wx_user->toArray());
            } else {
                $wx_user = model('WechatUser')->get(['wx_openid' => session('wx_openid')]);
                cmf_update_current_user($wx_user->toArray());
            }

            return cmf_get_current_user();
        }
    }
}