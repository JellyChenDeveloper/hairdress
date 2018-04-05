<?php
/**
 * FileName:SettingValidate.php
 * Created by JellyChen
 * Date: 2018/4/5 下午5:37
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\validate;

use think\Validate;

class SettingValidate extends Validate {

    protected $rule = [
        'software_name'  => 'require',
        'software_price' => 'require',
        'content'        => 'require',
    ];

    protected $field = [
        'software_name'  => '软件名称',
        'software_price' => '软件价格',
        'content'        => '首页内容',
    ];

    protected $message = [
    ];

    protected $scene = [
        'index'         => ['software_name', 'software_price'],
        'index_content' => ['content'],
    ];
}