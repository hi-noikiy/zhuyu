<?php

//decode 
if (!defined('IN_IA')) {
    die('Access Denied');
}
if (!class_exists('PosterModel')) {
    class PosterModel extends PluginModel
    {
        public function checkScan()
        {
            global $_W, $_GPC;
            $_var_0 = m('user')->getOpenid();
            $_var_1 = intval($_GPC['posterid']);
            if (empty($_var_1)) {
                return;
            }
            $_var_2 = pdo_fetch('select id,times from ' . tablename('ewei_shop_poster') . ' where id=:id and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $_var_1));
            if (empty($_var_2)) {
                return;
            }
            $_var_3 = intval($_GPC['mid']);
            if (empty($_var_3)) {
                return;
            }
            $_var_4 = m('member')->getMember($_var_3);
            if (empty($_var_4)) {
                return;
            }
            $this->scanTime($_var_0, $_var_4['openid'], $_var_2);
        }
        public function scanTime($_var_0, $_var_5, $_var_2)
        {
            if ($_var_0 == $_var_5) {
                return;
            }
            global $_W, $_GPC;
            $_var_6 = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_poster_scan') . ' where openid=:openid  and posterid=:posterid and uniacid=:uniacid limit 1', array(':openid' => $_var_0, ':posterid' => $_var_2['id'], ':uniacid' => $_W['uniacid']));
            if ($_var_6 <= 0) {
                $_var_7 = array('uniacid' => $_W['uniacid'], 'posterid' => $_var_2['id'], 'openid' => $_var_0, 'from_openid' => $_var_5, 'scantime' => time());
                pdo_insert('ewei_shop_poster_scan', $_var_7);
                pdo_update('ewei_shop_poster', array('times' => $_var_2['times'] + 1), array('id' => $_var_2['id']));
            }
        }
        public function createCommissionPoster($_var_0, $_var_8 = 0)
        {
            global $_W;
            $_var_9 = 2;
            if (!empty($_var_8)) {
                $_var_9 = 3;
            }
            $_var_2 = pdo_fetch('select * from ' . tablename('ewei_shop_poster') . ' where uniacid=:uniacid and type=:type and isdefault=1 limit 1', array(':uniacid' => $_W['uniacid'], ':type' => $_var_9));
            if (empty($_var_2)) {
                return '';
            }
            $_var_10 = m('member')->getMember($_var_0);
            if (empty($_var_2)) {
                return '';
            }
            $_var_11 = $this->getQR($_var_2, $_var_10, $_var_8);
            if (empty($_var_11)) {
                return '';
            }
            return $this->createPoster($_var_2, $_var_10, $_var_11, false);
        }
        public function getFixedTicket($_var_2, $_var_10, $_var_12)
        {
            global $_W, $_GPC;
            $_var_13 = md5("ewei_shop_poster:{$_W['uniacid']}:{$_var_10['openid']}:{$_var_2['id']}");
            $_var_14 = '{"action_info":{"scene":{"scene_str":"' . $_var_13 . '"} },"action_name":"QR_LIMIT_STR_SCENE"}';
            $_var_15 = $_var_12->fetch_token();
            $_var_16 = 'https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=' . $_var_15;
            $_var_17 = curl_init();
            curl_setopt($_var_17, CURLOPT_URL, $_var_16);
            curl_setopt($_var_17, CURLOPT_POST, 1);
            curl_setopt($_var_17, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($_var_17, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($_var_17, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($_var_17, CURLOPT_POSTFIELDS, $_var_14);
            $_var_18 = curl_exec($_var_17);
            $_var_19 = @json_decode($_var_18, true);
            if (!is_array($_var_19)) {
                return false;
            }
            if (!empty($_var_19['errcode'])) {
                return error(-1, $_var_19['errmsg']);
            }
            $_var_20 = $_var_19['ticket'];
            return array('barcode' => json_decode($_var_14, true), 'ticket' => $_var_20);
        }
        public function getQR($_var_2, $_var_10, $_var_8 = 0)
        {
            global $_W, $_GPC;
            $_var_21 = $_W['acid'];
            if ($_var_2['type'] == 1) {
                $_var_22 = m('qrcode')->createShopQrcode($_var_10['id'], $_var_2['id']);
                $_var_11 = pdo_fetch('select * from ' . tablename('ewei_shop_poster_qr') . ' where openid=:openid and acid=:acid and type=:type limit 1', array(':openid' => $_var_10['openid'], ':acid' => $_W['acid'], ':type' => 1));
                if (empty($_var_11)) {
                    $_var_11 = array('acid' => $_var_21, 'openid' => $_var_10['openid'], 'type' => 1, 'qrimg' => $_var_22);
                    pdo_insert('ewei_shop_poster_qr', $_var_11);
                    $_var_11['id'] = pdo_insertid();
                }
                $_var_11['current_qrimg'] = $_var_22;
                return $_var_11;
            } else {
                if ($_var_2['type'] == 2) {
                    $_var_23 = p('commission');
                    if ($_var_23) {
                        $_var_22 = $_var_23->createMyShopQrcode($_var_10['id'], $_var_2['id']);
                        $_var_11 = pdo_fetch('select * from ' . tablename('ewei_shop_poster_qr') . ' where openid=:openid and acid=:acid and type=:type limit 1', array(':openid' => $_var_10['openid'], ':acid' => $_W['acid'], ':type' => 2));
                        if (empty($_var_11)) {
                            $_var_11 = array('acid' => $_var_21, 'openid' => $_var_10['openid'], 'type' => 2, 'qrimg' => $_var_22);
                            pdo_insert('ewei_shop_poster_qr', $_var_11);
                            $_var_11['id'] = pdo_insertid();
                        }
                        $_var_11['current_qrimg'] = $_var_22;
                        return $_var_11;
                    }
                } else {
                    if ($_var_2['type'] == 3) {
                        $_var_22 = m('qrcode')->createGoodsQrcode($_var_10['id'], $_var_8, $_var_2['id']);
                        $_var_11 = pdo_fetch('select * from ' . tablename('ewei_shop_poster_qr') . ' where openid=:openid and acid=:acid and type=:type and goodsid=:goodsid limit 1', array(':openid' => $_var_10['openid'], ':acid' => $_W['acid'], ':type' => 3, ':goodsid' => $_var_8));
                        if (empty($_var_11)) {
                            $_var_11 = array('acid' => $_var_21, 'openid' => $_var_10['openid'], 'type' => 3, 'goodsid' => $_var_8, 'qrimg' => $_var_22);
                            pdo_insert('ewei_shop_poster_qr', $_var_11);
                            $_var_11['id'] = pdo_insertid();
                        }
                        $_var_11['current_qrimg'] = $_var_22;
                        return $_var_11;
                    } else {
                        if ($_var_2['type'] == 4) {
                            $_var_12 = WeAccount::create($_var_21);
                            $_var_11 = pdo_fetch('select * from ' . tablename('ewei_shop_poster_qr') . ' where openid=:openid and acid=:acid and type=4 limit 1', array(':openid' => $_var_10['openid'], ':acid' => $_var_21));
                            if (empty($_var_11)) {
                                $_var_19 = $this->getFixedTicket($_var_2, $_var_10, $_var_12);
                                if (is_error($_var_19)) {
                                    return $_var_19;
                                }
                                if (empty($_var_19)) {
                                    return error(-1, '生成二维码失败');
                                }
                                $_var_24 = $_var_19['barcode'];
                                $_var_20 = $_var_19['ticket'];
                                $_var_22 = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=' . $_var_20;
                                $_var_25 = array('uniacid' => $_W['uniacid'], 'acid' => $_W['acid'], 'scene_str' => $_var_24['action_info']['scene']['scene_str'], 'model' => 2, 'name' => 'EWEI_SHOP_POSTER_QRCODE', 'keyword' => 'EWEI_SHOP_POSTER', 'expire' => 0, 'createtime' => time(), 'status' => 1, 'url' => $_var_19['url'], 'ticket' => $_var_19['ticket']);
                                pdo_insert('qrcode', $_var_25);
                                $_var_11 = array('acid' => $_var_21, 'openid' => $_var_10['openid'], 'type' => 4, 'scenestr' => $_var_24['action_info']['scene']['scene_str'], 'ticket' => $_var_19['ticket'], 'qrimg' => $_var_22, 'url' => $_var_19['url']);
                                pdo_insert('ewei_shop_poster_qr', $_var_11);
                                $_var_11['id'] = pdo_insertid();
                                $_var_11['current_qrimg'] = $_var_22;
                            } else {
                                $_var_11['current_qrimg'] = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=' . $_var_11['ticket'];
                            }
                            return $_var_11;
                        }
                    }
                }
            }
        }
        public function getRealData($_var_26)
        {
            $_var_26['left'] = intval(str_replace('px', '', $_var_26['left'])) * 2;
            $_var_26['top'] = intval(str_replace('px', '', $_var_26['top'])) * 2;
            $_var_26['width'] = intval(str_replace('px', '', $_var_26['width'])) * 2;
            $_var_26['height'] = intval(str_replace('px', '', $_var_26['height'])) * 2;
            $_var_26['size'] = intval(str_replace('px', '', $_var_26['size'])) * 2;
            $_var_26['src'] = tomedia($_var_26['src']);
            return $_var_26;
        }
        public function createImage($_var_27)
        {
            load()->func('communication');
            $_var_28 = ihttp_request($_var_27);
            if ($_var_28['code'] == 200 && !empty($_var_28['content'])) {
                return imagecreatefromstring($_var_28['content']);
            }
            $_var_29 = 0;
            while ($_var_29 < 3) {
                $_var_28 = ihttp_request($_var_27);
                if ($_var_28['code'] == 200 && !empty($_var_28['content'])) {
                    return imagecreatefromstring($_var_28['content']);
                }
                $_var_29++;
            }
            return '';
        }
        public function mergeImage($_var_30, $_var_26, $_var_27)
        {
            $_var_31 = $this->createImage($_var_27);
            $_var_32 = imagesx($_var_31);
            $_var_33 = imagesy($_var_31);
            imagecopyresized($_var_30, $_var_31, $_var_26['left'], $_var_26['top'], 0, 0, $_var_26['width'], $_var_26['height'], $_var_32, $_var_33);
            imagedestroy($_var_31);
            return $_var_30;
        }
        public function mergeText($_var_30, $_var_26, $_var_34)
        {
            $_var_35 = IA_ROOT . '/addons/ewei_shop/static/fonts/msyh.ttf';
            $_var_36 = $this->hex2rgb($_var_26['color']);
            $_var_37 = imagecolorallocate($_var_30, $_var_36['red'], $_var_36['green'], $_var_36['blue']);
            imagettftext($_var_30, $_var_26['size'], 0, $_var_26['left'], $_var_26['top'] + $_var_26['size'], $_var_37, $_var_35, $_var_34);
            return $_var_30;
        }
        function hex2rgb($_var_38)
        {
            if ($_var_38[0] == '#') {
                $_var_38 = substr($_var_38, 1);
            }
            if (strlen($_var_38) == 6) {
                list($_var_39, $_var_40, $_var_41) = array($_var_38[0] . $_var_38[1], $_var_38[2] . $_var_38[3], $_var_38[4] . $_var_38[5]);
            } elseif (strlen($_var_38) == 3) {
                list($_var_39, $_var_40, $_var_41) = array($_var_38[0] . $_var_38[0], $_var_38[1] . $_var_38[1], $_var_38[2] . $_var_38[2]);
            } else {
                return false;
            }
            $_var_39 = hexdec($_var_39);
            $_var_40 = hexdec($_var_40);
            $_var_41 = hexdec($_var_41);
            return array('red' => $_var_39, 'green' => $_var_40, 'blue' => $_var_41);
        }
        public function createPoster($_var_2, $_var_10, $_var_11, $_var_42 = true)
        {
            global $_W;
            $_var_43 = IA_ROOT . '/addons/ewei_shop/data/poster/' . $_W['uniacid'] . '/';
            if (!is_dir($_var_43)) {
                load()->func('file');
                mkdirs($_var_43);
            }
            if (!empty($_var_11['goodsid'])) {
                $_var_44 = pdo_fetch('select id,title,thumb,commission_thumb,marketprice,productprice from ' . tablename('ewei_shop_goods') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $_var_11['goodsid'], ':uniacid' => $_W['uniacid']));
                if (empty($_var_44)) {
                    m('message')->sendCustomNotice($_var_10['openid'], '未找到商品，无法生成海报');
                    die;
                }
            }
            $_var_45 = md5(json_encode(array('openid' => $_var_10['openid'], 'goodsid' => $_var_11['goodsid'], 'bg' => $_var_2['bg'], 'data' => $_var_2['data'], 'version' => 1)));
            $_var_46 = $_var_45 . '.png';
            if (!is_file($_var_43 . $_var_46) || $_var_11['qrimg'] != $_var_11['current_qrimg']) {
                set_time_limit(0);
                @ini_set('memory_limit', '256M');
                $_var_30 = imagecreatetruecolor(640, 1008);
                $_var_47 = $this->createImage(tomedia($_var_2['bg']));
                imagecopy($_var_30, $_var_47, 0, 0, 0, 0, 640, 1008);
                imagedestroy($_var_47);
                $_var_26 = json_decode(str_replace('&quot;', '\'', $_var_2['data']), true);
                foreach ($_var_26 as $_var_48) {
                    $_var_48 = $this->getRealData($_var_48);
                    if ($_var_48['type'] == 'head') {
                        $_var_49 = preg_replace('/\\/0$/i', '/96', $_var_10['avatar']);
                        $_var_30 = $this->mergeImage($_var_30, $_var_48, $_var_49);
                    } else {
                        if ($_var_48['type'] == 'img') {
                            $_var_30 = $this->mergeImage($_var_30, $_var_48, $_var_48['src']);
                        } else {
                            if ($_var_48['type'] == 'qr') {
                                $_var_30 = $this->mergeImage($_var_30, $_var_48, tomedia($_var_11['current_qrimg']));
                            } else {
                                if ($_var_48['type'] == 'nickname') {
                                    $_var_30 = $this->mergeText($_var_30, $_var_48, $_var_10['nickname']);
                                } else {
                                    if (!empty($_var_44)) {
                                        if ($_var_48['type'] == 'title') {
                                            $_var_30 = $this->mergeText($_var_30, $_var_48, $_var_44['title']);
                                        } else {
                                            if ($_var_48['type'] == 'thumb') {
                                                $_var_50 = !empty($_var_44['commission_thumb']) ? tomedia($_var_44['commission_thumb']) : tomedia($_var_44['thumb']);
                                                $_var_30 = $this->mergeImage($_var_30, $_var_48, $_var_50);
                                            } else {
                                                if ($_var_48['type'] == 'marketprice') {
                                                    $_var_30 = $this->mergeText($_var_30, $_var_48, $_var_44['marketprice']);
                                                } else {
                                                    if ($_var_48['type'] == 'productprice') {
                                                        $_var_30 = $this->mergeText($_var_30, $_var_48, $_var_44['productprice']);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                imagepng($_var_30, $_var_43 . $_var_46);
                imagedestroy($_var_30);
                if ($_var_11['qrimg'] != $_var_11['current_qrimg']) {
                    pdo_update('ewei_shop_poster_qr', array('qrimg' => $_var_11['current_qrimg']), array('id' => $_var_11['id']));
                }
            }
            $_var_31 = $_W['siteroot'] . 'addons/ewei_shop/data/poster/' . $_W['uniacid'] . '/' . $_var_46;
            if (!$_var_42) {
                return $_var_31;
            }
            if ($_var_11['qrimg'] != $_var_11['current_qrimg'] || empty($_var_11['mediaid']) || empty($_var_11['createtime']) || $_var_11['createtime'] + 3600 * 24 * 3 - 7200 < time()) {
                $_var_51 = $this->uploadImage($_var_43 . $_var_46);
                $_var_11['mediaid'] = $_var_51;
                pdo_update('ewei_shop_poster_qr', array('mediaid' => $_var_51, 'createtime' => time()), array('id' => $_var_11['id']));
            }
            return array('img' => $_var_31, 'mediaid' => $_var_11['mediaid']);
        }
        public function uploadImage($_var_31)
        {
            load()->func('communication');
            $_var_52 = m('common')->getAccount();
            $_var_53 = $_var_52->fetch_token();
            $_var_16 = "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token={$_var_53}&type=image";
            $_var_17 = curl_init();
            $_var_26 = array('media' => '@' . $_var_31);
            if (version_compare(PHP_VERSION, '5.5.0', '>')) {
                $_var_26 = array('media' => curl_file_create($_var_31));
            }
            curl_setopt($_var_17, CURLOPT_URL, $_var_16);
            curl_setopt($_var_17, CURLOPT_POST, 1);
            curl_setopt($_var_17, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($_var_17, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($_var_17, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($_var_17, CURLOPT_POSTFIELDS, $_var_26);
            $_var_54 = @json_decode(curl_exec($_var_17), true);
            if (!is_array($_var_54)) {
                $_var_54 = array('media_id' => '');
            }
            curl_close($_var_17);
            return $_var_54['media_id'];
        }
        public function getQRByTicket($_var_20 = '')
        {
            global $_W;
            if (empty($_var_20)) {
                return false;
            }
            $_var_55 = pdo_fetchall('select * from ' . tablename('ewei_shop_poster_qr') . ' where ticket=:ticket and acid=:acid and type=4 limit 1', array(':ticket' => $_var_20, ':acid' => $_W['acid']));
            $_var_56 = count($_var_55);
            if ($_var_56 <= 0) {
                return false;
            }
            if ($_var_56 == 1) {
                return $_var_55[0];
            }
            return false;
        }
        public function checkMember($_var_0 = '')
        {
            global $_W;
            $_var_57 = WeiXinAccount::create($_W['acid']);
            $_var_58 = $_var_57->fansQueryInfo($_var_0);
            $_var_58['avatar'] = $_var_58['headimgurl'];
            load()->model('mc');
            $_var_59 = mc_openid2uid($_var_0);
            if (!empty($_var_59)) {
                pdo_update('mc_members', array('nickname' => $_var_58['nickname'], 'gender' => $_var_58['sex'], 'nationality' => $_var_58['country'], 'resideprovince' => $_var_58['province'], 'residecity' => $_var_58['city'], 'avatar' => $_var_58['headimgurl']), array('uid' => $_var_59));
            }
            pdo_update('mc_mapping_fans', array('nickname' => $_var_58['nickname']), array('uniacid' => $_W['uniacid'], 'openid' => $_var_0));
            $_var_60 = m('member');
            $_var_10 = $_var_60->getMember($_var_0);
            if (empty($_var_10)) {
                $_var_61 = mc_fetch($_var_59, array('realname', 'nickname', 'mobile', 'avatar', 'resideprovince', 'residecity', 'residedist'));
                $_var_10 = array('uniacid' => $_W['uniacid'], 'uid' => $_var_59, 'openid' => $_var_0, 'realname' => $_var_61['realname'], 'mobile' => $_var_61['mobile'], 'nickname' => !empty($_var_61['nickname']) ? $_var_61['nickname'] : $_var_58['nickname'], 'avatar' => !empty($_var_61['avatar']) ? $_var_61['avatar'] : $_var_58['avatar'], 'gender' => !empty($_var_61['gender']) ? $_var_61['gender'] : $_var_58['sex'], 'province' => !empty($_var_61['resideprovince']) ? $_var_61['resideprovince'] : $_var_58['province'], 'city' => !empty($_var_61['residecity']) ? $_var_61['residecity'] : $_var_58['city'], 'area' => $_var_61['residedist'], 'createtime' => time(), 'status' => 0);
                pdo_insert('ewei_shop_member', $_var_10);
                $_var_10['id'] = pdo_insertid();
                $_var_10['isnew'] = true;
            } else {
                $_var_10['nickname'] = $_var_58['nickname'];
                $_var_10['avatar'] = $_var_58['headimgurl'];
                $_var_10['province'] = $_var_58['province'];
                $_var_10['city'] = $_var_58['city'];
                pdo_update('ewei_shop_member', $_var_10, array('id' => $_var_10['id']));
                $_var_10['isnew'] = false;
            }
            return $_var_10;
        }
        function perms()
        {
            return array('poster' => array('text' => $this->getName(), 'isplugin' => true, 'view' => '浏览', 'add' => '添加-log', 'edit' => '修改-log', 'delete' => '删除-log', 'log' => '扫描记录', 'clear' => '清除缓存-log', 'setdefault' => '设置默认海报-log'));
        }
    }
}