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
        if ($this->user['code_id'] != 0) {
            $this->redirect(url('hair/UserInfo/index'));
        }
        $this->assign('user', $this->user);

        return $this->fetch();
    }

    public function doBindCode() {
        $data   = $this->request->param();
        $result = $this->validate($data, 'ActivityCode.bind');
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
                $this->success('绑定成功', url('hair/UserInfo/index'));
            } else {
                $this->error('绑定失败');
            }
        } else {
            $this->error('激活码和验证码不匹配');
        }
    }
}