<?php

//decode 
if (!defined('IN_IA')) {
    die('Access Denied');
}
if (!class_exists('DesignerModel')) {
    class DesignerModel extends PluginModel
    {
        public function getPage($_var_0 = 1)
        {
            global $_W, $_GPC;
            $_var_1 = pdo_fetch('SELECT * FROM ' . tablename('ewei_shop_designer') . ' WHERE uniacid= :uniacid and pagetype=:type and setdefault=:default', array(':uniacid' => $_W['uniacid'], ':type' => $_var_0, ':default' => '1'));
            if (empty($_var_1)) {
                return false;
            }
            return $this->getData($_var_1);
        }
        public function change(&$_var_2, $_var_3)
        {
            $_var_2[$_var_4['k1']][$_var_4['k2']]['name'] = $_var_3['title'];
            $_var_2[$_var_4['k1']][$_var_4['k2']]['priceold'] = $_var_3['productprice'];
            $_var_2[$_var_4['k1']][$_var_4['k2']]['pricenow'] = $_var_3['marketprice'];
            $_var_2[$_var_4['k1']][$_var_4['k2']]['img'] = $_var_3['thumb'];
            $_var_2[$_var_4['k1']][$_var_4['k2']]['sales'] = $_var_3['sales'];
            $_var_2[$_var_4['k1']][$_var_4['k2']]['unit'] = $_var_3['unit'];
        }
        public function getData($_var_1)
        {
            global $_W;
            if (strexists($_var_1['datas'], '{')) {
                $_var_5 = htmlspecialchars_decode($_var_1['datas']);
            } else {
                $_var_5 = htmlspecialchars_decode(base64_decode($_var_1['datas']));
            }
            $_var_2 = json_decode($_var_5, true);
            $_var_6 = array();
            foreach ($_var_2 as $_var_7 => &$_var_8) {
                if ($_var_8['temp'] == 'goods') {
                    foreach ($_var_8['data'] as $_var_9 => $_var_10) {
                        $_var_6[] = array('id' => $_var_10['goodid'], 'k1' => $_var_7, 'k2' => $_var_9);
                    }
                } elseif ($_var_8['temp'] == 'richtext') {
                    $_var_8['content'] = $this->unescape($_var_8['content']);
                }
            }
            unset($_var_8);
            $_var_11 = array();
            foreach ($_var_6 as $_var_12) {
                $_var_11[] = $_var_12['id'];
            }
            if (count($_var_11) > 0) {
                $_var_13 = pdo_fetchall('SELECT id,title,productprice,marketprice,thumb,sales,unit FROM ' . tablename('ewei_shop_goods') . ' WHERE id in ( ' . implode(',', $_var_11) . ') and uniacid= :uniacid ', array(':uniacid' => $_W['uniacid']), 'id');
                $_var_13 = set_medias($_var_13, 'thumb');
                foreach ($_var_2 as $_var_7 => &$_var_8) {
                    if ($_var_8['temp'] == 'goods') {
                        foreach ($_var_8['data'] as $_var_9 => &$_var_10) {
                            $_var_3 = $_var_13[$_var_10['goodid']];
                            $_var_10['name'] = $_var_3['title'];
                            $_var_10['priceold'] = $_var_3['productprice'];
                            $_var_10['pricenow'] = $_var_3['marketprice'];
                            $_var_10['img'] = $_var_3['thumb'];
                            $_var_10['sales'] = $_var_3['sales'];
                            $_var_10['unit'] = $_var_3['unit'];
                        }
                        unset($_var_10);
                    }
                }
                unset($_var_8);
            }
            $_var_5 = json_encode($_var_2);
            $_var_5 = rtrim($_var_5, ']');
            $_var_5 = ltrim($_var_5, '[');
            if (strexists($_var_1['pageinfo'], '{')) {
                $_var_14 = htmlspecialchars_decode($_var_1['pageinfo']);
            } else {
                $_var_14 = htmlspecialchars_decode(base64_decode($_var_1['pageinfo']));
            }
            $_var_15 = json_decode($_var_14, true);
            $_var_16 = empty($_var_15[0]['params']['title']) ? '未设置页面标题' : $_var_15[0]['params']['title'];
            $_var_17 = empty($_var_15[0]['params']['desc']) ? '未设置页面简介' : $_var_15[0]['params']['desc'];
            $_var_18 = empty($_var_15[0]['params']['img']) ? '' : tomedia($_var_15[0]['params']['img']);
            $_var_19 = empty($_var_15[0]['params']['kw']) ? '' : $_var_15[0]['params']['kw'];
            $_var_20 = m('common')->getSysset(array('shop', 'share'));
            $_var_21 = $_var_20;
            $_var_21['shop'] = set_medias($_var_21['shop'], 'logo');
            $_var_21 = json_encode($_var_21);
            $_var_14 = rtrim($_var_14, ']');
            $_var_14 = ltrim($_var_14, '[');
            $_var_22 = array('page' => $_var_1, 'pageinfo' => $_var_14, 'data' => $_var_5, 'share' => array('title' => $_var_16, 'desc' => $_var_17, 'imgUrl' => $_var_18), 'footertype' => intval($_var_15[0]['params']['footer']), 'footermenu' => intval($_var_15[0]['params']['footermenu']), 'system' => $_var_21);
            if ($_var_15[0]['params']['footer'] == 2) {
                $_var_23 = intval($_var_15[0]['params']['footermenu']);
                $_var_24 = pdo_fetch('select * from ' . tablename('ewei_shop_designer_menu') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $_var_23, ':uniacid' => $_W['uniacid']));
                if (!empty($_var_24)) {
                    $_var_22['menus'] = json_decode($_var_24['menus'], true);
                    $_var_22['params'] = json_decode($_var_24['params'], true);
                }
            }
            return $_var_22;
        }
        public function escape($_var_25)
        {
            preg_match_all('/[�-�][�-�]+|[�-�][�-�]{2}|[�-�][�-�]{3}|[-]+/e', $_var_25, $_var_26);
            $_var_25 = $_var_26[0];
            $_var_27 = count($_var_25);
            for ($_var_28 = 0; $_var_28 < $_var_27; $_var_28++) {
                $_var_29 = ord($_var_25[$_var_28][0]);
                if ($_var_29 < 223) {
                    $_var_25[$_var_28] = rawurlencode(utf8_decode($_var_25[$_var_28]));
                } else {
                    $_var_25[$_var_28] = '%u' . strtoupper(bin2hex(iconv('UTF-8', 'UCS-2', $_var_25[$_var_28])));
                }
            }
            return join('', $_var_25);
        }
        public function unescape($_var_25)
        {
            $_var_22 = '';
            $_var_30 = strlen($_var_25);
            for ($_var_28 = 0; $_var_28 < $_var_30; $_var_28++) {
                if ($_var_25[$_var_28] == '%' && $_var_25[$_var_28 + 1] == 'u') {
                    $_var_31 = hexdec(substr($_var_25, $_var_28 + 2, 4));
                    if ($_var_31 < 127) {
                        $_var_22 .= chr($_var_31);
                    } else {
                        if ($_var_31 < 2048) {
                            $_var_22 .= chr(192 | $_var_31 >> 6) . chr(128 | $_var_31 & 63);
                        } else {
                            $_var_22 .= chr(224 | $_var_31 >> 12) . chr(128 | $_var_31 >> 6 & 63) . chr(128 | $_var_31 & 63);
                        }
                    }
                    $_var_28 += 5;
                } else {
                    if ($_var_25[$_var_28] == '%') {
                        $_var_22 .= urldecode(substr($_var_25, $_var_28, 3));
                        $_var_28 += 2;
                    } else {
                        $_var_22 .= $_var_25[$_var_28];
                    }
                }
            }
            return $_var_22;
        }
        public function getGuide($_var_21, $_var_14)
        {
            global $_W, $_GPC;
            if (!empty($_GPC['preview'])) {
                $_var_32['followed'] = '0';
            } else {
                $_var_32['openid2'] = m('user')->getOpenid();
                $_var_32['followed'] = m('user')->followed($_var_32['openid2']);
            }
            if ($_var_32['followed'] != '1') {
                $_var_21 = json_decode($_var_21, true);
                $_var_21['shop'] = set_medias($_var_21['shop'], 'logo');
                $_var_14 = json_decode($_var_14, true);
                if (!empty($_GPC['mid'])) {
                    $_var_32['member1'] = pdo_fetch('SELECT id,nickname,openid,avatar FROM ' . tablename('ewei_shop_member') . ' WHERE id=:mid and uniacid= :uniacid limit 1 ', array(':uniacid' => $_W['uniacid'], ':mid' => $_GPC['mid']));
                    $_var_32['member2'] = pdo_fetch('SELECT id,nickname,openid FROM ' . tablename('ewei_shop_member') . ' WHERE openid=:openid and uniacid= :uniacid limit 1 ', array(':uniacid' => $_W['uniacid'], ':openid' => $_var_32['openid2']));
                }
                $_var_32['followurl'] = $_var_21['share']['followurl'];
                if (empty($_var_32['member1'])) {
                    $_var_32['title1'] = $_var_14['params']['guidetitle1'];
                    $_var_32['title2'] = $_var_14['params']['guidetitle2'];
                    $_var_32['logo'] = $_var_21['shop']['logo'];
                } else {
                    $_var_14['params']['guidetitle1s'] = str_replace('[邀请人]', $_var_32['member1']['nickname'], $_var_14['params']['guidetitle1s']);
                    $_var_14['params']['guidetitle2s'] = str_replace('[邀请人]', $_var_32['member1']['nickname'], $_var_14['params']['guidetitle2s']);
                    $_var_14['params']['guidetitle1s'] = str_replace('[访问者]', $_var_32['member2']['nickname'], $_var_14['params']['guidetitle1s']);
                    $_var_14['params']['guidetitle2s'] = str_replace('[访问者]', $_var_32['member2']['nickname'], $_var_14['params']['guidetitle2s']);
                    $_var_32['title1'] = $_var_14['params']['guidetitle1s'];
                    $_var_32['title2'] = $_var_14['params']['guidetitle2s'];
                    $_var_32['logo'] = $_var_32['member1']['avatar'];
                }
            }
            return $_var_32;
        }
        public function getMenu($_var_23 = 0)
        {
            if (empty($_var_23)) {
            }
        }
        public function getDefaultMenuID()
        {
            global $_W;
            return pdo_fetchcolumn('select id from ' . tablename('ewei_shop_designer_menu') . ' where isdefault=1 and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid']));
        }
        public function getDefaultMenu()
        {
            global $_W;
            return pdo_fetch('select * from ' . tablename('ewei_shop_designer_menu') . ' where isdefault=1 and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid']));
        }
        public function perms()
        {
            return array('designer' => array('text' => $this->getName(), 'isplugin' => true, 'child' => array('page' => array('text' => '页面设置', 'view' => '浏览', 'edit' => '添加修改-log', 'delete' => '删除-log', 'setdefault' => '设置默认-log'), 'menu' => array('text' => '菜单设置', 'view' => '浏览', 'edit' => '添加修改-log', 'delete' => '删除-log', 'setdefault' => '设置默认-log'))));
        }
    }
}