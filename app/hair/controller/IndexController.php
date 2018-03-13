<?php
/**
 * FileName:IndexController.php
 * Created by JellyChen
 * Date: 2018/2/9 上午10:19
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

class IndexController extends HairBaseController {

    public function index() {
        return $this->fetch();
    }

    public function register() {
        $this->assign('user', $this->user);

        return $this->fetch();
    }

    public function doRegister() {
        $from_url = session('register.from_url');
        $user_id  = $this->request->post('user_id');
        if ($user_id != $this->user_id) {
            $this->error(lang('页参数错误，请刷新重试'));
        }

        $data = $this->request->param();

        $result = $this->validate($data, [
            'user_id'        => 'require',
            'mobile'         => 'require',
            'activation_key' => 'require|length:8',
        ], [
            'user_id.require'        => '参数错误，请刷新重试',
            'mobile.require'         => '手机号不能为空',
            'activation_key.require' => '邀请码不能为空',
            'activation_key.length'  => '邀请码必须为8位长度',
        ]);
        if ($result !== true) {
            $this->error($result);
        }

        $mobile         = $this->request->post('mobile');
        $activation_key = $this->request->post('activation_key');

        $data = [
            'id'             => $user_id,
            'mobile'         => $mobile,
            'activation_key' => $activation_key,
        ];
        $code = model('ActivityCode')->get(['code' => $activation_key]);
        if (!$code) {
            $this->error('邀请码不存在，请重新输入');
        }
        $user = model('WechatUser')->get($user_id);
        if (!$user) {
            $this->error('用户不存在');
        }

        $result = $user->data($data)->save();
        cmf_update_current_user(model('WechatUser')->get($user_id)->toArray());
        if ($result == 1) {
            $code->setInc('count');
            $this->success(lang('注册成功'), null, ['from_url' => $from_url]);
        } else {
            $this->error(lang('该用户已注册'));
        }
    }

    public function wxAuth() {

        $this->wecharService->setWxHasAuth();

        $this->userLogin();

        $callback_url = session('wx_auth_callback_url');

        $this->redirect($callback_url);
    }
}