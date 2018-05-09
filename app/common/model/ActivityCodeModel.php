<?php
/**
 * FileName:ActivityCodeModel.php
 * Created by JellyChen
 * Date: 2018/3/10 下午10:57
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\common\model;


class ActivityCodeModel extends BaseModel {
    protected $table = 'hair_activity_code';

    public function getLevelStrAttr($value, $data) {
        return config('property.code_level')[$data['level']];
    }

    public function getUserIdStrAttr($value, $data) {
        return $data['user_id'] ? $data['user_id'] : '未绑定';
    }

    public function getUserNameStrAttr($value, $data) {
        return $data['user_id'] ? model('WechatUser')->get($data['user_id'])->wx_nickname : '未绑定';
    }

    public function getChildNumAttr($value, $data) {
        return $this->where(['parent_id' => $data['id']])->count();
    }

    public function getChildCountAttr($value, $data) {
        return $this->where(['parent_id' => $data['id']])->sum('count');
    }

    public function getChildNumStrAttr($value, $data) {
        $child_num = $this->where(['parent_id' => $data['id']])->count();

        return $child_num ? : '';
    }

    public function getParentCodeAttr($value, $data) {
        return $this->where(['id' => $data['parent_id']])->value('code');
    }

    public function getUsefulCountAttr($value, $data) {
        return model('WechatUser')->where(['activation_key'=>$data['code']])->count();
    }

    /**
     * 批量插入激活码
     *
     * @param int $parent_id 父级ID
     * @param int $level     级别：1-一级，2-二级
     * @param int $num       数量
     * @param int $rate      比率
     * @param int $rate2     二级比率
     *
     * @return int|string 插入成功数量
     */
    public function generateCode($parent_id = 0, $level = 1, $num = 1, $rate = 25, $rate2 = 0) {
        $flag  = 0;
        $codes = [];
        while ($flag == 0) {
            $i = count($codes);
            for (; $i < $num; $i++) {
                $code      = cmf_generate_code();
                $is_repeat = 1;
                while ($is_repeat) {
                    if (isset($codes[$code])) {
                        $code = cmf_generate_code();
                    } else {
                        $is_repeat = 0;
                    }
                }
                $codes[$code] = $code;
            }
            $result = $this->where('code', 'in', $codes)->column('code');
            if (!empty($result)) {
                foreach ($result as $k => $v) {
                    unset($codes[$v]);
                }
            }
            if (count($codes) == $num) {
                $flag = 1;
            }
        }
        $datas = [];
        foreach ($codes as $value) {
            $datas[] = [
                'code'        => $value,
                'rate'        => $rate,
                'rate2'       => $rate2,
                'verify'      => cmf_generate_code(4),
                'level'       => $level,
                'parent_id'   => $parent_id,
                'create_time' => time(),
                'update_time' => time(),
            ];
        }

        return $this->insertAll($datas);
    }
}