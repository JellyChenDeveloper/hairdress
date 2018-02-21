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
 * 判断前台用户是否登录
 *
 * @return boolean
 */
function cmf_is_user_wx_login() {
    return session('?' . config('we_chat.WX_LOGIN_SESSION_KEY'));
}

/**
 * 设置前台用户为已登录
 */
function cmf_set_user_wx_login() {
    session(config('we_chat.WX_LOGIN_SESSION_KEY'), 1);
}