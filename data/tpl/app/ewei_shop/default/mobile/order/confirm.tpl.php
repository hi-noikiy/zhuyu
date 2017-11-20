<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('common/header2', TEMPLATE_INCLUDEPATH)) : (include template('common/header2', TEMPLATE_INCLUDEPATH));?>
	<link rel="stylesheet" type="text/css" href="../addons/ewei_shop/static/cate/css/mui.picker.min.css"/>
	<link href="../addons/ewei_shop/static/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../addons/ewei_shop/template/mobile/default/static/css/style.css">
	<script src="../addons/ewei_shop/static/js/dist/mobiscroll/mobiscroll.core-2.5.2.js" type="text/javascript"></script>
	<script src="../addons/ewei_shop/static/js/dist/mobiscroll/mobiscroll.core-2.5.2-zh.js" type="text/javascript"></script>
	<script src="../addons/ewei_shop/static/js/dist/mobiscroll/mobiscroll.datetime-2.5.1.js" type="text/javascript"></script>
	<script src="../addons/ewei_shop/static/js/dist/mobiscroll/mobiscroll.datetime-2.5.1-zh.js" type="text/javascript"></script>
	<script src="../addons/ewei_shop/static/js/dist/mobiscroll/mobiscroll.android-ics-2.5.2.js" type="text/javascript"></script>
	<script src="../addons/ewei_shop/template/mobile/default/static/js/star-rating.js" type="text/javascript"></script>
	<script src="../addons/ewei_shop/static/js/dist/ajaxfileupload.js" type="text/javascript"></script>
	<script type="text/javascript" src="../addons/ewei_shop/static/js/dist/area/cascade.js"></script>
		<style type="text/css">
			.content { bottom: 0.98rem; } .detail-footer { line-height: 0.98rem; } .detail-footer >span {color: #a61a59} .order-sel .right input {width: 100%;}
			.coupon_item {box-sizing: content-box;}.coupon_item .cinfo .inner{box-sizing: content-box;}
		</style>
		
		<div id='carrier_container'></div>
		<div id='dispatch_container'></div>
		<div id='address_container'></div>
		<div id='confirm_container'></div>



		<script id='tpl_address_list' type='text/html'>
		    <div class="chooser choose_address" >
		        <%each list as address%>
		        <div class="address" 
		             data-addressid='<%address.id%>'
		             data-realname='<%address.realname%>'
		             data-mobile='<%address.mobile%>'
		             data-address='<%address.address%>'
		             >
		            <div class="ico" ><%if selectedAdressID==address.id%><i class="fa fa-check" style="color:#0c9"></i><%/if%></div>
		            <div class="info">
		                <div class='inner'>
		                    <div class="name"><%address.realname%>(<%address.mobile%>)</div>
		                    <div class="addr"><%address.address%></div>
		                </div>
		            </div>
		            <div class="edit"><i class='fa fa-pencil'></i></div>
		        </div>
		        <%/each%>
		        <div class="add_address"><i class="fa fa-plus-circle" style="margin-left:3%; margin-right:10px; line-height:44px; font-size:20px;"></i>新增收货地址</div>
		    </div>
		</script>
		
		<script id='tpl_address_new' type='text/html'>
		    <input type='hidden' id='edit_addressid' value="<%address.id%>" />
		    <div class="address_main" >
		        <div class="line"><input type="text" placeholder="收件人" id="realname" value="<?php  if(address.realname) { ?><%address.realname%><?php  } ?>" /></div>
		        <div class="line"><input type="text" placeholder="联系电话"  id="mobile" value="<?php  if(address.mobile) { ?><%address.mobile%><?php  } ?>"/></div>
		        
		        <div class="line"><select id="sel-provance" onchange="selectCity();" class="select"><option value="" selected="true">所在省份</option></select></div>
		        <div class="line"><select id="sel-city" onchange="selectcounty()" class="select"><option value="" selected="true">所在城市</option></select></div>
		        <div class="line"><select id="sel-area" class="select"><option value="" selected="true">所在地区</option></select></div>
		       
		        <div class="line"><input type="text" placeholder="详细地址(不包含省份城市区域)"  id="address" value="<?php  if(address.address) { ?><%address.address%><?php  } ?>"/></div>
		<!--        <div class="line"><input type="text" placeholder="邮政编码"  id="zipcode" value="<?php  if(address.zipcode) { ?><%address.zipcode%><?php  } ?>"/></div>-->
		
		        <div class="address_sub1">确认</div>
		        <div class="address_sub2">取消</div>
		    </div>
		</script>
		
		<script id='tpl_carrier_list' type='text/html'>
		    <div class="chooser choose_carrier">
		        <%each carrier_list as carrier index%>
		        <div class="address carrier"
		             data-index='<%index%>'
		             data-id='<%carrier.id%>'
		             data-realname='<%carrier.realname%>'
		             data-mobile='<%carrier.mobile%>'
		             data-address='<%carrier.address%>' 
		             >
		            <div class="ico" ><%if selectedCarrierIndex==index%><i class="fa fa-check" style="color:#0c9"></i><%/if%></div>
		            <div class="info">
		                <div class='inner'>
		                    <div class="name"><%carrier.realname%>(<%carrier.mobile%>)</div>
		                    <div class="addr"><%carrier.address%></div>
		                </div>
		            </div>
		        </div>
		        <%/each%>
		    </div>
		</script>



		<script id='tpl_confirm_info' type='text/html'>
		<div class="page">
			<div class="order-head">
				<a class="back" onclick="window.history.back();"><img src="../addons/ewei_shop/static/cate/img/order_back.png" /></a>
				订单确认
			</div>
			<div class="content">
				<!-- 收货地址 S -->
				
				<%if !address %>
				<!-- 未添加任何收货地址 -->
				<div id="address_new" class="address-container tc f-b no">
					请添加收货地址
				</div>
				<%else%>
				<!-- 已添加收货地址 -->
				<div class="address-container">
					<input type='hidden' id='addressid' value='<%address.id%>' />
					<div class="wrap fv">
						<div class="left fv">
							<img src="../addons/ewei_shop/static/cate/img/address_icon.png" />
							<div class="text">
								<span class="title"><span id="address_realname"><%address.realname%></span></span><span><span id="address_mobile"><%address.mobile%></span></span>
								<p class="fz-24"><span id="address_address"><%address.address%></span></p>
							</div>
						</div>
						<a href="javascript:;"  id='address_select' class="tips">更换</a>
					</div>
				</div>
				<%/if%>
				
				
				<!-- 收货地址 E -->
				<div class="order-items">
					<!-- 这里开始遍历 S-->
					<%each goods as g%>
						<div class="order-item"    onclick="window.location.href='<?php  echo $this->createMobileUrl('shop/detail')?>&id=<%g.goodsid%>'"   >
							<div class="item">
								<img  class="fl" src="../addons/ewei_shop/static/cate/img/order_img.png" />
								<div class="text">
									<div class="title"><%g.title%></div>
									<%if g.optionid!='0'%><div class="sub-title">规格：<%g.optiontitle%></div><%/if%>
									<div class="price">￥<%g.marketprice%></div>
								</div>
								<div class="number">x<%g.total%></div>
							</div>
							<!-- 选择了参数 -->
							<%if g.cakehattitle!=''%><div class="sel-style">已选择：<%if g.birthdaycard%>生日牌、<%/if%>  <%if g.cakehattitle%><%g.cakehattitle%><%/if%>  <%if g.birthdaycandletitle%><%g.birthdaycandletitle%><%/if%></div><%/if%>
							<input type="hidden" id="birthdaycard" value="<%g.birthdaycard%>"/>
							<input type="hidden" id="cakehat" value="<%g.cakehat%>"/>
							<input type="hidden" id="birthdaycandle" value="<%g.birthdaycandle%>"/>	
							<input type="hidden" id="fruitid" value="<%g.fruitid%>"/>								
						</div>
        			<%/each%>	
        			<input type="hidden" id="goods" value="<%each goods as g%><%g.goodsid%>,<%g.optionid%>,<%g.total%>|<%/each%>"/>
					<!-- 这里开始遍历 E-->
					<div class="total">共<%total%>件商品&nbsp;&nbsp;&nbsp;小计：<span>￥<span class="goodsprice"><%goodsprice%></span></span></div>

				</div>
				
				<div class="order-sel-mar">
					<div class="order-sel bg"><span class="fl left">配送时间</span><span class="fr right" style="width: 80%;"><input type="" id="sel-time" placeholder="请选择" value="" readonly onfocus="this.blur()" /></span></div>					
					<input type="hidden" id="couponid" value="" />
					
					<div id="coupondiv" class="order-sel"><span class="fl left">优惠券</span><span  id="selectcoupon"><span id="couponselect"   class="fr right price"><%couponcount%>张可用</span></span></div>
				</div>
				
		
				
				
				
				
				<div class="order-sel-mar">
					<div class="order-sel-title">支付方式</div>
					<div class="order-sel bg bg-wx"><span class="fl left">微信支付</span><span class="fr right right0 checked"></span></div>
				</div>
				
				<div class="order-sel-mar">
					<div class="order-sel-title">订单留言</div>
					<div class="order-sel order-sel-textarea">
						<textarea rows="" id="remark" cols="4" placeholder="请填写您对订单或商品的特殊要求，200字以内"></textarea>
					</div>
				</div>
				<div class="order-sel-mar">
					<div class="order-sel-title">金额明细</div>
					<div class="order-sel"><span class="fl left">商品总额</span><span class="fr c-6">￥<%goodsprice%></span></div>
					<div class="order-sel"><span class="fl left">配送服务费</span><span class="fr c-6">￥<span class="dispatchprice"><%dispatchprice%></span></span></div>
				</div>
			</div>
			<div class="detail-footer clearfi tr">
				合计：<span>￥<span class="totalprice"><%realprice%></span></span>
				<div class="wrap fr">
					<section class="button paysub">去结算</section>
				</div>
			</div>
		</div>
		</script>

		<script src="../addons/ewei_shop/static/cate/js/jquery-1.12.4.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/mui.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/mui.picker.min.js"></script>
		<script src="../addons/ewei_shop/static/cate/js/tools.js"></script>
		
		
		<?php  if($hascouponplugin) { ?>
		<?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('coupon/chooser', TEMPLATE_INCLUDEPATH)) : (include template('coupon/chooser', TEMPLATE_INCLUDEPATH));?>
		<?php  } ?>
		<script type="text/javascript">
			var fromcart = 0;
		    require(['tpl', 'core'], function(tpl, core) {
		
				var showAniaddress = function () {
					$('#address_container').show()
					setTimeout(function () {
						$('#address_container').css('transform', 'translateX(0)');
					}, 50);
				}
				var hideAniaddress = function () {
					$('#address_container').css('transform', 'translateX(100%)');
					setTimeout(function() {
						$('#address_container').hide();
					}, 300);
				}
		        core.json('order/confirm', {id:'<?php  echo intval($_GPC['id'])?>', optionid:'<?php  echo intval($_GPC['optionid'])?>', total:'<?php  echo intval($_GPC['total'])?>',cartids:"<?php  echo $_GPC['cartids'];?>"}, function(json){
		
		        if(json.status==-1){
		            location.href=json.result.url;
		            return;
		        }
		        $('#confirm_container').html(tpl('tpl_confirm_info', json.result));
				
					//han
				var picker = new mui.PopPicker({
					layer: 2
				});
				//存储时间数组
				var a = [], b = [];
				const ONE_DAY = 24*60*60*1000;
				var sdate = new Date()*1 + ONE_DAY;
				var edate = new Date(new Date().setMonth(new Date().getMonth()+1))*1+ONE_DAY;
				var sc = new Date(new Date().setHours(0, 0, 0, 0))*1 + 10*60*60*1000;
				var sm = new Date(new Date().setHours(0, 0, 0, 0))*1 + 19.5*60*60*1000;
				while (sdate <= edate) {
					var t = Tools.formatDate(sdate, 'MM-dd w ');
					var obj = {
						value: sdate, //时间戳方便后台直接获取
						text: t //显示的值
					};
					a.push(obj);
					sdate += 24*60*60*1000;
				}
				while (sc < sm) {
					var c = sc + 30*60*1000;
					var t1 = Tools.formatDate(sc, 'HH:mm');
					var t2 = Tools.formatDate(c, 'HH:mm');
					var obj = {
						value: sc, //时间戳方便后台直接获取
						text: t1+' ~ '+t2 //显示的值
					};
					b.push(obj);
					sc += 30*60*1000;
				}
				//获取到选择时间（该时间只显示了  时分  可以通过 value字段获取时间戳 ）
				var parmas = [];
				for (i = 0; i<a.length; i++) {
					var obj = {
						value: a[i].value,
						text: a[i].text,
						children: b
					};
					parmas.push(obj);
				}
				console.log(parmas);
				$('#sel-time').click(function () {
					picker.setData(parmas);
					picker.show(function (obj) {
						var startdate = obj[0].text;
						var enddate = obj[1].text;
						//获取时间时间戳      Tools.formatDate(obj[0].value);
						console.log(Tools.formatDate(obj[0].value, 'yyyy-MM-dd HH:mm:ss'));
						this.value = startdate+enddate;
					}.bind(this));
				});
				$('.bg-wx').click(function () {
					var _this = $(this).find('.right');
					if (_this.hasClass('checked')) {
						_this.removeClass('checked');
					}else {
						_this.addClass('checked');
					}
				});
				
				$('#cancel-order').click(function () {
					Tools.alert('亲，确定要取消该订单吗？', function () {
						
						Tools.showIndicator();
						setTimeout(function () {
							Tools.hideIndicator();
							Tools.toast('取消订单成功');
						}, 500);
					}, true);
				});						
					
					//han
				
				
					console.log(json.result);
		            <?php  if(!empty($order_formInfo)) { ?>
		                <?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('diyform/common_js', TEMPLATE_INCLUDEPATH)) : (include template('diyform/common_js', TEMPLATE_INCLUDEPATH));?>
		                <?php  } ?>
		                    
		           $('.leftnav').click(function(){
		                var input =$(this).next();
		                if(!input.isInt()){
		                    input.val('1');
		                }
		                var num = parseFloat( input.val() );
		                num--;
		                if(num<=0){
		                    num=1;
		                }
		                input.val(num);
		                    $('#goodscount').html(num);
		                marketprice = parseFloat( $(this).closest('.good').find('.marketprice').html().replace(",","") ) * num;
		                $('.goodsprice').html( marketprice.toFixed(2) );
		                if( $('.memberdiscount').length>0){
		                                var discountprice = marketprice - parseFloat( $('.memberdiscount').html().replace(",","") ) / 10 * marketprice;
		                $('.discountprice').html( discountprice.toFixed(2) );
		            }
		                var zt =  $('.addorder_nav .selected').data('nav') =='1';
		                getDispatchPrice(zt);
		                
		            })
		            
		             $('.rightnav').click(function(){
		                var maxbuy = parseInt( $(this).closest('.good').data('totalmaxbuy'));
		             
		                var input =$(this).prev();
		                if(!input.isInt()){
		                    input.val('1');
		                } 
		                var num = parseInt( input.val() );
		                num++;
		               
		                if(num>maxbuy ){
		                    num=maxbuy;
		                    core.tip.show("您最多购买 " + maxbuy + " 件");
		                }
		                input.val(num);
		                $('#goodscount').html(num);
		                var marketprice = parseFloat( $(this).closest('.good').find('.marketprice').html().replace(",","") ) * num;
		                $('.goodsprice').html( marketprice.toFixed(2) );
		                     if( $('.memberdiscount').length>0){
		                var discountprice = marketprice - parseFloat( $('.memberdiscount').html().replace(",","") ) / 10 * marketprice;
		                $('.discountprice').html( discountprice.toFixed(2) );
		                     }
		               var zt =  $('.addorder_nav .selected').data('nav') =='1';
		                getDispatchPrice(zt);
		
		            });
		            
		     $('.shownum').blur(function(){
		               
		               var maxbuy = parseInt( $(this).closest('.good').data('totalmaxbuy'));
		           
		                var input =$(this);
		                if(!input.isInt()){
		                    input.val('1');
		                    return;
		                }
		                if(parseInt(input.val())<0){
		                    input.val('1');
		                    return;
		                }
		                var num = parseInt( input.val() );
		            
		               
		               if(num>maxbuy ){
		                    num=maxbuy;
		                    core.tip.show("您最多购买 " + maxbuy + " 件");
		                }
		                input.val(num);
		                $('#goodscount').html(num);
		                   marketprice = parseFloat( $(this).closest('.good').find('.marketprice').html().replace(",","") ) * num;
		                $('.goodsprice').html( marketprice.toFixed(2) );
		                     if( $('.memberdiscount').length>0){
		                var discountprice = marketprice - parseFloat( $('.memberdiscount').html().replace(",","") ) / 10 * marketprice;
		                $('.discountprice').html( discountprice.toFixed(2) );
		                     }
		          
		               var zt =  $('.addorder_nav .selected').data('nav') =='1';
		                getDispatchPrice(zt);
		               
		           })
		        fromcart = json.result.fromcart;
		        
		 
		        if (json.result.carrier_list.length > 0) {
		             
		            //选择快递或字提
		            $('.addorder_nav .nav').click(function() {
		                var nav = $(this).data('nav');
		                $('.addorder_nav .nav').removeClass('selected');
		                $(this).addClass('selected');
		                $('.addorder_user').hide();
		                $('.addorder_user_' + nav).show();
		                if (nav == '1') {
		                    $('.carrier_input_info').show();
		                    $('.addorder_exp').hide();
		                    getDispatchPrice(true);
		                }
		                else {
		                    $('.carrier_input_info').hide();
		                    $('.addorder_exp').show();
		                    getDispatchPrice();
		                }
		                $('#dispatchtype').val(nav);
		            });
		            //选择自提
		            $('#carrier_select').click(function() {
		                json.result.selectedCarrierIndex = $("#carrierindex").val();
		
		                $('#carrier_container').html(tpl('tpl_carrier_list', json.result));
		                $(".chooser").height($(document.body).height());
		                $(".choose_carrier").animate({right: "0px"}, 200);
		                $('.carrier').click(function() {
		                    var obj = $(this);
		                    $("#carrierindex").val(obj.data('index'));
		                    $("#carrierid").val(obj.data('id'));
		                    $("#carrier_realname").html(obj.data('realname'));
		                    $("#carrier_mobile").html(obj.data('mobile'));
		                    $("#carrier_address").html(obj.data('address'));
		                    $(".choose_carrier").animate({right: "-100%"}, 100);
		                })
		            })
		        }
		
		        //选择地址 
		        $('#address_select').click(function() {
		
		            core.json('shop/address', {}, function(addresslist_json) {
		            	
		            	console.log(addresslist_json);
		            	
		            	
		                //默认地址
		                addresslist_json.result.selectedAdressID = $("#addressid").val();
		
		                $('#address_container').html(tpl('tpl_address_list', addresslist_json.result));
		                showAniaddress();
		                $('.address .ico,.address .info').click(function() {
		                    var $this = $(this).parent();
		                    $("#addressid").val($this.data('addressid'));
		                    $("#address_realname").html($this.data('realname'));
		                    $("#address_mobile").html($this.data('mobile'));
		                    $("#address_address").html($this.data('address'));
		                    $(".choose_address").animate({right: "-100%"}, 200);
		                    //重新获取运费
		                    $('#address_container').hide();
		                    
		                    
		                    getDispatchPrice();
		                });
		                //地址编辑
		                $('.address .edit').click(function() {
		                    var addressid = $(this).parent().data('addressid');
		                    core.json('shop/address', {op: 'get', id: addressid}, function(getaddress_json) {
		                        $('#address_container').html(tpl('tpl_address_new', getaddress_json.result));
		                        console.log(getaddress_json.result);
		                        var address = getaddress_json.result.address;
		                        cascdeInit(address.province, address.city, address.area);
		                        $('.address_sub2').click(function() {
		                        	hideAniaddress();
		                        });
		                        $('.address_sub1').click(function() {
		                            saveAddress($(this));
		                        });
		
		                    }, true);
		                })
						$(".chooser").height($(document.body).height());
		                $(".choose_address").animate({right: "0px"}, 200);
		                $('.add_address').click(function() {
		                    addAddress($(this));
		                })
		            }, true);
		
		        });
		
		
		        //保存地址
		        function saveAddress(obj) {
		            if (obj.attr('saving') == '1') {
		                return;
		            }
		
		            if ($('#realname').val() == '') {
		                core.tip.show('请输入收件人!');
		                return;
		            }
		            if ($('#mobile').val() == '') {
		                core.tip.show('请输入联系电话!');
		                return;
		            }
		            if (!isMobile($('#mobile').val())) {
		                core.tip.show('请输入正确的联系电话!');
		                return;
		            }
			   		if($('#sel-provance').val()=='请选择省份'){
		                    core.tip.show('请选择省份!');
		                    return;
		                }
			       if($('#sel-city').val()=='请选择城市'){
		                    core.tip.show('请选择城市!');
		                    return;
		                }
				  if($('#sel-area').val()=='请选择地区'){
		                    core.tip.show('请选择地区!');
		                    return;
		                }
		            if ($('#address').val() == '') {
		                core.tip.show('请输入详细地址!');
		                return;
		            }
		            function isMobile (val) {
		            	return /^1[34578]\d{9}$/.test(val);
		            }
		            $('.address_sub1').html('正在处理...').attr('disabled', true);
		            obj.attr('saving', '1');
		            core.json('shop/address', {
		                op: 'submit',
		                id: $('#edit_addressid').val(),
		                addressdata: {
		                    realname: $('#realname').val(),
		                    mobile: $('#mobile').val(),
		                    address: $('#address').val(),
		                    province: $('#sel-provance').val(),
		                    city: $('#sel-city').val(),
		                    area: $('#sel-area').val(),
		                 //   zipcode: $('#zipcode').val(),
		                }
		            }, function(saveaddress_json) {
		                if (saveaddress_json.status == 1) {
		                    $("#addressid").val(saveaddress_json.result.addressid);
		                    $("#address_realname").html($('#realname').val());
		                    $("#address_mobile").html($('#mobile').val());
		                    $("#address_address").html($('#address').val());
		                    $("#address_select").show();
		                    $('#address_new').hide();
		                    $('#address_container').hide();
		                    getDispatchPrice();
		                    //hideAniaddress();
		                  	window.location.reload();
	                    
		                    
		                    
		                }
		                else {
		                    core.tip.show('保存失败,请重试');
		                }
		                obj.removeAttr('saving');
		            }, true, true);
		
		        }
		        function getDispatchPrice(zt) {
		            var goodsprice = parseFloat($('.goodsprice').html().replace(',',''));
		            var discountprice =0;
		            if($('.discountprice').length>0){
		                 discountprice = parseFloat($(".discountprice").html().replace(',',''));
		            }
		            totalprice = goodsprice - discountprice;
		            //重新获取运费
		            if( $('.shownum').length>0){
		                totalprice = parseFloat( $('.marketprice').html() ) * parseInt($('.shownum').val());
		                var goodsinfo = $('#goods').val().split('|')[0];
		                var goods = goodsinfo.split(',');
		                var goodsid = goods[0];
		                var optionid = goods[1];
		                var num = parseInt( $('.shownum').val());
		                $('#goods').val(goodsid + "," + optionid +"," + num + '|');
		            }
							 
		            core.json('order/confirm', {
		                op: 'getdispatchprice',
		                totalprice:totalprice,
		                addressid: $('#addressid').val(),
		                dispatchid: $('#dispatchid').val(),
		                dflag: zt,
			            goods: $('#goods').val()
		            }, function(getjson) {
		                if (getjson.status == 1) {
		                    if(zt){
		                        $('.dispatchprice').html('0.00');
		                    } else {
		                        $('.dispatchprice').html(getjson.result.price);
		                    }
		
		                    if(getjson.result.deductcredit){
		                        $('#deductcredit_money').html( getjson.result.deductmoney);
		                        $('#deductcredit_info').html( getjson.result.deductcredit);
		                        $("#deductcredit").attr('credit',getjson.result.deductcredit);
		                        $("#deductcredit").attr('money',getjson.result.deductmoney);
		                    }
		
		                    if(getjson.result.deductcredit2){
		                        $('#deductcredit2_money').html( getjson.result.deductcredit2);
		                        $("#deductcredit2").attr('credit2',getjson.result.deductcredit2);
		                    }
		
							if(getjson.result.hascoupon){
								$('#coupondiv').show();
								$('#coupondiv .couponcount').html(getjson.result.couponcount);
								bindCouponEvents();
							}else{
								$('#couponid').val('');
								$('#couponselect').html('我要使用优惠券');
								$('#coupondiv').hide();
							}
		
							if(getjson.result.deductenough_money>0){
								$('#deductenough').show();
								$('#deductenough_money').html( getjson.result.deductenough_money);
								$('#deductenough_enough').html( getjson.result.deductenough_enough);
							} else{
								$('#deductenough').hide();
								$('#deductenough_money').html( '0');
								$('#deductenough_enough').html( '0');
							}
		                    calctotalprice();
		                       if( $('.shownum').length>0){
		
							var goodsinfo = $('#goods').val().split('|')[0];
							var goods = goodsinfo.split(',');
							var goodsid = goods[0];
							var optionid = goods[1];
							var num = parseInt( $('.shownum').val());
							$('#goods').val(goodsid + "," + optionid +"," + num + '|');
						}
		                   
		                }
		            }, true);
		        }
		        //新增地址
		        function addAddress(obj) {
		
		            core.json('shop/address', {'op': 'new'}, function(addaddress_json) {
		
		                var result = addaddress_json.result;
		                $('#address_container').html(tpl('tpl_address_new', result));
		                console.log(result);
		                showAniaddress();
		                cascdeInit(result.address.province,result.address.city);
		                <?php  if($trade['shareaddress']=='1') { ?>
		                    var shareAddress = <?php  echo json_encode($shareAddress)?>;
		                                WeixinJSBridge.invoke('editAddress',shareAddress,function(res){ 
		                                    if(res.err_msg=='edit_address:ok'){
		                                        $("#realname").val( res.userName  );
		                                        $('#mobile').val( res.telNumber );
		                                        $('#address').val( res.addressDetailInfo );
		                                        console.log(res+'11');
		                                        cascdeInit(res.proviceFirstStageName,res.addressCitySecondStageName,res.addressCountiesThirdStageName);
		                                    }
		                    });
		                <?php  } ?>
		                $('.address_sub2').click(function() {
		                	hideAniaddress();
		                });
		                $('.address_sub1').click(function() {
		                    saveAddress($(this));
		                });
		
		            }, true);
		        }
		
		        $('#address_new').click(function() {
		            addAddress($(this));
		        });
		
		        //计算总价
		        function calctotalprice() {
		            var goodsprice = parseFloat($('.goodsprice').html().replace(',',''));
		            var dispatchprice = parseFloat($(".dispatchprice").html().replace(',',''));
		            
		            var discountprice =0;
		            if($('.discountprice').length>0){
		                 discountprice = parseFloat($(".discountprice").html().replace(',',''));
		            }
			        var totalprice = goodsprice - discountprice;
		            var enoughprice =0;
		            if($("#deductenough_money").length>0 && $("#deductenough_money").html()!=''){
		                 enoughprice = parseFloat($("#deductenough_money").html().replace(',',''));
		            }
			   <?php  if($hascouponplugin) { ?>
			       totalprice = calcCouponPrice(totalprice);
			   <?php  } ?>
		            totalprice = totalprice - enoughprice + dispatchprice;
		
		            var deductprice = 0;
		            if($("#deductcredit").length>0){
		                if($("#deductcredit").attr('on')=='1'){
		                    deductprice = parseFloat( $("#deductcredit").attr('money').replace(',','') )
		
		                           if($("#deductcredit2").length>0){
		                              var td1 = parseFloat( $("#deductcredit2").attr('credit2').replace(',','') );
		                        
		                              if(totalprice-deductprice>=0){
		                                  var td = totalprice - deductprice;
		                                  if(td>td1){
		                                      td = td1;
		                                  }
		                                  $("#deductcredit2_money").html( td.toFixed(2) );
		                              }else{
		                                   $("#deductcredit2").attr('on','0').removeClass('on');
		                              }
		                           }
		                   
		                } else{
		                     if($("#deductcredit2").length>0){
		                        var td = parseFloat( $("#deductcredit2").attr('credit2').replace(',','') );
		                        $("#deductcredit2_money").html( td.toFixed(2) );
		                     }
		                     
		                }
		            }   
		            var deductprice2 = 0;
		            if($("#deductcredit2").length>0){
		                     if($("#deductcredit2").attr('on')=='1'){
		                          deductprice2 = parseFloat( $("#deductcredit2_money").html().replace(',','') );
		                     }
		             }
		    
		            totalprice = totalprice - deductprice - deductprice2;
		            if(totalprice<=0){ 
		                totalprice = 0;
		            }
		
		
		            $('.totalprice').html(totalprice.toFixed(2));
		            return totalprice;
		        }
		        //选择快递
		        $('#dispatch_select').click(function() {
		
		            json.result.selectedDispatchID = $("#dispatchid").val();
		            $('#dispatch_container').html(tpl('tpl_dispatch_list', json.result));
					$(".chooser").height($(document.body).height());
		            $(".choose_dispatch").animate({right: "0px"}, 200);
		            $('.dispatch').click(function() {
		                var obj = $(this);
		                $("#dispatchid").val(obj.data('dispatchid'));
		                $(".dispatchname").html(obj.data('dispatchname'));
		                $(".chooser").animate({right: "-100%"}, 100);
		                //重新获取运费
		                getDispatchPrice();
		
		            })
		        });
		
		        //订单
		        $('.paysub').click(function() {
		            if ($(this).attr('submitting') == '1') {
		                return;
		            }
		            
		            
		           	var seltime= $('#sel-time').val();
		           	if(seltime==''){
		                core.tip.show("请选择配送时间!");
		                return;
		           	}
		           	console.log(seltime);
		           	
		            var dispatchid = $("#dispatchid").val();
		            var carrierid = $("#carrierid").val();
		            var addressid = $("#addressid").val();
		            
		            if(addressid=='' || addressid===undefined || typeof(addressid)==undefined ){
		                core.tip.show("请选择收货地址!");
		                return;
		            }
		            console.log(addressid);
		            
		            //alert('测试收货地址');
		            //return;
		            
		            var goods = $("#goods").val();
		            var carrier_realname = $.trim( $('#carrier_input_realname').val() );
		            var carrier_mobile = $.trim( $('#carrier_input_mobile').val() );
		            if (goods == '') {
		                core.tip.show("没有任何商品");
		                return;
		            }
		            if(addressid==''){
						core.tip.show("请选择收货地址");
						return;
		            }
		            
		            
		            
					 <?php  if($show==1) { ?>
						if( $("#dispatchtype").val()=='0'){
							   if (addressid == '') {
									core.tip.show("请选择地址");
									return;
								}
								if (dispatchid == '') {
									core.tip.show("请选择配送方式");
									return;
								}
						} 
						 if($('#isverify').val()=='true'){
							if (carrier_realname== '') {
								 core.tip.show("请填写联系人姓名");
								 return;
							 }
							  if (!$.isMobile(carrier_mobile)) {
									core.tip.show("请填写正确手机号");
									return;
							  }
						 }
						   if( $("#dispatchtype").val()=='1'){
								if (carrier_realname== '') {
									core.tip.show("请填写姓名");
									return;
								}
								if (!$.isMobile(carrier_mobile)) {
									core.tip.show("请填写正确手机号");
									return;
								}
							}
							<?php  } ?> 
					 var diydata = '';
					 var gdid = <?php  echo intval($goods_data_id)?>;
		   	                    <?php  if(!empty($order_formInfo)) { ?>
						 <?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('diyform/common_js_data', TEMPLATE_INCLUDEPATH)) : (include template('diyform/common_js_data', TEMPLATE_INCLUDEPATH));?>
					 <?php  } ?>
		            $(this).attr('submitting', '1').html('提交中...');
		            var data ={
		                'op': 'create', 
		                'goods': goods,
						'id':'<?php  echo $id;?>',
						gdid:gdid,
						diydata:diydata,
		                'dispatchtype': $("#dispatchtype").val(),
		                'fromcart':fromcart,
		                'cartids':"<?php  echo $_GPC['cartids'];?>",
		                'remark': $("#remark").val(),
		                'deduct':0,
		                'deduct2':0
		            };
		        	data.addressid = addressid; 
		        	data.seltime=seltime;
		        	data.birthdaycard=$('#birthdaycard').val();
		        	data.cakehat=$('#cakehat').val();
		        	data.birthdaycandle=$('#birthdaycandle').val();
		        	data.fruitid=$('#fruitid').val();		        	
		             if( $("#dispatchtype").val()=='0'){
		            
		                 data.addressid = addressid; 
		                 data.dispatchid = dispatchid;
		             }
		             
		             if( $("#dispatchtype").val()=='1' || $('#isverify').val()=='true'){
		                 data.carrierid = carrierid;
		                data.carrier = {
		                    'carrier_realname': carrier_realname,
		                    'carrier_mobile':carrier_mobile,
		                    'realname': $('#carrier_realname').html(),
		                    'mobile': $('#carrier_mobile').html(),
		                    'address': $('#carrier_address').html()
		                };
		            }
		            
		            if($("#deductcredit").length>0){
		                if($("#deductcredit").attr('on')=='1'){
		                      data.deduct = 1;       
		                }
		            }
		             
		            if($("#deductcredit2").length>0){
		                if($("#deductcredit2").attr('on')=='1'){
		                      data.deduct2 = 1;       
		                }
		            }
			   <?php  if($hascouponplugin) { ?>
				data.couponid = $('#couponid').val();
			  <?php  } ?>
			  
			  
			  		console.log(data);
		            core.json('order/confirm', data, function(create_json) {
		
		                if (create_json.status == 1) {
		                    location.href = "<?php  echo $this->createMobileUrl('order/pay')?>&orderid=" + create_json.result.orderid +"&openid=<?php  echo $openid;?>";
		                }  else if (create_json.status == -1) {
		                     $('.paysub').html('确认订单').removeAttr('submitting');
		                     core.tip.show(create_json.result);
		                }
		                else {
		                    $('.paysub').html('确认订单').removeAttr('submitting');
		                    core.tip.show("生成订单失败!")
		                }
		
		            }, true, true);
		        })
		        
		        //积分抵扣
		        $('#deductcredit').click(function(){
		               var on = $(this).attr('on')=='0'?'1':'0';
		               $(this).attr('on',on);
		               if(on=='1'){
		                     $(this).addClass('on').find('nav').addClass('on');
		               }
		               else{
		                     $(this).removeClass('on').find('nav').removeClass('on');
		               } 
		               calctotalprice();
		        });
		        //余额抵扣
		          $('#deductcredit2').click(function(){
		               var on = $(this).attr('on')=='0'?'1':'0';
		               $(this).attr('on',on);
		               if(on=='1'){
		                     $(this).addClass('on').find('nav').addClass('on');
		               }
		               else{
		                     $(this).removeClass('on').find('nav').removeClass('on');
		               } 
		               calctotalprice();
		        });
		       <?php  if($hascouponplugin) { ?>
		            bindCouponEvents();
		            function calcCouponPrice(totalprice){
			  
			       $('#coupondeduct_div').hide();
			       $('#coupondeduct_text').html('');
			       $('#coupondeduct_money').html('0');
			       if($('#couponid').val()=='' ||  $('#couponid').val()=='0')   {
					  return totalprice;
			       }
			       var deduct   = parseFloat( $('#couponselect').data('deduct') );
		                 var discount = parseFloat( $('#couponselect').data('discount') );
		                 var backtype = parseFloat( $('#couponselect').data('backtype') );
			     
			       var deductprice = 0;
			       if(deduct>0 && backtype==0){ //抵扣
				   if(deduct>totalprice){
					   deduct=totalprice;
				   }
				   if(deduct<=0){
					   deduct = 0;
				   }
		 		   deductprice = deduct;
				   totalprice-=deduct;
				   $('#coupondeduct_text').html('-优惠券优惠');
			      }else if(discount>0 && backtype==1){//打折
					  
				   deductprice = totalprice *  (1 - discount/10 );
				   if(deductprice>totalprice){
					   deductprice=totalprice;
				   }
				  if(deductprice<=0){
					   deductprice = 0;
				   }
		    		   totalprice-=deductprice;		
				   $('#coupondeduct_text').html('-优惠券折扣(' + discount + '折)');
			        }
			       if(deductprice>0){
				 $('#coupondeduct_div').show();
			          $('#coupondeduct_money').html(deductprice.toFixed(2));	
			       }
			      return totalprice;
						
		            }
		            function bindCouponEvents(){
						$('#selectcoupon').click( function(){
		                     //console.log('我执行了');                    
		                     var money =parseFloat( $('.totalprice').html().replace(",","") ) ;	
		 				     core.pjson('coupon/util', {op: 'query', money: money, type:0}, function (rjson) {
									if (rjson.status != 1) {
										core.tip.show(rjson.result);
										$('#couponid').val('');
										calctotalprice(); 
										return;
									}
									if(rjson.result.coupons.length>0){
										CouponChooser.cancelCallback = function(){
											
											$('#coupondeduct_div').hide();
											$('#coupondeduct_text').html('');
											$('#coupondeduct_money').html('0');
											calctotalprice();
											 
										}
										CouponChooser.confirmCallback = function(){
											calctotalprice();
										}
										CouponChooser.open( rjson.result );
										
									}
								}, true, true);
						});
				}
					
		       <?php  } ?>
								  
		       
		    }, true);
			
		
			
		    });
		</script>			

	</body>
</html>