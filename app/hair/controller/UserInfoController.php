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

use cmf\controller\HomeBaseController;

class UserInfoController extends HomeBaseController {

    public function index() {
        $this->fetch();
    }
}