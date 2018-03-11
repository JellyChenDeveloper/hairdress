<?php
/**
 * FileName:BindCodeController.php
 * Created by JellyChen
 * Date: 2018/3/11 下午5:26
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;


class BindCodeController extends HairBaseController {

    public function index() {
        $this->assign('user', $this->user);

        return $this->fetch();
    }

    public function doBindCode() {
        $data   = $this->request->param();
        $result = $this->validate($data, [
            'user_id' => 'require',
            'code'    => 'require|number|length:8',
            'verify'  => 'require|number|length:4',
        ], [
            'user_id.require' => '参数错误，请刷新重试',
            'code.require'    => '激活码不能为空',
            'code.number'     => '激活码必须是数字',
            'code.length'     => '激活码为8位数字',
            'verify.require'  => '验证码不能为空',
            'verify.number'   => '验证码必须是数字',
            'verify.length'   => '验证码为4位数字',
        ]);
        if ($result !== true) {
            $this->error($result);
        }
        $code = model('ActivityCode')->get(['code' => $data['code'], 'verify' => $data['verify']]);
        if ($code) {
            $data   = [
                'code_id'   => $code->id,
                'user_type' => 2,
            ];
            $result = model('WechatUser')->get($this->user_id)->save($data);
            if ($result) {
                model('ActivityCode')->get($code->id)->save(['user_id' => $this->user_id]);
                $this->success('绑定成功', '');
            } else {
                $this->error('绑定失败');
            }
        } else {
            $this->error('激活码和验证码不匹配');
        }
    }
}