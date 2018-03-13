<?php
/**
 * FileName:ActivityCodeValidate.php
 * Created by JellyChen
 * Date: 2018/3/13 下午10:49
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\validate;

use think\Validate;

class ActivityCodeValidate extends Validate {

    protected $rule = [
        'id'        => 'require',
        'level'     => 'require',
        'num'       => 'require|number|between:1,20',
        'rate'      => 'require|number|between:1,50',
        'parent_id' => 'requireIf:level:2',
        'user_id'   => 'require',
        'code'      => 'require|number|length:8',
        'verify'    => 'require|number|length:4',
    ];

    protected $field = [
        'id'      => 'ID',
        'level'   => '级别',
        'num'     => '数量',
        'rate'    => '分配比率',
        'user_id' => '用户ID',
        'code'    => '邀请码',
        'verify'  => '验证码',
    ];

    protected $message = [
        'id.require'          => '参数错误，请刷新重试',
        'level.require'       => '参数错误，请刷新重试',
        'num.between'         => '一次生成的数量必须为1-20个之间',
        'rate.between'        => '比率必须为1-50之间',
        'parent_id.requireIf' => '参数错误，请刷新重试',
        'user_id.require'     => '参数错误，请刷新重试',
    ];

    protected $scene = [
        'generate' => ['level', 'num', 'rate', 'parent_id'],
        'edit'     => ['id', 'rate'],
        'bind'     => ['user_id', 'code', 'verify'],
    ];
}