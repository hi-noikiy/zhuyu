<?php
 if(!pdo_fieldexists('ewei_shop_goods', 'isnodiscount')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `isnodiscount` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'showlevels')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD  `showlevels` text;");
}

 if(!pdo_fieldexists('ewei_shop_goods', 'buylevels')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD    `buylevels` text;");
}

 if(!pdo_fieldexists('ewei_shop_goods', 'showgroups')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `showgroups` text;");
}

 if(!pdo_fieldexists('ewei_shop_goods', 'buygroups')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `buygroups` text;");
}

 if(!pdo_fieldexists('ewei_shop_goods', 'isverify')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD  `isverify` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'noticeopenid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `noticeopenid` text;");
}

 if(!pdo_fieldexists('ewei_shop_goods', 'storeids')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `storeids` text;");
}

 if(!pdo_fieldexists('ewei_shop_order_goods', 'realprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD    `realprice` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'isverify')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD  `isverify` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'verified')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD   `verified` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'verifyopenid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD   `verifyopenid` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'verifytime')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD   `verifytime` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'verifystoreid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD   `verifystoreid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'verifycode')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD    `verifycode` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'childtime')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD   `childtime` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'inviter')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD    `inviter` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'realprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD     `realprice` decimal(10,2) DEFAULT '0.00';");
}
//0818
 if(!pdo_fieldexists('ewei_shop_category', 'advimg')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_category')." ADD     `advimg` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_category', 'advurl')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_category')." ADD    `advurl` varchar(500) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_category', 'level')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_category')." ADD   `level` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'tcate')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD    `tcate` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'noticetype')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD     `noticetype` tinyint(3) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_goods_option', 'goodssn')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods_option')." ADD `goodssn` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods_option', 'productsn')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods_option')." ADD `productsn` varchar(255) DEFAULT '';");
}

 if(!pdo_fieldexists('ewei_shop_member', 'agentnotupgrade')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD   `agentnotupgrade` tinyint(3) DEFAULT '0';");
}

 if(pdo_fieldexists('ewei_shop_order', 'verifycode')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." CHANGE   `verifycode`  `verifycode` text;");
}

 if(!pdo_fieldexists('ewei_shop_order_goods', 'goodssn')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD    `goodssn` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'productsn')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD     `productsn` varchar(255) DEFAULT '';");
}

 if(!pdo_fieldexists('ewei_shop_poster', 'entrytext')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_poster')." ADD     `entrytext` varchar(255) DEFAULT '';");
}
//0910
 if(!pdo_fieldexists('ewei_shop_commission_shop', 'selectgoods')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_commission_shop')." ADD     `selectgoods` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_commission_shop', 'selectcategory')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_commission_shop')." ADD    `selectcategory` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_commission_shop', 'goodsids')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_commission_shop')." ADD   `goodsids` text;");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'needfollow')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD  `needfollow` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'followtip')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD    `followtip` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'followurl')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD    `followurl` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'deduct')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD    `deduct` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'agentselectgoods')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD    `agentselectgoods` tinyint(3) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_order', 'deductprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD     `deductprice` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'deductcredit')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `deductcredit` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'deductcredit2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `deductcredit2` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'deductenough')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD     `deductenough` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order_refund', 'refundtype')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_refund')." ADD     `refundtype` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_plugin', 'status')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_plugin')." ADD     `status` tinyint(3) DEFAULT '0';");
}
//1016 add
 if(pdo_fieldexists('ewei_shop_goods', 'noticetype')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." CHANGE   `noticetype`   `noticetype` text;");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'virtual')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `virtual` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'cates')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `cates` text;");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'discounts')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD  `discounts` text;");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'nocommission')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `nocommission` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'hidecommission')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `hidecommission` tinyint(3) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_order', 'virtual')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD   `virtual` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'virtual_info')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD     `virtual_info` text;");
}
 if(!pdo_fieldexists('ewei_shop_order', 'virtual_str')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD     `virtual_str` text;");
}

 if(!pdo_fieldexists('ewei_shop_sysset', 'sec')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_sysset')." ADD    `sec` text;");
}
 if(!pdo_fieldexists('ewei_shop_goods_option', 'virtual')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods_option')." ADD   `virtual` int(11) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_goods_spec_item', 'virtual')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods_spec_item')." ADD    `virtual` int(11) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_member', 'agentblack')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD    `agentblack` tinyint(3) DEFAULT '0';");
}
//1121 add
if(!pdo_fieldexists('ewei_shop_goods', 'ccates')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." CHANGE  `cates`  `ccates` text;");
}

 if(!pdo_fieldexists('ewei_shop_goods', 'pcates')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `pcates` text;");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'tcates')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD    `tcates` text;");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'artid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD    `artid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'detail_logo')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `detail_logo` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'detail_shopname')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `detail_shopname` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'detail_btntext1')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD  `detail_btntext1` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'detail_btnurl1')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `detail_btnurl1` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'detail_btntext2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `detail_btntext2` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'detail_btnurl2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD  `detail_btnurl2` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'detail_totaltitle')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD   `detail_totaltitle` varchar(255) DEFAULT '';");
}

 if(!pdo_fieldexists('ewei_shop_order', 'address')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD  `address` text;");
}
 if(!pdo_fieldexists('ewei_shop_order', 'sysdeleted')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD  `sysdeleted` tinyint(3) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_order_goods', 'nocommission')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD   `nocommission` tinyint(3) DEFAULT '0';");
}
//1.10.6 add  by QQ  1601408008
 if(!pdo_fieldexists('ewei_shop_creditshop_log', 'storeid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_creditshop_log')." ADD    `storeid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_creditshop_log', 'realname')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_creditshop_log')." ADD   `realname` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_creditshop_log', 'mobile')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_creditshop_log')." ADD   `mobile` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_creditshop_log', 'couponid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_creditshop_log')." ADD   `couponid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_creditshop_log', 'dupdate1')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_creditshop_log')." ADD   `dupdate1` tinyint(3) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_order', 'ordersn2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD    `ordersn2` int(11) DEFAULT '0';");
}
if(!pdo_fieldexists('ewei_shop_order', 'changeprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD    `changeprice` decimal(10,2) DEFAULT '0.00';");
}
if(!pdo_fieldexists('ewei_shop_order', 'changedispatchprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD    `changedispatchprice` decimal(10,2) DEFAULT '0.00';");
}
if(!pdo_fieldexists('ewei_shop_order', 'oldprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD    `oldprice` decimal(10,2) DEFAULT '0.00';");
}
if(!pdo_fieldexists('ewei_shop_order', 'olddispatchprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD    `olddispatchprice` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'isvirtual')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD   `isvirtual` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'changeprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD    `changeprice` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'oldprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD    `oldprice` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'commissions')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD    `commissions` text;");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'ednum')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD    `ednum` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'edmoney')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD     `edmoney` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'edareas')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `edareas` text;");
}
 if(!pdo_fieldexists('ewei_shop_member', 'fixagentid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `fixagentid` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_poster', 'reccouponid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_poster')." ADD      `reccouponid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_poster', 'reccouponnum')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_poster')." ADD        `reccouponnum` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_poster', 'subcouponid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_poster')." ADD         `subcouponid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_poster', 'subcouponnum')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_poster')." ADD         `subcouponnum` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_plugin', 'category')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_plugin')." ADD         `category` varchar(255) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_poster_log', 'reccouponid')) {
  pdo_query("ALTER TABLE ".tablename('ewei_shop_poster_log')." ADD      `reccouponid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_poster_log', 'reccouponnum')) {
  pdo_query("ALTER TABLE ".tablename('ewei_shop_poster_log')." ADD        `reccouponnum` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_poster_log', 'subcouponid')) {
  pdo_query("ALTER TABLE ".tablename('ewei_shop_poster_log')." ADD         `subcouponid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_poster_log', 'subcouponnum')) {
  pdo_query("ALTER TABLE ".tablename('ewei_shop_poster_log')." ADD         `subcouponnum` int(11) DEFAULT '0';");
}
/**/
 if(!pdo_fieldexists('ewei_shop_goods', 'deduct2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD         `deduct2` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'couponid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD         `couponid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'couponprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD         `couponprice` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_creditshop_goods', 'goodstype')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_creditshop_goods')." ADD      `goodstype` tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_creditshop_goods', 'couponid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_creditshop_goods')." ADD      `couponid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member_log', 'gives')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member_log')." ADD      `gives` decimal(10,2) DEFAULT NULL;");
}
 if(!pdo_fieldexists('ewei_shop_member_log', 'couponid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member_log')." ADD      `couponid` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_commission_level', 'downcount')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_commission_level')." ADD      `downcount` int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_commission_level', 'ordercount')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_commission_level')." ADD      `ordercount` int(11) DEFAULT '0';");
}
//1.11.3 add  by QQ  1601408008
 if(!pdo_fieldexists('ewei_shop_goods', 'diyformtype')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `diyformtype`  tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'diyformid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `diyformid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'diymode')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `diymode`  tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'diymemberid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `diymemberid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'diymemberfields')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `diymemberfields`  text;");
}
 if(!pdo_fieldexists('ewei_shop_member', 'diymemberdata')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `diymemberdata`  text;");
}
 if(!pdo_fieldexists('ewei_shop_member', 'diymemberdataid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `diymemberdataid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'diycommissionid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `diycommissionid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'diycommissionfields')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `diycommissionfields`  text;");
}
 if(!pdo_fieldexists('ewei_shop_member', 'diycommissiondata')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `diycommissiondata`  text;");
}
 if(!pdo_fieldexists('ewei_shop_member', 'diycommissiondataid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `diycommissiondataid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'isblack')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `isblack`  tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member_cart', 'diyformdataid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member_cart')." ADD      `diyformdataid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member_cart', 'diyformdata')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member_cart')." ADD      `diyformdata`  text;");
}
 if(!pdo_fieldexists('ewei_shop_member_cart', 'diyformfields')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member_cart')." ADD      `diyformfields`  text;");
}
 if(!pdo_fieldexists('ewei_shop_member_cart', 'diyformid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member_cart')." ADD      `diyformid`  int(11) DEFAULT '0';");
}

