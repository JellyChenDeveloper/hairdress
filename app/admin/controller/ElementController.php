<?php
/**
 * FileName:ElementController.php
 * Created by JellyChen
 * Date: 2018/3/4 下午4:53
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\admin\controller;

use cmf\controller\AdminBaseController;

/**
 * Class ElementController
 *
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   => '组件管理',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '组件管理'
 * )
 */
class ElementController extends AdminBaseController{

    /**
     * 组件列表
     * @adminMenu(
     *     'name'   => '组件列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '组件列表',
     *     'param'  => ''
     * )
     */
    public function index() {

        return $this->fetch();
    }
}