<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
if (!class_exists('ArticleModel')) {
	class ArticleModel extends PluginModel
	{
		public function doShare($article, $shareid, $myid)
		{
			global $_W, $_GPC;
			if (empty($article) || empty($shareid) || empty($myid) || $shareid == $myid) {
                return;
            }
			$profile = m('member')->getMember($shareid);
			$myinfo = m('member')->getMember($myid);
			if (empty($profile) || empty($myinfo)) {
                return;
            }
			$shopset = m('common')->getSysset('shop');
			$articlecredit = intval($article["article_rule_credit"]);
			$articlemoney = floatval($article['article_rule_money']);
			$my_click = pdo_fetchcolumn("SELECT COUNT(*) FROM " . tablename('ewei_shop_article_share') . " WHERE aid=:aid and click_user=:click_user and uniacid=:uniacid ", array('
				:aid' => $article['id'], 
				':click_user' => $myid, 
				':uniacid' => $_W['uniacid']
			));
			if (!empty($my_click)) {
                $articlecredit = intval($article["article_rule_credit2"]);
                $articlemoney = floatval($article["article_rule_money2"]);
            }
			if (!empty($article["article_hasendtime"]) && time() > $article["article_endtime"]) {
                return;
            }
            $articlereadtime = $article["article_readtime"];
            if ($articlereadtime <= 0) {
                $articlereadtime = 4;
            }
			$articlecount = pdo_fetchcolumn("SELECT COUNT(*) FROM " . tablename("ewei_shop_article_share") . " WHERE aid=:aid and share_user=:share_user and click_user=:click_user and uniacid=:uniacid ", array(
                ":aid" => $article["id"],
                ":share_user" => $shareid,
                ":click_user" => $myid,
                ":uniacid" => $_W["uniacid"]
            ));
            if ($articlecount >= $articlereadtime) {
                return;
            }
            $articlecount2 = pdo_fetchcolumn("SELECT COUNT(*) FROM " . tablename("ewei_shop_article_share") . " WHERE aid=:aid and share_user=:share_user and uniacid=:uniacid ", array(
                ":aid" => $article["id"],
                ":share_user" => $shareid,
                ":uniacid" => $_W["uniacid"]
            ));
			if ($articlecount2 >= $article["article_rule_allnum"]) {
                $articlecredit = 0;
                $articlemoney = 0;
            } else {
                $starttime = mktime(0, 0, 0, date("m") , date("d") , date("Y"));
                $endtime = mktime(0, 0, 0, date("m") , date("d") + 1, date("Y")) - 1;
                $articlecount3 = pdo_fetchcolumn("SELECT COUNT(*) FROM " . tablename("ewei_shop_article_share") . " WHERE aid=:aid and share_user=:share_user and click_date>:day_start and click_date<:day_end and uniacid=:uniacid ", array(
                    ":aid" => $article["id"],
                    ":share_user" => $shareid,
                    ":day_start" => $starttime,
                    ":day_end" => $endtime,
                    ":uniacid" => $_W["uniacid"]
                ));
                if ($articlecount3 >= $article["article_rule_daynum"]) {
                    $articlecredit = 0;
                    $articlemoney = 0;
                }
            }
			$articlecount4 = pdo_fetchcolumn("SELECT COUNT(*) FROM " . tablename("ewei_shop_article_share") . " WHERE aid=:aid and share_user=:click_user and click_user=:share_user and uniacid=:uniacid ", array(
                ":aid" => $article["id"],
                ":share_user" => $shareid,
                ":click_user" => $myid,
                ":uniacid" => $_W["uniacid"]
            ));
            if (!empty($articlecount4)) {
                return;
            }
			if ($article["article_rule_credittotal"] > 0 || $article["article_rule_moneytotal"] > 0) {
                $ruletotal = 0;
                $rulemoey = 0;
                $clickusercount = pdo_fetchcolumn("select count(distinct click_user) from " . tablename("ewei_shop_article_share") . " where aid=:aid and uniacid=:uniacid limit 1", array(
                    ":aid" => $article["id"],
                    ":uniacid" => $_W["uniacid"]
                ));
                $sharecount = pdo_fetchcolumn("select count(*) from " . tablename("ewei_shop_article_share") . " where aid=:aid and uniacid=:uniacid limit 1", array(
                    ":aid" => $article["id"],
                    ":uniacid" => $_W["uniacid"]
                ));
                $caclcount = $sharecount - $clickusercount;
                if ($article["article_rule_credittotal"] > 0) {
                    $ruletotal = $article["article_rule_credittotal"] - ($clickusercount + $article["article_readnum_v"]) * $article["article_rule_creditm"] - $caclcount * $article["article_rule_creditm2"];
                }
                if ($article["article_rule_moneytotal"] > 0) {
                    $rulemoey = $article["article_rule_moneytotal"] - ($clickusercount + $article["article_readnum_v"]) * $article["article_rule_moneym"] - $caclcount * $article["article_rule_moneym2"];
                }
                $ruletotal <= 0 && $ruletotal = 0;
                $rulemoey <= 0 && $rulemoey = 0;
                if ($ruletotal <= 0) {
                    $articlecredit = 0;
                }
                if ($rulemoey <= 0) {
                    $articlemoney = 0;
                }
            }
            $articlearray = array(
                "aid" => $article["id"],
                "share_user" => $shareid,
                "click_user" => $myid,
                "click_date" => time() ,
                "add_credit" => $articlecredit,
                "add_money" => $articlemoney,
                "uniacid" => $_W["uniacid"]
            );
            pdo_insert("ewei_shop_article_share", $articlearray);
            if ($articlecredit > 0) {
                m("member")->setCredit($profile["openid"], "credit1", $articlecredit, array(
                    0,
                    $shopset["name"] . " 文章营销奖励积分"
                ));
            }
            if ($articlemoney > 0) {
                m("member")->setCredit($profile["openid"], "credit2", $articlemoney, array(
                    0,
                    $shopset["name"] . " 文章营销奖励余额"
                ));
            }
            if ($articlecredit > 0 || $articlemoney > 0) {
                $shopsysdata = pdo_fetch("SELECT * FROM " . tablename("ewei_shop_article_sys") . " WHERE uniacid=:uniacid limit 1 ", array(
                    ":uniacid" => $_W["uniacid"]
                ));
                $articleurl = $_W["siteroot"] . "app/index.php?i=" . $_W["uniacid"] . "&c=entry&m=ewei_shop&do=member";
                $articlemsg = '';
                if ($articlecredit > 0) {
                    $articlemsg.= $articlecredit . "个积分、";
                }
                if ($articlemoney > 0) {
                    $articlemsg.= $articlemoney . "元余额";
                }
                $arraymsg = array(
                    "first" => array(
                        "value" => "您的奖励已到帐！",
                        "color" => "#4a5077"
                    ) ,
                    "keyword1" => array(
                        "title" => "任务名称",
                        "value" => "分享得奖励",
                        "color" => "#4a5077"
                    ) ,
                    "keyword2" => array(
                        "title" => "通知类型",
                        "value" => "用户通过您的分享进入文章《" . $article["article_title"] . "》，系统奖励您" . $articlemsg . "。",
                        "color" => "#4a5077"
                    ) ,
                    "remark" => array(
                        "value" => "奖励已发放成功，请到会员中心查看。",
                        "color" => "#4a5077"
                    )
                );
                if (!empty($shopsysdata["article_message"])) {
                    m("message")->sendTplNotice($profile["openid"], $shopsysdata["article_message"], $arraymsg, $articleurl);
                } else {
                    m("message")->sendCustomNotice($profile["openid"], $arraymsg, $articleurl);
                }
            }
        }		
		/* function mid_replace($midtext) {
            global $_GPC;
            preg_match_all('/href\=[" | ]( . * ?) ["|\']/is', $midtext, $midarray);
            foreach ($midarray[1] as $midhref => $hreftext) {
                $midnewtext = $this->href_replace($hreftext);
                $midtext = str_replace($midarray[0][$midhref], "href=\"{$midnewtext}\"", $midtext);
            }
            return $midtext;
        }
        function href_replace($hreftext) {
            global $_GPC;
            $midnewtext = $hreftext;
            if (strexists($hreftext, "ewei_shop") && !strexists($hreftext, "&mid")) {
                if (strexists($hreftext, "?")) {
                    $midnewtext = $hreftext . "&mid=" . intval($_GPC["mid"]);
                } else {
                    $midnewtext = $hreftext . "?mid=" . intval($_GPC["mid"]);
                }
            }
            return $midnewtext;
        } */
		
		function mid_replace($content)
		{
			global $_GPC;
			preg_match_all('/href\\=["|\'](.*?)["|\']/is', $content, $links);
			foreach ($links[1] as $key => $lnk) {
				$newlnk = $this->href_replace($lnk);
				$content = str_replace($links[0][$key], "href=\"{$newlnk}\"", $content);
			}
			return $content;
		}

		function href_replace($lnk)
		{
			global $_GPC;
			$newlnk = $lnk;
			if (strexists($lnk, 'ewei_shop') && !strexists($lnk, '&mid')) {
				if (strexists($lnk, '?')) {
					$newlnk = $lnk . "&mid=" . intval($_GPC['mid']);
				} else {
					$newlnk = $lnk . "?mid=" . intval($_GPC['mid']);
				}
			}
			return $newlnk;
		}

		function perms()
		{
			return array(
				'article' => array(
					'text' => $this->getName(), 
					'isplugin' => true, 
					'child' => array(
						'cate' => array(
							'text' => '分类设置', 
							'addcate' => '添加分类-log', 
							'editcate' => '编辑分类-log', 
							'delcate' => '删除分类-log'
						), 
						'page' => array(
							'text' => '文章设置', 
							'add' => '添加文章-log', 
							'edit' => '修改文章-log', 
							'delete' => '删除文章-log', 
							'showdata' => '查看数据统计', 
							'otherset' => '其他设置', 
							'report' => '举报记录'
						)
					)
				)
			);
		}
	}
}