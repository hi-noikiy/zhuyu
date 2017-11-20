<?php
//
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_W, $_GPC;
function sortByTime($a, $b)
{
	if ($a['ts'] == $b['ts']) {
		return 0;
	} else {
		return $a['ts'] > $b['ts'] ? 1 : -1;
	}
}

function getList($express, $expresssn) 
{
	global $_W;
	$express_set = $_W['shopset']['express'];
	$express = (($express == 'jymwl' ? 'jiayunmeiwuliu' : $express));
	$express = (($express == 'TTKD' ? 'tiantian' : $express));
	$express = (($express == 'jjwl' ? 'jiajiwuliu' : $express));
	$express = (($express == 'zhongtiekuaiyun' ? 'ztky' : $express));
	load()->func('communication');
	if (!(empty($express_set['isopen'])) && !(empty($express_set['apikey']))) 
	{
		if (!(empty($express_set['cache'])) && (0 < $express_set['cache'])) 
		{
			$cache_time = $express_set['cache'] * 60;
			$cache = pdo_fetch('SELECT * FROM' . tablename('ewei_shop_express_cache') . 'WHERE express=:express AND expresssn=:expresssn LIMIT 1', array('express' => $express, 'expresssn' => $expresssn));
			if ((time() <= $cache['lasttime'] + $cache_time) && !(empty($cache['datas']))) 
			{
				return iunserializer($cache['datas']);
			}
		}
		if ($express_set['isopen'] == 1) 
		{
			$url = 'http://api.kuaidi100.com/api?id=' . $express_set['apikey'] . '&com=' . $express . '&nu=' . $expresssn;
			$params = array();
		}
		else 
		{
			$url = 'http://poll.kuaidi100.com/poll/query.do';
			$params = array('customer' => $express_set['customer'], 'param' => json_encode(array('com' => $express, 'num' => $expresssn)));
			$params['sign'] = md5($params['param'] . $express_set['apikey'] . $params['customer']);
			$params['sign'] = strtoupper($params['sign']);
		}
		$response = ihttp_post($url, $params);
		$content = $response['content'];
		$info = json_decode($content, true);
	}
	if (!(isset($info)) || empty($info['data']) || !(is_array($info['data']))) 
	{
		$url = 'https://www.kuaidi100.com/query?type=' . $express . '&postid=' . $expresssn . '&id=1&valicode=&temp=';
		$response = ihttp_request($url);
		$content = $response['content'];
		$info = json_decode($content, true);
		$useapi = false;
	}
	else 
	{
		$useapi = true;
	}
	$list = array();
	if (!(empty($info['data'])) && is_array($info['data'])) 
	{
		foreach ($info['data'] as $index => $data ) 
		{
			$list[] = array('time' => trim($data['time']), 'step' => trim($data['context']));
		}
	}
	if ($useapi && (0 < $express_set['cache']) && !(empty($list))) 
	{
		if (empty($cache)) 
		{
			pdo_insert('ewei_shop_express_cache', array('expresssn' => $expresssn, 'express' => $express, 'lasttime' => time(), 'datas' => iserializer($list)));
		}
		else 
		{
			pdo_update('ewei_shop_express_cache', array('lasttime' => time(), 'datas' => iserializer($list)), array('id' => $cache['id']));
		}
	}
	//var_dump($list);
	return $list;
}

$operation = !empty($_GPC['op']) ? $_GPC['op'] : 'display';
$openid = m('user')->getOpenid();
$uniacid = $_W['uniacid'];
$orderid = intval($_GPC['id']);
if ($_W['isajax']) {
	if ($operation == 'display') {
		$order = pdo_fetch('select * from ' . tablename('ewei_shop_order') . ' where id=:id and uniacid=:uniacid and openid=:openid limit 1', array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));
		if (empty($order)) {
			show_json(0);
		}
		$goods = pdo_fetchall("select og.goodsid,og.price,g.title,g.thumb,og.total,g.credit,og.optionid,og.optionname as optiontitle,g.isverify,g.storeids  from " . tablename('ewei_shop_order_goods') . " og " . " left join " . tablename('ewei_shop_goods') . " g on g.id=og.goodsid " . " where og.orderid=:orderid and og.uniacid=:uniacid ", array(':uniacid' => $uniacid, ':orderid' => $orderid));
		$goods = set_medias($goods, 'thumb');
		$order['goodstotal'] = count($goods);
		$set = set_medias(m('common')->getSysset('shop'), 'logo');
		show_json(1, array('order' => $order, 'goods' => $goods, 'set' => $set));
	} else if ($operation == 'step') {
		$express = trim($_GPC['express']);
		$expresssn = trim($_GPC['expresssn']);
		$arr = getList($express, $expresssn);

		show_json(1, array('list' => $arr));
	}
}
include $this->template('order/express');