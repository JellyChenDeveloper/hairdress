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
        $this->userLogin();
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