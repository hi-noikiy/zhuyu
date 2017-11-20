<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('common/header2', TEMPLATE_INCLUDEPATH)) : (include template('common/header2', TEMPLATE_INCLUDEPATH));?>
		<div class="page">
			<header id="header" class="i-header fv">
				<a href="javascript:;" id="show-list" class="icon fl"><img src="../addons/ewei_shop/static/cate/img/i_list_icon.png" /></a>
				<div class="m"  onclick="window.location.href='<?php  echo $this->createMobileUrl('shop')?>'" ><img src="../addons/ewei_shop/static/cate/img/i_head_icon.png" /></div>
				<a href="<?php  echo $this->createMobileUrl('shop/cart')?>" class="icon fr"><img src="../addons/ewei_shop/static/cate/img/i_shop_icon.png" />
				<?php  if($cartnum>0) { ?>
				<p><?php  echo $cartnum;?></p>
				<?php  } ?>				
				</a>
				<div class="top-header-menu" style="display: none;" >
					<a href="<?php  echo $this->createMobileUrl('shop')?>" class="menu-home"><img src="../addons/ewei_shop/static/cate/img/header_list_icon1.png" alt="" /><span>首页</span></a>
					<a href="<?php  echo $this->createMobileUrl('shop/category')?>" title="" class="menu-class"><img src="../addons/ewei_shop/static/cate/img/header_list_icon2.png" /><span>分类</span></a>
					<a href="<?php  echo $this->createMobileUrl('member')?>" title="" class="menu-per"><img src="../addons/ewei_shop/static/cate/img/header_list_icon3.png" /><span>个人</span></a>
				</div>
			</header>
			
			<div id="allcontent">
			<script id='indexlist' type='text/html'>
			<div class="content">
				<div id="banner" class="swiper-container">
					<div class="swiper-wrapper">
							<%each advs as adv %>
							<div class="swiper-slide"  <%if adv.link%>onclick="location.href='<%adv.link%>'"<%/if%>   >
								<img data-src="<%adv.thumb%>" class="swiper-lazy" src="../addons/ewei_shop/static/cate/img/placeholder_img.png" />
							</div>
							<%/each%>
						
					</div>
					<div class="swiper-pagination"></div>
				</div>
				<footer id="footer" class="footer fv">
				
				
					<%each category as value%>
						<a href="<?php  echo $this->createMobileUrl('shop/category')?>&pcate=<%value.id%>" class="item">
							<div class="img"><img src="<%value.advimg%>" /></div>
							<%value.name%>
						</a>
       				<%/each%>
       				
       				
				</footer>
				<div class="i-imgs">
					<%each articles as value%>
						<div  onclick="window.location.href='<?php  echo $this->createPluginMobileUrl('article')?>&aid=<%value.id%>'"   class="img"><img src="<%value.resp_img%>"/></div><!-- 352px -->
       				<%/each%>
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
			</script>
			</div>
		</div>
		
		<script src="../addons/ewei_shop/static/cate/js/jquery-1.12.4.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/jquery.lazyload.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/tools.js"></script>
<!--	<script src="../addons/ewei_shop/static/cate/js/swiper-3.4.2.min.js"></script>-->
		<script type="text/javascript">
    	
    	require(['core', 'tpl','../addons/ewei_shop/static/cate/js/swiper-3.4.2.min.js'], function (core, tpl,swipe) {
				
				
				//获取首页advs和category
				function  getindex(){
					core.json('shop/index', {}, function(json) {

						$('#allcontent').append(tpl('indexlist', json.result));
						var hH = $('#header').height();
						var fH = $('#footer').height();
						$('#banner').height(window.innerHeight - hH - fH);
						//幻灯片最后再加载
						new swipe('#banner', {
							pagination: '.swiper-pagination',
							autoplay: 3000,
							autoplayDisableOnInteraction: false,
							loop: true,
							lazyLoading: true
						});
					});
					
				}

				getindex();
    	});
			

			
			$(document).ready(function () {
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
			});
		</script>
	</body>
</html>
