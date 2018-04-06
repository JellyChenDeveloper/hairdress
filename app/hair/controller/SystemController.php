<?php
/**
 * FileName:SystemController.php
 * Created by JellyChen
 * Date: 2018/2/25 下午1:48
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;


class SystemController extends HairBaseController {

    public function _initialize() {

    }

    public function clearCache() {

        session(null);
        if (isset($_COOKIE[session_name()])) {
            cookie(session_name(), null);
        }
        cookie(null);
        session_destroy();

        $this->redirect(url('hair/index/index'));
    }

    public function shareTest() {
        return $this->fetch();
    }
}