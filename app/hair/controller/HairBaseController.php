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
use app\wechat\service\WechatService;

class HairBaseController extends HomeBaseController {

    public function _initialize() {
        parent::_initialize();
//        $this->userLogin();
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
    public function userLogin() {
        if (!WechatService::instance()->checkWxAuth()) {
            WechatService::instance()->auth();
        }
    }
}