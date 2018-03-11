<?php
/**
 * FileName:DownloadController.php
 * Created by JellyChen
 * Date: 2018/3/11 下午10:13
 *
 * @author         JellyChen
 * @copyright      All Rights Reserved.
 * @version        1.0
 */

namespace app\hair\controller;

use cmf\controller;

class DownloadController extends controller\BaseController {

    public function down() {
        $id     = $this->request->param('id');
        $avatar = model('Pages')->get($id)->avatar;
        $file   = CMF_ROOT . 'public/upload/' . $avatar;
        header("Content-type: octet/stream");
        header("Content-disposition:attachment;filename=" . basename($file) . ";");
        header("Content-Length:" . filesize($file));
        readfile($file);
        exit;
    }
}