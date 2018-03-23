<?php
/**
 * FileName:ActivityCodeController.php
 * Created by JellyChen
 * Date: 2018/3/10 下午10:53
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Validate;

/**
 * Class ElementController
 *
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   => '激活码管理',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '激活码管理'
 * )
 */
class ActivityCodeController extends AdminBaseController {

    /**
     * 激活码列表
     * @adminMenu(
     *     'name'   => '激活码列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '激活码列表',
     *     'param'  => ''
     * )
     */
    public function index() {
        $where     = [];
        $code      = $this->request->param('code');
        $level     = $this->request->param('level');
        $parent_id = $this->request->param('parent_id');
        $is_bind   = $this->request->param('is_bind');
        if ($code) {
            $where['code'] = ['like', "%$code%"];
        }
        if (!is_null($level) && $level != 999) {
            $where['level'] = $level;
        }
        if ($parent_id) {
            $where['parent_id'] = $parent_id;
        }
        if ($is_bind == 1) {
            $where['user_id'] = 0;
        } elseif ($is_bind == 2) {
            $where['user_id'] = ['gt', 0];
        }
        $codes = model('ActivityCode')
            ->order(["list_order" => "asc"])
            ->where($where)
            ->paginate();
        $codes->appends(['code' => $code, 'level' => $level, 'parent_id' => $parent_id, 'is_bind' => $is_bind]);
        // 获取分页显示
        $page = $codes->render();

        $this->assign("page", $page);
        $this->assign("codes", $codes);

        return $this->fetch();
    }

    /**
     * 生成激活码
     * @adminMenu(
     *     'name'   => '生成激活码',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '生成激活码',
     *     'param'  => ''
     * )
     */
    public function generate() {
        $parent_id = $this->request->param('parent_id');
        if (!empty($parent_id)) {
            $parent = model('ActivityCode')->get($parent_id);
            $parent = $parent->getData();
            $this->assign($parent);

            return $this->fetch('generate_1');
        } else {
            return $this->fetch();

        }

    }

    /**
     * 生成激活码提交
     * @adminMenu(
     *     'name'   => '生成激活码提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '生成激活码提交',
     *     'param'  => ''
     * )
     */
    public function generatePost() {
        $data = $this->request->param();

        $result = $this->validate($data, 'ActivityCode.generate');
        if ($result !== true) {
            $this->error($result);
        }

        $parent_id = isset($data['parent_id']) ? $data['parent_id'] : 0;
        $num       = $data['num'];
        $rate      = $data['rate'];
        $rate2     = $data['rate2'];
        $level     = $data['level'];

        $result = model('ActivityCode')->generateCode($parent_id, $level, $num, $rate, $rate2);

        if ($result === false) {
            $this->error('生成失败!');
        }

        $this->success('生成成功!', url('ActivityCode/index'));
    }

    /**
     * 编辑激活码
     * @adminMenu(
     *     'name'   => '编辑激活码',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑激活码',
     *     'param'  => ''
     * )
     */
    public function edit() {
        $id = $this->request->param("id", 0, 'intval');

        $code = model('ActivityCode')->get($id);
        $this->assign('code', $code);

        return $this->fetch();
    }

    /**
     * 激活码编辑提交
     * @adminMenu(
     *     'name'   => '激活码编辑提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '激活码编辑提交',
     *     'param'  => ''
     * )
     */
    public function editPost() {
        $data = $this->request->param();

        $result = $this->validate($data, 'ActivityCode.edit');
        if ($result !== true) {
            $this->error($result);
        }

        $result = model('ActivityCode')->get($data['id'])->save($data);

        if ($result === false) {
            $this->error('保存失败!');
        }

        $this->success('保存成功!');
    }

}