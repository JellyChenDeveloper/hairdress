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
        'is_free'    => 'require',
        'price'      => 'integer',
        'list_order' => 'require|between:1,10000',
    ];

    protected $message = [
        'id.require'         => 'id不存在，操作错误',
        'name.require'       => '组件名称不能为空',
        'image.require'      => '组件图片不能为空',
        'type.require'       => '组件类型不能为空',
        'is_free.require'    => '是否免费不能为空',
        'price.integer'      => '组件价格必须为整数',
        'list_order.require' => '排序不能为空',
        'list_order.between' => '排序只能在1-10000之间',
    ];

    protected $scene = [
        'add'  => ['name', 'image', 'type', 'is_free', 'price', 'list_order'],
        'edit' => ['id', 'name', 'image', 'type', 'is_free', 'price', 'list_order'],
    ];
}