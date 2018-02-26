<?php
/**
 * Created by PhpStorm.
 * User: cgd45
 * Date: 2018/2/23
 * Time: 18:49
 */

namespace app\hair\controller;


class PageController extends HairBaseController {
    public function index($id) {
        $page = model('Pages')->get(['id' => $id, 'user_id' => $this->user_id]);

        $this->assign('page', $page);

        return $this->fetch();
    }

    public function doAddPage() {
        $page_name  = $this->request->post('page_name');
        $project_id = $this->request->post('project_id');

        $data = [
            'user_id'    => $this->user_id,
            'project_id' => $project_id,
            'name'       => $page_name,
        ];
        if (model('Pages')->get($data)) {
            $this->error(lang('PAGE_NAME_EXIST'));
        }
        $page = model('Pages');
        $page->save($data);

        $this->success(lang('ADD_PAGE_OK'), url('hair/page/index', ['id' => $page->id]));
    }

    public function doSavePage() {
        $avatar     = $this->request->post('img_url');
        $id         = $this->request->post('id');
        $project_id = $this->request->post('project_id');

        $data = [
            'id'         => $id,
            'user_id'    => $this->user_id,
            'project_id' => $project_id,
            'avatar'     => $avatar,
        ];
        $page = model('Projects');
        $page->save($data);

        $this->success(lang('SAVE_IMG_OK'), url('hair/project/detail', ['id' => $project_id]));
    }

    public function doDeletePage() {
        $page_id    = $this->request->post('page_id');
        $project_id = $this->request->post('project_id');

        $data = [
            'id'         => $page_id,
            'user_id'    => $this->user_id,
            'project_id' => $project_id,
        ];
        $page = model('Pages')->get($data);
        if (!$page) {
            $this->error(lang('PAGE_NOT_EXIST'));
        }

        $result = $page->delete();
        if ($result == 1) {
            $this->success(lang('DELETE_SUCCESS'));
        } else {
            $this->error(lang('DELETE_FAILED'));
        }
    }
}