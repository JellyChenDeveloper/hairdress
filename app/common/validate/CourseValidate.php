<?php
/**
 * FileName:CourseValidate.php
 * Created by JellyChen
 * Date: 2018/3/27 上午12:30
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\validate;

use think\Validate;

class CourseValidate extends Validate {

    protected $rule = [
        'id'    => 'require',
        'title' => 'require',
    ];

    protected $field = [
        'id'    => 'ID',
        'title' => '标题',
    ];

    protected $message = [
        'id.require' => '参数错误，请刷新重试',
    ];

    protected $scene = [
        'add'  => ['title'],
        'edit' => ['id', 'title'],
    ];
}