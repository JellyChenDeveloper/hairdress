<?php
/**
 * FileName:TransferModel.php
 * Created by JellyChen
 * Date: 2018/3/23 上午12:00
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;


class TransferModel extends BaseModel {
    protected $table = 'hair_transfer';

    public function getTransStatusStrAttr($value, $data) {
        return config('property.trans_status')[$data['trans_status']];
    }

    public function getBankCodeStrAttr($value, $data) {
        return config('property.wechat_bank_code')[$data['bank_code']];
    }
}