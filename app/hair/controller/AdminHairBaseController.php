<?php
/**
 * FileName:AdminHairBaseController.php
 * Created by JellyChen
 * Date: 2018/3/22 下午10:58
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

use cmf\controller\AdminBaseController;
use app\common\service\WechatService;

class AdminHairBaseController extends AdminBaseController {

    /**
     * @var \app\common\service\WechatService
     */
    protected $wecharService;

    public function _initialize() {
        parent::_initialize();
        $this->wecharService = WechatService::instance();
    }
}