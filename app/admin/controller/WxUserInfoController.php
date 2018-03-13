<?php
/**
 * Created by PhpStorm.
 * User: cgd45
 * Date: 2018/2/28
 * Time: 14:30
 */

namespace app\admin\controller;


use cmf\controller\AdminBaseController;

/**
 * Class WxUserInfoController
 *
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   => '微信用户管理',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '微信用户管理'
 * )
 */
class WxUserInfoController extends AdminBaseController {

    /**
     * 微信用户
     * @adminMenu(
     *     'name'   => '微信用户',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '微信用户',
     *     'param'  => ''
     * )
     */
    public function index() {
        $where = [];
        /**搜索条件**/
        $wx_nickname = $this->request->param('wx_nickname');
        $mobile      = $this->request->param('mobile');
        $has_payed   = $this->request->param('has_payed');
        $user_type   = $this->request->param('user_type');

        if ($wx_nickname) {
            $where['wx_nickname'] = ['like', "%$wx_nickname%"];
        }

        if ($mobile) {
            $where['mobile'] = ['like', "%$mobile%"];
        }
        if (!is_null($has_payed) && $has_payed != 999) {
            $where['has_payed'] = $has_payed;
        }
        if (!is_null($user_type) && $user_type != 999) {
            $where['user_type'] = $user_type;
        }
        $users = model('WechatUser')
            ->useGlobalScope(false)
            ->where($where)
            ->order("id DESC")
            ->paginate(10);
        $users->appends(['wx_nickname' => $wx_nickname, 'mobile' => $mobile, 'has_payed' => $has_payed, 'user_type' => $user_type]);
        // 获取分页显示
        $page = $users->render();

        $this->assign("page", $page);
        $this->assign("users", $users);

        return $this->fetch();
    }

    /**
     * 编辑用户
     * @adminMenu(
     *     'name'   => '编辑用户',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑用户',
     *     'param'  => ''
     * )
     */
    public function edit() {
        $id = $this->request->param("id", 0, 'intval');

        $user = model('WechatUser')->get($id);
        $this->assign('user', $user);

        return $this->fetch();
    }

    /**
     * 微信用户编辑提交
     * @adminMenu(
     *     'name'   => '微信用户编辑提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '微信用户编辑提交',
     *     'param'  => ''
     * )
     */
    public function editPost() {
        if ($this->request->isPost()) {
            $id        = $this->request->post('id');
            $has_payed = $this->request->post('has_payed');
            if (is_null($has_payed)) {
                $this->request->post(['has_payed' => 0]);
            }

            $user = model('WechatUser')->get($id);
            if (is_null($user)) {
                $this->error('用户不存在，请重新操作！');
            }

            $result = $user->update($this->request->post());
            if ($result !== false) {
                $this->success("保存成功！");
            } else {
                $this->error("保存失败！");
            }
        }
    }
}