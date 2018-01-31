<?php
/**
 * FileName:IndexController.class.php
 * Created by JellyChen
 * Date: 2018/1/31 下午9:27
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $this->display();
    }
}