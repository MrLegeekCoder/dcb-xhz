<?php
return array(
	//'配置项'=>'配置值'
    'APP_DEBUG' =>'true',
    //开发调试模式APP_DEBUG=true,下边缓存无效
    //生产模式APP_DEBUG=false,缓存有效
    'TMPL_PARSE_STRING' => array('__ADMIN__' => __ROOT__.'/Public/Admin'),
    'DB_TYPE'               =>  'mysql',     // 数据库类型
    'DB_HOST'               =>  'localhost', // 服务器地址
    'DB_NAME'               =>  'dcb',          // 数据库名
    'DB_USER'               =>  'root',      // 用户名
    'DB_PWD'                =>  '19950327',          // 密码
    'DB_PORT'               =>  '3306',        // 端口
    'DB_PREFIX'             =>  '',    // 数据库表前缀
    'DB_PARAMS'          	=>  array(), // 数据库连接参数
    'DB_DEBUG'  			=>  TRUE, // 数据库调试模式 开启后可以记录SQL日志
    'DB_FIELDS_CACHE'       =>  true,        // 启用字段缓存
    'DB_CHARSET'            =>  'utf8',      // 数据库编码默认采用utf8
);