<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_header', TEMPLATE_INCLUDEPATH)) : (include template('web/_header', TEMPLATE_INCLUDEPATH));?>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('tabs', TEMPLATE_INCLUDEPATH)) : (include template('tabs', TEMPLATE_INCLUDEPATH));?>
<form id="setform"  action="" method="post" class="form-horizontal form">
    <div class='panel panel-default'>
 	
	<div class='panel-heading'>
            其他设置
        </div>
	 <div class='panel-body'>
		 <div class="form-group">
		<label class="col-xs-12 col-sm-3 col-md-2 control-label">购物券优惠券统一使用说明</label>
		<div class="col-sm-9 col-xs-12">
			  <?php if(cv('coupon.set.save')) { ?>
                                 <?php  echo tpl_ueditor('setdata[consumedesc]',$set['consumedesc'])?>
			   <span class='help-block'>统一说明会放到购物券单独说明的前面</span>
                            <?php  } else { ?>
                            <textarea id='consumedesc' style='display:none'><?php  echo $set['consumedesc'];?></textarea>
							
                            <a href='javascript:preview_html("#consumedesc")' class="btn btn-default">查看内容</a>
                            <?php  } ?>
		</div>
	</div>
		 
	 <div class="form-group">
		<label class="col-xs-12 col-sm-3 col-md-2 control-label">充值优惠券统一使用说明</label>
		<div class="col-sm-9 col-xs-12">
			  <?php if(cv('coupon.set.save')) { ?>
                            <?php  echo tpl_ueditor('setdata[rechargedesc]',$set['rechargedesc'])?>
							<span class='help-block'>统一说明会放到充值券单独说明的前面</span>
                            <?php  } else { ?>
                            <textarea id='rechargedesc' style='display:none'><?php  echo $set['rechargedesc'];?></textarea>
                            <a href='javascript:preview_html("#rechargedesc")' class="btn btn-default">查看内容</a>
                            <?php  } ?>
		</div>
	</div>
		 
		 
         <div class="form-group" style="padding-top:20px;">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">优惠券发放通知（任务处理通知）</label>
            <div class="col-sm-9 col-xs-12">
				   <?php if(cv('coupon.set.save')) { ?>
                <input type="text" name="setdata[templateid]" class="form-control" value="<?php  echo $set['templateid'];?>" />
                <div class="help-block">公众平台模板消息编号: OPENTM200605630 (同分销任务处理通知 一个模板id) </div>
				<div class="help-block">优惠券的发放或领取通知会优先使用客服消息发送图文消息，如果接收消息会员在４８小时没有互动，则使用模板消息,其他消息默认优先客服消息</div>
				<?php  } else { ?>
				 <div class='form-control-static'><?php  echo $set['templateid'];?></div>
				<?php  } ?>
            </div>
        </div>

            
             <?php  if($_W['isfounder']) { ?>
				<div class="form-group">
					<label class="col-xs-12 col-sm-3 col-md-2 control-label">自动优惠券返利执行间隔时间</label>
					<div class="col-sm-5">
						 
						<div class="input-group">
							<input type="text" name="setdata[backruntime]" class="form-control" value="<?php  echo $set['backruntime'];?>" />
							<div class="input-group-addon">分钟</div>
						</div>
						<span class='help-block'>自动优惠券返利执行间隔时间，如果为空默认为 60分钟 执行一次关自动优惠券返利</span>
						 
					</div>
				</div>
                <?php  } ?>
         <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
            <div class="col-sm-9">
                <input type="submit" name="submit" value="提交" class="btn btn-primary col-lg-1" onclick='return formcheck()' />
                <input type="hidden" name="token" value="<?php  echo $_W['token'];?>" />
            </div>
        </div>
        </div>
 
</form>
<script language='javascript'>
    require(['util'],function(u){
    $('#cp').each(function(){
	u.clip(this, $(this).text());
	});
    })
    </script>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_footer', TEMPLATE_INCLUDEPATH)) : (include template('web/_footer', TEMPLATE_INCLUDEPATH));?>