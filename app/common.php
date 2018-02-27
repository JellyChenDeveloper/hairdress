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