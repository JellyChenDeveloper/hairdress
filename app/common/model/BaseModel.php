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

    protected $type = [
        'more' => 'array',
    ];

    use SoftDelete;
    protected $deleteTime = 'delete_time';

    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'true';

    // 定义全局的查询范围
    protected function base($query) {
        $query->where(['status' => 1, 'delete_time' => 0]);
    }

    public function getCreateTimeStrAttr($value, $data) {
        return $data['create_time'] ? date('Y-m-d H:i:s', $data['create_time']) : '-';
    }

    public function getUpdateTimeStrAttr($value, $data) {
        return $data['update_time'] ? date('Y-m-d H:i:s', $data['update_time']) : '-';
    }

    public function getDeleteTimeStrAttr($value, $data) {
        return $data['delete_time'] ? date('Y-m-d H:i:s', $data['delete_time']) : '-';
    }

    public function getLastLoginTimeStrAttr($value, $data) {
        return $data['last_login_time'] ? date('Y-m-d H:i:s', $data['last_login_time']) : '-';
    }

    public function getPayTimeStrAttr($value, $data) {
        return $data['pay_time'] ? date('Y-m-d H:i:s', $data['pay_time']) : '-';
    }

}