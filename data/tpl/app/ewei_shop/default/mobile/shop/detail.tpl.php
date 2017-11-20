<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('common/header2', TEMPLATE_INCLUDEPATH)) : (include template('common/header2', TEMPLATE_INCLUDEPATH));?>
		<style type="text/css">
			.content {
				bottom: 0.8rem;
			}
			#banner {height: 70%;}
		</style>
		<div class="page">
			<header id="header" class="i-header fv">
				<a href="javascript:;" id="show-list" class="icon fl"><img src="../addons/ewei_shop/static/cate/img/i_list_icon.png" /></a>
				<div class="m" onclick="window.location.href='<?php  echo $this->createMobileUrl('shop')?>'"><img src="../addons/ewei_shop/static/cate/img/i_head_icon.png" /></div>
				<a href="<?php  echo $this->createMobileUrl('shop/cart')?>" class="icon fr"><img src="../addons/ewei_shop/static/cate/img/i_shop_icon.png" />
				<p id="cardnum" <?php  if($cartnum==0) { ?>style="display:none;"<?php  } ?>><?php  echo $cartnum;?></p>
				</a>
				<div class="top-header-menu" style="display: none;">
					<a href="<?php  echo $this->createMobileUrl('shop')?>" class="menu-home"><img src="../addons/ewei_shop/static/cate/img/header_list_icon1.png" alt="" /><span>首页</span></a>
					<a href="<?php  echo $this->createMobileUrl('shop/category')?>" title="" class="menu-class"><img src="../addons/ewei_shop/static/cate/img/header_list_icon2.png" /><span>分类</span></a>
					<a href="<?php  echo $this->createMobileUrl('member')?>" title="" class="menu-per"><img src="../addons/ewei_shop/static/cate/img/header_list_icon3.png" /><span>个人</span></a>
				</div>
			</header>
			<div class="content">
				<div id="goodinfo">
				<script id='goods_info'  type='text/html'>
				<div id="banner" class="swiper-container">
					<div class="swiper-wrapper">
					<%if pics.length>1%>
							<%each pics as value index %>
								
								<div class="swiper-slide">
									<img data-src="<%value%>" src="../addons/ewei_shop/static/cate/img/placeholder_img.png" class="swiper-lazy" />
								</div>
								
            				<%/each%>
            		<%else%>
							<%each pics as value index %>
							<div class="swiper-slide">
								<img data-src="<%value%>" src="../addons/ewei_shop/static/cate/img/placeholder_img.png" class="swiper-lazy" />
							</div>
            				<%/each%>
            		<%/if%>
					</div>
				</div>
				<div class="detail-content">
					<div class="top">
						<h1 class="title"><%goods.title%></h1>
						<div class="tags">
							<%if goods.burdening1 !=null%>
							<div class="tag tag1"><%goods.burdening1%></div>
							<%/if%>
							<%if goods.burdening2 !=null%>
							<div class="tag tag1"><%goods.burdening2%></div>
							<%/if%>
							<%if goods.burdening3 !=null%>
							<div class="tag tag1"><%goods.burdening3%></div>
							<%/if%>
						</div>
						<div class="sub-title"><span><%goods.summary%></span></div>
						<!-- 选择规格 -->
						<a id="sel" href="javascript:;" class="sel-p sel-params-btn">规格数量选择</a>
					</div>
					<div class="center">
						<!-- candy_bg1,candy_bg2,candy_bg3,candy_bg4,candy_bg5 这些类分别代表参考甜度数量   例如：5颗  就是  candy_bg5-->
						<div class="item bg1"><em class="fl">参考甜度</em><span class="fl candy candy_bg<%if goods.referencesweetness!=''%><%goods.referencesweetness%><%else%>5<%/if%>   "></span></div>
						<div class="item bg2"><em class="fl">配送时间</em><span class="fl"><%goods.ordertime%></span></div>
						<div class="item bg3"><em class="fl">保鲜条件</em><span class="fl"><%goods.preservationcondition%></span></div>
						<div class="item bg4"><em class="fl">标准匹配</em><span class="fl"><%goods.suboptimalmatching%></span></div>
					</div>
					<div class="bottom">
						<!-- 这里是图文详情 -->
						<h2 style="font-size: 50px; font-weight: 700;"><?php  echo $html;?></h2>
					</div>
				</div>
				
				</script>
				</div>
			</div>
			<!-- 商品选择规格参数  S-->
			<div id="show-sel" class="sel-bottom-wrap content-pad hide">
				<div class="top clearfix">
					<span class="fl">￥<span class="price"></span></span><a href="javascript:;" class="close fr">+</a>
				</div>
				<div class="center">
					<ul class="params-list">
						<li><img src="../addons/ewei_shop/static/cate/img/sel_params_l1.png"/>直径d=<span class="diameter"></span>cm</li>
						<li><img src="../addons/ewei_shop/static/cate/img/sel_params_l2.png"/>适合<span class="fitnumber"></span>人分享</li>
						<li><img src="../addons/ewei_shop/static/cate/img/sel_params_l3.png"/>含<span class="tableware"></span>套餐具</li>
						<li><img src="../addons/ewei_shop/static/cate/img/sel_params_l4.png"/>须提前<span class="scheduletime"></span>小时预定</li>
					</ul>
					<img class="s-img" src="../addons/ewei_shop/static/cate/img/sel_params_img.png" />
					<div id="goodinfores">
						<script id='goodinfo1' type='text/html'>
							<%each specs as spec%>
								<dl class="params-item">
									
									<input type='hidden' name="optionid[]" class='optionid optionid_<%spec.id%>' value="" title="<%spec.title%>">
									<dt><%spec.title%></dt>
										<%each spec.items as value index%>
											<dd    <%if index==0%>class="active"<%/if%>   specid='<%spec.id%>' oid="<%value.id%>" title='<%value.title%>' thumb='<%value.thumb%>'><%value.title%></dd>
											
										<%/each%>
									
	                				
									<dd id="more" class='more'>更多</dd>
								</dl>
							<%/each%>
						</script>
					</div>
				</div>
				<a href="javascript:;" id="add" class="bottom">加入购物车<span>（¥:<span class="cartprice">0.00</span>）</span></a>
			</div>
			<!-- 商品选择规格参数  E-->
			<a href="javascript:;" class="detail_add_btn sel-params-btn" >加入购物车</a>
		</div>
		
		<script src="../addons/ewei_shop/static/cate/js/jquery-1.12.4.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/jquery.lazyload.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/tools.js"></script>
		<script type="text/javascript">
    		var nowoptionsnum=0;
    		var goodsinfo;
			var shopoption=false;
			var goodid;
    		require(['core', 'tpl','../addons/ewei_shop/static/cate/js/swiper-3.4.2.min.js'], function (core, tpl,swipe) {
				
				//获取商品信息
				function  getshop(){
					Tools.showIndicator();
					core.json('shop/detail',{id:'<?php  echo $_GPC['id'];?>',mid:"<?php  echo $mid;?>"},function(json){
						Tools.hideIndicator();
						console.log(json.result);
						$('#goodinfo').html(  tpl('goods_info',json.result) ); 
						nowoptionsnum=json.result.options.length;
						goodsinfo=json.result.goods;
						if(json.result.options.length==0){
							$('#sel').hide();
						}
						
						//幻灯片最后执行
						new swipe('#banner', {
							autoplay: 3000,
							autoplayDisableOnInteraction: false,
							loop: true,
							lazyLoading: true
						});
					});
				}
				getshop();
				

				 
				 
				 
				  
 				//最终的购物车被点击
 				$('#show-sel').delegate('#add', 'click', function() {
 					
    				if($(this).attr('show')=='addcart'){
    					//添加购物车
     					//如果选作了更多直接返回
    					var more=$('.more');
    					for (var i=0;i<more.length;i++) {
    						if(more.eq(i).hasClass('active')){
    							return;
    						}
    					}   					
    					
    					
    					Tools.showIndicator();
    					var url="<?php  echo $this->createMobileUrl('shop/cart')?>";
					    $.post(url,
					    {
					        op:'add',
					        id:"<?php  echo $_GPC['id'];?>",
					        optionid:nowoptions,
					        total:1
					    },
					        function(data,status){
					        	console.log(data);
					        	Tools.hideIndicator();
					        	var data=eval("("+data+")");
					        	selElement.hide();
					        	if(status=='success'){
					        		if(data.status==1){
					        			//添加成功更新下数量.
					        			var cardnum=$('#cardnum').text();
					        			console.log(cardnum);
					        			console.log(typeof(cardnum));					        			
					        			if(cardnum==''){
					        				console.log('我执行到了!');
					        				$('#cardnum').text(1)
					        			}
					        			else{
					        				cardnum++;
					        				$('#cardnum').text(cardnum);
					        			}
					        			$('#cardnum').show();
					        			Tools.toast(data.result.message);
					        		}
					        		else{
					        			Tools.toast(data.result);
					        		}
					        		
					        	}
					        	else{
					        		Tools.toast('网络请求失败!');
					        	}
					        	
					    });
    					

    				
    					
    				}
 				});					  
				//最终的购物车被点击 end
				  
				  
				  
				
    			//获取商品规格信息的方法
    			function getoptions2(){
					//先获取所有保存options的容器
    				alloptionobj=$('#goodinfores .active');
    				//console.log(alloptionobj);
    				var alloptionsid='';
    				
    				for (var i=0;i<alloptionobj.length;i++) {
    					
    					
    					//console.log(alloptionobj[i].getAttribute('oid'));
    					
    					if(alloptionobj[i].getAttribute('oid')==undefined){
    						break;
    					}
    					if(i+1<alloptionobj.length){
    						alloptionsid+=alloptionobj[i].getAttribute('oid')+'_';
    					}
    					else{
    						alloptionsid+=alloptionobj[i].getAttribute('oid');
    					}
    					
    				}
    				
    			
    				/* 这里不执行  gao*/
    				core.json('shop/category',{optionid:alloptionsid},function(json){
    					console.log('不执行');
    					if(json.result.options!=false){
    					$('.diameter').text(json.result.options.diameter);
    					$('.fitnumber').text(json.result.options.fitnumber);
    					$('.tableware').text(json.result.options.tableware);
    					$('.scheduletime').text(json.result.options.scheduletime);
						$('#show-sel .top  .price').text(json.result.options.marketprice);
						$('#add').attr('show','addcart');
						$('#add').html('加入购物车<span>（¥:'+json.result.options.marketprice+'）</span>').attr('href', '#');
						nowoptions=json.result.options.id;
						}
						//$('.cartprice').text(json.result.options.marketprice);
						
    				});
    				
    				console.log(alloptionsid);
    				
    				
    			}				
				//获取商品规格信息的方法end
				
				
				
				
				
				var selElement = Tools.selParams({
					triggerEle: '.sel-params-btn',
					open:function(e, defferd){
						var goodid=goodsinfo.id;
						var price =goodsinfo.marketprice;
						//return;
						//获取商品的详情
						Tools.showIndicator();
						core.json('shop/detail',{id:goodid},function(json){
								Tools.hideIndicator();
								//默认价格显示
								var minprice=json.result.goods.minprice;
								var maxprice=json.result.goods.maxprice;
								var marketprice=json.result.goods.marketprice;
								var trueprice=0;
								if(minprice !=maxprice){
									trueprice=minprice+'-'+maxprice;
								}
								else{
									trueprice=marketprice;
								}
								
								
								$('#show-sel .top  .price').text(trueprice);
								//默认价格显示end
							
							
							
							
							//有规格
							if(json.result.specs.length>0){
								
								shopoption=true;
								$('#goodinfores').show();
								$('#goodinfores').html(tpl('goodinfo1',json.result) );
								console.log(json.result);
								//return;
								//规格选作
								$('.params-item').delegate('dd', 'click', function() {
									$(this).addClass('active').siblings().removeClass('active');
									if (this.id === 'more') {
										//点击了更多
										$('#add').html('联系客服').attr('href', 'tel:<?php  echo $phone;?>');
									}else {
										
										//更新规格图片
										$('.s-img').attr('src',$(this).attr('thumb'));
										
										//保存每次选作的规格
										$(this).parent().find("input").val($(this).attr('oid'));
											
										//执行操作规格返回的数据
										getoptions2();
										
										
										
									}
								});
								//规格选作end
								
								
							}
							//无规格直接添加到购物车
							else{
								//显示价格
								//cartprice
								e.setAttribute('hide', true);
								$('.cartprice').text(trueprice);
		    					Tools.showIndicator();
		    					var url="<?php  echo $this->createMobileUrl('shop/cart')?>";
							    $.post(url,
							    {
							        op:'add',
							        id:goodid,
							        total:1
							    },
							        function(data,status){
							        	console.log(data);
							        	Tools.hideIndicator();
							        	var data=eval("("+data+")");
							        	
							        	if(status=='success'){
							        		if(data.status==1){
							        			//添加成功更新下数量.
							        			var cardnum=$('#cardnum').text();
							        			console.log(cardnum);
							        			console.log(typeof(cardnum));					        			
							        			if(cardnum==''){
							        				console.log('我执行到了!');
							        				$('#cardnum').text(1)
							        			}
							        			else{
							        				cardnum++;
							        				$('#cardnum').text(cardnum);
							        			}
							        			$('#cardnum').show();
							        			//添加成功更新下数量.
							        			Tools.toast(data.result.message);
							        		}
							        		else{
							        			Tools.toast(data.result.message);
							        		}
							        		
							        	}
							        	else{
							        		Tools.toast('网络请求失败!');
							        	}
							        	
							    });
								
								
								//.setAttribute('hide', true);
								//var url="<?php  echo $this->createMobileUrl('shop/detail')?>&id="+goodid;
								//window.location.href=url;
								
								/*
								$('#goodinfores').hide();
								$('#show-sel .params-list').html('');
								$('#add').attr('show','addcart');
								$('#add').html('加入购物车<span>（¥:'+price+'）</span>').attr('href', '#');
								*/
							}
							
							
							
							//点击添加购物车,会请求查询默认选作的规格信息
							getoptions2();
							//延迟对象
							defferd.resolve();
						});
					
					},
					ele: '#show-sel',
					closeEle: '.close',
				});
				
				$('.params-item').delegate('dd', 'click', function() {
					$(this).addClass('active').siblings().removeClass('active');
					if (this.id === 'more') {
						//点击了更多
						$('#add').html('联系客服').attr('href', 'tel:<?php  echo $phone;?>');
					}else {
					    $('#add').html('加入购物车<span>（¥:'+price+'）</span>').attr('href', '#');
					}
				});
 
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
				function loadImg() {
					$("img.lazyload").lazyload({
						placeholder : "../addons/ewei_shop/static/cate/img/placeholder_img.png",
						effect: "fadeIn",
						container: '.content'
					});
				}
				loadImg();
    		});
			
		</script>
	</body>
</html>
