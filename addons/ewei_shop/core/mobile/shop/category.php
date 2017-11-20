<?php
//
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_W, $_GPC;
$operation = !empty($_GPC['op']) ? $_GPC['op'] : 'index';
$openid = m('user')->getOpenid();
$cartnum= m('member')->getUserCart($openid);
$uniacid = $_W['uniacid'];
$shopset = set_medias(m('common')->getSysset('shop'), 'catadvimg');
$commission = p('commission');
if ($commission) {
	$shopid = intval($_GPC['shopid']);
	$shop = set_medias($commission->getShop($openid), array('img', 'logo'));
}

$shopset = m('common')->getSysset('shop');
$phone=$shopset[phone];



if ($_W['isajax']) {
	
	//type=1获取总分类
	if($_GPC['type']==1){
		$category = pdo_fetchall('select id,name,thumb,advimg,parentid,level from ' . tablename('ewei_shop_category') . ' where uniacid=:uniacid and enabled=1 and  parentid=0  order by displayorder asc', array(':uniacid' => $uniacid));
		$category = set_medias($category, 'thumb');
		$category = set_medias($category, 'advimg');
		show_json(1, array('category' => $category));
	}
	//获取子分类
	if($_GPC['type']==2){
		$parentid=$_GPC['id'];
		$category = pdo_fetchall('select id,name,thumb,advimg,parentid,level from ' . tablename('ewei_shop_category') . ' where uniacid=:uniacid and enabled=1 and  parentid='.$parentid.'  order by displayorder asc', array(':uniacid' => $uniacid));
		$category = set_medias($category, 'thumb');
		$category = set_medias($category, 'advimg');
		show_json(1, array('soncategory' => $category));		
	}
	
	//获取商品规格信息
	if($_GPC['optionid']!=''){
		$optionid=$_GPC['optionid'];
		$options= pdo_get('ewei_shop_goods_option', array('specs' => $optionid));
		show_json(1, array('options' => $options));			
	}
	
	
	
}









include $this->template('shop/category');