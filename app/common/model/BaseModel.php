<?php
/**
 * FileName:BaseModel.php
 * Created by JellyChen
 * Date: 2018/2/15 上午1:17
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;

use think\Model;
use traits\model\SoftDelete;

class BaseModel extends Model {

    use SoftDelete;
    protected $deleteTime = 'delete_time';

    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'true';

    // 定义全局的查询范围
    protected function base($query) {
        $query->where(['status' => 1, 'delete_time' => 0]);
    }


}