<?php

//decode 
if (!defined('IN_IA')) {
    die('Access Denied');
}
global $_W, $_GPC;
$operation = !empty($_GPC['op']) ? $_GPC['op'] : 'display';
$openid = m('user')->getOpenid();
$cartnum= m('member')->getUserCart($openid);
$uniacid = $_W['uniacid'];
if ($_W['isajax']) {
	
	//获取推荐商品
	if($_GPC['act'] == 'shop') {
		
		$args = array('page' => 1, 'pagesize' => 6, 'isrecommand' => 1, 'order' => 'displayorder desc,createtime desc', 'by' => '');
		$goods = m('goods')->getList($args);
		show_json(1, array('goods' => $goods, 'pagesize' => $args['pagesize']));
	}
	//获取生日牌
	if($_GPC['act'] == 'birthdaycard') {
		$cardres = pdo_getall('ewei_shop_birthdaycard', array('state' => 1));
		show_json(1, array('cardres' => $cardres));
	}	
	//获取蛋糕帽
	if($_GPC['act'] == 'cakehat') {
		$cakehatres = pdo_getall('ewei_shop_catehat', array('state' => 1));
        $cakehatres = set_medias($cakehatres, 'thumb');
		show_json(1, array('cakehatres' => $cakehatres));
	}	
	//获取生日蜡烛
	if($_GPC['act'] == 'birthdaycandle') {
		$candleres = pdo_getall('ewei_shop_birthdaycandle', array('state' => 1));
        $candleres = set_medias($candleres, 'thumb');
		show_json(1, array('candleres' => $candleres));
	}
	//获取水果夹心
	if($_GPC['act'] == 'birthdayfruit') {
		$fruitres = pdo_getall('ewei_shop_fruit', array('state' => 1));
        $fruitres = set_medias($fruitres, 'thumb');
		show_json(1, array('fruitres' => $fruitres));
	}	
			
	
	//更新购物车的生日牌/蛋糕帽/生日蜡烛
	if($_GPC['act'] == 'updatecart') {
		$id=$_GPC['id'];
		$data=array();
		
		if($_GPC['birthdaycard']!=''){
			$data[birthdaycard]=$_GPC['birthdaycard'];	
		}
		if($_GPC['cakehat']!=''){
			$data[cakehat]=$_GPC['cakehat'];	
		}
		if($_GPC['birthdaycandle']!=''){
			$data[birthdaycandle]=$_GPC['birthdaycandle'];	
		}
		if($_GPC['cakehatimg']!=''){
			$data[cakehatimg]=$_GPC['cakehatimg'];	
		}
		if($_GPC['birthdaycandleimg']!=''){
			$data[birthdaycandleimg]=$_GPC['birthdaycandleimg'];	
		}
		if($_GPC['cakehattitle']!=''){
			$data[cakehattitle]=$_GPC['cakehattitle'];	
		}
		if($_GPC['birthdaycandletitle']!=''){
			$data[birthdaycandletitle]=$_GPC['birthdaycandletitle'];	
		}
		if($_GPC['fruitid']!=''){
			$data[fruitid]=$_GPC['fruitid'];	
		}	
		if($_GPC['fruitimg']!=''){
			$data[fruitimg]=$_GPC['fruitimg'];	
		}			
		if($_GPC['fruittitle']!=''){
			$data[fruittitle]=$_GPC['fruittitle'];	
		}
				
		pdo_update('ewei_shop_member_cart', $data, array('id' => $id));	
        show_json(1);
	}
	
	
	
    if ($operation == 'display') {
        $condition = ' and f.uniacid= :uniacid and f.openid=:openid and f.deleted=0';
        $params = array(':uniacid' => $uniacid, ':openid' => $openid);
        $list = array();
        $total = 0;
        $totalprice = 0;
        $sql = 'SELECT f.id,f.fruitimg,f.fruittitle,f.birthdaycard,f.cakehatimg,f.birthdaycandleimg,f.cakehattitle,f.birthdaycandletitle,f.total,f.goodsid,g.isgift,g.total as stock, o.stock as optionstock,dispatchprice as dispatchprice,  g.maxbuy,g.title,g.thumb,ifnull(o.marketprice, g.marketprice) as marketprice,ifnull(o.productprice, g.productprice) as productprice,o.title as optiontitle,f.optionid,o.specs FROM ' . tablename('ewei_shop_member_cart') . ' f ' . ' left join ' . tablename('ewei_shop_goods') . ' g on f.goodsid = g.id ' . ' left join ' . tablename('ewei_shop_goods_option') . ' o on f.optionid = o.id ' . ' where 1 ' . $condition . ' ORDER BY `id` DESC ';
        $list = pdo_fetchall($sql, $params);
        foreach ($list as &$r) {
            if (!empty($r['optionid'])) {
                $optionid = $r['optionid'];
                $goodsid = $r['goodsid'];
                $option = pdo_fetch('select tableware,thumb,specs from ' . tablename('ewei_shop_goods_option') . ' ' . ' where id=:id and uniacid=:uniacid and goodsid=:goodsid limit 1 ', array(':id' => $optionid, ':uniacid' => $uniacid, ':goodsid' => $goodsid));
                $r['tableware'] = '';
                if (!empty($option)) {
                    
                    $cartspecs = explode('_', $option['specs']);
                    $specid = $cartspecs[0];
                    if (!empty($specid)) {
                        $spec = pdo_fetch('select thumb from ' . tablename('ewei_shop_goods_spec_item') . ' ' . ' where id=:id and uniacid=:uniacid limit 1 ', array(':id' => $specid, ':uniacid' => $uniacid));
                        if (!empty($spec)) {
                            if (!empty($spec['thumb'])) {
                                //$r['thumb'] = $spec['thumb'];
                            }
                        }
                    }
                }
                $r['stock'] = $r['optionstock'];
				$r['tableware'] = $option['tableware'];
            }
            $totalprice += $r['marketprice'] * $r['total'];
			$dispatchprice+=$r['dispatchprice'];
            $total += $r['total'];
        }
        unset($r);
        $list = set_medias($list, 'thumb');
        $totalprice = number_format($totalprice, 2);
		$dispatchprice = number_format($dispatchprice, 2);
        show_json(1, array('total' => $total, 'list' => $list, 'totalprice' => $totalprice,'dispatchprice' => $dispatchprice));
    } else {
        if ($operation == 'add' && $_W['ispost']) {
            $id = intval($_GPC['id']);
            $total = intval($_GPC['total']);
            empty($total) && ($total = 1);
            $optionid = intval($_GPC['optionid']);
            $goods = pdo_fetch('select id,marketprice from ' . tablename('ewei_shop_goods') . ' where uniacid=:uniacid and id=:id limit 1', array(':uniacid' => $uniacid, ':id' => $id));
            if (empty($goods)) {
                show_json(0, '商品未找到');
            }
            $diyform_plugin = p('diyform');
            $datafields = 'id,total';
            if ($diyform_plugin) {
                $datafields .= ',diyformdataid';
            }
            $data = pdo_fetch("select {$datafields} from " . tablename('ewei_shop_member_cart') . ' where openid=:openid and goodsid=:id and  optionid=:optionid and deleted=0 and  uniacid=:uniacid   limit 1', array(':uniacid' => $uniacid, ':openid' => $openid, ':optionid' => $optionid, ':id' => $id));
            $diyformdataid = 0;
            $diyformfields = iserializer(array());
            $diyformdata = iserializer(array());
            if ($diyform_plugin) {
                $diyformdata = $_GPC['diyformdata'];
                if (!empty($diyformdata) && is_array($diyformdata)) {
                    $diyformid = intval($diyformdata['diyformid']);
                    $diydata = $diyformdata['diydata'];
                    if (!empty($diyformid) && is_array($diydata)) {
                        $formInfo = $diyform_plugin->getDiyformInfo($diyformid);
                        if (!empty($formInfo)) {
                            $diyformfields = $formInfo['fields'];
                            $insert_data = $diyform_plugin->getInsertData($diyformfields, $diydata);
                            $idata = $insert_data['data'];
                            $diyformdata = $idata;
                            $diyformfields = iserializer($diyformfields);
                        }
                    }
                }
            }
            $cartcount = pdo_fetchcolumn('select sum(total) from ' . tablename('ewei_shop_member_cart') . ' where openid=:openid and deleted=0 and uniacid=:uniacid limit 1', array(':uniacid' => $uniacid, ':openid' => $openid));
            if (empty($data)) {
                $data = array('uniacid' => $uniacid, 'openid' => $openid, 'goodsid' => $id, 'optionid' => $optionid, 'marketprice' => $goods['marketprice'], 'total' => $total, 'diyformid' => $diyformid, 'diyformdata' => $diyformdata, 'diyformfields' => $diyformfields, 'createtime' => time());
             	//检查商品是否开启附属礼品isgift,如果开启了,添加到购物车默认加上水果夹心的第一个.
            	$thisgood=pdo_get('ewei_shop_goods', array('id' => $id), array('isgift'));               
                if($thisgood['isgift']==1){
                	//取出一条
					$thisfruit=pdo_get('ewei_shop_fruit');  
					$thisfruit = set_medias($thisfruit, 'thumb');
					$data['fruitid']=$thisfruit['id'];
					$data['fruitimg']=$thisfruit['thumb'];
					$data['fruittitle']=$thisfruit['title'];					
                }
				
				
                
                pdo_insert('ewei_shop_member_cart', $data);
                $cartcount += $total;
                show_json(1, array('message' => '添加成功', 'cartcount' => $cartcount));
            } else {
                $data['diyformdataid'] = $diyformdataid;
                $data['diyformdata'] = $diyformdata;
                $data['diyformfields'] = $diyformfields;
                pdo_update('ewei_shop_member_cart', $data, array('id' => $data['id']));
            }
            show_json(1, array('message' => '已在购物车', 'cartcount' => $cartcount));
        } else {
            if ($operation == 'selectoption') {
                $id = intval($_GPC['id']);
                $goodsid = intval($_GPC['goodsid']);
                $cartdata = pdo_fetch('SELECT id,optionid,total FROM ' . tablename('ewei_shop_member_cart') . ' WHERE id = :id and uniacid=:uniacid and openid=:openid limit 1', array(':id' => $id, ':uniacid' => $uniacid, ':openid' => $openid));
                $cartoption = pdo_fetch('select id,title,thumb,marketprice,productprice,costprice, stock,weight,specs from ' . tablename('ewei_shop_goods_option') . ' ' . ' where uniacid=:uniacid and goodsid=:goodsid and id=:id limit 1 ', array(':id' => $cartdata['optionid'], ':uniacid' => $uniacid, ':goodsid' => $goodsid));
                $cartoption = set_medias($cartoption, 'thumb');
                $cartspecs = explode('_', $cartoption['specs']);
                $goods = pdo_fetch('SELECT id,title,thumb,total,marketprice FROM ' . tablename('ewei_shop_goods') . ' WHERE id = :id', array(':id' => $goodsid));
                $goods = set_medias($goods, 'thumb');
                $allspecs = pdo_fetchall('select * from ' . tablename('ewei_shop_goods_spec') . ' where goodsid=:id order by displayorder asc', array(':id' => $goodsid));
                foreach ($allspecs as &$s) {
                    $s['items'] = pdo_fetchall('select * from ' . tablename('ewei_shop_goods_spec_item') . ' where  `show`=1 and specid=:specid order by displayorder asc', array(':specid' => $s['id']));
                }
                unset($s);
                $options = pdo_fetchall('select id,title,thumb,marketprice,productprice,costprice, stock,weight,specs from ' . tablename('ewei_shop_goods_option') . ' where goodsid=:id order by id asc', array(':id' => $goodsid));
                $options = set_medias($options, 'thumb');
                $specs = array();
                if (count($options) > 0) {
                    $specitemids = explode('_', $options[0]['specs']);
                    foreach ($specitemids as $itemid) {
                        foreach ($allspecs as $ss) {
                            $items = $ss['items'];
                            foreach ($items as $it) {
                                if ($it['id'] == $itemid) {
                                    $specs[] = $ss;
                                    break;
                                }
                            }
                        }
                    }
                }
                show_json(1, array('cartdata' => $cartdata, 'cartoption' => $cartoption, 'cartspecs' => $cartspecs, 'goods' => $goods, 'options' => $options, 'specs' => $specs));
            } else {
                if ($operation == 'setoption' && $_W['ispost']) {
                    $id = intval($_GPC['id']);
                    $goodsid = intval($_GPC['goodsid']);
                    $optionid = intval($_GPC['optionid']);
                    $option = pdo_fetch('select id,title,thumb,marketprice,productprice,costprice, stock,weight,specs from ' . tablename('ewei_shop_goods_option') . ' ' . ' where uniacid=:uniacid and goodsid=:goodsid and id=:id limit 1 ', array(':id' => $optionid, ':uniacid' => $uniacid, ':goodsid' => $goodsid));
                    $option = set_medias($option, 'thumb');
                    if (empty($option)) {
                        show_json(0, '规格未找到');
                    }
                    pdo_update('ewei_shop_member_cart', array('optionid' => $optionid), array('id' => $id, 'uniacid' => $uniacid, 'goodsid' => $goodsid));
                    show_json(1, array('optionid' => $optionid, 'optiontitle' => $option['title']));
                } else {
                    if ($operation == 'updatenum' && $_W['ispost']) {
                        $id = intval($_GPC['id']);
                        $goodsid = intval($_GPC['goodsid']);
                        $total = intval($_GPC['total']);
                        empty($total) && ($total = 1);
                        $data = pdo_fetchall('select id,total from ' . tablename('ewei_shop_member_cart') . ' ' . ' where id=:id and uniacid=:uniacid and goodsid=:goodsid  and openid=:openid limit 1 ', array(':id' => $id, ':uniacid' => $uniacid, ':goodsid' => $goodsid, ':openid' => $openid));
                        if (empty($data)) {
                            show_json(0, '购物车数据未找到');
                        }
                        pdo_update('ewei_shop_member_cart', array('total' => $total), array('id' => $id, 'uniacid' => $uniacid, 'goodsid' => $goodsid));
                        show_json(1);
                    } else {
                        if ($operation == 'tofavorite' && $_W['ispost']) {
                            $ids = $_GPC['ids'];
                            if (empty($ids) || !is_array($ids)) {
                                show_json(0, '参数错误');
                            }
                            foreach ($ids as $id) {
                                $goodsid = pdo_fetchcolumn('select goodsid from ' . tablename('ewei_shop_member_cart') . ' where id=:id and uniacid=:uniacid and openid=:openid limit 1 ', array(':id' => $id, ':uniacid' => $uniacid, ':openid' => $openid));
                                if (!empty($goodsid)) {
                                    $fav = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_member_favorite') . ' where goodsid=:goodsid and uniacid=:uniacid and openid=:openid and deleted=0 limit 1 ', array(':goodsid' => $goodsid, ':uniacid' => $uniacid, ':openid' => $openid));
                                    if ($fav <= 0) {
                                        $fav = array('uniacid' => $uniacid, 'goodsid' => $goodsid, 'openid' => $openid, 'deleted' => 0, 'createtime' => time());
                                        pdo_insert('ewei_shop_member_favorite', $fav);
                                    }
                                }
                            }
                            $sql = 'update ' . tablename('ewei_shop_member_cart') . ' set deleted=1 where uniacid=:uniacid and openid=:openid and id in (' . implode(',', $ids) . ')';
                            pdo_query($sql, array(':uniacid' => $uniacid, ':openid' => $openid));
                            show_json(1);
                        } else {
                            if ($operation == 'remove' && $_W['ispost']) {
                                $ids = $_GPC['ids'];
                                if (empty($ids) || !is_array($ids)) {
                                    show_json(0, '参数错误');
                                }
                                $sql = 'update ' . tablename('ewei_shop_member_cart') . ' set deleted=1 where uniacid=:uniacid and openid=:openid and id in (' . implode(',', $ids) . ')';
                                pdo_query($sql, array(':uniacid' => $uniacid, ':openid' => $openid));
                                show_json(1);
                            }
                        }
                    }
                }
            }
        }
    }
}
include $this->template('shop/cart');