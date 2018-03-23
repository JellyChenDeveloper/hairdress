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
        $rst = $app->transfer->toBankCard([
            'partner_trade_no' => $transfer['partner_trade_no'],
            'enc_bank_no'      => '6217000010077774829', // 银行卡号
            'enc_true_name'    => '陈国栋',   // 银行卡对应的用户真实姓名
            'bank_code'        => '1003', // 银行编号
            'amount'           => $transfer['amount'],
            'desc'             => $transfer['desc'],
        ]);
        trace($rst);
        if ($rst['return_code'] == 'SUCCESS' && $rst['result_code'] == 'SUCCESS') {
            $transfer->save(['trans_status' => 2]);
            $this->success($rst['err_code_des']);
        } else {
            $this->error($rst['err_code_des']);
        }
    }
}