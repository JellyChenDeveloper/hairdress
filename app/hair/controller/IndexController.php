<?php
/**
 * FileName:IndexController.php
 * Created by JellyChen
 * Date: 2018/2/9 上午10:19
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

class IndexController extends HairBaseController {

    public function index() {
        return $this->fetch();
    }

    public function test() {
        echo 'asd';
        exit();
    }

    public function wxAuth() {

        cmf_set_user_wx_login();

        $this->userLogin();

        $this->redirect(url('hair/index/index'));
    }
}