<?php defined('IN_IA') or exit('Access Denied');?>
<div class="panel-body table-responsive" style="padding:0px;">
    <table class="table">
        <thead>
            <tr>
                <th style='width:50px;'></th>
                <th>属性名称</th>
                <th>属性值</th>
            </tr>
        </thead>



			<tbody id="param-items" class="ui-sortable">
			                    <tr>

				
			    <td>
			        <a href="javascript:;" class="fa fa-move" title="拖动调整此显示顺序"><i class="fa fa-arrows"></i></a>&nbsp;
			        
			    </td>
			    <td>
			        <input name="param_title[]"  readonly="readonly" type="text" class="form-control param_title" value="参考甜度(数字,最大是5)">
			        <input name="param_id[]" type="hidden" class="form-control" value="">
			    </td>
			    <td><input name="referencesweetness" type="text" class="form-control param_value" value="<?php  echo $item['referencesweetness'];?>"></td>
			</tr><tr>
			
			
			
			
			
			    <td>
			        <a href="javascript:;" class="fa fa-move" title="拖动调整此显示顺序"><i class="fa fa-arrows"></i></a>&nbsp;
			        
			    </td>
			    <td>
			        <input name="param_title[]"  readonly="readonly" type="text" class="form-control param_title" value="配送时间">
			        <input name="param_id[]" type="hidden" class="form-control" value="">
			    </td>
			    <td><input name="ordertime" type="text" class="form-control param_value" value="<?php  echo $item['ordertime'];?>"></td>
			</tr><tr>
				
				
				
				
				
				
				
				
				
				
			    <td>
			        <a href="javascript:;" class="fa fa-move" title="拖动调整此显示顺序"><i class="fa fa-arrows"></i></a>&nbsp;
			        
			    </td>
			    <td>
			        <input name="param_title[]"  readonly="readonly" type="text" class="form-control param_title" value="保鲜条件">
			        <input name="param_id[]" type="hidden" class="form-control" value="">
			    </td>
			    <td><input name="preservationcondition" type="text" class="form-control param_value" value="<?php  echo $item['preservationcondition'];?>"></td>
			</tr><tr>
				
				
				
				
				
			    <td>
			        <a href="javascript:;" class="fa fa-move" title="拖动调整此显示顺序"><i class="fa fa-arrows"></i></a>&nbsp;
			        
			    </td>
			    <td>
			        <input name="param_title[]"  readonly="readonly" type="text" class="form-control param_title" value="标准匹配">
			        <input name="param_id[]" type="hidden" class="form-control" value="">
			    </td>
			    <td><input name="suboptimalmatching" type="text" class="form-control param_value" value="<?php  echo $item['suboptimalmatching'];?>"></td>
			</tr><tr>
				
				
				
				
				
			    <td>
			        <a href="javascript:;" class="fa fa-move" title="拖动调整此显示顺序"><i class="fa fa-arrows"></i></a>&nbsp;
			        
			    </td>
			    <td>
			        <input name="param_title[]"   readonly="readonly" type="text" class="form-control param_title" value="包含配料1">
			        <input name="param_id[]" type="hidden" class="form-control" value="">
			    </td>
			    <td><input name="burdening1" type="text" class="form-control param_value" value="<?php  echo $item['burdening1'];?>"></td>
			</tr><tr>
				
				
				
			    <td>
			        <a href="javascript:;" class="fa fa-move" title="拖动调整此显示顺序"><i class="fa fa-arrows"></i></a>&nbsp;
			        
			    </td>
			    <td>
			        <input name="param_title[]"  readonly="readonly" type="text" class="form-control param_title" value="包含配料2">
			        <input name="param_id[]" type="hidden" class="form-control" value="">
			    </td>
			    <td><input name="burdening2" type="text" class="form-control param_value" value="<?php  echo $item['burdening2'];?>"></td>
			</tr><tr>
			

			    <td>
			        <a href="javascript:;" class="fa fa-move" title="拖动调整此显示顺序"><i class="fa fa-arrows"></i></a>&nbsp;
			        
			    </td>
			    <td>
			        <input name="param_title[]"  readonly="readonly" type="text" class="form-control param_title" value="包含配料3">
			        <input name="param_id[]" type="hidden" class="form-control" value="">
			    </td>
			    <td><input name="burdening3" type="text" class="form-control param_value" value="<?php  echo $item['burdening3'];?>"></td>
			</tr><tr>

			
			</tbody>







           <?php if( ce('shop.goods' ,$item) ) { ?>
        <tbody>
            <tr>
                <td>&nbsp;</td>
                <!--<td colspan="2">
                    <a href="javascript:;" id='add-param' onclick="addParam()" style="margin-top:10px;" class="btn btn-default"  title="添加属性"><i class='fa fa-plus'></i> 添加属性</a>
                </td>-->
            </tr>
        </tbody>
        <?php  } ?>
    </table>
</div>

<script language="javascript">
    $(function() {
        $("#param-items").sortable({handle: '.fa-move'});
        $("#chkoption").click(function() {
            var obj = $(this);
            if (obj.get(0).checked) {
                $("#tboption").show();
                $(".trp").hide();
            }
            else {
                $("#tboption").hide();
                $(".trp").show();
            }
        });
    })
    function addParam() {
        var url = "<?php  echo $this->createWebUrl('shop/tpl',array('tpl'=>'param'))?>";
        $.ajax({
            "url": url,
            success: function(data) {
                $('#param-items').append(data);
            }
        });
        return;
    }
    function deleteParam(o) {
        $(o).parent().parent().remove();
    }
</script>