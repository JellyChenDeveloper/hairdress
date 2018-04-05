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
        $project_list = model('Projects')->where(['user_id' => $this->user_id])->page('1,500')->select();

        $this->assign('project_list', $project_list);

        return $this->fetch();
    }

    public function doAddProj() {
        $project_name = $this->request->post('project_name');

        $data = [
            'user_id' => $this->user_id,
            'name'    => $project_name,
        ];
        if (model('Projects')->get($data)) {
            $this->error(lang('PROJECT_NAME_EXIST'));
        }
        $project = model('Projects');
        $project->save($data);


        $this->success(lang('ADD_PROJECT_OK'), url('hair/project/detail', ['id' => $project->id]));
    }

    public function doDeleteProj() {
        $project_id = $this->request->post('project_id');

        $data    = [
            'user_id' => $this->user_id,
            'id'      => $project_id,
        ];
        $project = model('Projects')->get($data);
        if (!$project) {
            $this->error(lang('PROJECT_NOT_EXIST'));
        }

        $result = $project->delete();
        if ($result == 1) {
            $this->success(lang('DELETE_SUCCESS'));
        } else {
            $this->error(lang('DELETE_FAILED'));
        }
    }

    public function detail($id) {
        $project_id = $id;

        $project   = model('Projects')->get(['id' => $project_id]);
        $page_list = model('Pages')->where(['user_id' => $this->user_id, 'project_id' => $project_id])->page('1,500')->select();

        $this->assign('project', $project);
        $this->assign('page_list', $page_list);

        return $this->fetch();
    }
}