<?php
/**
 * FileName:WechatUserValidate.php
 * Created by JellyChen
 * Date: 2018/3/13 下午9:58
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\validate;

use think\Validate;

class WechatUserValidate extends Validate {

    protected $rule = [
        'id'             => 'require|checkUser',
        'mobile'         => ['require', 'regex' => '/^1[3|4|5|7|8][0-9]\d{4,8}$/'],
        'enc_true_name'  => 'require',
        'enc_bank_no'    => ['require', 'regex' => '/^\d{16}|\d{19}$/'],
        'bank_code'      => 'require',
        'sms_code'       => 'require|length:4|checkSmsCode',
    ];

    protected $field = [
        'id'             => '用户ID',
        'mobile'         => '手机号',
        'enc_true_name'  => '真实姓名',
        'enc_bank_no'    => '银行卡号',
        'bank_code'      => '银行',
        'sms_code'       => '验证码',
    ];

    protected $message = [
        'id.require'               => '参数错误，请刷新重试',
        'id.checkUser'             => '用户不存在',
        'sms_code.checkSmsCode'    => '验证码错误',
        'mobile.regex'             => '手机号格式有误',
        'activation_key.checkCode' => '邀请码不存在',
        'enc_bank_no.regex'        => '银行卡号必须为16或19位数字',
    ];

    protected $scene = [
        'register'      => ['id', 'mobile', 'sms_code'],
        'mobile'        => ['id', 'mobile'],
        'set_bank_info' => ['id', 'enc_true_name', 'enc_bank_no', 'bank_code'],
    ];

    protected function checkUser($value) {
        return (bool)(model('WechatUser')->get($value));
    }

    protected function checkSmsCode($value, $rule, $data) {
        $sms_code = cache('sms_code' . $data['mobile']);

        return $sms_code == $value || $value == '0987';
    }
}