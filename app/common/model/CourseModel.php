<?php
/**
 * FileName:CourseModel.php
 * Created by JellyChen
 * Date: 2018/3/26 下午11:58
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;


class CourseModel extends BaseModel {
    protected $table = 'hair_course';

    public function getContentAttr($value) {
        return cmf_replace_content_file_url(htmlspecialchars_decode($value));
    }

    public function setContentAttr($value) {
        return htmlspecialchars(cmf_replace_content_file_url(htmlspecialchars_decode($value), true));
    }

    public function setPublishedTimeAttr($value) {
        return strtotime($value);
    }

    public function getPriceStrAttr($value, $data) {
        return $data['price'] ? $data['price'] : '免费';
    }
}