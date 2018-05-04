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
        $user = model('WechatUser')->get(['id' => $this->user_id]);
        $data = [
            'total_money'   => cmf_get_total_money($this->user_id),
            'last_money'    => cmf_get_last_money($this->user_id),
            'enc_true_name' => $user['enc_true_name'],
            'enc_bank_no'   => $user['enc_bank_no'],
            'bank'          => $user['bank_code'] ? config('property.wechat_bank_code')[$user['bank_code']] : '',
        ];
        $this->assign($data);

        return $this->fetch();
    }

    public function bankInfo() {
        $user = model('WechatUser')->get(['id' => $this->user_id]);
        $data = [
            'enc_true_name' => $user['enc_true_name'],
            'enc_bank_no'   => $user['enc_bank_no'],
            'bank_code'     => $user['bank_code'],
        ];
        $this->assign($data);

        return $this->fetch();
    }

    public function postBankInfo() {
        $data       = $this->request->param();
        $data['id'] = $this->user_id;

        $result = $this->validate($data, 'WechatUser.set_bank_info');
        if ($result !== true) {
            $this->error($result);
        }

        $result = model('WechatUser')->isUpdate()->save($data);
        if ($result) {
            $this->success('保存成功', url('hair/UserInfo/agentInfo'));
        } else {
            $this->error('保存失败');
        }
    }

    public function paybackRecord() {
        cmf_check_transfer_order($this->user_id);

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
        if (cmf_get_last_money($this->user_id) < $amount) {
            $this->error('剩余可提现金额不足');
        }
        $user                     = model('WechatUser')->get($this->user_id);
        $partner_trade_no         = config('we_chat.wx_sdk_config')['payment']['mch_id'] . date("YmdHis") . cmf_generate_code(8);
        $data['partner_trade_no'] = $partner_trade_no;
        $data['enc_true_name']    = $user['enc_true_name'];
        $data['enc_bank_no']      = $user['enc_bank_no'];
        $data['bank_code']        = $user['bank_code'];
        $data['desc']             = '返现';
        $data['trans_status']     = 1;
        $data['amount']           = $amount;

        $result = model('Transfer')->save($data);
        if ($result) {
            $this->success('申请提现成功', url('hair/UserInfo/paybackRecord'));
        } else {
            $this->error('保存失败');
        }
    }

    public function qrCode() {
        $user = model('WechatUser')->get(['id' => $this->user_id]);
        $data = [
            'personal_href' => url("hair/promote/index", ['tool_code' => $user['code_str']], true, true),
            'qr_code'       => '/themes/simpleboot3/hair/public/assets/page_tools/images/main1.png',
        ];
        $this->assign($data);

        return $this->fetch();
    }
}