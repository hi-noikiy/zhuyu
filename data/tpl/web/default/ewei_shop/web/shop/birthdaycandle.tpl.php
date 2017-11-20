<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_header', TEMPLATE_INCLUDEPATH)) : (include template('web/_header', TEMPLATE_INCLUDEPATH));?>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/shop/tabs', TEMPLATE_INCLUDEPATH)) : (include template('web/shop/tabs', TEMPLATE_INCLUDEPATH));?>
<?php  if($operation == 'display') { ?>
     <form action="" method="post">
<div class="panel panel-default">
    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead class="navbar-inner">
                <tr>
                    <th style="width:30px;">ID</th>	
                    
                    <th>生日蜡烛名称</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <?php  if(is_array($list)) { foreach($list as $row) { ?>
                <tr>
                    <td><?php  echo $row['id'];?></td>                   
                    <td><?php  echo $row['title'];?></td>

                    <td>
                                    <?php  if($row['state']==1) { ?>
                                    <span class='label label-success'>显示</span>
                                    <?php  } else { ?>
                                    <span class='label label-danger'>隐藏</span>
                                    <?php  } ?>
                    </td>
                    <td style="text-align:left;">
                        <?php if(cv('shop.adv.view|shop.adv.edit')) { ?><a href="<?php  echo $this->createWebUrl('shop/birthdaycandle', array('op' => 'post', 'id' => $row['id']))?>" class="btn btn-default btn-sm" 
                                                               title="<?php if(cv('shop.adv.edit')) { ?>修改<?php  } else { ?>查看<?php  } ?>"><i class="fa fa-edit"></i></a><?php  } ?>
                        <?php if(cv('shop.adv.delete')) { ?><a href="<?php  echo $this->createWebUrl('shop/birthdaycandle', array('op' => 'delete', 'id' => $row['id']))?>"class="btn btn-default btn-sm" onclick="return confirm('确认删除?')" title="删除"><i class="fa fa-times"></i></a><?php  } ?>
                    </td>
                </tr>
                <?php  } } ?> 
                <tr>
                    <td colspan='6'>
                        <?php if(cv('shop.adv.add')) { ?>
                          <a class='btn btn-default' href="<?php  echo $this->createWebUrl('shop/birthdaycandle',array('op'=>'post'))?>"><i class='fa fa-plus'></i>添加生日蜡烛</a>
                          <input type="hidden" name="token" value="<?php  echo $_W['token'];?>" />
                       <?php  } ?>

                    </td>
                </tr>
            </tbody>
        </table>
        <?php  echo $pager;?>
    </div>
</div>
</form>
<script>
    require(['bootstrap'], function ($) {
        $('.btn').hover(function () {
            $(this).tooltip('show');
        }, function () {
            $(this).tooltip('hide');
        });
    });
</script>

<?php  } else if($operation == 'post') { ?>

<div class="main">
    <form <?php if( ce('shop.adv' ,$item) ) { ?>action="" method="post"<?php  } ?> class="form-horizontal form" enctype="multipart/form-data" onsubmit='return formcheck()'>
        <input type="hidden" name="id" value="<?php  echo $item['id'];?>" />
        <div class="panel panel-default">
            <div class="panel-heading">
                	生日蜡烛设置
            </div>
            <div class="panel-body">

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"><span style="color:red">*</span>生日蜡烛名称</label>
                    <div class="col-sm-9 col-xs-12">
                         <?php if( ce('shop.adv' ,$item) ) { ?>
                        <input type="text" id='title' name="title" class="form-control" value="<?php  echo $item['title'];?>" />
                         <?php  } else { ?>
                        <div class='form-control-static'><?php  echo $item['title'];?></div>
                        <?php  } ?>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">生日蜡烛名称图片</label>
                    <div class="col-sm-9 col-xs-12">
                         <?php if( ce('shop.adv' ,$item) ) { ?>
                        <?php  echo tpl_form_field_image('thumb', $item['thumb'])?>
                        <span class='help-block'>建议尺寸: 60*60  请将蛋糕帽图片尺寸保持一致</span>
                        <?php  } else { ?>
                            <?php  if(!empty($item['thumb'])) { ?>
                                  <a href='<?php  echo tomedia($item['thumb'])?>' target='_blank'>
                            <img src="<?php  echo tomedia($item['thumb'])?>" style='width:100px;border:1px solid #ccc;padding:1px' />
                                  </a>
                            <?php  } ?>
                        <?php  } ?>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">是否显示</label>
                    <div class="col-sm-9 col-xs-12">
                            <?php if( ce('shop.adv' ,$item) ) { ?>
                        <label class='radio-inline'>
                            <input type='radio' name='state' value=1' <?php  if($item['state']==1) { ?>checked<?php  } ?> /> 是
                        </label>
                        <label class='radio-inline'>
                            <input type='radio' name='state' value=0' <?php  if($item['state']==0) { ?>checked<?php  } ?> /> 否
                        </label>
                     <?php  } else { ?>
                            <div class='form-control-static'><?php  if(empty($item['state'])) { ?>否<?php  } else { ?>是<?php  } ?></div>
                        <?php  } ?>
                    </div>
                </div>
                
                    <div class="form-group"></div>
            <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                           <?php if( ce('shop.adv' ,$item) ) { ?>
                            <input type="submit" name="submit" value="提交" class="btn btn-primary col-lg-1"  />
                            <input type="hidden" name="token" value="<?php  echo $_W['token'];?>" />
                        <?php  } ?>
                       <input type="button" name="back" onclick='history.back()' <?php if(cv('shop.adv.add|shop.adv.edit')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
                    </div>
            </div>
                
                
            </div>
        </div>
         
    </form>
</div>

<script language='javascript'>
    function formcheck() {
        if ($("#title").isEmpty()) {
            Tip.focus("title", "标题不能为空!");
            return false;
        }
        return true;
    }
</script>
<?php  } ?>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_footer', TEMPLATE_INCLUDEPATH)) : (include template('web/_footer', TEMPLATE_INCLUDEPATH));?>