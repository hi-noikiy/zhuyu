<?php
//
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_W, $_GPC;

$operation = !empty($_GPC['op']) ? $_GPC['op'] : 'display';
if ($operation == 'display') {
	$list = pdo_fetchall("SELECT * FROM " . tablename('ewei_shop_birthdaycard') . "  ORDER BY id DESC");
} elseif ($operation == 'post') {
	$id = intval($_GPC['id']);
	if (empty($id)) {
		ca('shop.adv.add');
	} else {
		ca('shop.adv.edit|shop.adv.view');
	}
	if (checksubmit('submit')) {
		$data = array('title' => trim($_GPC['title']),'state' => trim($_GPC['state']));
		if (!empty($id)) {
			pdo_update('ewei_shop_birthdaycard', $data, array('id' => $id));
			
		} else {
			pdo_insert('ewei_shop_birthdaycard', $data);
			$id = pdo_insertid();
			
		}
		message('更新生日牌成功！', $this->createWebUrl('shop/birthdaycard', array('op' => 'display')), 'success');
	}
	$item = pdo_fetch("select * from " . tablename('ewei_shop_birthdaycard') . " where id=:id  limit 1", array(":id" => $id));
} elseif ($operation == 'delete') {
	
	
	$id = intval($_GPC['id']);
	$item = pdo_fetch("SELECT id FROM " . tablename('ewei_shop_birthdaycard') . " WHERE id = '$id'");
	if (empty($item)) {
		message('抱歉，不存在或是已经被删除！', $this->createWebUrl('shop/birthdaycard', array('op' => 'display')), 'error');
	}
	pdo_delete('ewei_shop_birthdaycard', array('id' => $id));
	message('删除成功！', $this->createWebUrl('shop/birthdaycard', array('op' => 'display')), 'success');
}
load()->func('tpl');
include $this->template('web/shop/birthdaycard');