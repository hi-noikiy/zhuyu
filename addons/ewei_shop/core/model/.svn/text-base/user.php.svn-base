<?php
//decode by 
if (!defined('IN_IA')) {
	exit('Access Denied');
}

class Ewei_DShop_User
{
	private $sessionid;

	public function __construct()
	{
		global $_W;
		$this->sessionid = "__cookie_ewei_shop_201507200000_{$_W['uniacid']}";
	}

	function getOpenid()
	{
		$_var_0 = $this->getInfo(false, true);
		return $_var_0['openid'];
	}

	function getPerOpenid()
	{
		global $_W, $_GPC;
		$_var_1 = 24 * 3600 * 3;
		session_set_cookie_params($_var_1);
		@session_start();
		$_var_2 = "__cookie_ewei_shop_openid_{$_W['uniacid']}";
		$_var_3 = base64_decode($_COOKIE[$_var_2]);
		if (!empty($_var_3)) {
			return $_var_3;
		}
		load()->func('communication');
		$_var_4 = $_W['account']['key'];
		$_var_5 = $_W['account']['secret'];
		$_var_6 = "";
		$_var_7 = $_GPC['code'];
		$_var_8 = $_W['siteroot'] . 'app/index.php?' . $_SERVER['QUERY_STRING'];
		if (empty($_var_7)) {
			$_var_9 = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $_var_4 . '&redirect_uri=' . urlencode($_var_8) . '&response_type=code&scope=snsapi_base&state=123#wechat_redirect';
			header('location: ' . $_var_9);
			exit();
		} else {
			$_var_10 = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $_var_4 . '&secret=' . $_var_5 . '&code=' . $_var_7 . '&grant_type=authorization_code';
			$_var_11 = ihttp_get($_var_10);
			$_var_12 = @json_decode($_var_11['content'], true);
			if (!empty($_var_12) && is_array($_var_12) && $_var_12['errmsg'] == 'invalid code') {
				$_var_9 = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $_var_4 . '&redirect_uri=' . urlencode($_var_8) . '&response_type=code&scope=snsapi_base&state=123#wechat_redirect';
				header('location: ' . $_var_9);
				exit();
			}
			if (is_array($_var_12) && !empty($_var_12['openid'])) {
				$_var_6 = $_var_12['access_token'];
				$_var_3 = $_var_12['openid'];
				setcookie($_var_2, base64_encode($_var_3));
			} else {
				$_var_13 = explode('&', $_SERVER['QUERY_STRING']);
				$_var_14 = array();
				foreach ($_var_13 as $_var_15) {
					if (!strexists($_var_15, 'code=') && !strexists($_var_15, 'state=') && !strexists($_var_15, 'from=') && !strexists($_var_15, 'isappinstalled=')) {
						$_var_14[] = $_var_15;
					}
				}
				$_var_16 = $_W['siteroot'] . 'app/index.php?' . implode('&', $_var_14);
				$_var_9 = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $_var_4 . '&redirect_uri=' . urlencode($_var_16) . '&response_type=code&scope=snsapi_base&state=123#wechat_redirect';
				header('location: ' . $_var_9);
				exit;
			}
		}
		return $_var_3;
	}

