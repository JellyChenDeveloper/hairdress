<?php
/**
 * FileName:TransferValidate.php
 * Created by JellyChen
 * Date: 2018/3/23 上午12:01
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\validate;

use think\Validate;

class TransferValidate extends Validate {
    protected $rule = [
        'user_id'          => 'require',
        'openid'           => 'require',
        'partner_trade_no' => 'require',
        'is_check'         => 'require',
        're_user_name'     => 'requireIf:is_check:1',
        'amount'           => 'require|integer|gt:0|checkAmount',
        'desc'             => 'require',
    ];

    protected $field = [
        'user_id'          => '用户ID',
        'openid'           => '用户微信openid',
        'partner_trade_no' => '商户订单号',
        'is_check'         => '是否强制校验姓名',
        're_user_name'     => '用户姓名',
        'amount'           => '金额',
        'desc'             => '描述',
    ];

    protected $message = [
        'amount.checkAmount' => '金额必须为100的整数倍',
    ];

    protected $scene = [
        'apply' => ['amount', 'user_id', 'openid'],
    ];

    protected function checkAmount($value) {
        if ($value % 100 == 0) {
            return true;
        }

        return false;
    }
}