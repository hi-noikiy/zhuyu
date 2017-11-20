<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('common/header2', TEMPLATE_INCLUDEPATH)) : (include template('common/header2', TEMPLATE_INCLUDEPATH));?>
		<style type="text/css">
			.content { top: 0; }
			.page {background-color: #fff;}
			.notice-title {
				color: #545454;
				line-height: 1.6rem;
				font-size: 0.36rem;
				text-align: center;
			}
			.notice-content {
				padding: 0 0.2rem;
				font-size: 0.32rem;
				color: #545454;
				line-height: 1.6;
			}
			.notice-content p {margin-bottom: 0.3rem;}
		</style>
		<div class="page">
			<div class="content">
				<h1 class="notice-title">企业订购</h1>
				<div class="notice-content">
						<?php  echo $notice;  ?>
				</div>
				<div class="footer-div">
					<div class="btns fh">
						<a href="tel:<?php  echo $phone;?>">联系我们</a>
						<a href="<?php  echo $this->createMobileUrl('shop/companytoorder')?>">企业订购</a>						
						<a href="<?php  echo $this->createMobileUrl('shop/shopnotice')?>">全站公告</a>
					</div>
					<p class="bq">版权所有©2017 珠玉私房烘培公司保留所有权利</p>
				</div>
			</div>
		</div>
	</body>
</html>
