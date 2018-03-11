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
 * @param        $filename
 * @param string $path
 *
 * @return mixed|string
 */
function cmf_save_base64_image($image_str, $filename, $path = 'default') {
    $base64_string = explode(',', $image_str);
    $data          = base64_decode($base64_string[1]);
    $upload_path   = $_SERVER['DOCUMENT_ROOT'] . '/upload';
    $path          = $upload_path . '/' . $path . '/' . date('y-m-d') . '/';
    $dir           = iconv("UTF-8", "GBK", $path);
    if (!file_exists($dir)) {
        mkdir($dir, 0777, true);
    }
    $abs_path = $path . $filename . '_' . time() . '.png';
    file_put_contents($abs_path, $data); //写入文件并保存

    $abs_path = str_replace($upload_path, '', $abs_path);

    return $abs_path;
}

function cmf_generate_code($length = 8, $characters = '0123456789') {
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }

    return $randomString;
}