<?php
/**
 * FileName:PagesModel.php
 * Created by JellyChen
 * Date: 2018/2/25 下午2:41
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;


class PagesModel extends BaseModel {
    protected $table = 'hair_pages';

    public function getAvatarUrlAttr($value, $data) {
        return $data['avatar'] ? '/upload/' . $data['avatar'] : '';
    }
}