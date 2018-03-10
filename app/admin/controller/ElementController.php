<?php
/**
 * FileName:ElementController.php
 * Created by JellyChen
 * Date: 2018/3/4 下午4:53
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\admin\controller;

use cmf\controller\AdminBaseController;

/**
 * Class ElementController
 *
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   => '组件管理',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '组件管理'
 * )
 */
class ElementController extends AdminBaseController {

    /**
     * 组件列表
     * @adminMenu(
     *     'name'   => '组件列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '组件列表',
     *     'param'  => ''
     * )
     */
    public function index() {
        $where = [];
        $name  = $this->request->param('name');
        $type  = $this->request->param('type');
        if ($name) {
            $where['name'] = ['like', "%$name%"];
        }
        if ($type && $type != '999') {
            $where['type'] = $type;
        }
        $elements = model('Element')
            ->order(["list_order" => "asc"])
            ->where($where)
            ->paginate(10);
        $elements->appends(['name' => $name, 'type' => $type]);
        // 获取分页显示
        $page = $elements->render();

        $this->assign("page", $page);
        $this->assign("elements", $elements);

        return $this->fetch();
    }

    /**
     * 添加组件
     * @adminMenu(
     *     'name'   => '添加组件',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加组件',
     *     'param'  => ''
     * )
     */
    public function add() {
        return $this->fetch();
    }

    /**
     * 添加组件分类提交
     * @adminMenu(
     *     'name'   => '添加组件分类提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加组件分类提交',
     *     'param'  => ''
     * )
     */
    public function addPost() {
        $data = $this->request->param();

        $result = $this->validate($data, 'Element.add');

        if ($result !== true) {
            $this->error($result);
        }

        if ($data['is_free'] == 0 && empty($data['price'])) {
            $this->error('价格不能为空');
        }
        if ($data['is_free']) {
            unset($data['price']);
        }
        $result = model('Element')->save($data);

        if ($result === false) {
            $this->error('添加失败!');
        }

        $this->success('添加成功!', url('Element/index'));
    }

    /**
     * 编辑组件
     * @adminMenu(
     *     'name'   => '编辑组件',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑组件',
     *     'param'  => ''
     * )
     */
    public function edit() {

        $id = $this->request->param("id", 0, 'intval');

        $element = model('Element')->get($id);
        $this->assign('element', $element);

        return $this->fetch();
    }

    /**
     * 组件编辑提交
     * @adminMenu(
     *     'name'   => '组件编辑提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '组件编辑提交',
     *     'param'  => ''
     * )
     */
    public function editPost() {
        $data = $this->request->param();

        $result = $this->validate($data, 'Element.edit');

        if ($result !== true) {
            $this->error($result);
        }

        if ($data['is_free'] == 0 && empty($data['price'])) {
            $this->error('价格不能为空');
        }

        if ($data['is_free']) {
            unset($data['price']);
        }

        $result = model('Element')->get($data['id'])->save($data);

        if ($result === false) {
            $this->error('保存失败!');
        }

        $this->success('保存成功!');
    }

    /**
     * 组件排序
     * @adminMenu(
     *     'name'   => '组件排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '组件排序',
     *     'param'  => ''
     * )
     */
    public function listOrder() {
        parent::listOrders(model('Element'));
        $this->success("排序更新成功！", '');
    }
}