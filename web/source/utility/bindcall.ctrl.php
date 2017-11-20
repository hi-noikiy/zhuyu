<?php 


defined('IN_IA') or exit('Access Denied');
$modulename = $_GPC['modulename'];
$callname = $_GPC['callname'];
$uniacid = $_GPC['uniacid'];
$_W['uniacid'] = $_GPC['uniacid'];
$args = $_GPC['args'];

$data = $_GPC['W'];
$data = @iunserializer(@base64_decode($data));
if(empty($data)){
	exit('Access Denied');
}

$_W = array_merge($_W, $data);

$site = WeUtility::createModuleSite($modulename);
if (empty($site)) {
	message(array(), '', 'ajax');
}
$ret = @$site->$callname($args);
message($ret, '', 'ajax');