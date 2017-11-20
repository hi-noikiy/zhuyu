<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('common/header2', TEMPLATE_INCLUDEPATH)) : (include template('common/header2', TEMPLATE_INCLUDEPATH));?>
		<div class="page">
			<header id="header" class="i-header fv">
				<a href="javascript:;" id="show-list" class="icon fl"><img src="../addons/ewei_shop/static/cate/img/i_list_icon.png" /></a>
				<div class="m" onclick="window.location.href='<?php  echo $this->createMobileUrl('shop')?>'"  ><img  src="../addons/ewei_shop/static/cate/img/i_head_icon.png" /></div>
				<a href="<?php  echo $this->createMobileUrl('shop/cart')?>" class="icon fr"><img src="../addons/ewei_shop/static/cate/img/i_shop_icon.png" />
				<?php  if($cartnum>0) { ?>
				<p><?php  echo $cartnum;?></p>
				<?php  } ?>				
				</a>
				<div class="top-header-menu" style="display: none;">
					<a href="<?php  echo $this->createMobileUrl('shop')?>" class="menu-home"><img src="../addons/ewei_shop/static/cate/img/header_list_icon1.png" alt="" /><span>首页</span></a>
					<a href="<?php  echo $this->createMobileUrl('shop/category')?>" title="" class="menu-class"><img src="../addons/ewei_shop/static/cate/img/header_list_icon2.png" /><span>分类</span></a>
					<a href="<?php  echo $this->createMobileUrl('member')?>" title="" class="menu-per"><img src="../addons/ewei_shop/static/cate/img/header_list_icon3.png" /><span>个人</span></a>
				</div>
			</header>
			<div class="content">
				<div class="home-top">
					<div class="info">
						<div class="head">
							<img src="<?php  echo $member['avatar'];?>">
						</div>
						<p class="name"><?php  echo $member['nickname'];?></p>
						<div class="number-wrap">
							<p class="number fhv"><img src="../addons/ewei_shop/static/cate/img/home_mobile.png"/><?php  echo $member['mobile'];?></p>
						</div>
					</div>
				</div>
				<div class="home-items">
					<section class="item" id="allorder">
						<script id='orderlist' type="text/javascript">
						<div class="title">
							<p>商城订单</p>
							<p>
								<a href="<?php  echo $this->createMobileUrl('order')?>" style="color: #eb569a">查看全部订单<img src="../addons/ewei_shop/static/cate/img/home_right_arrow.png" alt="" /></a>
							</p>
						</div>
						<ul class="wrap wrap1">
							<li>
								<a href="<?php  echo $this->createMobileUrl('order',array('status'=>0))?>">
									<div class="img">
										<%if order.status0>0 %><p class="number"><%order.status0%></p><%/if%>
										<img src="../addons/ewei_shop/static/cate/img/daifukuan.png" alt="">
									</div>
									<p>待付款</p>
								</a>
							</li>
							<li>
								<a href="<?php  echo $this->createMobileUrl('order',array('status'=>6,'type'=>1))?>">
									<div class="img">
										<%if order.status6>0 %><p class="number"><%order.status6%></p><%/if%>
										<img src="../addons/ewei_shop/static/cate/img/daizhizuo.png" alt="">
		
									</div>
									<p>待制作</p>
								</a>
							</li>
							<li>
								<a href="<?php  echo $this->createMobileUrl('order',array('status'=>7,'type'=>2))?>">
									<div class="img">
										<%if order.status7>0 %><p class="number"><%order.status7%></p><%/if%>
										<img src="../addons/ewei_shop/static/cate/img/zhizuozhong.png" alt="">
		
									</div>
									<p>制作中</p>
								</a>
							</li>
							
							<li>
								<a href="<?php  echo $this->createMobileUrl('order',array('status'=>2))?>">
									<div class="img">
										<%if order.status2>0 %><p class="number"><%order.status2%></p><%/if%>
										<img src="../addons/ewei_shop/static/cate/img/yunshuzhong.png" alt="">
		
									</div>
									<p>运输中</p>
								</a>
							</li>
						</ul>
						</script>
					</section>
				</div>
				<div class="home-links">
					<a href="<?php  echo $this->createMobileUrl('member/info')?>" class="link fv"><img class="left" src="../addons/ewei_shop/static/cate/img/home_img1.png"/><div class="border">修改个人信息<img class="right" src="../addons/ewei_shop/static/cate/img/home_right_arrow.png" alt="" /></div></a>
					<a href="<?php  echo $this->createMobileUrl('shop/address')?>" class="link fv"><img class="left" src="../addons/ewei_shop/static/cate/img/home_img3.png"/><div class="border">收货地址管理<img class="right" src="../addons/ewei_shop/static/cate/img/home_right_arrow.png" alt="" /></div></a>
					<a href="<?php  echo $this->createPluginMobileUrl('coupon')?>" class="link fv"><img class="left" src="../addons/ewei_shop/static/cate/img/home_img4.png"/><div class="border">领取优惠券<img class="right" src="../addons/ewei_shop/static/cate/img/home_right_arrow.png" alt="" /></div></a>
					<a href="<?php  echo $this->createPluginMobileUrl('coupon/my')?>" class="link fv"><img class="left" src="../addons/ewei_shop/static/cate/img/home_img5.png"/><div class="border">我的优惠券<img class="right" src="../addons/ewei_shop/static/cate/img/home_right_arrow.png" alt="" /></div></a>
					<a href="<?php  echo $this->createMobileUrl('shop/history')?>" class="link fv"><img class="left" src="../addons/ewei_shop/static/cate/img/home_img6.png"/><div class="border">我的足迹<img class="right" src="../addons/ewei_shop/static/cate/img/home_right_arrow.png" alt="" /></div></a>
				</div>
			</div>
		</div>
		<script src="../addons/ewei_shop/static/cate/js/jquery-1.12.4.min.js"></script>
		<script language="javascript">
		    require(['tpl', 'core'], function(tpl, core) {
		        
		        core.json('member/center',{},function(json){
		            
		           $('#allorder').html(  tpl('orderlist',json.result) );
		            
		        },true);
		        
		    })
		</script>
		<script type="text/javascript">
			(function () {
				var showList = $('#show-list');
				var top = $('.top-header-menu');
				showList.click(function () {
					var _this = this;
					$('.top-header-menu').toggle(function () {
					},function () {
						if (top.css('display') === 'none') $(_this).find('img')[0].src = '../addons/ewei_shop/static/cate/img/i_list_icon.png';
						else $(_this).find('img')[0].src = '../addons/ewei_shop/static/cate/img/i_close_icon.png';
					});
				});
			})();
		</script>
	</body>
</html>
