<?php
/**
 * FileName:AdminCourseController.php
 * Created by JellyChen
 * Date: 2018/3/26 下午11:56
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

/**
 * Class ElementController
 *
 * @package app\hair\controller
 * @adminMenuRoot(
 *     'name'   => '教程管理',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '教程管理'
 * )
 */
class AdminCourseController extends AdminHairBaseController {
    /**
     * 教程管理
     * @adminMenu(
     *     'name'   => '教程管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '教程管理',
     *     'param'  => ''
     * )
     */
    public function index() {
        $param = $this->request->param();

        $where = [
            'create_time' => ['>=', 0],
        ];

        $startTime = empty($param['start_time']) ? 0 : strtotime($param['start_time']);
        $endTime   = empty($param['end_time']) ? 0 : strtotime($param['end_time']);
        if (!empty($startTime) && !empty($endTime)) {
            $where['published_time'] = [['>= time', $startTime], ['<= time', $endTime]];
        } else {
            if (!empty($startTime)) {
                $where['published_time'] = ['>= time', $startTime];
            }
            if (!empty($endTime)) {
                $where['published_time'] = ['<= time', $endTime];
            }
        }

        $keyword = empty($param['keyword']) ? '' : $param['keyword'];
        if (!empty($keyword)) {
            $where['title'] = ['like', "%$keyword%"];
        }

        $articles = Model('Course')
            ->where($where)
            ->order(['list_order', 'published_time' => 'DESC'])
            ->paginate();

        $articles->appends($param);

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('articles', $articles->items());
        $this->assign('page', $articles->render());

        return $this->fetch();
    }

    /**
     * 添加教程
     * @adminMenu(
     *     'name'   => '添加教程',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加教程',
     *     'param'  => ''
     * )
     */
    public function add() {
        return $this->fetch();
    }

    /**
     * 添加教程提交
     * @adminMenu(
     *     'name'   => '添加教程提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加教程提交',
     *     'param'  => ''
     * )
     */
    public function addPost() {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'Course.add');
            if ($result !== true) {
                $this->error($result);
            }

            $data['user_id'] = cmf_get_current_admin_id();

            if (!empty($data['thumb'])) {
                $data['thumb'] = cmf_asset_relative_url($data['thumb']);
            }

            $course = model('Course');
            $course->save($data);

            $this->success('添加成功!', url('AdminCourse/edit', ['id' => $course->id]));
        }
    }

    /**
     * 编辑教程
     * @adminMenu(
     *     'name'   => '编辑教程',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑教程',
     *     'param'  => ''
     * )
     */
    public function edit() {
        $id = $this->request->param('id', 0, 'intval');

        $course = model('Course')->get($id);

        $this->assign('course', $course);

        return $this->fetch();
    }

    /**
     * 编辑教程提交
     * @adminMenu(
     *     'name'   => '编辑教程提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑教程提交',
     *     'param'  => ''
     * )
     */
    public function editPost() {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'Course.edit');
            if ($result !== true) {
                $this->error($result);
            }

            unset($data['user_id']);

            if (!empty($data['thumb'])) {
                $data['thumb'] = cmf_asset_relative_url($data['thumb']);
            }

            model('Course')->isUpdate(true)->save($data);

            $this->success('保存成功!');

        }
    }

    /**
     * 教程删除
     * @adminMenu(
     *     'name'   => '教程删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '教程删除',
     *     'param'  => ''
     * )
     */
    public function delete() {
        if (!cmf_get_current_admin_id()) {
            $this->error('非法操作');
        }

        $param = $this->request->param();

        if (isset($param['id'])) {
            $id     = $this->request->param('id', 0, 'intval');
            $course = model('Course')->get($id);
            if (!$course) {
                $this->error('参数错误，请刷新重试');
            }
            $result = $course->delete();
            if ($result == 1) {
                $this->success(lang('DELETE_SUCCESS'));
            } else {
                $this->error(lang('DELETE_FAILED'));
            }
        }

        if (isset($param['ids'])) {
            $ids    = $this->request->param('ids/a');
            $result = model('Course')->where(['id' => ['in', $ids]])->update(['delete_time' => time()]);
            if ($result) {
                $this->success("删除成功！", '');
            }
        }
    }

    /**
     * 教程排序
     * @adminMenu(
     *     'name'   => '教程排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '教程排序',
     *     'param'  => ''
     * )
     */
    public function listOrder() {
        parent::listOrders(model('Course'));
        $this->success("排序更新成功！", '');
    }
}