<?php
/**
 * FileName:AdminSettingController.php
 * Created by JellyChen
 * Date: 2018/4/5 下午4:54
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;


/**
 * Class OrderController
 *
 * @package app\hair\controller
 * @adminMenuRoot(
 *     'name'   => '系统设置',
 *     'action' => 'default',
 *     'parent' => 'default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   => '',
 *     'remark' => '系统设置'
 * )
 */
class AdminSettingController extends AdminHairBaseController {

    /**
     * 参数设置
     * @adminMenu(
     *     'name'   => '参数设置',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '参数设置',
     *     'param'  => ''
     * )
     */
    public function index() {
        $setting = model('Setting')->get(1)->toArray();
        $this->assign($setting);

        return $this->fetch();
    }

    /**
     * 参数设置提交
     * @adminMenu(
     *     'name'   => '参数设置提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '参数设置提交',
     *     'param'  => ''
     * )
     */
    public function postIndex() {
        $data = $this->request->param();

        $result = $this->validate($data, 'Setting.index');

        if ($result !== true) {
            $this->error($result);
        }

        $data['id'] = 1;

        $setting   = model('Setting')->get(1);
        $is_update = !is_null($setting);
        $result    = model('Setting')->isUpdate($is_update)->save($data);
        if ($result === false) {
            $this->error('添加失败!');
        }

        $this->success('添加成功!', url('AdminSetting/index'));
    }

    /**
     * 首页内容
     * @adminMenu(
     *     'name'   => '首页内容',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '首页内容',
     *     'param'  => ''
     * )
     */
    public function content() {
        $setting = model('Setting')->get(1)->toArray();
        $this->assign($setting);

        return $this->fetch();
    }

    /**
     * 首页内容提交
     * @adminMenu(
     *     'name'   => '首页内容提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '首页内容提交',
     *     'param'  => ''
     * )
     */
    public function postContent() {
        $data = $this->request->param();

        $result = $this->validate($data, 'Setting.index_content');

        if ($result !== true) {
            $this->error($result);
        }

        $data['id'] = 1;

        $setting   = model('Setting')->get(1);
        $is_update = !is_null($setting);
        $result    = model('Setting')->isUpdate($is_update)->save($data);

        if ($result === false) {
            $this->error('添加失败!');
        }

        $this->success('添加成功!', url('AdminSetting/content'));
    }

}