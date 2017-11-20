<?php
//
global $_W, $_GPC;
//check_shop_auth('http://baidu.com/api.php', $this->pluginname);
ca('perm.set');
$type = m('cache')->getString('permset', 'global');
$set = array('type' => intval($type));
if (checksubmit('submit')) {
	m('cache')->set('permset', intval($_GPC['data']['type']), 'global');
	message('设置成功!', referer(), 'success');
}
load()->func('tpl');
include $this->template('index');