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
 * @return int
 */
function cmf_get_total_money($user_id) {
    $user = model('WechatUser')->get($user_id);
    if ($user['user_type'] == 1 || $user['code_id'] == 0) {
        return 0;
    }
    $activity_code = model('ActivityCode')->get($user['code_id']);
    $money         = ($user['code_count'] * $activity_code['rate'] / 100 + $user['child_code_count'] * $activity_code['rate2'] / 100) * 300;

    return $money;
}

/**
 * 获取代理用户的剩余可用金额
 *
 * @param int $user_id 用户ID
 *
 * @return int
 */
function cmf_get_last_money($user_id) {
    $total_money = cmf_get_total_money($user_id);
    if ($total_money == 0) {
        return 0;
    }
    $used_money = model('Transfer')->where(['user_id' => $user_id])->sum('amount');

    return $total_money - $used_money;
}