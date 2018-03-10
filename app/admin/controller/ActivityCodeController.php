<?php
/**
 * FileName:ActivityCodeController.php
 * Created by JellyChen
 * Date: 2018/3/10 下午10:53
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
 *     'name'   => '激活码管理',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '激活码管理'
 * )
 */
class ActivityCodeController extends AdminBaseController {

    /**
     * 激活码列表
     * @adminMenu(
     *     'name'   => '激活码列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '激活码列表',
     *     'param'  => ''
     * )
     */
    public function index() {
        $where = [];
        $name  = $this->request->param('name');
        $type  = $this->request->param('type');
        if ($name) {
            $where['name'] = ['like', "%$name%"];
        }
        if ($type && $type != '999') {
            $where['type'] = $type;
        }
        $codes = model('ActivityCode')
            ->order(["list_order" => "asc"])
            ->where($where)
            ->paginate(10);
        $codes->appends(['name' => $name, 'type' => $type]);
        // 获取分页显示
        $page = $codes->render();

        $this->assign("page", $page);
        $this->assign("codes", $codes);

        return $this->fetch();
    }
}