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
$shopset = m('common')->getSysset('shop');
$phone=$shopset[phone];
$designer = p('designer');
if ($designer) {
	$pagedata = $designer->getPage();
	if ($pagedata) {
		extract($pagedata);
		$guide = $designer->getGuide($system, $pageinfo);
		$_W['shopshare'] = array('title' => $share['title'], 'imgUrl' => $share['imgUrl'], 'desc' => $share['desc'], 'link' => $this->createMobileUrl('shop'));
		if (p('commission')) {
			$set = p('commission')->getSet();
			if (!empty($set['level'])) {
				$member = m('member')->getMember($openid);
				if (!empty($member) && $member['status'] == 1 && $member['isagent'] == 1) {
					$_W['shopshare']['link'] = $this->createMobileUrl('shop', array('mid' => $member['id']));
					if (empty($set['become_reg']) && (empty($member['realname']) || empty($member['mobile']))) {
						$trigger = true;
					}
				} else if (!empty($_GPC['mid'])) {
					$_W['shopshare']['link'] = $this->createMobileUrl('shop', array('mid' => $_GPC['mid']));
				}
			}
		}
		include $this->template('shop/index_diy');
		exit;
	}
}
$set = set_medias(m('common')->getSysset('shop'), array('logo', 'img'));
if ($_W['isajax']) {
	if ($operation == 'index') {
		$advs = pdo_fetchall('select id,advname,link,thumb from ' . tablename('ewei_shop_adv') . ' where uniacid=:uniacid and enabled=1 order by displayorder desc', array(':uniacid' => $uniacid));
		$advs = set_medias($advs, 'thumb');
		$category = pdo_fetchall('select id,name,thumb,advimg,parentid,level from ' . tablename('ewei_shop_category') . ' where uniacid=:uniacid and enabled=1 and  parentid=0  order by displayorder asc', array(':uniacid' => $uniacid));
		$category = set_medias($category, 'thumb');
		$category = set_medias($category, 'advimg');
		
		//获取文章列表,记得关闭显示分类
		$article_sys = pdo_fetch("select * from" . tablename('ewei_shop_article_sys') . "where uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
		if ($article_sys['article_temp'] == 0) {
			$limit = empty($article_sys['article_shownum']) ? '10' : $article_sys['article_shownum'];
			$articles = pdo_fetchall("SELECT id,article_title,resp_img,article_rule_credit,article_rule_money,article_date FROM " . tablename('ewei_shop_article') . " WHERE article_state=1 and uniacid=:uniacid order by id desc limit " . $limit, array(':uniacid' => $_W['uniacid']));
		} elseif ($article_sys['article_temp'] == 1) {
			$limit = empty($article_sys['article_shownum']) ? '7' : $article_sys['article_shownum'];
			$articles = pdo_fetchall("SELECT distinct article_date_v FROM " . tablename('ewei_shop_article') . " WHERE article_state=1 and uniacid=:uniacid order by id desc limit " . $limit, array(':uniacid' => $_W['uniacid']), 'article_date_v');
			foreach ($articles as &$a) {
				$a['articles'] = pdo_fetchall("SELECT id,article_title,article_date_v,resp_img,resp_desc,article_date_v FROM " . tablename('ewei_shop_article') . " WHERE article_state=1 and uniacid=:uniacid and article_date_v=:article_date_v order by id desc ", array(':uniacid' => $_W['uniacid'], ':article_date_v' => $a['article_date_v']));
			}
			unset($a);
		} 		
		
		
		
		foreach ($category as &$c) {
			$c['thumb'] = tomedia($c['thumb']);
			if ($c['level'] == 3) {
				$c['url'] = $this->createMobileUrl('shop/list', array('tcate' => $c['id']));
			} else if ($c['level'] == 2) {
				$c['url'] = $this->createMobileUrl('shop/list', array('ccate' => $c['id']));
			}
		}
		unset($c);
		show_json(1, array('set' => $set, 'advs' => $advs, 'category' => $category,'articles'=>$articles));
	} else if ($operation == 'goods') {
		$type = $_GPC['type'];
		$args = array('page' => $_GPC['page'], 'pagesize' => 6, 'isrecommand' => 1, 'order' => 'displayorder desc,createtime desc', 'by' => '');
		$goods = m('goods')->getList($args);
		show_json(1, array('goods' => $goods, 'pagesize' => $args['pagesize']));
	}
}
$this->setHeader();
include $this->template('shop/index');