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
        $data     = $this->request->param();
        $user_id  = $this->request->post('id');
        if ($user_id != $this->user_id) {
            $this->error('参数错误，请刷新重试');
        }

        $result = $this->validate($data, 'WechatUser.register');
        if ($result !== true) {
            $this->error($result);
        }
        unset($data['sms_code']);
        $user   = model('WechatUser')->get($user_id);
        $result = $user->data($data)->save();
        if ($result == 1) {
            model('ActivityCode')->get(['code' => $this->request->post('activation_key')])->setInc('count');
            cmf_update_current_user($user->toArray());
            $this->success('注册成功', null, ['from_url' => $from_url]);
        } else {
            $this->error('该用户已注册');
        }
    }

    public function sendSmsCode() {
        $data    = $this->request->param();
        $user_id = $this->request->post('id');
        if ($user_id != $this->user_id) {
            $this->error('参数错误，请刷新重试');
        }

        $result = $this->validate($data, 'WechatUser.mobile');
        if ($result !== true) {
            $this->error($result);
        }

        $sms_code = cmf_generate_code(4);
        cache('sms_code' . $data['mobile'], $sms_code, 60 * 5);
        // todo: 暂时关闭短信功能，待后期放开
//        $result = cmf_send_sms_code($sms_code, $data['mobile']);
        $result = 1;
        if ($result) {
            $this->success('短信发送成功');
        } else {
            $this->error('短信发送失败');
        }
    }

    public function wxAuth() {

        $this->wecharService->setWxHasAuth();

        $this->userLogin();

        $callback_url = session('wx_auth_callback_url');

        $this->redirect($callback_url);
    }
}