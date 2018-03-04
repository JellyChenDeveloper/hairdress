<?php
/**
 * FileName:SystemController.php
 * Created by JellyChen
 * Date: 2018/3/4 下午4:52
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\admin\controller;


use cmf\controller\AdminBaseController;

/**
 * Class SystemController
 *
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   => '系统设置',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '系统设置'
 * )
 */
class SystemController extends AdminBaseController {

    /**
     * 系统列表
     * @adminMenu(
     *     'name'   => '系统列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '系统列表',
     *     'param'  => ''
     * )
     */
    public function index() {

        return $this->fetch();
    }
}