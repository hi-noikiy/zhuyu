<?php
//
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_W, $_GPC;
$operation = !empty($_GPC['op']) ? $_GPC['op'] : 'index';
$openid = m('user')->getOpenid();
$uniacid = $_W['uniacid'];
$shopset = m('common')->getSysset('shop');
$phone=$shopset[phone];

$notice=htmlspecialchars_decode($shopset[enterprisetoorder]);

include $this->template('shop/enterprisetoorder ');