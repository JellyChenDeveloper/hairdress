<?php
/**
 * FileName:WechatModel.php
 * Created by JellyChen
 * Date: 2018/2/15 上午1:18
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;

class WechatUserModel extends BaseModel {
    protected $table = 'hair_wechat_user';

    public function getHasPayedStrAttr($value, $data) {
        return config('property.pay_status')[$data['has_payed']];
    }

    public function getLocationAttr($value, $data) {
        return implode(' ', array_filter([$data['country'], $data['province'], $data['city']]));
    }
}