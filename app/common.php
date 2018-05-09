<?php
/**
 * FileName:common.php
 * Created by JellyChen
 * Date: 2018/2/21 下午1:44
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

use app\common\service\WechatService;


/**
 * 判断是否使用手机号注册过
 *
 * @return bool
 */
function cmf_user_has_register() {
    $user = cmf_get_current_user();
    if (empty($user['mobile'])) {
        return false;
    } else {
        return true;
    }
}

/**
 * 判断用户是否已购买产品
 *
 * @return bool
 */
function cmf_user_has_payed() {
    $user = cmf_get_current_user();

    return $user['has_payed'];
}

/**
 * 将base64字符串保存为图片，返回图片的相对路径
 *
 * @param        $image_str
 * @param string $path
 *
 * @return mixed|string
 */
function cmf_save_base64_image($image_str, $path = 'default') {
    $base64_string = explode(',', $image_str);
    $data          = base64_decode($base64_string[1]);
    $upload_path   = $_SERVER['DOCUMENT_ROOT'] . '/upload/';
    $path          = $upload_path . $path . '/' . date('Ymd') . '/';
    $dir           = iconv("UTF-8", "GBK", $path);
    if (!file_exists($dir)) {
        mkdir($dir, 0777, true);
    }
    $abs_path = $path . md5(uniqid()) . '.png';
    file_put_contents($abs_path, $data); //写入文件并保存

    $abs_path = str_replace($upload_path, '', $abs_path);

    return $abs_path;
}

/**
 * 生成随机数字
 *
 * @param int    $length     生成的字符串长度
 * @param string $characters 生成限定字符集
 *
 * @return string 生成的字符串
 */
function cmf_generate_code($length = 8, $characters = '0123456789') {
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }

    return $randomString;
}

/**
 * 获取代理用户的总金额
 *
 * @param int $user_id 用户ID
 *
 * @return float|int
 * @throws \think\exception\DbException
 */
function cmf_get_total_money($user_id) {
    $user = model('WechatUser')->get($user_id);
    if ($user['user_type'] == 1 || $user['code_id'] == 0) {
        return 0;
    }

    $setting       = model('Setting')->get(1);
    $price         = $setting['software_price'] ? $setting['software_price'] : 300;
    $activity_code = model('ActivityCode')->get($user['code_id']);
    $money         = ($user['useful_code_count'] * $activity_code['rate'] / 100 + $user['useful_child_code_count'] * $activity_code['rate2'] / 100) * $price;

    return $money;
}

/**
 * 获取代理用户的剩余可用金额
 *
 * @param int $user_id 用户ID
 *
 * @return float|int
 * @throws \think\exception\DbException
 */
function cmf_get_last_money($user_id) {
    $total_money = cmf_get_total_money($user_id);
    if ($total_money == 0) {
        return 0;
    }
    $used_money = model('Transfer')->where(['user_id' => $user_id])->sum('amount');

    return $total_money - $used_money;
}

/**
 * 查询企业支付订单情况
 *
 * @param int $user_id 用户ID
 *
 * @throws \EasyWeChat\Kernel\Exceptions\InvalidConfigException
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function cmf_check_transfer_order($user_id = 0) {
    $app = WechatService::instance()->pay();
    if ($user_id == 0) {
        $orders = model('Transfer')->where(['trans_status' => 2])->limit(config('paginate.list_rows'))->select();
    } else {
        $orders = model('Transfer')->where(['user_id' => $user_id, 'trans_status' => 2])->select();
    }
    trace('企业支付订单列表');
    trace($orders->toArray());
    foreach ($orders as $order) {
        $rst = $app->transfer->queryBankCardOrder($order['partner_trade_no']);
        if ($rst['return_code'] == 'SUCCESS') {
            if ($rst['result_code'] == 'FAIL') {
                trace($order);
                trace($rst);
            } else {
                if ($rst['status'] == 'SUCCESS') {
                    model('Transfer')->get($order['id'])->save(['trans_status' => 3]);
                } elseif ($rst['status'] == 'FAILED' || $rst['status'] == 'BANK_FAIL') {
                    model('Transfer')->get($order['id'])->save(['trans_status' => 4]);
                }
            }
        }
    }
}

use Aliyun\Core\Config;
use Aliyun\Core\Profile\DefaultProfile;
use Aliyun\Core\DefaultAcsClient;
use Aliyun\Api\Sms\Request\V20170525\SendSmsRequest;

/**
 * 发送短信验证码
 *
 * @param $code
 * @param $mobile
 *
 * @return mixed|SimpleXMLElement
 */
function cmf_send_sms_code($code, $mobile) {
    Config::load();
    $product         = "Dysmsapi";
    $domain          = "dysmsapi.aliyuncs.com";
    $accessKeyId     = config('ali_sms.AccessKeyId');
    $accessKeySecret = config('ali_sms.AccessKeySecret');
    $region          = config('ali_sms.region');
    $endPointName    = config('ali_sms.endPointName');
    static $acsClient;
    if ($acsClient == null) {
        $profile = DefaultProfile::getProfile($region, $accessKeyId, $accessKeySecret);
        DefaultProfile::addEndpoint($endPointName, $region, $product, $domain);
        $acsClient = new DefaultAcsClient($profile);
    }
    $request = new SendSmsRequest();
    //$request->setProtocol("https");
    $request->setPhoneNumbers($mobile);
    $request->setSignName(config('ali_sms.signName'));
    $request->setTemplateCode(config('ali_sms.templateCode'));
    $request->setTemplateParam(json_encode(array("code" => $code,), JSON_UNESCAPED_UNICODE));
    $acsResponse = $acsClient->getAcsResponse($request);

    return $acsResponse->Code == 'OK';
}