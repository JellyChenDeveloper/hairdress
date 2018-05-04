<?php
/**
 * FileName:SettingModel.php
 * Created by JellyChen
 * Date: 2018/4/5 下午5:37
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;


class SettingModel extends BaseModel {
    protected $table = 'hair_setting';

    public function getSoftwareQrCodeAttr($value) {
        return $value ? cmf_get_image_url($value) : '';
    }
}