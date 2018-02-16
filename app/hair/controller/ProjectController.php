<?php
/**
 * FileName:ProjectController.php
 * Created by JellyChen
 * Date: 2018/2/9 上午10:22
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

class ProjectController extends HairBaseController {

    public function index() {
        return $this->fetch();
    }

    public function addProj() {
        return $this->fetch();
    }

    public function doAddProj(){

    }
}