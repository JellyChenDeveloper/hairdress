<?php
/**
 * FileName:CourseController.php
 * Created by JellyChen
 * Date: 2018/3/28 下午11:01
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;


class CourseController extends HairBaseController {

    private $pagesize = 10;

    public function index() {
        $courses = model('Course')->page(1, $this->pagesize)->select();
        $this->assign('courses', $courses);

        return $this->fetch();
    }

    public function getMore() {
        $courses = model('Course')->page($this->request->param('page'), $this->pagesize)->select()->toArray();
        foreach ($courses as $k => $v) {
            $courses[$k]['thumb_url'] = $v['thumb'] ? cmf_get_image_url($v['thumb']) : "";
            $courses[$k]['url']       = cmf_url('hair/Course/detail', array('id' => $v['id']));
        }
        if (count($courses) == 0) {
            $this->error("没有更多内容了");
        } else {
            $this->success('加载成功', null, $courses);
        }
    }

    public function detail() {
        $id = $this->request->param('id', 0);
        if ($id == 0 || empty($this->user_id)) {
            $this->error('参数错误，请刷新重试');
        }

        $course = model('Course')->get($id);
        if ($course) {
            $order              = model('Order')->where(['user_id' => $this->user_id, 'type' => 2, 'pay_time' => ['gt', 0], 'element_id' => $course['id']])->find();
            $course['need_pay'] = $course['price'] > 0 && empty($order);
        }
        $this->assign('course', $course);

        return $this->fetch();
    }
}