if(!pdo_fieldexists('ewei_shop_order', 'diyformdata')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `diyformdata`  text;");
}
if(!pdo_fieldexists('ewei_shop_order', 'diyformfields')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `diyformfields`  text;");
}
 if(!pdo_fieldexists('ewei_shop_order', 'diyformid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `diyformid`  int(11) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_order_goods', 'diyformdataid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD      `diyformdataid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'diyformdata')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD      `diyformdata`  text;");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'diyformfields')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD      `diyformfields`  text;");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'diyformid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD      `diyformid`  int(11) DEFAULT '0';");
}
//1.11.7 add  by QQ  1601408008
 if(!pdo_fieldexists('ewei_shop_dispatch', 'calculatetype')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_dispatch')." ADD      `calculatetype`  tinyint(1) DEFAULT '0';");
}
if(!pdo_fieldexists('ewei_shop_dispatch', 'firstnum')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_dispatch')." ADD      `firstnum`  int(11) DEFAULT '0';");
}
if(!pdo_fieldexists('ewei_shop_dispatch', 'firstnumprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_dispatch')." ADD      `firstnumprice`  decimal(10,2) DEFAULT '0.00';");
}
if(!pdo_fieldexists('ewei_shop_dispatch', 'secondnumprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_dispatch')." ADD      `secondnumprice`  decimal(10,2) DEFAULT '0.00';");
}
if(!pdo_fieldexists('ewei_shop_dispatch', 'isdefault')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_dispatch')." ADD      `isdefault`  tinyint(1) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'diymode')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `diymode`  tinyint(3) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'dispatchtype')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `dispatchtype`   tinyint(1) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_goods', 'dispatchprice')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `dispatchprice`   decimal(10,2) DEFAULT '0.00';");
}

 if(!pdo_fieldexists('ewei_shop_goods', 'dispatchid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `dispatchid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'manydeduct')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `manydeduct`   tinyint(1) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_goods', 'shorttitle')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_goods')." ADD      `shorttitle`  varchar(255) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'commission')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `commission` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_member', 'commission_pay')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_member')." ADD      `commission_pay` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'storeid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `storeid`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'printstate')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `printstate`  tinyint(1) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'printstate2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `printstate2`  tinyint(1) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order', 'address_send')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order')." ADD      `address_send`  text;");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'openid')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD      `openid`  varchar(255) DEFAULT NULL;");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'printstate')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD      `printstate`  tinyint(1) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_order_goods', 'printstate2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_order_goods')." ADD      `printstate2`  tinyint(1) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_postera', 'starttext')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_postera')." ADD      `starttext`  varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_postera', 'endtext')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_postera')." ADD      `endtext`  varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_store', 'realname')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_store')." ADD      `realname`  varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_store', 'mobile')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_store')." ADD      `mobile`  varchar(255) DEFAULT '';");
}

 if(!pdo_fieldexists('ewei_shop_store', 'fetchtime')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_store')." ADD      `fetchtime`  varchar(255) DEFAULT '';");
}

 if(!pdo_fieldexists('ewei_shop_store', 'type')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_store')." ADD      `type`  tinyint(1) DEFAULT '0';");
}

 if(!pdo_fieldexists('ewei_shop_article', 'article_rule_credittotal')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_rule_credittotal`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_rule_moneytotal')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_rule_moneytotal`   decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_rule_credit2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_rule_credit2`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_rule_money2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_rule_money2`   decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_rule_creditm')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_rule_creditm`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_rule_moneym')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_rule_moneym` decimal(10,2) DEFAULT '0.00';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_rule_creditm2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_rule_creditm2`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_rule_moneym2')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_rule_moneym2` decimal(10,2) DEFAULT '0.00';");
}

 if(!pdo_fieldexists('ewei_shop_article', 'article_readtime')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_readtime`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_areas')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_areas` varchar(255) DEFAULT '';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_endtime')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_endtime`  int(11) DEFAULT '0';");
}
 if(!pdo_fieldexists('ewei_shop_article', 'article_hasendtime')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `article_hasendtime`  tinyint(3) DEFAULT '0'");
}
 if(!pdo_fieldexists('ewei_shop_article', 'displayorder')) {
	pdo_query("ALTER TABLE ".tablename('ewei_shop_article')." ADD      `displayorder`  int(11) DEFAULT '0';");
}

