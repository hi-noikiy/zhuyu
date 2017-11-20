<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_header', TEMPLATE_INCLUDEPATH)) : (include template('web/_header', TEMPLATE_INCLUDEPATH));?>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/order/tabs', TEMPLATE_INCLUDEPATH)) : (include template('web/order/tabs', TEMPLATE_INCLUDEPATH));?>

<script type="text/javascript" src="../addons/ewei_shop/static/js/dist/area/cascade.js"></script>


<style type="text/css">
    .main .form-horizontal .form-group{margin-bottom:0;}
    .main .form-horizontal .modal .form-group{margin-bottom:15px;}
    #modal-confirmsend .control-label{margin-top:0;}
    .ad2  {display: none;}
    .ex2  {display: none;}
</style>
<div class="main">
    <form class="form-horizontal form" action="" method="post">
        <?php  if($item['transid']) { ?><div  class="alert alert-error"><i class="fa fa-lightbulb"></i> 此为微信支付订单，必须要提交发货状态！</div><?php  } ?>
        <input type="hidden" name="id" value="<?php  echo $item['id'];?>" />
        <input type="hidden" name="token" value="<?php  echo $_W['token'];?>" />
        <input type="hidden" name="dispatchid" value="<?php  echo $dispatch['id'];?>" />
        <div class="panel panel-default">
            <div class="panel-heading">
                订单信息
            </div>
            <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">粉丝</label>
                <div class="col-sm-9 col-xs-12">
                    <img src='<?php  echo $member['avatar'];?>' style='width:100px;height:100px;padding:1px;border:1px solid #ccc' />
                         <?php  echo $member['nickname'];?>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">会员信息</label>
                <div class="col-sm-9 col-xs-12">
                    <div class='form-control-static'>ID: <?php  echo $member['id'];?> 姓名: <?php  echo $member['realname'];?> / 手机号: <?php  echo $member['mobile'];?> /微信号: <?php  echo $member['weixin'];?></div>
                </div>
            </div>
                
                <?php  if($item['transid']) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">微信交易号 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $item['transid'];?></p>
                    </div>
                </div>
                <?php  } ?>
                      <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">订单编号 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $item['ordersn'];?> </p>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">订单金额 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><table cellspacing="0" cellpadding="0">
							<tr>
								<td  style='border:none;text-align:right;'>商品小计：</td>
								<td  style='border:none;text-align:right;;'>￥<?php  echo number_format( $item['goodsprice'] ,2)?></td>
							</tr>
							<tr>
								<td  style='border:none;text-align:right;'>运费：</td>
								<td  style='border:none;text-align:right;;'>￥<?php  echo number_format( $item['olddispatchprice'],2)?></td>
							</tr>
							<?php  if($item['discountprice']>0) { ?>
							<tr>
								<td  style='border:none;text-align:right;'>会员折扣：</td>
								<td  style='border:none;text-align:right;;'>-￥<?php  echo number_format( $item['discountprice'],2)?></td>
							</tr>
							<?php  } ?>
							
							<?php  if($item['deductprice']>0) { ?>
							<tr>
								<td  style='border:none;text-align:right;'>积分抵扣：</td>
								<td  style='border:none;text-align:right;;'>-￥<?php  echo number_format( $item['deductprice'],2)?></td>
							</tr>
							<?php  } ?>
							<?php  if($item['deductcredit2']>0) { ?>
							<tr>
								<td  style='border:none;text-align:right;'>余额抵扣：</td>
								<td  style='border:none;text-align:right;;'>-￥<?php  echo number_format( $item['deductcredit2'],2)?></td>
							</tr> 
							<?php  } ?>
							<?php  if($item['deductenough']>0) { ?>
							<tr>
								<td  style='border:none;text-align:right;'>满额立减：</td>
								<td  style='border:none;text-align:right;;'>-￥<?php  echo number_format( $item['deductenough'],2)?></td>
							</tr>
							<?php  } ?>
							<?php  if($item['couponprice']>0) { ?>
							<tr>
								<td  style='border:none;text-align:right;'>优惠券优惠：</td>
								<td  style='border:none;text-align:right;;'>-￥<?php  echo number_format( $item['couponprice'],2)?></td>
							</tr>
							<?php  } ?>
							<?php  if(intval($item['changeprice'])!=0) { ?>
							<tr>
								<td  style='border:none;text-align:right;'>卖家改价：</td>
								<td  style='border:none;text-align:right;;'><span style="<?php  if(0<$item['changeprice']) { ?>color:green<?php  } else { ?>color:red<?php  } ?>"><?php  if(0<$item['changeprice']) { ?>+<?php  } else { ?>-<?php  } ?>￥<?php  echo number_format(abs($item['changeprice']),2)?></span></td>
							</tr>
						         <?php  } ?>
							<?php  if(intval($item['changedispatchprice'])!=0) { ?>
							<tr>
								<td  style='border:none;text-align:right;'>卖家改运费：</td>
								<td  style='border:none;text-align:right;;'><span style="<?php  if(0<$item['changedispatchprice']) { ?>color:green<?php  } else { ?>color:red<?php  } ?>"><?php  if(0<$item['changedispatchprice']) { ?>+<?php  } else { ?>-<?php  } ?>￥<?php  echo abs($item['changedispatchprice'])?></span></td>
							</tr>
						         <?php  } ?> 
						<tr>
								<td style='border:none;text-align:right;'>应收款：</td>
								<td  style='border:none;text-align:right;color:green;'>￥<?php  echo number_format($item['price'],2)?></td>
							</tr>
									<?php if(cv('order.op.changeprice')) { ?>
			<?php  if(empty($item['statusvalue'])) { ?>
							<tr>
								<td style='border:none;text-align:right;'></td>
								<td  style='border:none;text-align:right;color:green;'><a href="javascript:;" class="btn btn-link " onclick="changePrice('<?php  echo $item['id'];?>')">修改价格</a></td>
							</tr>
							<?php  } ?>  <?php  } ?>
						</table></div>
                    </div>
                </div>
				<?php  if(!empty($coupon)) { ?>
				  <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">使用优惠券 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                            <a href="<?php  echo $this->createPluginWebUrl('coupon/coupon',array('op'=>'post','id'=>$coupon['id']))?>" target='_blank'>

                                [<?php  echo $coupon['id'];?>]<?php  echo $coupon['couponname'];?></a> -

                            <?php  if($coupon['backtype']==0) { ?>
                            立减 <?php  echo $coupon['deduct'];?> 元

                            <?php  } else if($coupon['backtype']==1) { ?>
                            打 <?php  echo $coupon['discount'];?> 折

                            <?php  } else if($coupon['backtype']==2) { ?>
                                <?php  if($coupon['backmoney']>0) { ?>返 <?php  echo $coupon['backmoney'];?> 余额;<?php  } ?>
                                <?php  if($coupon['backcredit']>0) { ?>返 <?php  echo $coupon['backcredit'];?> 积分;<?php  } ?>
                                <?php  if($coupon['backredpack']>0) { ?>返 <?php  echo $coupon['backredpack'];?> 红包;<?php  } ?>

                                <b>返利方式: </b>
                                <?php  if($item['backwhen']==0) { ?>
                                    交易完成后（过退款期限）
                                <?php  } else if($item['backwhen']==1) { ?>
                                    订单完成后（收货后）
                                <?php  } else { ?>
                                    订单付款后
                                <?php  } ?>

                                    <b>返利情况: </b>
                                <?php  if(empty($coupon['back'])) { ?>
                                    <span class='label label-default'>未返利</span>
                                <?php  } else { ?>
                                        <span class='label label-danger'>已返利 <?php  echo date('Y-m-d H:i',$coupon['backtime'])?></span>
                                <?php  } ?>
                            <?php  } ?>
					</p>
				  </div>
				  </div>
				<?php  } ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">配送方式 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
							<?php  if(empty($item['addressid'])) { ?>
                                <?php  if($item['isverify']==1) { ?>
                                    线下核销
                                <?php  } else if($item['isvirtual']==1) { ?>
                                    虚拟物品
                                <?php  } else if(!empty($item['virtual'])) { ?>
                                    虚拟物品(卡密)自动发货<!--virtual-->
                                <?php  } else if($item['dispatchtype']==1) { ?>
                                    自提
                                <?php  } ?>

                            <?php  } else { ?>
                                <?php  if(empty($dispatchtype)) { ?>
                                快递
                                <?php  } ?>
                            <?php  } ?></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">付款方式 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                            <?php  if($item['paytype'] == 0) { ?>未支付<?php  } ?>
                            <?php  if($item['paytype'] == 1) { ?>余额支付<?php  } ?>
                            <?php  if($item['paytype'] == 11) { ?>后台付款<?php  } ?>
                            <?php  if($item['paytype'] == 21) { ?>微信支付<?php  } ?>
                            <?php  if($item['paytype'] == 22) { ?>支付宝支付<?php  } ?>
                            <?php  if($item['paytype'] == 23) { ?>银联支付<?php  } ?>
                            <?php  if($item['paytype'] == 3) { ?>货到付款<?php  } ?>

                        </p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">订单状态 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                            <?php  if($item['status'] == 0) { ?><span class="label label-info">待付款</span><?php  } ?>
                            <?php  if($item['status'] == 1) { ?>
                            	<?php  if($item['allstate']==0) { ?>
                            	<span class="label label-info">待制作</span>
                            	<?php  } ?>
                             	<?php  if($item['allstate']==1) { ?>
                            	<span class="label label-info">制作中</span>
                            	<?php  } ?>                           	
                            	
                            <?php  } ?>
                            <?php  if($item['status'] == 2) { ?><span class="label label-info">运输中</span><?php  } ?>
                            <?php  if($item['status'] == 3) { ?><span class="label label-success">已完成</span><?php  } ?>
                            <?php  if($item['status'] == -1) { ?>
                              <?php  if(!empty($refund) && $refund['status']==1) { ?>
                                <span class="label label-default">已<?php  echo $r_type[$refund['rtype']];?></span> <?php  if(!empty($refund['refundtime'])) { ?>完成时间: <?php  echo date('Y-m-d H:i:s',$refund['refundtime'])?><?php  } ?>
                                <?php  } else { ?>
                              <span class="label label-default">已关闭</span>
                              <?php  } ?>
                            <?php  } ?>
                        </p>
                    </div>
                </div>
                 <?php  if(!empty($refund) && $refund['status']==1) { ?>
                  <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">退款时间 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  echo date('Y-m-d H:i:s',$item['refundtime'])?></div>
                    </div>
                </div>
                <?php  } ?>
                
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">下单日期 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo date('Y-m-d H:i:s', $item['createtime'])?></p>
                    </div>
                </div>
                <?php  if($item['status']>=1) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">付款时间 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo date('Y-m-d H:i:s', $item['paytime'])?></p>
                    </div>
                </div>
                <?php  } ?>
                
                <?php  if($item['status']>=2 && !empty($item['addressid']) ) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">发货信息 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                            <div class="ex1">
                            快递公司: <?php  echo $item['expresscom'];?>
                            <br/>快递单号: <?php  echo $item['expresssn'];?>
                            <br/>发货时间: <?php  echo date('Y-m-d H:i:s', $item['sendtime'])?><br/>
                            </div>
                            <div class="ex2">
                                <p class="form-control-static">
                                    快递公司<select class="form-control" name="eexpress" id="eexpress" style="width: 230px;margin:0 20px 0 10px;display: inline;">
                                    <option value="" data-name="">其他快递</option>
                                    <option value="shunfeng" data-name="顺丰">顺丰</option>
                                    <option value="shentong" data-name="申通">申通</option>
                                    <option value="yunda" data-name="韵达快运">韵达快运</option>
                                    <option value="tiantian" data-name="天天快递">天天快递</option>
                                    <option value="yuantong" data-name="圆通速递">圆通速递</option>
                                    <option value="zhongtong" data-name="中通速递">中通速递</option>
                                    <option value="ems" data-name="ems快递">ems快递</option>
                                    <option value="huitongkuaidi" data-name="汇通快运">汇通快运</option>
                                    <option value="quanfengkuaidi" data-name="全峰快递">全峰快递</option>
                                    <option value="zhaijisong" data-name="宅急送">宅急送</option>
                                    <option value="aae" data-name="aae全球专递">aae全球专递</option>
                                    <option value="anjie" data-name="安捷快递">安捷快递</option>
                                    <option value="anxindakuaixi" data-name="安信达快递">安信达快递</option>
                                    <option value="biaojikuaidi" data-name="彪记快递">彪记快递</option>
                                    <option value="bht" data-name="bht">bht</option>
                                    <option value="baifudongfang" data-name="百福东方国际物流">百福东方国际物流</option>
                                    <option value="coe" data-name="中国东方（COE）">中国东方（COE）</option>
                                    <option value="changyuwuliu" data-name="长宇物流">长宇物流</option>
                                    <option value="datianwuliu" data-name="大田物流">大田物流</option>
                                    <option value="debangwuliu" data-name="德邦物流">德邦物流</option>
                                    <option value="dhl" data-name="dhl">dhl</option>
                                    <option value="dpex" data-name="dpex">dpex</option>
                                    <option value="dsukuaidi" data-name="d速快递">d速快递</option>
                                    <option value="disifang" data-name="递四方">递四方</option>
                                    <option value="fedex" data-name="fedex（国外）">fedex（国外）</option>
                                    <option value="feikangda" data-name="飞康达物流">飞康达物流</option>
                                    <option value="fenghuangkuaidi" data-name="凤凰快递">凤凰快递</option>
                                    <option value="feikuaida" data-name="飞快达">飞快达</option>
                                    <option value="guotongkuaidi" data-name="国通快递">国通快递</option>
                                    <option value="ganzhongnengda" data-name="港中能达物流">港中能达物流</option>
                                    <option value="guangdongyouzhengwuliu" data-name="广东邮政物流">广东邮政物流</option>
                                    <option value="gongsuda" data-name="共速达">共速达</option>
                                    <option value="hengluwuliu" data-name="恒路物流">恒路物流</option>
                                    <option value="huaxialongwuliu" data-name="华夏龙物流">华夏龙物流</option>
                                    <option value="haihongwangsong" data-name="海红">海红</option>
                                    <option value="haiwaihuanqiu" data-name="海外环球">海外环球</option>
                                    <option value="jiayiwuliu" data-name="佳怡物流">佳怡物流</option>
                                    <option value="jinguangsudikuaijian" data-name="京广速递">京广速递</option>
                                    <option value="jixianda" data-name="急先达">急先达</option>
                                    <option value="jjwl" data-name="佳吉物流">佳吉物流</option>
                                    <option value="jymwl" data-name="加运美物流">加运美物流</option>
                                    <option value="jindawuliu" data-name="金大物流">金大物流</option>
                                    <option value="jialidatong" data-name="嘉里大通">嘉里大通</option>
                                    <option value="jykd" data-name="晋越快递">晋越快递</option>
                                    <option value="kuaijiesudi" data-name="快捷速递">快捷速递</option>
                                    <option value="lianb" data-name="联邦快递（国内）">联邦快递（国内）</option>
                                    <option value="lianhaowuliu" data-name="联昊通物流">联昊通物流</option>
                                    <option value="longbanwuliu" data-name="龙邦物流">龙邦物流</option>
                                    <option value="lijisong" data-name="立即送">立即送</option>
                                    <option value="lejiedi" data-name="乐捷递">乐捷递</option>
                                    <option value="minghangkuaidi" data-name="民航快递">民航快递</option>
                                    <option value="meiguokuaidi" data-name="美国快递">美国快递</option>
                                    <option value="menduimen" data-name="门对门">门对门</option>
                                    <option value="ocs" data-name="OCS">OCS</option>
                                    <option value="peisihuoyunkuaidi" data-name="配思货运">配思货运</option>
                                    <option value="quanchenkuaidi" data-name="全晨快递">全晨快递</option>
                                    <option value="quanjitong" data-name="全际通物流">全际通物流</option>
                                    <option value="quanritongkuaidi" data-name="全日通快递">全日通快递</option>
                                    <option value="quanyikuaidi" data-name="全一快递">全一快递</option>
                                    <option value="rufengda" data-name="如风达">如风达</option>
                                    <option value="santaisudi" data-name="三态速递">三态速递</option>
                                    <option value="shenghuiwuliu" data-name="盛辉物流">盛辉物流</option>
                                    <option value="sue" data-name="速尔物流">速尔物流</option>
                                    <option value="shengfeng" data-name="盛丰物流">盛丰物流</option>
                                    <option value="saiaodi" data-name="赛澳递">赛澳递</option>
                                    <option value="tiandihuayu" data-name="天地华宇">天地华宇</option>
                                    <option value="tnt" data-name="tnt">tnt</option>
                                    <option value="ups" data-name="ups">ups</option>
                                    <option value="wanjiawuliu" data-name="万家物流">万家物流</option>
                                    <option value="wenjiesudi" data-name="文捷航空速递">文捷航空速递</option>
                                    <option value="wuyuan" data-name="伍圆">伍圆</option>
                                    <option value="wxwl" data-name="万象物流">万象物流</option>
                                    <option value="xinbangwuliu" data-name="新邦物流">新邦物流</option>
                                    <option value="xinfengwuliu" data-name="信丰物流">信丰物流</option>
                                    <option value="yafengsudi" data-name="亚风速递">亚风速递</option>
                                    <option value="yibangwuliu" data-name="一邦速递">一邦速递</option>
                                    <option value="youshuwuliu" data-name="优速物流">优速物流</option>
                                    <option value="youzhengguonei" data-name="邮政包裹挂号信">邮政包裹挂号信</option>
                                    <option value="youzhengguoji" data-name="邮政国际包裹挂号信">邮政国际包裹挂号信</option>
                                    <option value="yuanchengwuliu" data-name="远成物流">远成物流</option>
                                    <option value="yuanweifeng" data-name="源伟丰快递">源伟丰快递</option>
                                    <option value="yuanzhijiecheng" data-name="元智捷诚快递">元智捷诚快递</option>
                                    <option value="yuntongkuaidi" data-name="运通快递">运通快递</option>
                                    <option value="yuefengwuliu" data-name="越丰物流">越丰物流</option>
                                    <option value="yad" data-name="源安达">源安达</option>
                                    <option value="yinjiesudi" data-name="银捷速递">银捷速递</option>
                                    <option value="zhongtiekuaiyun" data-name="中铁快运">中铁快运</option>
                                    <option value="zhongyouwuliu" data-name="中邮物流">中邮物流</option>
                                    <option value="zhongxinda" data-name="忠信达">忠信达</option>
                                    <option value="zhimakaimen" data-name="芝麻开门">芝麻开门</option>
                                </select>

                                <span>快递单号</span><input type="text" name="eexpresssn" id="eexpresssn" class="form-control" style="width:300px;margin-left:10px;display:inline;" value="<?php  echo $item['expresssn']?>">
                                <input type='hidden' name='eexpresscom' id='eexpresscom' value="<?php  echo $item['expresscom'];?>"/>
                                </p>
                            </div>

                            <button type='button' name='editexpress' id='editexpress' class='btn btn-default ex1'>编辑发货信息</button>
                            <button type='button' name='saveexpress' id='saveexpress' class='btn btn-default ex2'>保存发货信息</button>
                            <button type='button' name='backexpress' id='backexpress' class='btn btn-default ex2' style="margin-left:50px;">返回</button>

                            <button type='button' class='btn btn-default ex1' onclick='express_find(this,"<?php  echo $item['id'];?>")'  style="margin-left:50px;">查看物流</button>
						</p>
                    </div>
                </div>
                <?php  } ?>
                  
                <?php  if($item['status']>=2 && !empty($item['virtual']) ) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">发货信息 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo str_replace("\n","<br/>", $item['virtual_str'])?>

						</p>
                    </div>
                </div>
                <?php  } ?>
                
                <?php  if($item['status']>=3) { ?>
                <?php  if($item['isverify']==1) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">核销信息 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                            消费码: <?php  echo $item['verifycode'];?><br/> 
                            核销时间: <?php  echo date('Y-m-d H:i:s', $item['finishtime'])?><br/>
			 <?php  if(!empty($saler)) { ?>
                            核销人:  <?php  echo $saler['nickname'];?>( <?php  echo $saler['salername'];?> )<br/>
							<?php  } ?>
                           <?php  if(!empty($store)) { ?>
			    核销门店: <?php  echo $store['storename'];?><br/>
                           <?php  } ?>
                        </p>
                    </div>
                </div>
                <?php  } else { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">完成时间 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo date('Y-m-d H:i:s', $item['finishtime'])?></p>
                    </div>
                </div>
                <?php  } ?>
                
                <?php  } ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">备注 :</label>
                    <div class="col-sm-9 col-xs-12"><textarea style="height:150px;" class="form-control" name="remark" cols="70"><?php  echo $item['remark'];?></textarea></div>
                </div>
                
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                         <br/>
                        <button type='submit' name='saveremark' class='btn btn-default'>保存备注</button>
                    </div>
                </div>
        </div>
    </form>
        <?php  if(p('commission') && count($agents)>0) { ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                分销商信息
            </div>
            <div class="panel-body">
                <?php  if(!empty($agents['0'])) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">一级分销商 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
							<a href="<?php  echo $this->createWebUrl('member/list',array('op'=>'detail','id'=>$agents[0]['id']))?>" target='_blank'>
							<img src='<?php  echo $agents[0]['avatar'];?>' style="width:30px;height:30px;padding:1px;border:1px solid #ccc" /> <?php  echo $agents[0]['nickname'];?> 
								  </a>
								 <b>ID:</b> <?php  echo $agents[0]['id'];?> <b>姓名:</b> <?php  echo $agents[0]['realname'];?>  <b>手机号:</b> <?php  echo $agents[0]['mobile'];?> 
								
							<b>佣金:</b> <?php  echo $commission1;?> 元
								 </p>
							
                    </div>
                </div>
                <?php  } ?>
                <?php  if(!empty($agents['1'])) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">二级分销商 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
							<a href="<?php  echo $this->createWebUrl('member/list',array('op'=>'detail','id'=>$agents[1]['id']))?>" target='_blank'>
								<img src='<?php  echo $agents[1]['avatar'];?>' style="width:30px;height:30px;padding:1px;border:1px solid #ccc" /> <?php  echo $agents[1]['nickname'];?> 
									 </a>
							<b>ID:</b> <?php  echo $agents[1]['id'];?> <b>姓名:</b> <?php  echo $agents[1]['realname'];?>  <b>手机号:</b> <?php  echo $agents[1]['mobile'];?>
							<b>佣金:</b> <?php  echo $commission2;?> 元
						</p>
                    </div>
                </div>
                <?php  } ?>
                <?php  if(!empty($agents['2'])) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">三级分销商 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
														<a href="<?php  echo $this->createWebUrl('member/list',array('op'=>'detail','id'=>$agents[2]['id']))?>" target='_blank'>
							<img src='<?php  echo $agents[2]['avatar'];?>' style="width:30px;height:30px;padding:1px;border:1px solid #ccc" />  <?php  echo $agents[2]['nickname'];?> 
								 </a>
							<b>ID:</b> <?php  echo $agents[2]['id'];?> <b>姓名:</b> <?php  echo $agents[2]['realname'];?> <b>手机号:</b> <?php  echo $agents[2]['mobile'];?>
								<b>佣金:</b> <?php  echo $commission3;?> 元						
								 
								 </p>
                    </div>
                </div>
                <?php  } ?>
				
				<?php if(cv('commission.changecommission')) { ?>
				  <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
							<a href='javascript:;' class='btn btn-default' onclick="commission_change('<?php  echo $item['id'];?>')">修改佣金</a>
						</p>
                    </div>
                </div>
							
							<?php  } ?>
            </div>
        </div>
        <?php  } ?>
        
        <?php  if(!empty($item['birthdaycard'])  ||  !empty($item['cakehat'])  ||   !empty($item['birthdaycandle'])  || !empty($item['fruitid'])) { ?>
          <div class="panel panel-default">
            <div class="panel-heading">
              	包含附属礼品
            </div>
            <div class="panel-body">
            	
            	
            	<?php  $cakehatres = pdo_get('ewei_shop_catehat', array('id' => $item['cakehat']), array('title', 'thumb')); $cakehatres = set_medias($cakehatres, 'thumb');?>            	
           	 	<?php  $birthdaycandle = pdo_get('ewei_shop_birthdaycandle', array('id' => $item['birthdaycandle']), array('title', 'thumb')); $birthdaycandle = set_medias($birthdaycandle, 'thumb');?>           	
				<?php  $fruit = pdo_get('ewei_shop_fruit', array('id' => $item['fruitid']), array('title', 'thumb')); $fruit = set_medias($fruit, 'thumb');?>           	
				 <table class="table table-bordered">
					  <tbody>
					  	<?php  if(!empty($item['birthdaycard'])) { ?>
					    <tr>
					      <td>生日牌内容</td>
					      <td><?php  echo $item['birthdaycard'];?></td>
					    </tr>
		                <?php  } ?>
		                
		               <?php  if($cakehatres) { ?> 
					    <tr>
					      <td>生日帽名称</td>
					      <td><?php  echo $cakehatres['title'];?></td>
		
					    </tr>
					    
					    <tr>
					      <td>生日帽图片</td>
					      <td><img src="<?php  echo $cakehatres['thumb'];?>"></td>
					    </tr>
					    <?php  } ?>
					    
					    <?php  if($birthdaycandle) { ?>
					    <tr>
					      <td>蜡烛的名称</td>
					      <td><?php  echo $birthdaycandle['title'];?></td>
					    </tr>			    
		
		
					    <tr>
					      <td>蜡烛的图片</td>
					      <td><img src="<?php  echo $birthdaycandle['thumb'];?>"></td>
					    </tr>
						<?php  } ?>
						
						
						
					    <?php  if($fruit) { ?>
					    <tr>
					      <td>水果夹心的名称</td>
					      <td><?php  echo $fruit['title'];?></td>
					    </tr>			    
		
		
					    <tr>
					      <td>水果夹心的图片</td>
					      <td><img src="<?php  echo $fruit['thumb'];?>"></td>
					    </tr>
						<?php  } ?>						
						
						
					  </tbody>
				</table>           	


            </div>
        </div>        
        <?php  } ?>
        
        
        
        
        
        
        
        
        
        
        
        
        <?php  if(!empty($item['addressid'])) { ?>
          <div class="panel panel-default">
            <div class="panel-heading">
              收件人信息
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">姓名 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static ad1"><?php  echo $user['realname'];?></p>
                        <p class="form-control-static ad2"><input type="text" name="realname" id="realname" value="<?php  echo $user['realname'];?>" class="form-control" style="width:130px;display:inline;"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">手机 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static ad1"><?php  echo $user['mobile'];?></p>
                        <p class="form-control-static ad2"><input type="text" name="mobile" id="mobile" value="<?php  echo $user['mobile'];?>" class="form-control" style="width:130px;display:inline;"></p>
                    </div>
                </div>
                <div class="form-group">

                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">地址 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static ad1" id="d_address"><?php  echo $user['address'];?>
                        </p>

                        <?php if(cv('order.op.changeaddress')) { ?>
                        <p class="form-control-static ad2" id="e_address">
                            <select id="sel-provance" onChange="selectCity();" class="select form-control" style="width:130px;display:inline;">
                                <option value="" selected="true">省/直辖市</option>
                            </select>
                            <select id="sel-city" onChange="selectcounty(0)" class="select form-control" style="width:135px;display:inline;">
                                <option value="" selected="true">请选择</option>
                            </select>
                            <select id="sel-area" class="select form-control" style="width:130px;display:inline;">
                                <option value="" selected="true">请选择</option>
                            </select>
                            <input type="text" name="address_info" id="address_info" class="form-control" style="width:300px;display:inline;" value="<?php  echo $address_info?>">
                        </p>

                        <button type='button' name='editaddress' id='editaddress' class='btn btn-default ad1'>编辑信息</button>
                        <button type='button' name='saveaddress' id='saveaddress' class='btn btn-default ad2'>保存信息</button>
                        <button type='button' name='backaddress' id='backaddress' class='btn btn-default ad2' style="margin-left:50px;">返回</button>
                        <?php  } ?>
                    </div>
                </div>
            </div>
        </div>
        <?php  } else if($item['isverify']==1 || !empty($item['virtual']) ||!empty($item['isvirtual'])) { ?>
		<?php  if($show==1) { ?>
        <div class="panel panel-default">
            <div class="panel-heading">
               联系人
            </div>
            <div class="panel-body">
                   <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">联系人姓名 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $user['carrier_realname'];?> </p>
                    </div>
                </div>
               <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">联系人手机 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $user['carrier_mobile'];?>  </p>
                    </div>
                </div>
            </div>
        </div>
		<?php  } ?> 
        <?php  } else { ?>
          <div class="panel panel-default">
            <div class="panel-heading">
               自提信息
            </div>
            <div class="panel-body">
                   <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">自提人姓名 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $user['carrier_realname'];?> /  <?php  echo $user['carrier_mobile'];?></p>
                    </div>
                </div>
               <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">自提地点 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $user['address'];?> (联系人： <?php  echo $user['realname'];?> / <?php  echo $user['mobile'];?> ) </p>
                    </div>
                </div>
            </div>
        </div>
        <?php  } ?>
      

    <?php  if($diyform_flag == 1) { ?>
	
	<?php  if(!empty($order_data)) { ?>
   <div class='panel-heading'>
        订单统一表单信息
    </div>
    <div class='panel-body'>
        <!--<span>diyform</span>-->
    
       <?php  $datas = $order_data?>
        <?php  if(is_array($order_fields)) { foreach($order_fields as $key => $value) { ?>
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label"><?php  echo $value['tp_name']?></label>
            <div class="col-sm-9 col-xs-12">
                <div class="form-control-static">

                    <?php  if($value['data_type'] == 0 || $value['data_type'] == 1 || $value['data_type'] == 2 || $value['data_type'] == 6) { ?>
                    <?php  echo str_replace("\n","<br/>",$datas[$key])?>

                    <?php  } else if($value['data_type'] == 3) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <?php  echo $v1?>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 5) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <a target="_blank" href="<?php  echo tomedia($v1)?>"><img style='width:100px;;padding:1px;border:1px solid #ccc'  src="<?php  echo tomedia($v1)?>"></a>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 7) { ?>
                    <?php  echo $datas[$key]?>

                    <?php  } else if($value['data_type'] == 8) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <?php  echo $v1?>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 9) { ?>
                    <?php echo $datas[$key]['province']!='请选择省份'?$datas[$key]['province']:''?>-<?php echo $datas[$key]['city']!='请选择城市'?$datas[$key]['city']:''?>
                    <?php  } ?>
                </div>

            </div>
        </div>

        <?php  } } ?>
     
    </div>
	<?php  } ?>
	  <?php  if(count($goods)==1 &&  !empty($goods[0]['diyformdata'])) { ?>
    <div class='panel-heading'>
        其他信息
    </div>
    <div class='panel-body'>
        <!--<span>diyform</span>-->
      
		<?php  $datas = $goods[0]['diyformdata']?>
        <?php  if(is_array($goods[0]['diyformfields'])) { foreach($goods[0]['diyformfields'] as $key => $value) { ?>
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label"><?php  echo $value['tp_name']?></label>
            <div class="col-sm-9 col-xs-12">
                <div class="form-control-static">

                    <?php  if($value['data_type'] == 0 || $value['data_type'] == 1 || $value['data_type'] == 2 || $value['data_type'] == 6) { ?>
                    <?php  echo str_replace("\n","<br/>",$datas[$key])?>

                    <?php  } else if($value['data_type'] == 3) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <?php  echo $v1?>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 5) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <a target="_blank" href="<?php  echo tomedia($v1)?>"><img style='width:100px;;padding:1px;border:1px solid #ccc'  src="<?php  echo tomedia($v1)?>"></a>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 7) { ?>
                    <?php  echo $datas[$key]?>

                    <?php  } else if($value['data_type'] == 8) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <?php  echo $v1?>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 9) { ?>
                    <?php echo $datas[$key]['province']!='请选择省份'?$datas[$key]['province']:''?>-<?php echo $datas[$key]['city']!='请选择城市'?$datas[$key]['city']:''?>
                    <?php  } ?>
                </div>

            </div>
        </div>

        <?php  } } ?>
    
    </div>    <?php  } ?>
    <?php  } ?>
        <?php  if(!empty($refund)) { ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                退款申请
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">退款类型 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $r_type[$refund['rtype']];?></p>
                    </div>
                </div>

                <?php  if($refund['rtype']!=2) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">退款金额 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $refund['applyprice'];?></p>
                    </div>
                </div>
                <?php  } ?>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"><?php  if($refund['rtype']==2) { ?>换货<?php  } else { ?>退款<?php  } ?>原因 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php  echo $refund['reason'];?></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"><?php  if($refund['rtype']==2) { ?>换货<?php  } else { ?>退款<?php  } ?>说明 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static"><?php echo empty($refund['content'])?'无':$refund['content']?></p>
                    </div>
                </div>

                <?php  if(!empty($refund['imgs'])) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">图片凭证 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                            <?php  if(is_array($refund['imgs'])) { foreach($refund['imgs'] as $k1 => $v1) { ?>
                            <a target="_blank" href="<?php  echo tomedia($v1)?>"><img style='width:100px;;padding:1px;border:1px solid #ccc'  src="<?php  echo tomedia($v1)?>"></a>
                            <?php  } } ?>
                        </p>
                    </div>
                </div>
                <?php  } ?>

                <?php  if($refund['status']==1) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">退款时间 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  echo date('Y-m-d H:i:s',$item['refundtime'])?></div>
                    </div>
                </div>
                <?php  } ?>
                
                <?php if(cv('order.op.refund')) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                        <?php  if($refund['status']==0 || $refund['status']>=3) { ?>
                        <a class="btn btn-danger btn-sm" href="javascript:;" onclick="$('#modal-refund').find(':input[name=id]').val('<?php  echo $item['id'];?>')" data-toggle="modal" data-target="#modal-refund">处理<?php  echo $r_type[$refund['rtype']];?>申请</a>
                        <?php  } else if($refund['status']==-1) { ?>
                        <span class='label label-default'>已拒绝</span>
                        <?php  } else if($refund['status']==-2) { ?>
                        <span class='label label-default'>客户取消</span>
                        <?php  } else if($refund['status']==1) { ?>
                        <span class='label label-danger'>已完成</span>
                        <?php  } ?>
                    </div>
                </div> 
                <?php  } ?>

                <?php  if(!empty($refund['expresssn'])) { ?>
                <div class="form-group">
                    <div class="panel-heading" style="padding-left: 200px;">
                        <br>客户寄出快递信息
                    </div>
                </div>


                <?php  if($refund['status']==3 || $refund['status']==4) { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">是否寄出快递 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static" style="color: #ef4f4f;"><?php  if($refund['status']==3) { ?>等待客户寄出快递<?php  } else if($refund['status']==4) { ?>客户已经寄出快递<?php  } ?></div>
                    </div>
                </div>
                <?php  } ?>

                <?php  if(!empty($refund['expresssn'])) { ?>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">快递名称 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  if(empty($refund['expresscom'])) { ?>其他快递<?php  } else { ?><?php  echo $refund['expresscom'];?><?php  } ?></div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">快递单号 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  echo $refund['expresssn'];?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-default' onclick='refundexpress_find(this,"<?php  echo $item['id'];?>",1)' >查看物流</button>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">填写快递单号时间 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  echo date('Y-m-d H:i:s',$refund['sendtime'])?></div>
                    </div>
                </div>
                <?php  } ?>

                <?php  } ?>

                <?php  if(!empty($refund['rexpresssn'])) { ?>
                <div class="form-group">
                    <div class="panel-heading" style="padding-left: 200px;">
                        <br>店家寄出快递信息
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">快递名称 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  if(empty($refund['rexpresscom'])) { ?>其他快递<?php  } else { ?><?php  echo $refund['rexpresscom'];?><?php  } ?></div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">快递单号 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  echo $refund['rexpresssn'];?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-default' onclick='refundexpress_find(this,"<?php  echo $item['id'];?>",2)' >查看物流</button></div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">确认发货时间 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  echo date('Y-m-d H:i:s',$refund['returntime'])?></div>
                    </div>
                </div>

                <?php  } ?>

            </div>
        </div>
        <?php  } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                商品信息</span>
            </div>
            <div class="panel-body table-responsive">
                <table class="table table-hover">
                    <thead class="navbar-inner">
                        <tr>
                            <th style="width:5%;">ID</th>
                            <th style="width:10%;">商品标题</th>
                            <th style="width:15%;">商品规格</th>
                            <th style="width:10%;">商品编号</th>
                            <th style="width:10%;">商品条码</th>
                       
                            <th style="width:20%;">现价/原价/成本价</th>
                            <th style="width:10%;">属性</th>
                            <th style="width:5%;">购买数量</th>
                            <th style="width:10%;color:red;">折扣前/折扣后</th>
                            
                            <th style="width:10%;">操作</th>
                        </tr>
                    </thead>
                    <?php  if(is_array($item['goods'])) { foreach($item['goods'] as $goods) { ?>
                    <tr>
                        <td><?php  echo $goods['id'];?></td>
                        <td>
                            <?php  if($category[$goods['pcate']]['name']) { ?>
                            <span class="text-error">[<?php  echo $category[$goods['pcate']]['name'];?>] </span><?php  } ?><?php  if($children[$goods['pcate']][$goods['ccate']]['1']) { ?>
                            <span class="text-info">[<?php  echo $children[$goods['pcate']][$goods['ccate']]['1'];?>] </span>
                            <?php  } ?>
                            <?php  echo $goods['title'];?>
                        </td>
                        <td><span class="label label-info"><?php  echo $goods['optionname'];?></span></td>
                        <td><?php  echo $goods['goodssn'];?></td>
                        <td><?php  echo $goods['productsn'];?></td>
                        <td><?php  echo $goods['marketprice'];?>元 / <?php  echo $goods['productprice'];?>元 / <?php  echo $goods['costprice'];?>元</td>
                        <td><?php  if($goods['status']==1) { ?><span class="label label-success">上架</span><?php  } else { ?><span class="label label-error">下架</span><?php  } ?>&nbsp;<span class="label label-info"><?php  if($goods['type'] == 1) { ?>实体商品<?php  } else { ?>虚拟商品<?php  } ?></span></td>
                        <td><?php  echo $goods['total'];?></td>
                        <td style='color:red;font-weight:bold;'><?php  echo $goods['orderprice'];?>/<?php  echo $goods['realprice'];?>
						<?php  if(intval($goods['changeprice'])!=0) { ?>
						<br/>(改价<?php  if($goods['changeprice']>0) { ?>+<?php  } ?><?php  echo number_format(abs($goods['changeprice']),2)?>)
							<?php  } ?>
						</td>
                        <td>  
                            <a href="<?php  echo $this->createWebUrl('shop/goods', array('id' => $goods['id'], 'op' => 'post'))?>" class="btn btn-default btn-sm" title="编辑"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;
                        </td>
                    </tr>
					<?php  if(count($item['goods'])>1 && $diyform_flag==1 && !empty($goods['diyformdata'])) { ?>
					<tr>
						<td colspan='10' style="background:#FCF8E3">
							 
							<a href='javascript:;' class='btn btn-default' hide="1" onclick="showDiyInfo(this)">查看用户信息</a>
							<div style='display:none'>
							  
		<?php  $datas = $goods['diyformdata']?>
        <?php  if(is_array($goods['diyformfields'])) { foreach($goods['diyformfields'] as $key => $value) { ?>
        <div class="form-group">
            <label class="col-xs-1 control-label"><?php  echo $value['tp_name']?></label>
            <div class="col-sm-9 col-xs-12">
                <div class="form-control-static">

                    <?php  if($value['data_type'] == 0 || $value['data_type'] == 1 || $value['data_type'] == 2 || $value['data_type'] == 6) { ?>
                    <?php  echo str_replace("\n","<br/>",$datas[$key])?>

                    <?php  } else if($value['data_type'] == 3) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <?php  echo $v1?>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 5) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <a target="_blank" href="<?php  echo tomedia($v1)?>"><img style='width:100px;;padding:1px;border:1px solid #ccc'  src="<?php  echo tomedia($v1)?>"></a>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 7) { ?>
                    <?php  echo $datas[$key]?>

                    <?php  } else if($value['data_type'] == 8) { ?>
                    <?php  if(!empty($datas[$key])) { ?>
                    <?php  if(is_array($datas[$key])) { foreach($datas[$key] as $k1 => $v1) { ?>
                    <?php  echo $v1?>
                    <?php  } } ?>
                    <?php  } ?>

                    <?php  } else if($value['data_type'] == 9) { ?>
                    <?php echo $datas[$key]['province']!='请选择省份'?$datas[$key]['province']:''?>-<?php echo $datas[$key]['city']!='请选择城市'?$datas[$key]['city']:''?>
                    <?php  } ?>
                </div>

            </div>
        </div>

        <?php  } } ?>
       
					</div>		
						</td>
					</tr>
					<?php  } ?>
                    <?php  } } ?>
                    <tr>
                        <td colspan="10">
                            
                           <?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/order/ops', TEMPLATE_INCLUDEPATH)) : (include template('web/order/ops', TEMPLATE_INCLUDEPATH));?>
                           
                        </td>
                    </tr>
                </table>
            </div>
        </div>
		<script language="javascript">
            $("select[name=eexpress]").val("<?php  echo $item['express'];?>");

            $("#eexpress").change(function () {
                var obj = $(this);
                var sel = obj.find("option:selected").attr("data-name");
                $("#eexpresscom").val(sel);
            });

			function showDiyInfo(obj){
				var hide = $(obj).attr('hide');
				if(hide=='1'){
					$(obj).next().slideDown();
				}
				else{
					$(obj).next().slideUp();
				}
				$(obj).attr('hide',hide=='1'?'0':'1');
			}

            <?php if(cv('order.op.changeaddress')) { ?>
            cascdeInit("<?php echo isset($user['province'])?$user['province']:''?>","<?php echo isset($user['city'])?$user['city']:''?>","<?php echo isset($user['area'])?$user['area']:''?>");

            $('#editaddress').click(function() {
                show_address(1);
            });

            $('#backaddress').click(function() {
                show_address(0);
            });

            $('#editexpress').click(function() {
                show_express(1);
            });

            $('#backexpress').click(function() {
                show_express(0);
            });

            $('#saveexpress').click(function() {
                var url = "<?php  echo $this->createWebUrl('order/list',array('op'=>'saveexpress'))?>";
                var id =<?php  echo $id?>;

                var express = $('#eexpress').val();
                var expresscom = $('#eexpresscom').val();
                var expresssn = $('#eexpresssn').val();

                if(expresssn==''){
                    alert('请填写快递单号!');
                    return false;
                }

                $.ajax({
                    url: url,
                    dataType: "json",
                    data: {id:id,express:express,expresscom:expresscom,expresssn:expresssn},
                    success:function(json){
                        var result = json.result;
                        if(json.status==1){
                            location.reload();
                        } else {
                            alert(result);
                        }
                    }
                });

            });

            $('#saveaddress').click(function() {
                var url = "<?php  echo $this->createWebUrl('order/list',array('op'=>'saveaddress'))?>";
                var id =<?php  echo $id?>;
                var realname = $('#realname').val();
                var mobile = $('#mobile').val();
                var provance = $('#sel-provance').val();
                var city = $('#sel-city').val();
                var area = $('#sel-area').val();
                var address = $('#address_info').val();

                if(realname==''){
                    alert('请填写收件人姓名!');
                    return false;
                }

                if(mobile==''){
                    alert('请填写收件人手机!');
                    return false;
                }

                if(provance=='请选择省份'){
                    alert('请选择省份!');
                    return false;
                }

                if(address==''){
                    alert('请填写详细地址!');
                    return false;
                }

                $.ajax({
                    url: url,
                    dataType: "json",
                    data: {id:id,realname:realname,mobile:mobile,provance:provance,city:city,area:area,address:address},
                    success:function(json){
                        var result = json.result;
                        if(json.status==1){
                            location.reload();
                        } else {
                            alert(result);
                        }
                    }
                });
            });

            function show_address(flag) {
                if (flag == 1) {
                    $('.ad1').hide();
                    $('.ad2').show();
                } else {
                    $('.ad1').show();
                    $('.ad2').hide();
                }
            }

            function show_express(flag) {
                if (flag == 1) {
                    $('.ex1').hide();
                    $('.ex2').show();
                } else {
                    $('.ex1').show();
                    $('.ex2').hide();
                }
            }
            <?php  } ?>

			</script>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/order/modals', TEMPLATE_INCLUDEPATH)) : (include template('web/order/modals', TEMPLATE_INCLUDEPATH));?>
  <?php  if(p('commission')) { ?>
		  
		   <?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('commission/changecommission', TEMPLATE_INCLUDEPATH)) : (include template('commission/changecommission', TEMPLATE_INCLUDEPATH));?>
		  <?php  } ?>

<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_footer', TEMPLATE_INCLUDEPATH)) : (include template('web/_footer', TEMPLATE_INCLUDEPATH));?>
