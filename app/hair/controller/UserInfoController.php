<?php
/**
 * FileName:UserInfoController.php
 * Created by JellyChen
 * Date: 2018/2/9 上午11:03
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

class UserInfoController extends HairBaseController {

    public function index() {
        $user = model('WechatUser')->get(['id' => $this->user_id]);

        $this->assign('user', $user);

        return $this->fetch();
    }

    public function agentInfo() {
        return $this->fetch();
    }

    public function paybackRecord() {
        return $this->fetch();
    }
}