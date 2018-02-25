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

        $this->wecharService->setWxHasAuth();

        $this->userLogin();

        $callback_url = session('wx_auth_callback_url');

        $this->redirect($callback_url);
    }
}