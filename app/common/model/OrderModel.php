<?php
/**
 * FileName:OrderModel.php
 * Created by JellyChen
 * Date: 2018/2/27 下午9:38
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;


class OrderModel extends BaseModel {
    protected $table = 'hair_order';

    public function getTypeStrAttr($value, $data) {
        return config('property.order_type')[$data['type']];
    }

    public function getHasPayedAttr($value, $data) {
        return !($data['pay_time'] == 0);
    }
}