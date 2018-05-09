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

        $elements = model('Element')->where(['type' => ['in', [0, 1, 2]]])->order('list_order')->select()->toArray();
        $orders   = model('Order')->where(['user_id' => $this->user_id, 'type' => 1, 'pay_time' => ['gt', 0]])->column('element_id');
        $heads    = [];
        $tools    = [];
        $funcs    = [];

        foreach ($elements as $k => $v) {
            $v['need_pay'] = 0;
            if ($v['price'] != 0 && !in_array($v['id'], $orders)) {
                $v['need_pay'] = 1;
            }
            switch ($v['type']) {
                case 1:
                    $tools[$v['id']] = $v;
                    break;
                case 2:
                    $funcs[$v['alias']] = $v;
                    break;
                case 0:
                default:
                    $heads[$v['id']] = $v;
                    break;
            }
        }
        $this->assign('heads', $heads);
        $this->assign('tools', $tools);
        $this->assign('funcs', $funcs);

        $js_config = $this->wecharService->jssdk()->buildConfig([
            "onMenuShareTimeline",
            "onMenuShareAppMessage",
            "onMenuShareQQ",
            "onMenuShareWeibo",
        ]);
        $share     = [
            'js_config'   => $js_config,
            'share_title' => $this->setting['software_name'],
            'share_desc'  => '分享描述',
            'share_link'  => url('hair/index/index', '', true, true),
            'share_img'   => $page->avatar_url,
        ];
        $this->assign('share', $share);
        session('wx_pay.from_url', $this->request->url(true));

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
        $id         = $this->request->post('id');
        $user_id    = $this->request->post('user_id');
        $project_id = $this->request->post('project_id');
        $image      = $this->request->post('image');
        if ($user_id != $this->user_id) {
            $this->error(lang('页面错误，请关闭页面后重试!'));
        }

        $path = cmf_save_base64_image($image, 'page');

        $data = [
            'id'         => $id,
            'user_id'    => $this->user_id,
            'project_id' => $project_id,
        ];
        $page = model('Pages')->get($data);
        if (!$page) {
            $this->error(lang('页面错误，请关闭页面后重试!'));
        }
        $page->save(['avatar' => $path]);

        $this->success(lang('SAVE_IMG_OK'), url('hair/project/detail', ['id' => $project_id]), ['img_url' => cmf_get_image_url($path)]);
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