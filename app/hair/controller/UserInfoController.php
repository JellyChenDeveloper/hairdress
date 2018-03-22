<?php
/**
 * FileName:UserInfoController.php
 * Created by JellyChen
 * Date: 2018/2/9 上午11:03
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

class UserInfoController extends HairBaseController {

    public function index() {
        $user = model('WechatUser')->get(['id' => $this->user_id]);

        $this->assign('user', $user);

        return $this->fetch();
    }

    public function agentInfo() {
        return $this->fetch();
    }


    public function paybackRecord() {
        $transfers = model('Transfer')->where(['user_id' => $this->user_id])->select();

        $this->assign('transfers', $transfers);

        return $this->fetch();
    }

    public function postTransfer() {
        $amount = $this->request->param('amount');
        $data   = [
            'user_id' => $this->user_id,
            'openid'  => $this->user['wx_openid'],
            'amount'  => $amount,
        ];
        $result = $this->validate($data, 'Transfer.apply');
        if ($result !== true) {
            $this->error($result);
        }
        $partner_trade_no         = config('we_chat.wx_sdk_config')['payment']['mch_id'] . date("YmdHis") . cmf_generate_code(8);
        $data['partner_trade_no'] = $partner_trade_no;
        $data['is_check']         = 0;
        $data['re_user_name']     = '陈国栋';
        $data['desc']             = '返现';
        $data['trans_status']     = 1;

        $result = model('Transfer')->save($data);
        if ($result) {
            $this->success('申请提现成功', url('hair/UserInfo/paybackRecord'));
        } else {
            $this->error('保存失败');
        }
    }
}