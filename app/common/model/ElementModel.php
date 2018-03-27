<?php
/**
 * FileName:ElementModel.php
 * Created by JellyChen
 * Date: 2018/3/9 上午12:20
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;

class ElementModel extends BaseModel {
    protected $table = 'hair_element';

    public function getTypeStrAttr($value, $data) {
        return config('property.element_type')[$data['type']];
    }

    public function getPriceStrAttr($value, $data) {
        return $data['price'] ? $data['price'] : '免费';
    }

    public function getImageAttr($value) {
        return cmf_get_image_url($value);
    }

    public function getIsLockStrAttr($value, $data) {
        return config('property.is_lock')[$data['is_lock']];
    }
}