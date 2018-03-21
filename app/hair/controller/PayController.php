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
            'name'  => '美发工具',
            'price' => 200,
            'desc'  => '该工具为付费产品，必须支付后方能使用，一次付费终生使用。',
        ];
        $this->assign('data', $data);
        $out_trade_no = config('we_chat.wx_sdk_config')['payment']['mch_id'] . date("YmdHis");
        $order_info   = [
            'body'         => '美发工具-付费开通',
            'detail'       => $data['name'],
            'out_trade_no' => $out_trade_no,
            'total_fee'    => 1/*$data['price'] * 100*/,
            'notify_url'   => url('hair/pay/notify', '', true, true), // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            'trade_type'   => 'JSAPI',
            'openid'       => $this->user['wx_openid'],
        ];

        $order  = $this->wecharService->pay()->order;
        $result = $order->unify($order_info);
        if ($result['return_code'] == 'SUCCESS' && $result['return_msg'] == 'OK') {
            $prepayId = $result['prepay_id'];
            $jssdk    = $this->wecharService->pay()->jssdk;
            $pay_json = $jssdk->bridgeConfig($prepayId);
            // todo 更新用户的订单号
            $data = [
                'user_id'      => $this->user_id,
                'body'         => $order_info['body'],
                'detail'       => $order_info['detail'],
                'out_trade_no' => $order_info['out_trade_no'],
                'total_fee'    => $order_info['total_fee'],
                'openid'       => $order_info['openid'],
                'prepay_id'    => $prepayId,
                'type'         => 0,
            ];
            model('Order')->save($data);

            $this->assign('pay_json', $pay_json);
            $this->assign('wx_pay_from_url', session('wx_pay.from_url'));
        }

        return $this->fetch();
    }

    public function elementPay() {
        $elementid = $this->request->param('id');
        if (is_null($elementid) || $elementid <= 0) {
            $this->error('参数错误');
        }
        $element = model('Element')->get($elementid);
        if (is_null($element) || empty($element)) {
            $this->error('参数错误');
        }

        $data = [
            'title' => '付费组件',
            'name'  => $element['name'],
            'price' => $element['price'],
            'desc'  => '',
        ];
        $this->assign('data', $data);

        $out_trade_no = config('we_chat.wx_sdk_config')['payment']['mch_id'] . date("YmdHis");
        $order_info   = [
            'body'         => '付费组件',
            'detail'       => $element['name'],
            'out_trade_no' => $out_trade_no,
            'total_fee'    => $element['price'] * 100,
            'notify_url'   => url('hair/pay/notify', '', true, true), // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            'trade_type'   => 'JSAPI',
            'openid'       => $this->user['wx_openid'],
        ];

        $order  = $this->wecharService->pay()->order;
        $result = $order->unify($order_info);
        if ($result['return_code'] == 'SUCCESS' && $result['return_msg'] == 'OK') {
            $prepayId = $result['prepay_id'];
            $jssdk    = $this->wecharService->pay()->jssdk;
            $pay_json = $jssdk->bridgeConfig($prepayId);
            // todo 更新用户的订单号
            $data = [
                'user_id'      => $this->user_id,
                'element_id'   => $element['id'],
                'body'         => $order_info['body'],
                'detail'       => $order_info['detail'],
                'out_trade_no' => $order_info['out_trade_no'],
                'total_fee'    => $order_info['total_fee'],
                'openid'       => $order_info['openid'],
                'prepay_id'    => $prepayId,
                'type'         => 1,
            ];
            model('Order')->save($data);

            $this->assign('pay_json', $pay_json);
            $this->assign('wx_pay_from_url', session('wx_pay.from_url'));
        }

        return $this->fetch('toolpay');
    }

    /**
     * 支付回调函数
     *
     * TODO 还未做，带参数配置好后再写该部分代码
     *
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