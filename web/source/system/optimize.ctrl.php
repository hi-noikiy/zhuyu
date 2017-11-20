<?php

$_W['page']['title'] = '性能优化 - 系统管理';
$extensions = array(
	'memcache' => array(
		'support' => extension_loaded('memcache'),
		'status' => ($_W['config']['setting']['cache'] == 'memcache'),
	),
	'eAccelerator' => array(
		'support' => function_exists('eaccelerator_optimizer'),
		'status' => function_exists('eaccelerator_optimizer'),
	)
);

$slave = $_W['config']['db'];
$setting = $_W['config']['setting'];



template('system/optimize');



















