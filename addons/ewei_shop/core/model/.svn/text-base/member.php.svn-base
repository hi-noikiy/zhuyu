<?php

//decode 
if (!defined('IN_IA')) {
    die('Access Denied');
}
class Ewei_DShop_Member
{
	
	
	//获取购物车的数量
	public function getUserCart($openid){
			
		$cartres = pdo_getall('ewei_shop_member_cart', array('openid' => $openid,'deleted'=>0));
		
		return count($cartres);

	}
    public function getInfo($_var_0 = '')
    {
        global $_W;
        $_var_1 = intval($_var_0);
        if ($_var_1 == 0) {
            $_var_2 = pdo_fetch('select * from ' . tablename('ewei_shop_member') . ' where openid=:openid and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $_var_0));
        } else {
            $_var_2 = pdo_fetch('select * from ' . tablename('ewei_shop_member') . ' where id=:id  and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $_var_1));
        }
        if (!empty($_var_2['uid'])) {
            load()->model('mc');
            $_var_1 = mc_openid2uid($_var_2['openid']);
            $_var_3 = mc_fetch($_var_1, array('credit1', 'credit2', 'birthyear', 'birthmonth', 'birthday', 'gender', 'avatar', 'resideprovince', 'residecity', 'nickname'));
            $_var_2['credit1'] = $_var_3['credit1'];
            $_var_2['credit2'] = $_var_3['credit2'];
            $_var_2['birthyear'] = empty($_var_2['birthyear']) ? $_var_3['birthyear'] : $_var_2['birthyear'];
            $_var_2['birthmonth'] = empty($_var_2['birthmonth']) ? $_var_3['birthmonth'] : $_var_2['birthmonth'];
            $_var_2['birthday'] = empty($_var_2['birthday']) ? $_var_3['birthday'] : $_var_2['birthday'];
            $_var_2['nickname'] = empty($_var_2['nickname']) ? $_var_3['nickname'] : $_var_2['nickname'];
            $_var_2['gender'] = empty($_var_2['gender']) ? $_var_3['gender'] : $_var_2['gender'];
            $_var_2['sex'] = $_var_2['gender'];
            $_var_2['avatar'] = empty($_var_2['avatar']) ? $_var_3['avatar'] : $_var_2['avatar'];
            $_var_2['headimgurl'] = $_var_2['avatar'];
            $_var_2['province'] = empty($_var_2['province']) ? $_var_3['resideprovince'] : $_var_2['province'];
            $_var_2['city'] = empty($_var_2['city']) ? $_var_3['residecity'] : $_var_2['city'];
        }
        if (!empty($_var_2['birthyear']) && !empty($_var_2['birthmonth']) && !empty($_var_2['birthday'])) {
            $_var_2['birthday'] = $_var_2['birthyear'] . '-' . (strlen($_var_2['birthmonth']) <= 1 ? '0' . $_var_2['birthmonth'] : $_var_2['birthmonth']) . '-' . (strlen($_var_2['birthday']) <= 1 ? '0' . $_var_2['birthday'] : $_var_2['birthday']);
        }
        if (empty($_var_2['birthday'])) {
            $_var_2['birthday'] = '';
        }
        return $_var_2;
    }
    public function getMember($_var_0 = '')
    {
        global $_W;
        $_var_1 = intval($_var_0);
        if (empty($_var_1)) {
            $_var_2 = pdo_fetch('select * from ' . tablename('ewei_shop_member') . ' where  openid=:openid and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $_var_0));
        } else {
            $_var_2 = pdo_fetch('select * from ' . tablename('ewei_shop_member') . ' where id=:id and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $_var_1));
        }
        if (!empty($_var_2)) {
            $_var_0 = $_var_2['openid'];
            if (empty($_var_2['uid'])) {
                $_var_4 = m('user')->followed($_var_0);
                if ($_var_4) {
                    load()->model('mc');
                    $_var_1 = mc_openid2uid($_var_0);
                    if (!empty($_var_1)) {
                        $_var_2['uid'] = $_var_1;
                        $_var_5 = array('uid' => $_var_1);
                        if ($_var_2['credit1'] > 0) {
                            mc_credit_update($_var_1, 'credit1', $_var_2['credit1']);
                            $_var_5['credit1'] = 0;
                        }
                        if ($_var_2['credit2'] > 0) {
                            mc_credit_update($_var_1, 'credit2', $_var_2['credit2']);
                            $_var_5['credit2'] = 0;
                        }
                        if (!empty($_var_5)) {
                            pdo_update('ewei_shop_member', $_var_5, array('id' => $_var_2['id']));
                        }
                    }
                }
            }
            $_var_6 = $this->getCredits($_var_0);
            $_var_2['credit1'] = $_var_6['credit1'];
            $_var_2['credit2'] = $_var_6['credit2'];
        }
        return $_var_2;
    }
    public function getMid()
    {
        global $_W;
        $_var_0 = m('user')->getOpenid();
        $_var_7 = $this->getMember($_var_0);
        return $_var_7['id'];
    }
    public function setCredit($_var_0 = '', $_var_8 = 'credit1', $_var_6 = 0, $_var_9 = array())
    {
        global $_W;
        load()->model('mc');
        $_var_1 = mc_openid2uid($_var_0);
        if (!empty($_var_1)) {
            $_var_10 = pdo_fetchcolumn("SELECT {$_var_8} FROM " . tablename('mc_members') . ' WHERE `uid` = :uid', array(':uid' => $_var_1));
            $_var_11 = $_var_6 + $_var_10;
            if ($_var_11 <= 0) {
                $_var_11 = 0;
            }
            pdo_update('mc_members', array($_var_8 => $_var_11), array('uid' => $_var_1));
            if (empty($_var_9) || !is_array($_var_9)) {
                $_var_9 = array($_var_1, '未记录');
            }
            $_var_12 = array('uid' => $_var_1, 'credittype' => $_var_8, 'uniacid' => $_W['uniacid'], 'num' => $_var_6, 'module' => 'ewei_shop', 'createtime' => TIMESTAMP, 'operator' => intval($_var_9[0]), 'remark' => $_var_9[1]);
            pdo_insert('mc_credits_record', $_var_12);
        } else {
            $_var_10 = pdo_fetchcolumn("SELECT {$_var_8} FROM " . tablename('ewei_shop_member') . ' WHERE  uniacid=:uniacid and openid=:openid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $_var_0));
            $_var_11 = $_var_6 + $_var_10;
            if ($_var_11 <= 0) {
                $_var_11 = 0;
            }
            pdo_update('ewei_shop_member', array($_var_8 => $_var_11), array('uniacid' => $_W['uniacid'], 'openid' => $_var_0));
        }
    }
    public function getCredit($_var_0 = '', $_var_8 = 'credit1')
    {
        global $_W;
        load()->model('mc');
        $_var_1 = mc_openid2uid($_var_0);
        if (!empty($_var_1)) {
            return pdo_fetchcolumn("SELECT {$_var_8} FROM " . tablename('mc_members') . ' WHERE `uid` = :uid', array(':uid' => $_var_1));
        } else {
            return pdo_fetchcolumn("SELECT {$_var_8} FROM " . tablename('ewei_shop_member') . ' WHERE  openid=:openid and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $_var_0));
        }
    }
    public function getCredits($_var_0 = '', $_var_13 = array('credit1', 'credit2'))
    {
        global $_W;
        load()->model('mc');
        $_var_1 = mc_openid2uid($_var_0);
        $_var_14 = implode(',', $_var_13);
        if (!empty($_var_1)) {
            return pdo_fetch("SELECT {$_var_14} FROM " . tablename('mc_members') . ' WHERE `uid` = :uid limit 1', array(':uid' => $_var_1));
        } else {
            return pdo_fetch("SELECT {$_var_14} FROM " . tablename('ewei_shop_member') . ' WHERE  openid=:openid and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $_var_0));
        }
    }
    public function checkMember($_var_0 = '')
    {
        global $_W, $_GPC;
        if (strexists($_SERVER['REQUEST_URI'], '/web/')) {
            return;
        }
        if (empty($_var_0)) {
            $_var_0 = m('user')->getOpenid();
        }
        if (empty($_var_0)) {
            return;
        }
        $_var_7 = m('member')->getMember($_var_0);
        $_var_15 = m('user')->getInfo();
        $_var_4 = m('user')->followed($_var_0);
        $_var_1 = 0;
        $_var_16 = array();
        load()->model('mc');
        if ($_var_4) {
            $_var_1 = mc_openid2uid($_var_0);
            $_var_16 = mc_fetch($_var_1, array('realname', 'mobile', 'avatar', 'resideprovince', 'residecity', 'residedist'));
        }
        if (empty($_var_7)) {
            $_var_7 = array('uniacid' => $_W['uniacid'], 'uid' => $_var_1, 'openid' => $_var_0, 'realname' => !empty($_var_16['realname']) ? $_var_16['realname'] : '', 'mobile' => !empty($_var_16['mobile']) ? $_var_16['mobile'] : '', 'nickname' => !empty($_var_16['nickname']) ? $_var_16['nickname'] : $_var_15['nickname'], 'avatar' => !empty($_var_16['avatar']) ? $_var_16['avatar'] : $_var_15['avatar'], 'gender' => !empty($_var_16['gender']) ? $_var_16['gender'] : $_var_15['sex'], 'province' => !empty($_var_16['residecity']) ? $_var_16['resideprovince'] : $_var_15['province'], 'city' => !empty($_var_16['residecity']) ? $_var_16['residecity'] : $_var_15['city'], 'area' => !empty($_var_16['residedist']) ? $_var_16['residedist'] : '', 'createtime' => time(), 'status' => 0);
            pdo_insert('ewei_shop_member', $_var_7);
        } else {
            if ($_var_7['isblack'] == 1) {
                die('<!DOCTYPE html>
						<html>
							<head>
								<meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=0\'>
								<title>抱歉，出错了</title><meta charset=\'utf-8\'><meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=0\'><link rel=\'stylesheet\' type=\'text/css\' href=\'https://res.wx.qq.com/connect/zh_CN/htmledition/style/wap_err1a9853.css\'>
							</head>
							<body>
							<div class=\'page_msg\'><div class=\'inner\'><span class=\'msg_icon_wrp\'><i class=\'icon80_smile\'></i></span><div class=\'msg_content\'><h4>暂时无法访问，请稍后再试!</h4></div></div></div>
							</body>
						</html>');
            }
            $_var_5 = array();
            if ($_var_15['nickname'] != $_var_7['nickname'] && !empty($_var_15['nickname'])) {
                $_var_5['nickname'] = $_var_15['nickname'];
            }
            if ($_var_15['avatar'] != $_var_7['avatar'] && !empty($_var_15['avatar'])) {
                $_var_5['avatar'] = $_var_15['avatar'];
            }
            if (!empty($_var_5)) {
                pdo_update('ewei_shop_member', $_var_5, array('id' => $_var_7['id']));
            }
        }
        if (p('commission')) {
            p('commission')->checkAgent();
        }
        if (p('poster')) {
            p('poster')->checkScan();
        }
    }
    function getLevels()
    {
        global $_W;
        return pdo_fetchall('select * from ' . tablename('ewei_shop_member_level') . ' where uniacid=:uniacid order by level asc', array(':uniacid' => $_W['uniacid']));
    }
    function getLevel($_var_0)
    {
        global $_W;
        if (empty($_var_0)) {
            return false;
        }
        $_var_17 = m('common')->getSysset('shop');
        $_var_7 = m('member')->getMember($_var_0);
        if (empty($_var_7['level'])) {
            return array('discount' => $_var_17['leveldiscount']);
        }
        $_var_18 = pdo_fetch('select * from ' . tablename('ewei_shop_member_level') . ' where id=:id and uniacid=:uniacid order by level asc', array(':uniacid' => $_W['uniacid'], ':id' => $_var_7['level']));
        if (empty($_var_18)) {
            return array('discount' => $_var_17['leveldiscount']);
        }
        return $_var_18;
    }
    function upgradeLevel($_var_0)
    {
        global $_W;
        if (empty($_var_0)) {
            return;
        }
        $_var_19 = m('common')->getSysset('shop');
        $_var_20 = intval($_var_19['leveltype']);
        $_var_7 = m('member')->getMember($_var_0);
        if (empty($_var_7)) {
            return;
        }
        $_var_18 = false;
        if (empty($_var_20)) {
            $_var_21 = pdo_fetchcolumn('select ifnull( sum(og.realprice),0) from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_order') . ' o on o.id=og.orderid ' . ' where o.openid=:openid and o.status=3 and o.uniacid=:uniacid ', array(':uniacid' => $_W['uniacid'], ':openid' => $_var_7['openid']));
            $_var_18 = pdo_fetch('select * from ' . tablename('ewei_shop_member_level') . " where uniacid=:uniacid  and {$_var_21} >= ordermoney and ordermoney>0  order by level desc limit 1", array(':uniacid' => $_W['uniacid']));
        } else {
            if ($_var_20 == 1) {
                $_var_22 = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_order') . ' where openid=:openid and status=3 and uniacid=:uniacid ', array(':uniacid' => $_W['uniacid'], ':openid' => $_var_7['openid']));
                $_var_18 = pdo_fetch('select * from ' . tablename('ewei_shop_member_level') . " where uniacid=:uniacid  and {$_var_22} >= ordercount and ordercount>0  order by level desc limit 1", array(':uniacid' => $_W['uniacid']));
            }
        }
        if (empty($_var_18)) {
            return;
        }
        if ($_var_18['id'] == $_var_7['level']) {
            return;
        }
        $_var_23 = $this->getLevel($_var_0);
        $_var_24 = false;
        if (empty($_var_23['id'])) {
            $_var_24 = true;
        } else {
            if ($_var_18['level'] > $_var_23['level']) {
                $_var_24 = true;
            }
        }
        if ($_var_24) {
            pdo_update('ewei_shop_member', array('level' => $_var_18['id']), array('id' => $_var_7['id']));
            m('notice')->sendMemberUpgradeMessage($_var_0, $_var_23, $_var_18);
        }
    }
    function getGroups()
    {
        global $_W;
        return pdo_fetchall('select * from ' . tablename('ewei_shop_member_group') . ' where uniacid=:uniacid order by id asc', array(':uniacid' => $_W['uniacid']));
    }
    function getGroup($_var_0)
    {
        if (empty($_var_0)) {
            return false;
        }
        $_var_7 = m('member')->getMember($_var_0);
        return $_var_7['groupid'];
    }
    function setRechargeCredit($_var_0 = '', $_var_25 = 0)
    {
        if (empty($_var_0)) {
            return;
        }
        global $_W;
        $_var_26 = 0;
        $_var_27 = m('common')->getSysset(array('trade', 'shop'));
        if ($_var_27['trade']) {
            $_var_28 = floatval($_var_27['trade']['money']);
            $_var_29 = intval($_var_27['trade']['credit']);
            if ($_var_28 > 0) {
                if ($_var_25 % $_var_28 == 0) {
                    $_var_26 = intval($_var_25 / $_var_28) * $_var_29;
                } else {
                    $_var_26 = (intval($_var_25 / $_var_28) + 1) * $_var_29;
                }
            }
        }
        if ($_var_26 > 0) {
            $this->setCredit($_var_0, 'credit1', $_var_26, array(0, $_var_27['shop']['name'] . '会员充值积分:credit2:' . $_var_26));
        }
    }
}