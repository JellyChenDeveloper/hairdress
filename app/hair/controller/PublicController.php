<?php
/**
 * FileName:PublicController.php
 * Created by JellyChen
 * Date: 2018/5/5 下午10:43
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

use cmf\controller\BaseController;

class PublicController extends BaseController {
    public function _initialize() {
        parent::_initialize();
        Vendor('phpqrcode.phpqrcode');
    }

    public function index() {
        $href   = $this->request->param('href');
        $href   = base64_decode($href);
        $object = new \QRcode();
        $object->png($href, false, QR_ECLEVEL_L, 100, 1);
    }

}