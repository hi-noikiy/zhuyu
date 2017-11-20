<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('common/header2', TEMPLATE_INCLUDEPATH)) : (include template('common/header2', TEMPLATE_INCLUDEPATH));?>

		<style type="text/css">
			.content {top: 3.1rem;}
			@keyframes jump {
				from {
					transform: translateY(0);
				}
				to {
					transform: translateY(-80px);
				}
			}
		</style>
		
		<div class="page">
			<header class="i-header fv">
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
			<div id="category"  class="nav-fixed fv nav-click">
				<script id='catelist' type='text/html'>
					<%each category as cate %>
						<div class="item " id="<%cate.id%>">
							<img src="<%cate.advimg%>"/>
							<%cate.name%>
						</div>
					<%/each%>
				</script>	
			</div>
			<div id="nav-list" class="swiper-container">
				<ul  id="soncategory" class="nav-list fv nav-click swiper-wrapper">
				<script id='soncatelist' type='text/html'>
					<%each soncategory as soncate %>
						<li class="item swiper-slide" id="<%soncate.id%>">
							<a href="#"><%soncate.name%></a>
						</li>
					<%/each%>
				</script>	
				</ul>
			</div>
			<div class="content">
				<ul class="cate-list"  id="goods1">
					<script id='goodlist' type='text/html'>
						<%each goods as good %>
							<li>
								<a href="#">
									<div class="sq-img"><img class="lazyload" onclick="window.location.href='<?php  echo $this->createMobileUrl('shop/detail')?>&id=<%good.id%>'"    src="../addons/ewei_shop/static/cate/img/placeholder_img.png" data-original="<%good.thumb%>" /></div>
									<div class="text">
										<div class="title over_2"><%good.title%></div>
										<div class="wrap">
											<div class="price fl">￥<%good.marketprice%><%if good.unit!='' %> /<%good.unit%> <%/if%> </div>
											<img class="add_cart fr"  goodid="<%good.id %>"  price="<%good.marketprice%>"  src="../addons/ewei_shop/static/cate/img/add_cart.png"/>
										</div>
									</div>
								</a>
							</li>
						<%/each%>
					</script>
				</ul>
				<div id="pro_empty" class="hide">
					<div class="empty-wrap">
						<img src="../addons/ewei_shop/static/cate/img/pro_empty.png">
						<p>z暂无数据</p>
					</div>
				</div>
				<a id="loadding-more" href="javascript:;" class="scroll-tips block">查看更多</a>
				<!-- 底部 S -->
				<div class="footer-div">
					<div class="btns fh">
						<a href="tel:<?php  echo $phone;?>">联系我们</a>
						<a href="<?php  echo $this->createMobileUrl('shop/shopnotice')?>">全站公告</a>
					</div>
					<p class="bq">版权所有©2017 珠玉私房烘培公司保留所有权利</p>
				</div>
				<!-- 底部 E -->
			</div>
		</div>
		<!-- 商品选择规格参数  S-->
		<div id="show-sel" class="sel-bottom-wrap content-pad hide">
			
			
			
			<div class="top clearfix">
				<span class="fl" >￥<span class="price"></span></span><a href="javascript:;" class="close fr">+</a>
			</div>
			

				<div class="center">
					<ul class="params-list">
						<li><img src="../addons/ewei_shop/static/cate/img/sel_params_l1.png"/>直径d=<span class="diameter"></span>cm</li>
						<li><img src="../addons/ewei_shop/static/cate/img/sel_params_l2.png"/>适合<span class="fitnumber"></span>人分享</li>
						<li><img src="../addons/ewei_shop/static/cate/img/sel_params_l3.png"/>含<span class="tableware"></span>套餐具</li>
						<li><img src="../addons/ewei_shop/static/cate/img/sel_params_l4.png"/>须提前<span class="scheduletime"></span>小时预定</li>
					</ul>
					<img class="s-img" src="../addons/ewei_shop/static/cate/img/sel_params_img.png"/>
					
					<div id="goodinfores">
						<script id='goodinfo' type='text/html'>
							<%each specs as spec%>
								<dl class="params-item">
									
									<input type='hidden' name="optionid[]" class='optionid optionid_<%spec.id%>' value="" title="<%spec.title%>">
									<dt><%spec.title%></dt>
										<%each spec.items as value index%>
											<dd    <%if index==0%>class="active"<%/if%>   specid='<%spec.id%>' oid="<%value.id%>" title='<%value.title%>' thumb='<%value.thumb%>'><%value.title%></dd>
											
										<%/each%>
									
	                				
									<dd id="more" class="more">更多</dd>
								</dl>
							<%/each%>
						</script>
					</div>	
					
					
				</div>
			
			<a href="javascript:;" id="add" class="bottom">加入购物车<span>（¥:<span class="cartprice">0.00</span>）</span></a>
		</div>
		<!-- 商品选择规格参数  E-->
		
		
		<script src="../addons/ewei_shop/static/cate/js/jquery-1.12.4.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/jquery.lazyload.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/tools.js"></script>
		<script type="text/javascript">
			
			var pcate="<?php  echo $_GPC['pcate'];?>";//获取地址栏传参的分类id
			var shopoption=false;
			var goodid;
			var pcatetrue=true;			
			var nowoptions;//选择的大规格
		    var args  = {
		           page:1,
		           isnew: "<?php  echo $_GPC['isnew'];?>",
		           ishot: "<?php  echo $_GPC['ishot'];?>",
		           isrecommand:"<?php  echo $_GPC['isrecommand'];?>",
		           isdiscount:"<?php  echo $_GPC['isdiscount'];?>",
		           keywords:"<?php  echo $_GPC['keywords'];?>",
		           istime:"<?php  echo $_GPC['istime'];?>",
		           pcate:"<?php  echo $_GPC['pcate'];?>",
		           ccate:"<?php  echo $_GPC['ccate'];?>",
		           tcate:"<?php  echo $_GPC['tcate'];?>",
		           order:"<?php  echo $_GPC['order'];?>",
		           by:"<?php  echo $_GPC['by'];?>",
		           shopid:"<?php  echo $_GPC['shopid'];?>"
		    }; 			
    		require(['core', 'tpl','../addons/ewei_shop/static/cate/js/swiper-3.4.2.min.js'], function (core, tpl,swipe) {	

    			//先获取总分类函数
    			function getcategory(){
    				Tools.showIndicator();
    				core.json('shop/category', {'type':1}, function(json) {
    					if(json.result.category.length>0){
    						
    						Tools.hideIndicator();
    						//获取总分类
    						$('#category').html(tpl('catelist', json.result));
    						
    						//第一个分类active
    						if(pcate!=''){
    							$('#category #'+pcate).addClass('active');
    						}
    						else{
    							$('#category .item:first').addClass('active');
    						}
    						
    						
    						//获取首个总分类的子分类
    						if(pcate!='' && pcatetrue==true){
    							firstid=pcate;
    						}
    						else{
    							firstid=json.result.category[0].id;
    						}
    						
      						if(firstid!=''){
      							getsoncategory(firstid);
      						}
    						
    						
    						
    					}

    				});
    				
    			}
    			
    			//再获取子分类函数
     			function getsoncategory(id){
     				Tools.showIndicator();
    				core.json('shop/category', {'type':2,'id':id}, function(json) {
    					
    					Tools.hideIndicator();
    					//如果子分类没有数据清空
    					if(json.result.soncategory.length>-1){
    						$('#soncategory').html(tpl('soncatelist', json.result));
    					}
    					
    					else{
    						//$('#soncategory').html('');
    						$('#soncategory').html('<li style="width: 100%;" class="swiper-slide" >这儿啥都木有~</li>');
    					}
    					
		     			//轮播只是专属子分类
						/*new swipe('#nav-list', {
					        freeMode: true,
					        width: window.innerWidth/3.5
					   });*/
    				});
    				
    			}   			
    			
    			//获取参数的方法
    			function  getargs(){
    				 //获取选择的父类id
    				 var pcate= $('#category .active').attr('id');
    				 var ccate=	$('#soncategory .active').attr('id');
    				 
					if(typeof(pcate)=='undefined' && pcatetrue==true ){
						args.pcate="<?php  echo $_GPC['pcate'];?>";
					}
					else{
					 	args.pcate=pcate;
					}
					if(typeof(ccate)=='undefined'){
						//args.ccate="<?php  echo $_GPC['ccate'];?>";
					}
					else{
					 	args.ccate=ccate;
					}
    			}
    			
    			var isBottom = false;
    			//获取商品的方法
    			function  getlist(ele=''){
    				Tools.showIndicator();
    				core.json('shop/list', args, function (json) {
    					Tools.hideIndicator();
    					if(json.result.goods.length>0){
    						$('#loadding-more').html('查看更多');
    						isBottom = false;
    						$('#pro_empty').hide();
    						if(args.page==1){
    							$('#goods1').html(tpl('goodlist', json.result));
    						}
    						else{
    							$('#goods1').append(tpl('goodlist', json.result));
    						}
    						loadImg();
    					}
    					else{
    						//无数据,并且是page是第1页
    						$('#loadding-more').html('已经到底了');
    						isBottom = true;
    						if(args.page==1){
    							$('#pro_empty').show();
    							$('#goods1').html(tpl('goodlist', json.result));
    						}
    					}
    					
    				});
    				
    			}
    			
    			
    			
    			//获取商品规格信息,通过用户选择
    			
    			function getoptions1(){
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
    				
    				//获得结果进行查询
    				
    				core.json('shop/category',{optionid:alloptionsid},function(json){

						alloptionsid=json.result.options.id;
						
						
						
						
						
						
						
    				});

    				return alloptionsid;
    			}
    			
    			
    			
    			//获取商品规格信息,获取默认选择
    			function getoptions2(){
					Tools.showIndicator();
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
    				
    				
    				//获得结果进行查询
     				core.json('shop/category',{optionid:alloptionsid},function(json){
    					Tools.hideIndicator();
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
    				Tools.hideIndicator();
    			}
    			

    			
    			
    			//执行获取分类函数
    			getcategory();
    			//获取商品
    			getlist();
    			
    			
 
 
 
 				/*
				 * 弹出底部选择参数框 
				 * @params: Obj== {
				 	* 	triggerEle： 触发弹框的元素
				 * 		ele: 底部元素
				 * 		open: 显示弹框回调
				 * 		closeEle: 触发关闭弹框元素
				 * 		close: 关闭弹框回调
				 * }
				 * */
				var selElement = Tools.selParams({
					triggerEle: '.add_cart',
					ele: '#show-sel',
					closeEle: '.close',
					open:function(e, deferred){
						 goodid=e.getAttribute('goodid');
						var price =e.getAttribute('price');
						
						//获取商品的详情
						core.json('shop/detail',{id:goodid},function(json){
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
								$('#goodinfores').html(tpl('goodinfo',json.result) );
								console.log(json.result);

								//规格选作
								$('.params-item').delegate('dd', 'click', function() {
									
									$(this).addClass('active').siblings().removeClass('active');
									
									getoptions2();
									
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
							//无规格
							else{
								e.setAttribute('hide', true);
								var url="<?php  echo $this->createMobileUrl('shop/detail')?>&id="+goodid;							
								window.location.href=url;
								/*
								$('#goodinfores').hide();
								$('#add').attr('show','addcart');
								$('#add').html('加入购物车<span>（¥:'+price+'）</span>').attr('href', '#');
								*/
							}
							
							
							
							//点击添加购物车,会请求查询默认选作的规格信息
							getoptions2();
							
							deferred.resolve();
						});
						

					}
				});
				
				
				
				
				
				
				
				
				
				$('.nav-click').delegate('.item', 'click', function() {
					
					var _this = $(this).parent();
					$(this).addClass('active').siblings().removeClass('active');
					if (_this.hasClass('nav-fixed')) {
						

						console.log('点击了大分类');
						pcatetrue=false;

						//点击大分类清空子类
						$('#soncategory li').remove;
						$('#soncategory').html('');
						if(pcate==''){
							$('#goods1').html('');
						}						
						
						args.ccate='';
						args.page=1;
						getsoncategory($(this).attr('id'));

						getargs();
						getlist();

						
					}
					if (_this.hasClass('nav-list')) {

						console.log('点击了小分类');
						pcatetrue=false;
						//点击小分类清空商品
						if(pcate==''){
							$('#goods1').html('');
						}	
						args.page=1;
						getargs();
						getlist();
						
						

					}
					

				});
				
				//加载更多
				
				$('#loadding-more').click(function () {
					
					console.log(isBottom);
					if (!isBottom) {
						args.page++;
						getlist($(this));
					}
					
					//最后一页
				});

 
 
 				//最终的购物车被点击
 				$('#show-sel').delegate('#add', 'click', function() {
    				if($(this).attr('show')=='addcart'){
    					//添加购物车
    					console.log(goodid);
    					console.log(nowoptions);
    					
    					//如果选作了更多直接返回
    					var more=$('.more');
    					for (var i=0;i<more.length;i++) {
    						if(more.eq(i).hasClass('active')){
    							return;
    						}
    					}
    					
    					
    					
    					
    					var url="<?php  echo $this->createMobileUrl('shop/cart')?>";
					    $.post(url,
					    {
					        op:'add',
					        id:goodid,
					        optionid:nowoptions,
					        total:1
					    },
					        function(data,status){
					        	
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
					        			//添加成功更新下数量.
					        			console.log(data.result.message);
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
    		//Required End
    		});

		</script>
	</body>
</html>