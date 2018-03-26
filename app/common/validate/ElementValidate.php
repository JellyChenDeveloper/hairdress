<?php
/**
 * FileName:ElementValidate.php
 * Created by JellyChen
 * Date: 2018/3/10 下午5:30
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\validate;

use think\Validate;

class ElementValidate extends Validate {

    protected $rule = [
        'id'         => 'require',
        'name'       => 'require',
        'image'      => 'require',
        'type'       => 'require',
        'is_lock'    => 'require',
        'price'      => 'float',
        'list_order' => 'require|between:1,10000',
    ];

    protected $field = [
        'id'         => 'ID',
        'name'       => '组件名称',
        'image'      => '组件图片',
        'type'       => '组件类型',
        'price'      => '组件价格',
        'list_order' => '排序',
    ];

    protected $message = [
        'id.require' => 'id不存在，操作错误',
    ];

    protected $scene = [
        'add'  => ['name', 'image', 'type', 'is_free', 'price', 'list_order', 'is_lock'],
        'edit' => ['id', 'name', 'image', 'type', 'is_free', 'price', 'list_order', 'is_lock'],
    ];
}