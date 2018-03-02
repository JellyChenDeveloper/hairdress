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
        return $this->fetch();
    }

    public function getPreOrder() {
        $out_trade_no = config('we_chat.wx_sdk_config')['payment']['mch_id'] . date("YmdHis");
        $order_info   = [
            'body'         => '腾讯充值中心-QQ会员充值',
            'detail'       => '腾讯充值中心-QQ会员充值',
            'out_trade_no' => $out_trade_no,
            'total_fee'    => 1,
            'notify_url'   => url('hair/pay/notify'), // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            'trade_type'   => 'JSAPI',
            'openid'       => $this->user['wx_openid'],
        ];

        $result = $this->wecharService->pay()->order->unify($order_info);
        if ($result->return_code == 'SUCCESS' && $result->result_code == 'SUCCESS') {
            $prepayId = $result->prepay_id;
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

            $this->success("下单成功", null, ['pay_json' => $pay_json]);
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
            $order_hand = $this->wecharService->pay()->order;
            $order      = $order_hand->queryByOutTradeNumber($message['out_trade_no']);

            if (!$order || $order->paid_at) { // 如果订单不存在 或者 订单已经支付过了
                return true; // 告诉微信，我已经处理完了，订单没找到，别再通知我了
            }

            ///////////// <- 建议在这里调用微信的【订单查询】接口查一下该笔订单的情况，确认是已经支付 /////////////

            if ($message['return_code'] === 'SUCCESS') { // return_code 表示通信状态，不代表支付状态
                // 用户是否支付成功
                if ($message['result_code'] === 'SUCCESS') {
                    $order->paid_at = time(); // 更新支付时间为当前时间
                    $order->status  = 'paid';

                    // 用户支付失败
                } elseif ($message['result_code'] === 'FAIL') {
                    $order->status = 'paid_fail';
                }
            } else {
                return $fail('通信失败，请稍后再通知我');
            }

            $order->save(); // 保存订单

            return true; // 返回处理完成
        });

        $response->send();

//        return $response;
    }
}