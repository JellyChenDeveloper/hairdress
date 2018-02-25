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
        $page = model('Pages')->get(['id' => $id, 'user_id' => $this->user_id, 'status' => 1]);

        $this->assign('page', $page);

        return $this->fetch();
    }

    public function doAddPage() {
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
}