	function getInfo($_var_17 = false, $_var_18 = false)
	{
		global $_W, $_GPC;
		$_var_0 = array();
		if (EWEI_SHOP_DEBUG) {
			$_var_0 = array('openid' => 'oT-ihv9XGkJbX9owJiLZcZPAJcog', 'nickname' => '狸小狐', 'headimgurl' => 'https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png', 'province' => '山东', 'city' => '青岛');
		} else {
			load()->model('mc');
			if (empty($_GPC['directopenid'])) {
				$_var_0 = mc_oauth_userinfo();
			} else {
				$_var_0 = array('openid' => $this->getPerOpenid());
			}
			$_var_19 = true;
			if ($_W['container'] != 'wechat') {
				if ($_GPC['do'] == 'order' && $_GPC['p'] == 'pay') {
					$_var_19 = false;
				}
				if ($_GPC['do'] == 'member' && $_GPC['p'] == 'recharge') {
					$_var_19 = false;
				}
				if ($_GPC['do'] == 'plugin' && $_GPC['p'] == 'article' && $_GPC['preview'] == '1') {
					$_var_19 = false;
				}
			}
			if (empty($_var_0['openid']) && $_var_19) {
				die('<!DOCTYPE html>
                <html>
                    <head>
                        <meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=0\'>
                        <title>抱歉，出错了</title><meta charset=\'utf-8\'><meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=0\'><link rel=\'stylesheet\' type=\'text/css\' href=\'https://res.wx.qq.com/connect/zh_CN/htmledition/style/wap_err1a9853.css\'>
                    </head>
                    <body>
                    <div class=\'page_msg\'><div class=\'inner\'><span class=\'msg_icon_wrp\'><i class=\'icon80_smile\'></i></span><div class=\'msg_content\'><h4>请在微信客户端打开链接</h4></div></div></div>
                    </body>
                </html>');
			}
		}
		if ($_var_17) {
			return urlencode(base64_encode(json_encode($_var_0)));
		}
		return $_var_0;
	}

	function oauth_info()
	{
		global $_W, $_GPC;
		if ($_W['container'] != 'wechat') {
			if ($_GPC['do'] == 'order' && $_GPC['p'] == 'pay') {
				return array();
			}
			if ($_GPC['do'] == 'member' && $_GPC['p'] == 'recharge') {
				return array();
			}
		}
		$_var_1 = 24 * 3600 * 3;
		session_set_cookie_params($_var_1);
		@session_start();
		$_var_20 = "__cookie_ewei_shop_201507100000_{$_W['uniacid']}";
		$_var_21 = json_decode(base64_decode($_SESSION[$_var_20]), true);
		$_var_3 = is_array($_var_21) ? $_var_21['openid'] : '';
		$_var_22 = is_array($_var_21) ? $_var_21['openid'] : '';
		if (!empty($_var_3)) {
			return $_var_21;
		}
		load()->func('communication');
		$_var_4 = $_W['account']['key'];
		$_var_5 = $_W['account']['secret'];
		$_var_6 = "";
		$_var_7 = $_GPC['code'];
		$_var_8 = $_W['siteroot'] . 'app/index.php?' . $_SERVER['QUERY_STRING'];
		if (empty($_var_7)) {
			$_var_9 = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $_var_4 . '&redirect_uri=' . urlencode($_var_8) . '&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect';
			header('location: ' . $_var_9);
			exit();
		} else {
			$_var_10 = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $_var_4 . '&secret=' . $_var_5 . '&code=' . $_var_7 . '&grant_type=authorization_code';
			$_var_11 = ihttp_get($_var_10);
			$_var_12 = @json_decode($_var_11['content'], true);
			if (!empty($_var_12) && is_array($_var_12) && $_var_12['errmsg'] == 'invalid code') {
				$_var_9 = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $_var_4 . '&redirect_uri=' . urlencode($_var_8) . '&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect';
				header('location: ' . $_var_9);
				exit();
			}
			if (empty($_var_12) || !is_array($_var_12) || empty($_var_12['access_token']) || empty($_var_12['openid'])) {
				die('获取token失败,请重新进入!');
			} else {
				$_var_6 = $_var_12['access_token'];
				$_var_3 = $_var_12['openid'];
			}
		}
		$_var_23 = 'https://api.weixin.qq.com/sns/userinfo?access_token=' . $_var_6 . '&openid=' . $_var_3 . '&lang=zh_CN';
		$_var_11 = ihttp_get($_var_23);
		$_var_0 = @json_decode($_var_11['content'], true);
		if (isset($_var_0['nickname'])) {
			$_SESSION[$_var_20] = base64_encode(json_encode($_var_0));
			return $_var_0;
		} else {
			die('获取用户信息失败，请重新进入!');
		}
	}

	function followed($_var_3 = '')
	{
		global $_W;
		$_var_24 = !empty($_var_3);
		if ($_var_24) {
			$_var_25 = pdo_fetch('select follow from ' . tablename('mc_mapping_fans') . ' where openid=:openid and uniacid=:uniacid limit 1', array(':openid' => $_var_3, ':uniacid' => $_W['uniacid']));
			$_var_24 = $_var_25['follow'] == 1;
		}
		return $_var_24;
	}
}