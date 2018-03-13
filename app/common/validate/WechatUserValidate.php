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
        'user_id'        => 'require|checkUser',
        'mobile'         => ['require', 'regex' => '/^1[3|4|5|7|8][0-9]\d{4,8}$/'],
        'activation_key' => 'require|length:8|checkCode',
    ];

    protected $field = [
        'user_id'        => '用户ID',
        'mobile'         => '手机号',
        'activation_key' => '邀请码',
    ];

    protected $message = [
        'user_id.require'          => '参数错误，请刷新重试',
        'user_id.checkUser'        => '用户不存在',
        'mobile.regex'             => '手机号格式有误',
        'activation_key.checkCode' => '邀请码不存在',
    ];

    protected $scene = [
        'register' => ['user_id', 'mobile', 'activation_key'],
    ];

    protected function checkCode($value) {
        return (bool)(model('ActivityCode')->get(['code' => $value]));
    }

    protected function checkUser($value) {
        return (bool)(model('WechatUser')->get($value));
    }
}