<?php
/**
 * FileName:AdminTransferController.php
 * Created by JellyChen
 * Date: 2018/3/23 上午12:35
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;


/**
 * Class ElementController
 *
 * @package app\hair\controller
 * @adminMenuRoot(
 *     'name'   => '返现管理',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '返现管理'
 * )
 */
class AdminTransferController extends AdminHairBaseController {

    /**
     * 返现管理
     * @adminMenu(
     *     'name'   => '返现管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '返现管理',
     *     'param'  => ''
     * )
     */
    public function index() {
        $where     = [];
        $transfers = model('Transfer')
            ->where($where)
            ->paginate();
        // 获取分页显示
        $page = $transfers->render();
        $this->assign("page", $page);
        $this->assign("transfers", $transfers);

        return $this->fetch();
    }

    public function pass() {
        $id       = $this->request->param('id');
        $transfer = model('Transfer')->get($id);
        if (empty($transfer)) {
            $this->error('参数错误，请刷新重试');
        }
        $app = $this->wecharService->pay();
        $app->transfer->toBalance([
            'partner_trade_no' => $transfer['partner_trade_no'],
            'openid'           => $transfer['openid'],
            'check_name'       => 'NO_CHECK', // NO_CHECK：不校验真实姓名, FORCE_CHECK：强校验真实姓名
            //            're_user_name'     => '陈国栋', // 如果 check_name 设置为FORCE_CHECK，则必填用户真实姓名
            'amount'           => $transfer['amount'],
            'desc'             => $transfer['desc'],
        ]);
        $transfer->save(['trans_status' => 2]);
        $this->success('申请通过，等待微信处理');
    }
}