<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>
<div class="main">
    <form action="" method="post" class="form-horizontal form" enctype="multipart/form-data" >
        <div class="panel panel-default">
            <div class="panel-heading">
                系统升级
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">当前版本</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  echo $version;?><br/> 最后更新日期: <?php  echo $updatedate;?> <a href="<?php  echo $this->createWebUrl('upgrade',array('op'=>'checkversion'))?>">降低版本重新检测</a></div>
                    </div>
                </div>
                 <div class="form-group" >
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">最新版本</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"  id="check">等待检测...</div>
                    </div>
                </div>
           
                <div class="form-group" id="upgrade" style="display:none">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                        <div class='form-control-static'>
                            <input type="button" id="upgradebtn" value="立即更新" class="btn btn-primary col-lg-1" />
                            
                            <input type="hidden" name="token" value="<?php  echo $_W['token'];?>" />
                        </div>
                    </div>
        
                    
            </div>  
        </div>
    </form>
</div>
<script language='javascript'>
  
    function upgrade(){
        $.ajax({
            url: "<?php  $this->createWebUrl('upgrade')?>",
            data:{op:'download'},
            type:'post',
            dataType:'json',
            success:function(ret){
             if(ret.result==1)      {
                 $('#process').html("已更新 " + ret.success + "个文件 / 共 " + ret.total +  " 个文件！");
                 upgrade();
             }
             else if(ret.result==2){
                  $('#process').html("更新完成!");
                  alert('更新完成!');
                  location.reload();
             }
            }
        });
    }
 
    $(function(){
       
 
         $.ajax({
            url: "<?php  $this->createWebUrl('upgrade')?>",
            data:{op:'check',verifycode:$('#verifycode').val()}, 
            type:'post',
            dataType:'json',
            success:function(ret){
                if(ret.result==1){
                   
                    var html = "";
                    html+="最新版本: <span style='color:red'>" + ret.version + "</span><br/>";
                    if(ret.filecount<=0 && !ret.upgrade){
                        html+="恭喜您，您现在是最新版本！"
                    }
                    else{
                       if(ret.filecount>0)    {
                           html+="共检测到有 <span style='color:red'>" + ret.filecount + "</span> 个文件需要更新.<br/>";
                       }
                       if(ret.upgrade){
                            html+="此次有数据变动.<br/>";    
                       }
                       if(ret.log!=''){
                            html+="<br/><b>更新日志:</b><br/>";    
                            html+= ret.log + "<br/>";
                       }
                       html+="<br/><b style='color:red'>更新之前请注意数据备份!</b><br/><br/>";    
                    }
                    
                    
                
                    html+="<div id='process'></div>";
                    $("#check").html( html);
                    if(ret.filecount>0 || ret.upgrade){
                        $('#upgrade').show();
                            $("#upgradebtn").unbind('click').click(function(){
                                  if($(this).attr('updating')=='1'){
                                      return;
                                  }
                             if(confirm('确认已备份，并进行更新吗?')){
                                 $(this).attr('updating',1).val('正在更新中...');
                                 upgrade();
                             }
                         });
                    }
                    
                }
                else{
                    $("#check").html( ret.message);
                }
            }
        })
   

    })
</script>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_footer', TEMPLATE_INCLUDEPATH)) : (include template('web/_footer', TEMPLATE_INCLUDEPATH));?>