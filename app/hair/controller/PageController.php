<?php
/**
 * Created by PhpStorm.
 * User: cgd45
 * Date: 2018/2/23
 * Time: 18:49
 */

namespace app\hair\controller;


class PageController extends HairBaseController
{
    public function index(){
        $this->fetch();
    }
}