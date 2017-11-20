<?php
//
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_W, $_GPC;

$operation = !empty($_GPC['op']) ? $_GPC['op'] : 'display';
if ($operation == 'display') {
	$list = pdo_fetchall("SELECT * FROM " . tablename('ewei_shop_catehat') . "  ORDER BY id DESC");
} elseif ($operation == 'post') {
	$id = intval($_GPC['id']);
	if (empty($id)) {
		ca('shop.adv.add');
	} else {
		ca('shop.adv.edit|shop.adv.view');
	}
	if (checksubmit('submit')) {
		$data = array('title' => trim($_GPC['title']),'thumb' => trim($_GPC['thumb']),'state' => trim($_GPC['state']));
		if (!empty($id)) {
			pdo_update('ewei_shop_catehat', $data, array('id' => $id));
			
		} else {
			pdo_insert('ewei_shop_catehat', $data);
			$id = pdo_insertid();
			
		}
		message('更新成功！', $this->createWebUrl('shop/cakehat', array('op' => 'display')), 'success');
	}
	$item = pdo_fetch("select * from " . tablename('ewei_shop_catehat') . " where id=:id  limit 1", array(":id" => $id));
} elseif ($operation == 'delete') {
	
	
	$id = intval($_GPC['id']);
	$item = pdo_fetch("SELECT id FROM " . tablename('ewei_shop_catehat') . " WHERE id = '$id'");
	if (empty($item)) {
		message('抱歉，不存在或是已经被删除！', $this->createWebUrl('shop/cakehat', array('op' => 'display')), 'error');
	}
	pdo_delete('ewei_shop_catehat', array('id' => $id));
	message('删除成功！', $this->createWebUrl('shop/cakehat', array('op' => 'display')), 'success');
}
load()->func('tpl');
include $this->template('web/shop/cakehat');