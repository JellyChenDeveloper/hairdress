<?php
/**
 * FileName:PromoteController.php
 * Created by JellyChen
 * Date: 2018/5/4 下午10:26
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;


class PromoteController extends HairBaseController {

    public function index() {
        return $this->fetch();
    }
}