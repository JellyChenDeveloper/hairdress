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

use app\common\model\ProjectsModel;

class ProjectController extends HairBaseController {

    public function index() {
        return $this->fetch();
    }

    public function doAddProj() {
        $project_name = $this->request->post('project_name');
        $id           = cmf_get_current_user_id();

        $data    = [
            'user_id'      => $id,
            'project_name' => $project_name,
        ];
        $project = model('Projects');
        $project->save($data);


        $this->success(lang('ADD_PROJECT_OK'), url('hair/project/detail'), ['id' => $project->id, 'project_name' => $project_name]);
    }

    public function detail() {
        $project_id = $this->request->get('id');

        $project = model('Projects')->get(['id' => $project_id, 'project_status' => 1])->toArray();

        $this->assign('project', $project);

        return $this->fetch();
    }

    public function doAddPage() {
        $page_name = $this->request->post('page_name');

        $this->success(lang('ADD_PAGE_OK'), url('hair/project/detail'), ['id' => 1, 'page_name' => $page_name]);
    }
}