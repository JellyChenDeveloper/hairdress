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
        'price'      => 'checkPrice|integer',
        'list_order' => 'require|between:1,10000',
    ];

    protected $field = [
        'id'         => 'ID',
        'name'       => '组件名称',
        'image'      => '组件图片',
        'type'       => '组件类型',
        'is_free'    => '是否免费',
        'price'      => '组件价格',
        'list_order' => '排序',
    ];

    protected $message = [
        'id.require'       => 'id不存在，操作错误',
        'price.checkPrice' => '价格不能为空',
    ];

    protected $scene = [
        'add'  => ['name', 'image', 'type', 'is_free', 'price', 'list_order'],
        'edit' => ['id', 'name', 'image', 'type', 'is_free', 'price', 'list_order'],
    ];

    protected function checkPrice($value, $rule, $data) {
        if ($data['is_free'] == 0) {
            if (empty($value) || $value <= 0) {
                return false;
            }
        }

        return true;
    }
}