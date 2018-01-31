<?php
return array(
    //'配置项'=>'配置值'
    'URL_MODEL'         => 1, // URL访问模式,可选参数0、1、2、3,代表以下四种模式：
    // 0 (普通模式); 1 (PATHINFO 模式); 2 (REWRITE  模式); 3 (兼容模式)  默认为PATHINFO 模式
    //模板引擎普通标签标记
    'TMPL_L_DELIM'      => '{{',
    'TMPL_R_DELIM'      => '}}',
    //模板布局功能
    'LAYOUT_ON'         => false,
    'LAYOUT_NAME'       => 'layout/layout',
    'TMPL_PARSE_STRING' => array(
        '__PUBLIC__'   => '/Public',           // 更改默认的/Public 替换规则
        '__JS__'       => '/Public/js',        // 更改默认的/Public 替换规则
        '__CSS__'      => '/Public/css',       // 更改默认的/Public 替换规则
        '__HOMEJS__'   => '/Public/js/Home',   // 增加新的JS类库路径替换规则
        '__STUDIOJS__' => '/Public/js/Studio', // 增加新的JS类库路径替换规则
    ),
    'SESSION_OPTIONS'   => array('use_trans_sid' => 1),
    'LOAD_EXT_CONFIG'   => 'dbconnect,const_config',       //扩展配置
);