<?php
/**
 * FileName:OrderController.php
 * Created by JellyChen
 * Date: 2018/2/28 下午11:11
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\admin\controller;

use cmf\controller\AdminBaseController;

/**
 * Class OrderController
 *
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   => '订单管理',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '订单管理'
 * )
 */
class OrderController extends AdminBaseController {

    /**
     * 订单列表
     * @adminMenu(
     *     'name'   => '订单列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '订单列表',
     *     'param'  => ''
     * )
     */
    public function index() {
        $where = [];
        /**搜索条件**/
        $has_payed = $this->request->param('has_payed');
        if (!is_null($has_payed) && $has_payed != 999) {
            if ($has_payed) {
                $where['pay_time'] = ['gt', 0];
            } else {
                $where['pay_time'] = 0;
            }
        }

        $orders = model('Order')
            ->useGlobalScope(false)
            ->where($where)
            ->order("id DESC")
            ->paginate(10);
        $orders->appends(['has_payed' => $has_payed]);
        // 获取分页显示
        $page = $orders->render();

        $this->assign("page", $page);
        $this->assign("orders", $orders);

        return $this->fetch();
    }

    /**
     * 订单详情
     * @adminMenu(
     *     'name'   => '订单详情',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '订单详情',
     *     'param'  => ''
     * )
     */
    public function detail() {
        $id = $this->request->param("id", 0, 'intval');

        $order = model('Order')->get($id);
        $this->assign('order', $order);

        return $this->fetch();
    }

}