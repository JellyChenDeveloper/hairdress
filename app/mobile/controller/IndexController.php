<?php
/**
 * Created by PhpStorm.
 * User: cgd45
 * Date: 2018/2/8
 * Time: 14:09
 */

namespace app\mobile\controller;

use cmf\controller\HomeBaseController;

class IndexController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch('index');
    }
}