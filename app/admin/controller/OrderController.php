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
        $wx_nickname = $this->request->param('wx_nickname');
        $mobile      = trim($this->request->param('mobile'));

        if ($wx_nickname) {
            $where['wx_nickname'] = ['like', "%$wx_nickname%"];
        }

        if ($mobile) {
            $where['mobile'] = ['like', "%$mobile%"];;
        }
        $orders = model('Order')
            ->useGlobalScope(false)
            ->where($where)
            ->order("id DESC")
            ->paginate(10);
        $orders->appends(['wx_nickname' => $wx_nickname, 'mobile' => $mobile]);
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