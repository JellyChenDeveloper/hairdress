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

    /** TODO 添加对微信昵称保存和读取时进行base64编解码来保存昵称中的特殊符号，*/


    public function getHasPayedStrAttr($value, $data) {
        return config('property.has_payed')[$data['has_payed']];
    }

    public function getLocationAttr($value, $data) {
        return implode(' ', array_filter([$data['country'], $data['province'], $data['city']]));
    }

    public function getUserTypeStrAttr($value, $data) {
        return config('property.user_type')[$data['user_type']];
    }

    public function getSexStrAttr($value, $data) {
        return config('property.sex')[$data['sex']];
    }

    public function getCodeStrAttr($value, $data) {
        $code = model('ActivityCode')->get($data['code_id']);

        return $code ? $code->code : '';
    }

    public function getCodeCountAttr($value, $data) {
        $code = model('ActivityCode')->get($data['code_id']);

        return $code ? $code->count : 0;
    }

    public function getCodeLevelAttr($value, $data) {
        $code = model('ActivityCode')->get($data['code_id']);

        return $code ? $code->level : 0;
    }

    public function getChildCodeNumAttr($value, $data) {
        $code = model('ActivityCode')->get($data['code_id']);

        return $code ? $code->child_num : 0;
    }

    public function getChildCodeCountAttr($value, $data) {
        $code = model('ActivityCode')->get($data['code_id']);

        return $code ? $code->child_count : 0;
    }

    public function getTotalMoneyAttr($value, $data) {
        return cmf_get_total_money($data['id']);
    }

    public function getLastMoneyAttr($value, $data) {
        return cmf_get_last_money($data['id']);
    }
}