<?php
/**
 * FileName:ProjectController.php
 * Created by JellyChen
 * Date: 2018/2/9 上午10:22
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

class ProjectController extends HairBaseController {

    public function index() {
        return $this->fetch();
    }

    public function doAddProj() {
        $project_name = $this->request->post('project_name');

        $this->success(lang('ADD_PROJECT_OK'), url('hair/project/detail'), ['id' => 1, 'project_name' => $project_name]);
    }

    public function detail() {
        $project_name = $this->request->get('project_name');

        $this->assign('project_name', $project_name);

        return $this->fetch();
    }

    public function doAddPage() {
        $page_name = $this->request->post('page_name');

        $this->success(lang('ADD_PAGE_OK'), url('hair/project/detail'), ['id' => 1, 'page_name' => $page_name]);
    }
}