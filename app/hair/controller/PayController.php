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
        $out_trade_no = config('we_chat.wx_sdk_config')['payment']['mch_id'] . date("YmdHis");
        $order_info   = [
            'body'         => '腾讯充值中心-QQ会员充值',
            'detail'       => '详情详情',
            'out_trade_no' => $out_trade_no,
            'total_fee'    => 1,
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

    public function getPreOrder() {
        $out_trade_no = config('we_chat.wx_sdk_config')['payment']['mch_id'] . date("YmdHis");
        $order_info   = [
            'body'         => '腾讯充值中心-QQ会员充值',
            'detail'       => '详情详情',
            'out_trade_no' => $out_trade_no,
            'total_fee'    => 1,
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

            $this->success("下单成功", null, ['pay_json' => $pay_json, 'wx_pay_from_url' => session('wx_pay.from_url')]);
        } else {
            $this->error($result->return_code);
        }
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

            if (!$m_order || $m_order->pay_status == 1) {
                return true;
            }

            if ($message['return_code'] === 'SUCCESS') {
                // 用户是否支付成功
                if ($message['result_code'] === 'SUCCESS') {
                    $m_order['pay_time']   = time();
                    $m_order['pay_status'] = 1;

                    // 用户支付失败
                } elseif ($message['result_code'] === 'FAIL') {
                    $m_order['pay_status'] = 2;
                }
            } else {
                return $fail('通信失败，请稍后再通知我');
            }

            $m_order->save(); // 保存订单
            if ($m_order['pay_status'] == 1) {
                $user = model('WechatUser')->get($m_order['user_id']);
                $user->save(['has_payed' => 1]);
                cmf_update_current_user($user->toArray());
                trace(cmf_get_current_user());
            }

            return true; // 返回处理完成
        });

        $response->send();
    }
}