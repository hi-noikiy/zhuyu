<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>
<style type="text/css">
    .up h3 {
    height: 33px;
    line-height: 33px;
    font-weight: bold;
    padding: 0 14px;
    font-size: 18px;
    color: #31708f;
}
</style>
<script src="./resource/script/update.min.js" type="text/javascript"></script>
<link href="./resource/style/update.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
  $(document).ready(function(){
 var str = $('div#count').html();   
    var nstr = str.replace(/\n\r/gi,"<br/>"); 
    nstr = str.replace(/\r/gi,"<br/>"); 
    nstr = str.replace(/\n/gi,"<br/>"); 
    $('div#count').html(nstr); 
    });
</script>
<div class="main">
    <form action="" method="post" class="form-horizontal form" enctype="multipart/form-data" >
        <div class="panel panel-default">
            <div class="panel-heading">
                系统升级
            </div>
            <div class="panel-body">
            <?php  if($op == 'display') { ?>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">当前版本</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><?php  echo $ver;?><br/> 最后更新日期: <?php  echo $updatedate;?> <a href="<?php  echo $this->createWebUrl('upgrade',array('op'=>'recheck'))?>">降低到版本重新检测</a></div>
                    </div>
                </div>
                 <div class="form-group" >
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">最新版本</label>
                    <div class="col-sm-9 col-xs-12">
                    <div class="form-control-static">
                      <?php  if(version_compare($lastver, $ver,"<=") ) { ?>        
                     <span style="color:blue">[最新系统版本]：人人商城V<?php  echo $ver;?>（恭喜, 你的程序已经是最新版本）</span>
                           <?php  if($domain_time == '0') { ?>
                         <span style="color:red">【系统未授权，无法完成升级！】</span>
                    <?php  } ?>  
                         <?php  } else { ?>
                     <span style="color:blue">[下一个系统版本]：人人商城V<?php  echo $lastver;?>&nbsp;&nbsp;</span>
                           <?php  if($domain_time == '0') { ?>
                         <span style="color:red">【系统未授权，无法完成升级！】</span>
                       <?php  } else { ?>   
                   <a href="<?php  echo $this->createWebUrl('upgrade',array('op'=>'chanage'));?>"> <input type=button value="查看版本" class="btn btn-primary"></a> 
                    <?php  } ?>  
                      <?php  } ?>  
           
                    </div>
                </div>  
        </div>


        <div class="form-group" >
          <label class="col-xs-12 col-sm-3 col-md-2 control-label">授权状态</label>
  <div class="col-sm-9 col-xs-12">
            <div class="alert alert-danger">

               <?php  if($domain_time == '0') { ?><i class="fa fa-exclamation-triangle"></i> 未授权版本，请联系客服:
               <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1601408008&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1601408008:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a><!-- WPA Button Begin -->
               <script charset="utf-8" type="text/javascript" src="http://wpa.qq.com/msgrd?v=3&uin=1601408008&site=qq&menu=yes"></script>
               <!-- WPA Button End -->
               <?php  } else { ?>
               <i class="fa fa-refresh"></i> 授权版本：高级商业版 &nbsp;<br><br>更新服务截止：(<?php  echo date("Y-m-d", $domain_time);?>)
               <?php  } ?>
           </div>
<div class="alert alert-info">
            服务器域名(IP)：<?php  echo $_SERVER['SERVER_NAME'];?>(<?php  if('/'==DIRECTORY_SEPARATOR){echo $_SERVER['SERVER_ADDR'];}else{echo @gethostbyname($_SERVER['SERVER_NAME']);} ?>)
       </div>         
             </div>  
       </div>
        <?php  } ?>

<?php  if($op == 'chanage') { ?>
<div class="form-group">
 <label class="col-xs-12 col-sm-3 col-md-2 control-label"><i class="fa fa-refresh"></i>待更新的升级包</label>
                    <div class="col-sm-9 col-xs-12">
<div  class="up">
    <div class="alert alert-info" style="line-height:20px;margin-top:8px;">
   <div class="form-control-static"> <p class="red"><i class="fa fa-refresh"></i> [待更新的程序版本]人人商城_V<?php  echo $lastver;?> &nbsp;&nbsp;
   <a href="<?php  echo $this->createWebUrl('upgrade',array('op'=>'update'));?>"> <input type=button value="在线升级" class="btn btn-primary"></a> 
   </p>  </div>
         <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"  id="check"></div>
                    </div>
    <br/>
    <div class="alert alert-warning" style="width: 90%;" id='count'>
        <i class="fa fa-refresh"></i> [本次更新的内容]：<br><?php  echo $cinfo;?>
    </div>
    </div>
</div>
</div>
 </div>
             </div>  
<?php  } ?>
 </div>
    </form>
</div>
<script language='javascript'>

  function disp_confirm()
          {
          var r=confirm("确定已备份好系统，并更新系统到最新版本吗？")
          if (r==true)
            {
                 upgrade();
        
            }
          }
        function alert(title) {
            $("#windowcenter").slideToggle("slow");
            $("#txt").html(title);
            setTimeout('$("#windowcenter").slideUp(500)', 4000);
        } 

  
    function upgrade(){

        $.ajax({
            url: "<?php  echo $this->createWebUrl('upgrade',array('op'=>'update'));?>",
            type:'post',
            dataType:'json',
            success:function(ret){
             if(ret.result==1)      {
                 $('#check').html("已更新 " + ret.success + "个文件 / 共 " + ret.total +  " 个文件！");
             }
             else if(ret.result==2){
                  $('#check').html("更新完成!");
                  alert('更新完成!');
                  
             }
             else{
                 alert('更新完成!');
                    $("#check").html( ret.message);
                }
            }
        });
    }
 
  
</script>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_footer', TEMPLATE_INCLUDEPATH)) : (include template('web/_footer', TEMPLATE_INCLUDEPATH));?>