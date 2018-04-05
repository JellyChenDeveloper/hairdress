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

    public function getContentAttr($value) {
        return cmf_replace_content_file_url(htmlspecialchars_decode($value));
    }

    public function setContentAttr($value) {
        return htmlspecialchars(cmf_replace_content_file_url(htmlspecialchars_decode($value), true));
    }
}