$sql = "
CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diyform_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diyform_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `typeid` int(11) NOT NULL DEFAULT '0' COMMENT '类型id',
  `cid` int(11) DEFAULT '0' COMMENT '关联id',
  `diyformfields` text,
  `fields` text NOT NULL COMMENT '字符集',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '使用者openid',
  `type` tinyint(2) DEFAULT '0' COMMENT '该数据所属模块',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_typeid` (`typeid`),
  KEY `idx_cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diyform_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `typeid` int(11) DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `diyformfields` text,
  `fields` text NOT NULL COMMENT '字符集',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '使用者openid',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型',
  `diyformid` int(11) DEFAULT '0',
  `diyformdata` text,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diyform_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `cate` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `fields` text NOT NULL COMMENT '字段集',
  `usedata` int(11) NOT NULL DEFAULT '0' COMMENT '已用数据',
  `alldata` int(11) NOT NULL DEFAULT '0' COMMENT '全部数据',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_cate` (`cate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exhelper_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '单据分类 1为快递单 2为发货单',
  `expressname` varchar(255) DEFAULT '',
  `expresscom` varchar(255) NOT NULL DEFAULT '',
  `express` varchar(255) NOT NULL DEFAULT '',
  `width` decimal(10,2) DEFAULT '0.00',
  `datas` text,
  `height` decimal(10,2) DEFAULT '0.00',
  `bg` varchar(255) DEFAULT '',
  `isdefault` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isdefault` (`isdefault`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exhelper_senduser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `sendername` varchar(255) DEFAULT '' COMMENT '发件人',
  `sendertel` varchar(255) DEFAULT '' COMMENT '发件人联系电话',
  `sendersign` varchar(255) DEFAULT '' COMMENT '发件人签名',
  `sendercode` int(11) DEFAULT NULL COMMENT '发件地址邮编',
  `senderaddress` varchar(255) DEFAULT '' COMMENT '发件地址',
  `sendercity` varchar(255) DEFAULT NULL COMMENT '发件城市',
  `isdefault` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isdefault` (`isdefault`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exhelper_sys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT 'localhost',
  `port` int(11) NOT NULL DEFAULT '8000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ims_ewei_shop_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `express_name` varchar(50) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `express_price` varchar(10) DEFAULT '',
  `express_area` varchar(100) DEFAULT '',
  `express_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_coupon'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `catid` int(11) DEFAULT '0',
  `couponname` varchar(255) DEFAULT '',
  `gettype` tinyint(3) DEFAULT '0',
  `getmax` int(11) DEFAULT '0',
  `usetype` tinyint(3) DEFAULT '0' COMMENT '消费方式 0 付款使用 1 下单使用',
  `returntype` tinyint(3) DEFAULT '0' COMMENT '退回方式 0 不可退回 1 取消订单(未付款) 2.退款可以退回',
  `bgcolor` varchar(255) DEFAULT '',
  `enough` decimal(10,2) DEFAULT '0.00',
  `timelimit` tinyint(3) DEFAULT '0' COMMENT '0 领取后几天有效 1 时间范围',
  `coupontype` tinyint(3) DEFAULT '0' COMMENT '0 优惠券 1 充值券',
  `timedays` int(11) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '折扣',
  `deduct` decimal(10,2) DEFAULT '0.00' COMMENT '抵扣',
  `backtype` tinyint(3) DEFAULT '0',
  `backmoney` varchar(50) DEFAULT '' COMMENT '返现',
  `backcredit` varchar(50) DEFAULT '' COMMENT '返积分',
  `backredpack` varchar(50) DEFAULT '',
  `backwhen` tinyint(3) DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `desc` text,
  `createtime` int(11) DEFAULT '0',
  `total` int(11) DEFAULT '0' COMMENT '数量 -1 不限制',
  `status` tinyint(3) DEFAULT '0' COMMENT '可用',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '购买价格',
  `respdesc` text COMMENT '推送描述',
  `respthumb` varchar(255) DEFAULT '' COMMENT '推送图片',
  `resptitle` varchar(255) DEFAULT '' COMMENT '推送标题',
  `respurl` varchar(255) DEFAULT '',
  `credit` int(11) DEFAULT '0',
  `usecredit2` tinyint(3) DEFAULT '0',
  `remark` varchar(1000) DEFAULT '',
  `descnoset` tinyint(3) DEFAULT '0',
  `pwdkey` varchar(255) DEFAULT '',
  `pwdsuc` text,
  `pwdfail` text,
  `pwdurl` varchar(255) DEFAULT '',
  `pwdask` text,
  `pwdstatus` tinyint(3) DEFAULT '0',
  `pwdtimes` int(11) DEFAULT '0',
  `pwdfull` text,
  `pwdwords` text,
  `pwdopen` tinyint(3) DEFAULT '0',
  `pwdown` text,
  `pwdexit` varchar(255) DEFAULT '',
  `pwdexitstr` text,
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_coupontype` (`coupontype`),
  KEY `idx_timestart` (`timestart`),
  KEY `idx_timeend` (`timeend`),
  KEY `idx_timelimit` (`timelimit`),
  KEY `idx_status` (`status`),
  KEY `idx_givetype` (`backtype`),
  KEY `idx_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_coupon_category'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_coupon_data'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `couponid` int(11) DEFAULT '0',
  `gettype` tinyint(3) DEFAULT '0' COMMENT '获取方式 0 发放 1 领取 2 积分商城',
  `used` int(11) DEFAULT '0',
  `usetime` int(11) DEFAULT '0',
  `gettime` int(11) DEFAULT '0' COMMENT '获取时间',
  `senduid` int(11) DEFAULT '0',
  `ordersn` varchar(255) DEFAULT '',
  `back` tinyint(3) DEFAULT '0',
  `backtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_couponid` (`couponid`),
  KEY `idx_gettype` (`gettype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_coupon_guess'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `couponid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `times` int(11) DEFAULT '0',
  `pwdkey` varchar(255) DEFAULT '',
  `ok` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_coupon_log'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `logno` varchar(255) DEFAULT '',
  `openid` varchar(255) DEFAULT '',
  `couponid` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `paystatus` tinyint(3) DEFAULT '0',
  `creditstatus` tinyint(3) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `paytype` tinyint(3) DEFAULT '0',
  `getfrom` tinyint(3) DEFAULT '0' COMMENT '0 发放 1 中心 2 积分兑换',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_couponid` (`couponid`),
  KEY `idx_status` (`status`),
  KEY `idx_paystatus` (`paystatus`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_getfrom` (`getfrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_poster'). " (
   `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `type` tinyint(3) DEFAULT '0' COMMENT '1 首页 2 小店 3 商城 4 自定义',
  `title` varchar(255) DEFAULT '',
  `bg` varchar(255) DEFAULT '',
  `data` text,
  `keyword` varchar(255) DEFAULT '',
  `times` int(11) DEFAULT '0',
  `follows` int(11) DEFAULT '0',
  `isdefault` tinyint(3) DEFAULT '0',
  `resptitle` varchar(255) DEFAULT '',
  `respthumb` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `respdesc` varchar(255) DEFAULT '',
  `respurl` varchar(255) DEFAULT '',
  `waittext` varchar(255) DEFAULT '',
  `oktext` varchar(255) DEFAULT '',
  `subcredit` int(11) DEFAULT '0',
  `submoney` decimal(10,2) DEFAULT '0.00',
  `reccredit` int(11) DEFAULT '0',
  `recmoney` decimal(10,2) DEFAULT '0.00',
  `paytype` tinyint(1) DEFAULT '0',
  `scantext` varchar(255) DEFAULT '',
  `subtext` varchar(255) DEFAULT '',
  `beagent` tinyint(3) DEFAULT '0',
  `bedown` tinyint(3) DEFAULT '0',
  `isopen` tinyint(3) DEFAULT '0',
  `opentext` varchar(255) DEFAULT '',
  `openurl` varchar(255) DEFAULT '',
  `templateid` varchar(255) DEFAULT '',
  `subpaycontent` text,
  `recpaycontent` text,
  `entrytext` varchar(255) DEFAULT '',
  `reccouponid` int(11) DEFAULT '0',
  `reccouponnum` int(11) DEFAULT '0',
  `subcouponid` int(11) DEFAULT '0',
  `subcouponnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_type` (`type`),
  KEY `idx_times` (`times`),
  KEY `idx_isdefault` (`isdefault`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_poster_log'). " (
 `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `posterid` int(11) DEFAULT '0',
  `from_openid` varchar(255) DEFAULT '',
  `subcredit` int(11) DEFAULT '0',
  `submoney` decimal(10,2) DEFAULT '0.00',
  `reccredit` int(11) DEFAULT '0',
  `recmoney` decimal(10,2) DEFAULT '0.00',
  `createtime` int(11) DEFAULT '0',
  `reccouponid` int(11) DEFAULT '0',
  `reccouponnum` int(11) DEFAULT '0',
  `subcouponid` int(11) DEFAULT '0',
  `subcouponnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_posterid` (`posterid`),
  FULLTEXT KEY `idx_from_openid` (`from_openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_poster_qr'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `openid` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(3) DEFAULT '0',
  `sceneid` int(11) DEFAULT '0',
  `mediaid` varchar(255) DEFAULT '',
  `ticket` varchar(250) NOT NULL,
  `url` varchar(80) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `qrimg` varchar(1000) DEFAULT '',
  `scenestr` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_acid` (`acid`),
  KEY `idx_sceneid` (`sceneid`),
  KEY `idx_type` (`type`),
  FULLTEXT KEY `idx_openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_poster_scan'). " (
   `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `posterid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `from_openid` varchar(255) DEFAULT '',
  `scantime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_posterid` (`posterid`),
  KEY `idx_scantime` (`scantime`),
  FULLTEXT KEY `idx_openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_postera'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `type` tinyint(3) DEFAULT '0' COMMENT '1 首页 2 小店 3 商城 4 自定义',
  `days` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `bg` varchar(255) DEFAULT '',
  `data` text,
  `keyword` varchar(255) DEFAULT '',
  `isdefault` tinyint(3) DEFAULT '0',
  `resptitle` varchar(255) DEFAULT '',
  `respthumb` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `respdesc` varchar(255) DEFAULT '',
  `respurl` varchar(255) DEFAULT '',
  `waittext` varchar(255) DEFAULT '',
  `oktext` varchar(255) DEFAULT '',
  `subcredit` int(11) DEFAULT '0',
  `submoney` decimal(10,2) DEFAULT '0.00',
  `reccredit` int(11) DEFAULT '0',
  `recmoney` decimal(10,2) DEFAULT '0.00',
  `scantext` varchar(255) DEFAULT '',
  `subtext` varchar(255) DEFAULT '',
  `beagent` tinyint(3) DEFAULT '0',
  `bedown` tinyint(3) DEFAULT '0',
  `isopen` tinyint(3) DEFAULT '0',
  `opentext` varchar(255) DEFAULT '',
  `openurl` varchar(255) DEFAULT '',
  `paytype` tinyint(1) NOT NULL DEFAULT '0',
  `subpaycontent` text,
  `recpaycontent` varchar(255) DEFAULT '',
  `templateid` varchar(255) DEFAULT '',
  `entrytext` varchar(255) DEFAULT '',
  `reccouponid` int(11) DEFAULT '0',
  `reccouponnum` int(11) DEFAULT '0',
  `subcouponid` int(11) DEFAULT '0',
  `subcouponnum` int(11) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_type` (`type`),
  KEY `idx_isdefault` (`isdefault`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_postera_log'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `posterid` int(11) DEFAULT '0',
  `from_openid` varchar(255) DEFAULT '',
  `subcredit` int(11) DEFAULT '0',
  `submoney` decimal(10,2) DEFAULT '0.00',
  `reccredit` int(11) DEFAULT '0',
  `recmoney` decimal(10,2) DEFAULT '0.00',
  `createtime` int(11) DEFAULT '0',
  `reccouponid` int(11) DEFAULT '0',
  `reccouponnum` int(11) DEFAULT '0',
  `subcouponid` int(11) DEFAULT '0',
  `subcouponnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_posteraid` (`posterid`),
  FULLTEXT KEY `idx_from_openid` (`from_openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_postera_qr'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `openid` varchar(100) NOT NULL DEFAULT '',
  `posterid` int(11) DEFAULT '0',
  `type` tinyint(3) DEFAULT '0',
  `sceneid` int(11) DEFAULT '0',
  `mediaid` varchar(255) DEFAULT '',
  `ticket` varchar(250) NOT NULL,
  `url` varchar(80) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `qrimg` varchar(1000) DEFAULT '',
  `expire` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acid` (`acid`),
  KEY `idx_sceneid` (`sceneid`),
  KEY `idx_type` (`type`),
  KEY `idx_posterid` (`posterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS ".tablename('ewei_shop_system_copyright'). " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `copyright` text,
  `bgcolor` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;
DROP TABLE IF EXISTS  ".tablename('ewei_shop_plugin'). " ;

CREATE TABLE IF NOT EXISTS " . tablename('ewei_shop_plugin') . " (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayorder` int(11) DEFAULT '0',
  `identity` varchar(50) DEFAULT '',
  `name` varchar(50) DEFAULT '',
  `version` varchar(10) DEFAULT '',
  `author` varchar(20) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `category` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_displayorder` (`displayorder`),
  FULLTEXT KEY `idx_identity` (`identity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO " . tablename('ewei_shop_plugin') . " (`id`,`displayorder`,`identity`,`name`,`version`,`author`,`status`,`category`) VALUES
(1, 1,  'qiniu',  '七牛存储', '1.0',  '官方', '1','tool'),
(2, 2,  'taobao', '淘宝助手', '1.0',  '官方', '1','tool'),
(3, 3,  'commission','人人分销','1.0','官方','1','biz'),
(4, 4,  'poster','超级海报','1.2','官方','1','sale'),
(5, 5,  'verify','O2O核销','1.0','官方','1','biz'),
(6, 6,  'perm','分权系统','1.0','官方','0','help'),
(7, 7,  'sale','营销宝','1.0','官方','0','sale'),
(8, 8,  'tmessage','会员群发','1.0','官方','1','tool'),
(9, 9, 'designer', '店铺装修', '1.0', '官方', '1','tool'),
(10, 10,  'creditshop','积分商城','1.0','官方','0','biz'),
(11, 11,  'virtual','虚拟物品','1.0','官方','0','biz'),
(12, 12,  'article', '文章营销','1.0', '官方', '1','sale'),
(13,13,'coupon','超级券','1.0','官方','0','sale'),
(14,14,'postera','活动海报','1.0','官方','0','sale'),
(15, 15, 'system', '系统工具', '1.0', '官方', 0, 'help'),
('16','16','exhelper','快递助手','1.0','官方','0','help'),
('17','17','diyform', '自定义表单', '1.0', '官方', 1, 'help');

";
pdo_query($sql);