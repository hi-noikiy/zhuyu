<?php defined('IN_IA') or exit('Access Denied');?><ul class="nav nav-tabs" >
      <?php if(cv('order.view.status0|order.view.status1|order.view.status2|order.view.status3|order.view.status4|order.view.status_1')) { ?>
    <li <?php  if($operation == 'display' && $status == '' && $_GPC['refund']!='1') { ?>class="active"<?php  } ?>>
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display'))?>">全部订单(<span id="status_all">-</span>)</a>
    </li>
    <?php  } ?>

    <?php if(cv('order.view.status0')) { ?>
    <li <?php  if($operation == 'display' && $status == '0') { ?>class="active"<?php  } ?>>
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display', 'status' => 0))?>">待付款(<span id="status_0">-</span>)</a>
    </li>
    <?php  } ?>
    
    <?php if(cv('order.view.status1')) { ?>
    <li <?php  if($operation == 'display' && $status == '6') { ?> class="active"<?php  } ?>>
    	
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display', 'status' => 6))?>">待制作(<span id="status_6">-</span>)</a>
    </li>
    <?php  } ?>
    
    
    <?php if(cv('order.view.status1')) { ?>
    <li <?php  if($operation == 'display' && $status == '7') { ?> class="active"<?php  } ?>>
    	
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display', 'status' => 7))?>">制作中(<span id="status_7">-</span>)</a>
    </li>
    <?php  } ?>    
    <?php if(cv('order.view.status2')) { ?>
    <li <?php  if($operation == 'display' && $status == '2') { ?>class="active"<?php  } ?>>
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display', 'status' => 2))?>">运输中(<span id="status_2">-</span>)</a>
    </li>
    <?php  } ?>
    
    <?php if(cv('order.view.status3')) { ?>
    <li <?php  if($operation == 'display' && $status == '3') { ?>class="active"<?php  } ?>>
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display', 'status' => 3))?>">已完成(<span id="status_3">-</span>)</a>
    </li>
    <?php  } ?>
    
     <?php if(cv('order.view.status_1')) { ?>
    <li <?php  if($operation == 'display' && $status == '-1') { ?>class="active"<?php  } ?>>
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display', 'status' => -1))?>">已关闭(<span id="status__1">-</span>)</a>
    </li>
    <?php  } ?>
      
    
    <?php if(cv('order.view.status4')) { ?>
     <li <?php  if($operation == 'display' && $status== '4') { ?>class="active"<?php  } ?>>
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display', 'status' => 4))?>">维权申请(<span id="status_4">-</span>)</a>
    </li>
    <?php  } ?>
     
    <?php if(cv('order.view.status5')) { ?>
    <li <?php  if($operation == 'display' && $status == '5') { ?>class="active"<?php  } ?>>
        <a href="<?php  echo $this->createWebUrl('order', array('op' => 'display', 'status' => 5))?>">完成维权(<span id="status_5">-</span>)</a>
    </li>
    <?php  } ?>
    
    <?php  if($operation == 'detail') { ?>
    <li class="active">
        <a href="#">订单详情</a>
    </li>
    <?php  } ?>
    <?php  if($operation == 'export') { ?>
    <li class="active">
        <a href="#">自定义导出</a>
    </li>
    <?php  } ?>
</ul>
<script language="javascript">
    $(function(){
     $.ajax({
          'url' : "<?php  echo $this->createWebUrl('order/list',array('op'=>'totals'))?>",
          cache:false,
          dataType:'json',
          success : function(ret){
             var result = ret.result;
             $('#status_all').html( result.all);
             $('#status_0').html( result.status0);
             $('#status_1').html( result.status1);
             $('#status_2').html( result.status2);
             $('#status_3').html( result.status3);
             $('#status_4').html( result.status4);
             $('#status_5').html( result.status5);
             $('#status_6').html( result.status6);
             $('#status_7').html( result.status7);
             $('#status__1').html( result.status_1);
          }
     });
    })
</script>