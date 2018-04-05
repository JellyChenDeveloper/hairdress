<?php
/**
 * FileName:PayController.php
 * Created by JellyChen
 * Date: 2018/2/26 下午10:00
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

class PayController extends HairBaseController {

    public function toolPay() {
        $data = [
            'title' => '付费开通',
            'name'  => $this->setting['software_name'],
            'price' => $this->setting['software_price'],
            'desc'  => '该工具为付费产品，必须支付后方能使用，一次付费终生使用。',
        ];
        $this->pub_pay($data, 0);

        return $this->fetch('toolpay');
    }

    public function elementPay() {
        $element_id = $this->request->param('id');
        if (is_null($element_id) || $element_id <= 0) {
            $this->error('参数错误');
        }
        $element = model('Element')->get($element_id);
        if (is_null($element) || empty($element)) {
            $this->error('参数错误');
        }

        $data = [
            'title' => '付费组件',
            'name'  => $element['name'],
            'price' => $element['price'],
            'desc'  => '付费组件，一次付费终生使用',
        ];
        $this->pub_pay($data, 1, $element['id']);

        return $this->fetch('toolpay');
    }

    public function coursePay() {
        $course_id = $this->request->param('id');
        if (is_null($course_id) || $course_id <= 0) {
            $this->error('参数错误');
        }
        $course = model('Course')->get($course_id);
        if (is_null($course) || empty($course)) {
            $this->error('参数错误');
        }

        $data = [
            'title' => '付费教程',
            'name'  => $course['title'],
            'price' => $course['price'],
            'desc'  => $course['excerpt'],
        ];
        $this->pub_pay($data, 2, $course['id']);

        return $this->fetch('toolpay');
    }

    /**
     * @param $data
     * @param $element_id
     *
     * @throws \EasyWeChat\Kernel\Exceptions\InvalidConfigException
     */
    private function pub_pay($data, $type, $element_id = 0) {
        $out_trade_no = config('we_chat.wx_sdk_config')['payment']['mch_id'] . date("YmdHis") . cmf_generate_code(8);
        $order_info   = [
            'body'         => $data['title'],
            'detail'       => $data['name'],
            'out_trade_no' => $out_trade_no,
            'total_fee'    => 1 /*$data['price'] * 100*/,
            'notify_url'   => url('hair/pay/notify', '', true, true), // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            'trade_type'   => 'JSAPI',
            'openid'       => $this->user['wx_openid'],
        ];

        $result = $this->wecharService->pay()->order->unify($order_info);
        if ($result['return_code'] == 'SUCCESS' && $result['return_msg'] == 'OK') {
            $prepayId = $result['prepay_id'];
            $jssdk    = $this->wecharService->pay()->jssdk;
            $pay_json = $jssdk->bridgeConfig($prepayId);
            $order    = [
                'user_id'      => $this->user_id,
                'element_id'   => $element_id,
                'body'         => $order_info['body'],
                'detail'       => $order_info['detail'],
                'out_trade_no' => $order_info['out_trade_no'],
                'total_fee'    => $order_info['total_fee'],
                'openid'       => $order_info['openid'],
                'prepay_id'    => $prepayId,
                'type'         => $type,
            ];
            model('Order')->save($order);
        } else {
            $pay_json = '';
        }
        $this->assign('data', $data);
        $this->assign('pay_json', $pay_json);
        $this->assign('wx_pay_from_url', session('wx_pay.from_url'));
    }

    /**
     * 支付回调函数
     */
    public function notify() {
        $response = $this->wecharService->pay()->handlePaidNotify(function ($message, $fail) {
            // 使用通知里的 "微信支付订单号" 或者 "商户订单号" 去自己的数据库找到订单
            $m_order                   = model('Order')->get(['out_trade_no' => $message['out_trade_no']]);
            $m_order['transaction_id'] = $message['transaction_id'];

            if (!$m_order || $m_order->pay_time > 0) {
                return true;
            }
            trace($m_order);
            trace($message);
            trace($fail);

            if ($message['return_code'] === 'SUCCESS') {
                // 用户是否支付成功
                if ($message['result_code'] === 'SUCCESS') {
                    $m_order['pay_time'] = time();
                    // 用户支付失败
                } elseif ($message['result_code'] === 'FAIL') {
                    $m_order['pay_time'] = 0;
                }
            } else {
                return $fail('通信失败，请稍后再通知我');
            }

            $m_order->save(); // 保存订单
            if ($m_order['pay_time'] > 0) {
                if ($m_order['type'] == 0) {
                    $user = model('WechatUser')->get($m_order['user_id']);
                    $user->save(['has_payed' => 1]);
                    cmf_update_current_user($user->toArray());
                    trace(cmf_get_current_user());
                }
            }

            return true; // 返回处理完成
        });

        $response->send();
    }
}