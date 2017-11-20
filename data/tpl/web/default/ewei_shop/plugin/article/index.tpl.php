<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_header', TEMPLATE_INCLUDEPATH)) : (include template('web/_header', TEMPLATE_INCLUDEPATH));?>
<ul class="nav nav-tabs">
    <li <?php  if($_GPC['op']=='' || $_GPC['op']=='display') { ?>class="active"<?php  } ?>><a href="<?php  echo $this->createPluginWebUrl('article')?>" style="cursor: pointer;">文章管理</a></li>
    <?php if(cv('article.page.add')) { ?>
        <li <?php  if($_GPC['op']=='post') { ?>class="active"<?php  } ?>><a href="<?php  echo $this->createPluginWebUrl('article',array('op'=>'post'))?>" style="cursor: pointer;"><?php  if($_GPC['aid']) { ?>编辑文章<?php  } else { ?>添加文章<?php  } ?></a></li>
    <?php  } ?>
    <li <?php  if($_GPC['op']=='category') { ?>class="active"<?php  } ?>><a href="<?php  echo $this->createPluginWebUrl('article',array('op'=>'category'))?>" style="cursor: pointer;">分类管理</a></li>
    <?php if(cv('article.page.otherset')) { ?>
        <li <?php  if($_GPC['op']=='other') { ?>class="active"<?php  } ?>><a href="<?php  echo $this->createPluginWebUrl('article',array('op'=>'other'))?>" style="cursor: pointer;">其他设置</a></li>
    <?php  } ?>
    <?php if(cv('article.page.report')) { ?>
    <li <?php  if($_GPC['op']=='report') { ?>class="active"<?php  } ?>><a href="<?php  echo $this->createPluginWebUrl('article',array('op'=>'report'))?>" style="cursor: pointer;">举报记录</a></li>
    <?php  } ?>
    <?php  if($_GPC['op']=='list_read') { ?><li class="active"><a href="javascript:;" style="cursor: pointer;">阅读/点赞记录</a></li><?php  } ?>
    <?php  if($_GPC['op']=='list_share') { ?><li class="active"><a href="javascript:;" style="cursor: pointer;">分享记录</a></li><?php  } ?>
</ul>

<?php  if($operation == 'display') { ?>
<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">筛选</div>
        <div class="panel-body">
            <form action="./index.php" method="get" class="form-horizontal" role="form">
                <input type="hidden" name="c" value="site">
                <input type="hidden" name="a" value="entry">
                <input type="hidden" name="m" value="ewei_shop">
                <input type="hidden" name="do" value="plugin">
                <input type="hidden" name="p" value="article">
                <input type="hidden" name="op" value="display">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-1 control-label">筛选</label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="row row-fix tpl-category-container">
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <select class="form-control tpl-category-parent" name="category">
                                            <option value="">全部分类</option>
                                            <?php  if(is_array($categorys)) { foreach($categorys as $category) { ?>
                                                <option value="<?php  echo $category['id'];?>" <?php  if($_GPC['category']==$category['id']) { ?>selected="selected"<?php  } ?>><?php  echo $category['category_name'];?></option>
                                            <?php  } } ?>
                                    </select>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-lg-9">
                                <input class="form-control" name="keyword" id="" type="text" value="<?php  echo $_GPC['keyword'];?>" placeholder="请输入文章标题关键字进行检索（选择文章分类减小检索范围）">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2 col-lg-2">
                        <button class="btn btn-default"><i class="fa fa-search"></i> 搜索</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 文章列表 -->
<div class='panel panel-default'>
    <div class='panel-heading'> 文章列表 <?php  if($articlenum) { ?>(总数: <?php  echo $articlenum;?>)<?php  } ?></div>
    <div class='panel-body'>
        <table class="table" style="width:1190px;">
            <thead>
                <tr>
                    <th style="width:60px; text-align: center;">ID</th>
                    <th style="width:400px">文章标题</th>
                    <th style="width:100px; text-align: center;">文章分类</th>
                    <th style="width:100px; text-align: center;">文章关键字</th>
                    <th style="width:150px; text-align: center;">文章创建时间</th>
                    <th style="width:90px; text-align: center;">真实阅读量</th>
                    <th style="width:90px; text-align: center;">真实点赞量</th>
                    <th style="width:180px; text-align: center;">数据统计</th>
                    <th style="width:50px; text-align: center;">状态</th>
                    <th style="width:100px; text-align: center;">操作</th>
                </tr>
            </thead>
            <tbody>
                <?php  if(!empty($articles)) { ?>
                    <?php  if(is_array($articles)) { foreach($articles as $article) { ?>
                        <tr>
                            <td style="text-align: center;"><?php  echo $article['id'];?></td>
                            <td><?php  echo $article['article_title'];?></td>
                            <td style="text-align: center;"><?php  echo $article['category_name'];?></td>
                            <td style="text-align: center;"><?php  echo $article['article_keyword'];?></td>
                            <td style="text-align: center;"><?php  echo $article['article_date'];?></td>
                            <td style="text-align: center;"><?php  echo $article['article_readnum'];?></td>
                            <td style="text-align: center;"><?php  echo $article['article_likenum'];?></td>
                            <td style="text-align: center;">
                                <?php if(cv('article.page.showdata')) { ?>
                                    <a title="阅读/点赞记录" href="<?php  echo $this->createPluginWebUrl('article', array('op'=>'list_read','aid'=>$article['id']))?>">阅读/点赞记录</a>&nbsp;&nbsp;
                                    <a title="分享记录" href="<?php  echo $this->createPluginWebUrl('article', array('op'=>'list_share','aid'=>$article['id']))?>">分享记录</a>
                                    <?php  } else { ?>-
                                <?php  } ?>
                            </td>
                            <td style="text-align: center;">
                                <?php  if($article['article_state']==0) { ?>关闭<?php  } else { ?><span style='color: green;'>开启</span><?php  } ?>
                            </td>
                            <td style="text-align: center;">
                                <?php if(cv('article.page.edit')) { ?>
                                    <a title="编辑" class='btn btn-default' href="<?php  echo $this->createPluginWebUrl('article',array('op'=>'post','aid'=>$article['id']))?>"><i class="fa fa-edit"></i></a>
                                    <?php  } else { ?>-
                                <?php  } ?>
                                <?php if(cv('article.page.delete')) { ?>
                                    <a title="删除" class='btn btn-default nav-del' href="javascript:;" aid="<?php  echo $article['id'];?>"><i class="fa fa-trash-o"></i></a>
                                    <?php  } else { ?>-
                                <?php  } ?>
                            </td>
                        </tr>
                    <?php  } } ?>
                <?php  } else { ?>
                    <tr> 
                        <td style="text-align: center; line-height: 100px;" colspan="10"><?php  if(!empty($_GPC['category']) || !empty($_GPC['keyword'])) { ?>啊哦~没有搜索到相关文章哦~<?php  } else { ?>亲~您还没有添加营销文章哦~<?php  } ?><?php if(cv('article.page.add')) { ?>您可以尝试 ↙ 左下角的 “<a href="<?php  echo $this->createPluginWebUrl('article', array('op' => 'post'))?>">添加一篇文章</a>”<?php  } ?></td>
                    </tr>
                <?php  } ?>     
                <tr><td colspan="10" style="padding:0px; margin: 0px;"><?php  echo $pager;?></td></tr>
            </tbody>
        </table>
    </div>
    <?php if(cv('article.page.add')) { ?>
        <div class="panel-footer">
            <a class='btn btn-default' href="<?php  echo $this->createPluginWebUrl('article', array('op' => 'post'))?>"><i class="fa fa-plus"></i> 添加一篇文章</a>
        </div>
    <?php  } ?>
</div>
<?php if(cv('article.page.delete')) { ?>
    <script>
        $(function(){
            $(".nav-del").click(function(){
                var aid = $(this).attr("aid")
                if(confirm("确定要删除？此操作不可恢复！")){ 
                    $.ajax({
                        type: 'POST',
                        url: "<?php  echo $this->createPluginWebUrl('article',array('method'=>'api','apido'=>'delarticle'))?>",
                        data: {aid:aid}, 
                        dataType:'json',
                        success: function(data){
                            if(data.result=='success'){
                                $("a[aid="+aid+"]").parent().parent().fadeOut();
                            }else{
                                alert('删除失败！文章已删除或不存在！请刷新页面重试');
                            }
                        }
                    });
                }
            });
        });
    </script>
<?php  } ?>
<?php  } else if($operation == 'post') { ?>
<link href="../addons/ewei_shop/plugin/article/template/imgsrc/article.css" rel="stylesheet">
<script type="text/javascript" src="../addons/ewei_shop/plugin/article/template/imgsrc/jquery.json.js"></script>
<script type="text/javascript" src="./resource/components/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="./resource/components/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="./resource/components/ueditor/ueditor.parse.js"></script>
<script type="text/javascript" src="./resource/components/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
$(function(){
        var pagestate = 0;
//初始化百度编辑器        
        var opts = {type: 'image',direct: false,multi: true,tabs: {'upload': 'active','browser': '','crawler': ''},path: '',dest_dir: '',global: false,thumb: false,width: 0};
        var ue = UE.getEditor("editor", {
            topOffset: 0,
            autoFloatEnabled: false,
            autoHeightEnabled: false,
            autotypeset: {
                removeEmptyline: true
            },
            maximumWords : 9999999999999,
            initialFrameHeight: 607,
            focus : true,
            toolbars : [['fullscreen', 'source', '|', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'strikethrough', 'forecolor', 'backcolor', '|','justifyleft', 'justifycenter', 'justifyright', '|', 'insertorderedlist', 'insertunorderedlist', 'blockquote', 'emotion', 'insertvideo', 'removeformat', '|', 'rowspacingtop', 'rowspacingbottom', 'lineheight','indent', 'paragraph', 'fontsize', '|','inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol','mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', '|', 'anchor', 'map', 'print', 'drafts', '|','autotypeset']],
        });
        ue.ready(function() {
            //ue.setContent("<?php  echo $article['article_content'];?>");
            ue.addListener('contentChange',function(){
                $("#preview-content").html(ue.getContent());
                pagestate = 1;
            });
            $(".itembox").click(function(a) {
                ue.execCommand("insertHtml", "<div>" + $(this).html()+"<p></p>"+ "</div>");
            });
            $(".trash").click(function(){
                if(confirm("确定要清空编辑器？此操作不可恢复。")){
                    ue.setContent("");
                }
            });
            $(document).on("click",".mylink-nav",function(){
                var href = $(this).data("href");
                var id = $("#modal-mylink").attr("data-id");
                if(id){
                    $("input[data-id="+id+"]").val(href);
                    $("#modal-mylink").attr("data-id","");
                }else{
                    ue.execCommand('link', {href:href});
                }
                $("#modal-mylink .close").click();
            });
            $(".mylink-nav2").click(function(){
                var href = $("textarea[name=mylink_href").val();
                if(href){
                    var id = $("#modal-mylink").attr("data-id");
                    if(id){
                        $("input[data-id="+id+"]").val(href);
                        $("#modal-mylink").attr("data-id","");
                    }else{
                        ue.execCommand('link', {href:href});
                    }
                    $("#modal-mylink .close").click();
                    $("textarea[name=mylink_href").val(""); 
                }else{
                    $("textarea[name=mylink_href").focus();
                    alert("链接不能为空!");
                }
            });
        });
// 初始化调用系统上传图片
    UE.registerUI('myinsertimage',function(editor, uiName) {
        editor.registerCommand(uiName, {
            execCommand: function() {
                require(['fileUploader'],
                function(uploader) {
                    uploader.show(function(imgs) {
                        //console.log(imgs);
                        if (imgs.length == 0) {
                            return;
                        } else if (imgs.length == 1) {
                            editor.execCommand('insertimage', {
                                'src': imgs[0]['url'],
                                '_src': imgs[0]['url'],
                                'width': '100%',
                                'alt': imgs[0].filename
                            });
                        } else {
                            var imglist = [];
                            for (i in imgs) {
                                imglist.push({
                                    'src': imgs[i]['url'],
                                    '_src': imgs[i]['url'],
                                    'width': '100%',
                                    'alt': imgs[i].filename
                                });
                            }
                            editor.execCommand('insertimage', imglist);
                        }
                    },
                    opts);
                });
            }
        });
        var btn = new UE.ui.Button({
            name: '插入图片',
            title: '插入图片',
            cssRules: 'background-position: -726px -77px',
            onclick: function() {
                editor.execCommand(uiName);
            }
        });
        editor.addListener('selectionchange',
        function() {
            var state = editor.queryCommandState(uiName);
            if (state == -1) {
                btn.setDisabled(true);
                btn.setChecked(false);
            } else {
                btn.setDisabled(false);
                btn.setChecked(state);
            }
        });
        return btn;
    },
    19);
// 初始化 系统链接选择
    UE.registerUI('mylink', function(editor, uiName) {
        editor.registerCommand(uiName, {
            execCommand: function() {
                $("#modal-mylink").modal();
            }
        });
        var btn = new UE.ui.Button({
            name: '超链接',
            title: '超链接',
            cssRules: 'background-position: -500px 0;',
            onclick: function() {
                editor.execCommand(uiName);
            }
        });
        editor.addListener('selectionchange', function() {
            var state = editor.queryCommandState(uiName);
            if (state == -1) {
                btn.setDisabled(true);
                btn.setChecked(false);
            } else {
                btn.setDisabled(false);
                btn.setChecked(state);
            }
        });
        return btn;
    });
//初始化百度编辑器结束
    // 大选项卡切换
    $(".fart-editor-menu nav").click(function(){
        var step = $(this).attr("step");
        if(!step){
            return;
        }
        $(this).addClass("navon").siblings().removeClass("navon");
        $(".fart-editor-content[step="+step+"]").fadeIn().siblings().hide();
    });
    // 素材选项卡切换
    $(".con2 .tab .nav").click(function(){
        var n = $(this).attr("n");
        $(this).addClass("navon").siblings().removeClass("navon");
        $("#tabcon .con[n="+n+"]").fadeIn().siblings().hide();
    });
    $(".color").change(function(){
        var color = $(this).val();
        $(".itembox .tc").css("color",color);
        $(".itembox .bc").css("background-color",color);
        $(".itembox .bdc").css("border-color",color);
        $(".itembox .blc").css("border-left-color",color);
        $(".itembox .btc").css("border-top-color",color);
        $(".itembox .bbc").css("border-bottom-color",color);
        $(".itembox .brc").css("border-right-color",color);
    });
    // 监听 输入框 change 
    $("input").bind('input propertychange',function(){
        pagestate = 1;
        var bindint = $(this).attr("bind-in");
        var bindinfo = !$(this).val()?$(this).attr("bind-de"):$(this).val();
        if(parseInt(bindinfo) > 100000){
            var bindinfo = '100000+';
        }
        $("*[bind-to="+bindint+"]").text(bindinfo);
    });
    $("select").change(function(){
        pagestate = 1;
    });
    // 监听按钮是否显示商品
    $(".product_advs_type").change(function(){
        check = $(".product_advs_type:checked").val();
        if(check!=0){
            $(".product").show();
        }else{
            $(".product").hide();
        }
    });
    // ajax 选择商品
    $("#select-good-btn").click(function(){
        var kw = $("#select-good-kw").val();
        $.ajax({
            type: 'POST',
            url: "<?php  echo $this->createPluginWebUrl('article',array('method'=>'api','apido'=>'selectgoods'))?>",
            data: {kw:kw},
            dataType:'json',
            success: function(data){
                //console.log(data);
                $("#select-goods").html("");
                if(data){
                    $.each(data,function(n,value){
                        var html = '<div class="good">';
                              html+='<div class="img"><img src="'+value.thumb+'"/></div>'
                              html+='<div class="choosebtn">';
                              html+='<a href="javascript:;" class="mylink-nav" data-href="'+"<?php  echo $this->createMobileUrl('shop/detail')?>&id="+value.id+'">详情链接</a><br>';
                              if(value.hasoption==0){
                                html+='<a href="javascript:;" class="mylink-nav" data-href="'+"<?php  echo $this->createMobileUrl('order/confirm')?>&id="+value.id+'">下单链接</a>';
                              }
                              html+='</div>';
                              html+='<div class="info">';
                              html+='<div class="info-title">'+value.title+'</div>';
                              html+='<div class="info-price">原价:￥'+value.productprice+' 现价￥'+value.marketprice+'</div>';
                              html+='</div>'
                              html+='</div>';
                        $("#select-goods").append(html);
                    }); 
                }
           }
        });
    });
    // ajax 选择文章
    $("#select-article-btn").click(function(){
        var category = $("#select-article-ca option:selected").val();
        var keyword = $("#select-article-kw").val();
        $.ajax({
            type: 'POST',
            url: "<?php  echo $this->createPluginWebUrl('article',array('method'=>'api','apido'=>'selectarticles'))?>",
            data: {category:category,keyword:keyword},
            dataType:'json',
            success: function(data){
                //console.log(data);
                $("#select-articles").html("");
                if(data){
                    $.each(data,function(n,value){
                        var html = '<div class="mylink-line">['+value.category_name+'] '+value.article_title;
                              html+='<div class="mylink-sub">';
                              html+='<a href="javascript:;" class="mylink-nav" data-href="'+"<?php  echo $this->createPluginMobileUrl('article')?>&aid="+value.id+'">选择</a>';
                              html+='</div></div>';
                        $("#select-articles").append(html);
                    });
                }
            }
        });
    }); 
    // 离开页面未保存提示
    $(window).bind('beforeunload',function(){
        if(pagestate==1){
            return '您输入的内容尚未保存，确定离开此页面吗？';
        }
    });
    // 保存页面信息 
    postlock = true;
    $("#nav-save").click(function(){
            var post = true;
            $(".judge").each(function(){
                if(!$(this).val()){ 
                    $("#nav-step-2").click();
                    $(this).css("border","1px solid #f01");
                    $(this).focus();
                    post = false;
                    return post;
                }else{
                    $(this).css("border","1px solid #ccc");
                }
            });
           if($("#select1 option:selected").val()==0){
               post = false;
               $("#select1").css("border","1px solid #f01");
           }else{
               $("#select1").css("border","1px solid #ccc");
           }
            if(post && postlock){
                postlock = false;
                $(this).text('保存中...');
                $(this).css({'background':'#ccc','color':'#eee'});
                var content = ue.getContent();
                var data = $("form").serializeArray();
                var advs = [];
                $("#advs .adv").each(function(){
                    var img = $(this).find(".post-adv-img").val();
                    var link = $(this).find(".post-adv-link").val();
                    advs.push({
                            'img':img,
                            'link':link
                    });
                });
                $.ajax({
                        type: 'POST',
                        url: "<?php  echo $this->createPluginWebUrl('article',array('method'=>'api','apido'=>'save'))?>",
                        data: {
                            data:data,
                            content:content,
                            product_advs_title:$("input[name=product_advs_title]").val(),
                            product_advs_type:$("input[name=product_advs_type]:checked").val(),
                            product_advs_more:$("input[name=product_advs_more]").val(),
                            product_advs_link:$("input[name=product_advs_link]").val(),
                            product_advs:$.toJSON(advs)
                        }, 
                        dataType:'json',
                        success: function(data){
                           //console.log(data);
                           if(data.result=='error'){
                               util.message(data.desc);
                           }
                           else if(data.result=='success'){
                               pagestate = 0;
                               alert("保存成功!");
                               console.log(data.desc);
                               if(data.desc=='insert'){
                                   location.href = "<?php  echo $this->createPluginWebUrl('article',array('op'=>'post'))?>&aid="+data.id;
                               }
                           }
                           else if(data.result=='error-key'){
                               util.message(data.desc);
                               pagestate = 0;
                           }
                           $("#nav-save").text('保存').css({'background':'#6c9','color':'#fff'});
                           postlock = true;
                        }
                });
            }
    });
    $(".nav-imgp").click(function(){
        var id = $(this).data("id");
        var imgurl = $("input[data-id="+id+"]").val();
        if(imgurl){
            $("#imgp").attr("src",imgurl);
            $("#modal-imgp").modal();
        }else{
            alert("您还没选择图片哦！");
        }
    });
    $(document).on("click",".nav-imgc",function(){
        var id = $(this).data("id");
        require(['jquery', 'util'], function($, util){
                    util.image('',function(data){
                        $("input[data-id="+id+"]").val(data.url);
                        $("img[data-id="+id+"]").attr("src",data.url);
                    });
        });
    });
    $(document).on("click",".nav-link",function(){
        var id = $(this).data("id");
        if(id){
            $("#modal-mylink").attr({"data-id":id});
            $("#modal-mylink").modal();
        }
    });
    $(document).on("click",".del",function(){
        $(this).parent().remove();
    });
    $(".addbtn").click(function(){
        var id = new Date().getTime();
        var num = 0;
        $("#advs .adv").each(function(){
            num++;
        });
        if(num<5){
            var html = '<div class="adv">';
                  html+='<div class="del">×</div>';
                  html+='<div class="img"><img src="../addons/ewei_shop/plugin/article/template/imgsrc/nochooseimg.jpg" data-id="PAI-'+id+'" /></div>';
                  html+='<div class="info">';
                  html+='<div class="input-group form-group" style="margin-top:5px; margin-bottom:0px; margin-right:5px;">';
                  html+='<span class="input-group-addon">广告图片</span>';
                  html+='<input type="text" class="form-control post-adv-img" placeholder="推广广告图，可直接输入或者选择系统图片 (请以http://开头)" data-id="PAI-'+id+'">';
                  html+='<span class="input-group-addon btn btn-default nav-imgc" style="background: #fff;" data-id="PAI-'+id+'">选择图片</span>';
                  html+='</div>';
                  html+='<div class="input-group form-group" style="margin-top:10px; margin-bottom:0px; margin-right:5px;">';
                  html+='<span class="input-group-addon">广告链接</span>';
                  html+='<input type="text" class="form-control post-adv-link" placeholder="推广广告链接，可直接输入或者选择系统连接 (请以http://开头，单规格商品可直接下单)" data-id="PAL-'+id+'" >';
                  html+='<span class="input-group-addon btn btn-default nav-link" style="background: #fff;" data-id="PAL-'+id+'">选择链接</span>';
                  html+='</div></div></div>';
                  $("#advs").append(html);
          }else{
              alert("组多添加5张广告图! ");
          }
    });
});
</script>
    <div id="modal-imgp" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                    <h4>图片预览</h4>
                </div>
                <div class="modal-body">
                    <img src="" id="imgp" style="width:100%;" />
                </div>
            </div>
        </div>
    </div>
    <!-- mylink start -->
    <div id="modal-mylink" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="width: 720px;">
            <div class="modal-content">
                <div class="modal-header" style="padding: 5px;">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation" class="active" style="display: block;"><a aria-controls="link_system" role="tab" data-toggle="tab" href="#link_system" aria-expanded="true">系统页面</a></li>
                        <li role="presentation" style="display: block;"><a aria-controls="link_goods" role="tab" data-toggle="tab" href="#link_goods" aria-expanded="false">商品链接</a></li>
                        <li role="presentation" style="display: block;"><a aria-controls="link_cate" role="tab" data-toggle="tab" href="#link_cate" aria-expanded="false">商品分类</a></li>
                        <?php  if(!empty($designer)) { ?>
                            <li role="presentation" style="display: block;"><a aria-controls="link_diy" role="tab" data-toggle="tab" href="#link_diy" aria-expanded="false">DIY页面</a></li>
                        <?php  } ?>
                        <li role="presentation" style="display: block;"><a aria-controls="link_diy" role="tab" data-toggle="tab" href="#link_article" aria-expanded="false">营销文章</a></li>
                        <li role="presentation" style="display: block;"><a aria-controls="link_other" role="tab" data-toggle="tab" href="#link_other" aria-expanded="false">自定义链接</a></li>
                    </ul>	
                </div>
                 <div class="modal-body tab-content">
                     <div role="tabpanel" class="tab-pane link_system active" id="link_system">
                         <div class="mylink-con">
                            <div class="page-header">
                                <h4><i class="fa fa-folder-open-o"></i> 商城页面</h4>
                            </div>
                            <div class="btn btn-default mylink-nav" data-href="<?php  echo $this->createMobileUrl('shop/index')?>">商城首页</div>
                            <div class="btn btn-default mylink-nav" data-href="<?php  echo $this->createMobileUrl('member')?>">个人中心</div>
                            <div class="btn btn-default mylink-nav" data-href="<?php  echo $this->createMobileUrl('plugin/commission')?>">分销中心</div>
                            <div class="btn btn-default mylink-nav" data-href="<?php  echo $this->createMobileUrl('shop/category')?>">分类页面</div>
                            <div class="btn btn-default mylink-nav" data-href="<?php  echo $this->createMobileUrl('shop/list')?>">全部商品</div>
                            <div class="btn btn-default mylink-nav" data-href="<?php  echo $this->createMobileUrl('shop/cart')?>">购物车</div>
                            <div class="btn btn-default mylink-nav" data-href="<?php  echo $this->createMobileUrl('plugin/commission',array('method'=>'myshop'))?>">我的小店</div>
                            <div class="btn btn-default mylink-nav" data-href="<?php  echo $this->createMobileUrl('order')?>">我的订单</div>
                            <div class="page-header">
                                <h4><i class="fa fa-folder-open-o"></i> 其他页面</h4>
                            </div>
                            <p style="line-height: 20px;  padding-left: 20px;">更多功能正在开发...</p>
                        </div>
                     </div>
                     <div role="tabpanel" class="tab-pane link_goods" id="link_goods">
                         <div class="input-group">
                             <input type="text" class="form-control" name="keyword" value="" id="select-good-kw" placeholder="请输入商品名称进行搜索 (多规格商品不支持一键下单)">
                             <span class="input-group-btn"><button type="button" class="btn btn-default" id="select-good-btn">搜索</button></span>
                         </div>
                         <div class="mylink-con" id="select-goods" style="height:266px;"></div>
                     </div>
                     <div role="tabpanel" class="tab-pane link_cate" id="link_cate">
                         <div class="mylink-con">
                             <?php  if(is_array($goodcates)) { foreach($goodcates as $goodcate) { ?>
                                <?php  if(empty($goodcate['parentid'])) { ?>
                                    <div class="mylink-line">
                                        <?php  echo $goodcate['name'];?>
                                        <div class="mylink-sub">
                                            <a href="javascript:;" class="mylink-nav" data-href="<?php  echo $this->createMobileUrl('shop/list',array('pcate'=>$goodcate['id']))?>">选择</a>
                                        </div>
                                    </div>
                                    <?php  if(is_array($goodcates)) { foreach($goodcates as $goodcate2) { ?>
                                        <?php  if($goodcate2['parentid']==$goodcate['id']) { ?>
                                            <div class="mylink-line">
                                                <span style='height:10px; width: 10px; margin-left: 10px; margin-right: 10px; display:inline-block; border-bottom: 1px dashed #ddd; border-left: 1px dashed #ddd;'></span>
                                                <?php  echo $goodcate2['name'];?>
                                                <div class="mylink-sub">
                                                    <a href="javascript:;" class="mylink-nav" data-href="<?php  echo $this->createMobileUrl('shop/list',array('pcate'=>$goodcate['id'],'ccate'=>$goodcate2['id']))?>">选择</a>
                                                </div>
                                            </div>
                                            <?php  if(is_array($goodcates)) { foreach($goodcates as $goodcate3) { ?>
                                                <?php  if($goodcate3['parentid']==$goodcate2['id']) { ?>
                                                    <div class="mylink-line">
                                                        <span style='height:10px; width: 10px; margin-left: 30px; margin-right: 10px; display:inline-block; border-bottom: 1px dashed #ddd; border-left: 1px dashed #ddd;'></span>
                                                        <?php  echo $goodcate3['name'];?>
                                                        <div class="mylink-sub">
                                                            <a href="javascript:;" class="mylink-nav" data-href="<?php  echo $this->createMobileUrl('shop/list',array('pcate'=>$goodcate['id'],'ccate'=>$goodcate2['id'],'tcate'=>$goodcate3['id']))?>">选择</a>
                                                        </div>
                                                    </div>
                                                <?php  } ?>
                                            <?php  } } ?>
                                        <?php  } ?>
                                    <?php  } } ?>
                                <?php  } ?>
                             <?php  } } ?>
                         </div>
                     </div>
                     <?php  if(!empty($designer)) { ?>
                     <div role="tabpanel" class="tab-pane link_cate" id="link_diy">
                         <div class="mylink-con">
                             <?php  if(is_array($diypages)) { foreach($diypages as $diypage) { ?>
                                <div class="mylink-line">
                                    <?php  if($diypage['pagetype']=='4') { ?>
                                        <label class="label label-danger" style="margin-right:5px;">其他</label>
                                    <?php  } else if($diypage['pagetype']=='1') { ?>
                                        <?php  if($diypage['setdefault']==1) { ?>
                                            <label class="label label-success" style="margin-right:5px;">默认首页</label>
                                        <?php  } else { ?>
                                            <label class="label label-primary" style="margin-right:5px;">首页</label>
                                        <?php  } ?>
                                    <?php  } ?>
                                    <?php  echo $diypage['pagename'];?>
                                    <div class="mylink-sub">
                                        <a href="javascript:;" class="mylink-nav" data-href="<?php  echo $this->createPluginMobileUrl('designer',array('pageid'=>$diypage['id']))?>">选择</a>
                                    </div>
                                </div>
                             <?php  } } ?>
                         </div>
                     </div>
                     <?php  } ?>
                     <div role="tabpanel" class="tab-pane link_cate" id="link_article">
                         <div class="input-group">
                             <span class="input-group-addon" style='padding:0px; border: 0px;'>
                                 <select class="form-control tpl-category-parent" name="article_category" id="select-article-ca" style='width: 150px; border-radius: 4px 0px 0px 4px; border-right: 0px;'>
                                     <option value="" selected="selected">全部分类</option>
                                     <?php  if(is_array($categorys)) { foreach($categorys as $category) { ?>
                                        <option value="<?php  echo $category['id'];?>"><?php  echo $category['category_name'];?></option>
                                     <?php  } } ?>
                                 </select>
                             </span>
                             <input type="text" class="form-control" value="" id="select-article-kw" placeholder="请输入文章标题进行搜索">
                             <span class="input-group-btn"><button type="button" class="btn btn-default" id="select-article-btn">搜索</button></span>
                         </div>
                         <div class="mylink-con" style="height:266px;">
                             <div class="mylink-line">
                                 <label class="label label-primary" style="margin-right:5px;">文章列表</label>
                                 <?php  echo $article_sys['article_title'];?>
                                 <div class="mylink-sub">
                                     <a href="javascript:;" class="mylink-nav" data-href="<?php  echo $this->createPluginMobileUrl('article',array('method'=>'article'))?>">选择</a>
                                 </div>
                             </div>
                             <div id="select-articles"></div>
                         </div>
                     </div>
                     <div role="tabpanel" class="tab-pane link_cate" id="link_other">
                         <div class="mylink-con" style="height: 150px;">
                             <div class="form-group" style="overflow: hidden;">
                                 <label class="col-xs-12 col-sm-3 col-md-2 control-label" style="line-height: 34px;">链接地址</label>
                                 <div class="col-sm-9 col-xs-12">
                                     <textarea name="mylink_href" class="form-control" style="height: 90px; resize: none;" placeholder="请以http://开头"></textarea>   
                                 </div>
                             </div>
                             <div class="form-group" style="overflow: hidden; margin-bottom: 0px;i">
                                 <label class="col-xs-12 col-sm-3 col-md-2 control-label" style="line-height: 34px;"></label>
                                 <div class="col-sm-9 col-xs-12">
                                     <div class="btn btn-primary col-lg-1 mylink-nav2" style="margin-left: 20px; width: auto; overflow: hidden; margin-left: 0px;"> 插入 </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </div>
<!-- mylink end -->

<!-- 编辑页面 -->
<div class="fart-main">
    <div class="fart-preview">
        <div class="top"><p bind-to="art_title"><?php  if($aid) { ?><?php  echo $article['article_title'];?><?php  } else { ?>这里是文章标题<?php  } ?></p></div>
        <div class="main">
            <div class="fart-rich-primary">
                <div class="fart-rich-title" bind-to="art_title"><?php  if($aid) { ?><?php  echo $article['article_title'];?><?php  } else { ?>这里是文章标题<?php  } ?></div>
                <div class="fart-rich-mate">
                    <div class="fart-rich-mate-text" bind-to="art_date_v"><?php  if($aid) { ?><?php  echo $article['article_date_v'];?><?php  } else { ?><?php  echo date('Y-m-d');?><?php  } ?></div>
                    <div class="fart-rich-mate-text" bind-to="art_author"><?php  if($aid) { ?><?php  echo $article['article_author'];?><?php  } else { ?>编辑小美<?php  } ?></div>
                    <div class="fart-rich-mate-text href" bind-to="art_mp"><?php  if(empty($article['article_mp'])) { ?><?php  echo $mp['name'];?><?php  } else { ?><?php  echo $article['article_mp'];?><?php  } ?></div>
                </div>
                <div class="fart-rich-content" id="preview-content">
                    <?php  echo htmlspecialchars_decode($article['article_content'])?>
                </div>
                <div class="fart-rich-tool">
                    <div class="fart-rich-tool-text link">阅读原文</div>
                    <div class="fart-rich-tool-text" bind-to="art_read">阅读 <?php  if($aid) { ?><?php  if($article['article_readnum_v']>100000) { ?>100000+<?php  } else { ?><?php  echo $article['article_readnum_v'];?><?php  } ?><?php  } else { ?>100000+<?php  } ?></div>
                    <div class="fart-rich-tool-text">
                        <div class="fart-rich-tool-like"></div>
                        <span bind-to="art_like"><?php  if($aid) { ?><?php  if($article['article_likenum_v']>100000) { ?>100000+<?php  } else { ?><?php  echo $article['article_likenum_v'];?><?php  } ?><?php  } else { ?>54321<?php  } ?></span>
                    </div>
                    <div class="fart-rich-tool-text right">举报</div>
                </div>
            </div>
            <div class="fart-rich-sift product" <?php  if($article['product_advs_type']!=0) { ?>style="display:block;"<?php  } ?>>
                <div class="fart-rich-sift-line">
                    <div class="fart-rich-sift-border"></div>
                    <div class="fart-rich-sift-text"><a bind-to="product_adv_title"><?php  if($aid) { ?><?php  echo $article['product_advs_title'];?><?php  } else { ?>精品推荐<?php  } ?></a></div>
                </div>
                <div class="fart-rich-sift-img"><img src="../addons/ewei_shop/plugin/article/template/imgsrc/img01.jpg"></div>
                <div class="fart-rich-sift-more" bind-to="product_adv_more"><?php  if($aid) { ?><?php  echo $article['product_advs_more'];?><?php  } else { ?>更多精品<?php  } ?></div>
            </div>
        </div>
        <!-- 手机 -->
    </div>
    <div class="fart-editor">
        <div class="fart-editor-menu">
            <nav step="1" class="navon">① 编辑文章内容</nav>
            <nav step="2" id="nav-step-2">② 设置文章及页面信息</nav>
            <nav step="3">③ 设置营销内容</nav>
            <div class="savebtn" id="nav-save">保存</div>
        </div>
        <div id="fart-editor-content">
            <div class="fart-editor-content" step="2">
                <div class="fart-form">
                    <form>
                    <div class="line">
                        <div class="input-group form-group">
                            <span class="input-group-addon">文章标题</span>
                            <input type="hidden" name="id" value="<?php  if($aid) { ?><?php  echo $article['id'];?><?php  } ?>">
                            <input type="text" name="article_title" class="form-control judge" value="<?php  if($aid) { ?><?php  echo $article['article_title'];?><?php  } ?>" placeholder="请填写文章标题 (30个汉字以内)" bind-in="art_title" bind-de="这里是文章标题">
                        </div>
                    </div>
                    <div class="line">
                        <div class="line2" style="margin-right: 10px;">
                            <div class="input-group form-group">
                                <span class="input-group-addon">文章分类</span>
                                <select class="form-control tpl-category-parent" name="article_category" id="select1">
                                    <option value="0">请选择文章分类</option>
                                    <?php  if(is_array($categorys)) { foreach($categorys as $category) { ?>
                                        <option value="<?php  echo $category['id'];?>" <?php  if($article['article_category']==$category['id']) { ?> selected="selected"<?php  } ?>><?php  echo $category['category_name'];?></option>
                                    <?php  } } ?>
                                </select>
                            </div>
                        </div>
                        <div class="line2">
                            <div class="input-group form-group">
                                <span class="input-group-addon">虚拟发布时间</span>
                                <input type="text" name="article_date_v" class="form-control judge" style="padding-left: 12px; " value="<?php  if($aid) { ?><?php  echo $article['article_date_v'];?><?php  } else { ?><?php  echo date('Y-m-d');?><?php  } ?>" placeholder="虚拟发布时间 (格式: <?php  echo date('Y-m-d');?>)" bind-in="art_date_v" bind-de="<?php  echo date('Y-m-d');?>">
                            </div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="line2" style="margin-right: 10px;">
                            <div class="input-group form-group">
                                <span class="input-group-addon">公众号</span>
                                <input type="text" name="article_mp" class="form-control" value="<?php  if($aid) { ?><?php  echo $article['article_mp'];?><?php  } ?>" placeholder="请填公众号名称 (不填则显示当前公众号)" bind-in="art_mp" bind-de="<?php  echo $mp['name'];?>">
                            </div>
                        </div>
                        <div class="line2">
                            <div class="input-group form-group">
                                <span class="input-group-addon">发布作者</span>
                                <input type="text" name="article_author" class="form-control" value="<?php  if($aid) { ?><?php  echo $article['article_author'];?><?php  } ?>" placeholder="请填写发布作者 (不填则不显示)" bind-in="art_author" bind-de="编辑小美">
                            </div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="line2" style="margin-right: 10px;">
                            <div class="input-group form-group">
                                <span class="input-group-addon">虚拟阅读量</span>
                                <input type="number" name="article_readnum_v" class="form-control judge" value="<?php  if($aid) { ?><?php  echo $article['article_readnum_v'];?><?php  } ?>" placeholder="页面阅读量 = 真实阅读量 + 虚拟阅读量" bind-in="art_read" bind-de="100000+">
                            </div>
                        </div>
                        <div class="line2">
                            <div class="input-group form-group">
                                <span class="input-group-addon">虚拟点赞数</span>
                                <input type="number" name="article_likenum_v" class="form-control judge" value="<?php  if($aid) { ?><?php  echo $article['article_likenum_v'];?><?php  } ?>" placeholder="页面点赞数 = 真实点赞数 + 虚拟阅读数" bind-in="art_like" bind-de="54321">
                            </div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="input-group form-group">
                            <span class="input-group-addon">阅读原文链接</span>
                            <input type="text" name="article_linkurl"  class="form-control" value="<?php  if($aid) { ?><?php  echo $article['article_linkurl'];?><?php  } ?>" placeholder="请填写阅读原文指向的链接 (请以http://开头, 不填则不显示)" data-id="PAL-00010">
                            <span class="input-group-addon btn btn-default nav-link" style="background: #fff;" data-id="PAL-00010">选择链接</span>
                        </div>
                    </div>
                    
                    <div class="line">
                        <div class="line2" style="margin-right: 10px;">
                            <div class="input-group form-group">
                                <span class="input-group-addon">奖励规则&nbsp;&nbsp;&nbsp;&nbsp;每人每天奖励</span>
                                <input type="text" name="article_rule_daynum"  class="form-control judge" value="<?php  if($aid) { ?><?php  echo $article['article_rule_daynum'];?><?php  } ?>" placeholder="2">
                                <span class="input-group-addon" style="border-left: 0px; border-right: 0px;">次&nbsp;&nbsp;每人总共奖励</span>
                                <input type="text" name="article_rule_allnum"  class="form-control judge" value="<?php  if($aid) { ?><?php  echo $article['article_rule_allnum'];?><?php  } ?>" placeholder="6">
                                <span class="input-group-addon" style="border-left: 0px;">次</span>
                            </div>
                            <span class='help-block'>奖励规则提示：分享后，好友点击进入后，才算成功分享一次。</span>
                        </div>
                        <div class="line2">
                            <div class="input-group form-group">
                                <span class="input-group-addon" style="border-right: 0px;">每分享1次可获得</span> 
                                <input type="text" name="article_rule_credit"  class="form-control judge" value="<?php  if($aid) { ?><?php  echo $article['article_rule_credit'];?><?php  } ?>" placeholder="10">
                                <span class="input-group-addon" style="border-left: 0px; border-right: 0px;">个积分</span> 
                                <input type="text" name="article_rule_money"  class="form-control judge" value="<?php  if($aid) { ?><?php  echo $article['article_rule_money'];?><?php  } ?>" placeholder="0">
                                <span class="input-group-addon">元余额</span> 
                            </div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="line2" style="margin-right: 10px; width: 500px;">
                            <div class="input-group form-group">
                                <span class="input-group-addon">页面设置</span>
                                <div class="form-control">
                                    <label for="page_set_option2" class="checkbox-inline"><input type="checkbox" name="page_set_option_nocopy" value="1" id="page_set_option2" <?php  if($article['page_set_option_nocopy']=='1') { ?>checked="checked"<?php  } ?>> 禁止复制链接</label>
                                    <label for="page_set_option3" class="checkbox-inline"><input type="checkbox" name="page_set_option_noshare_tl" value="1" id="page_set_option3" <?php  if($article['page_set_option_noshare_tl']=='1') { ?>checked="checked"<?php  } ?>> 禁止分享至朋友圈</label>
                                    <label for="page_set_option1" class="checkbox-inline"><input type="checkbox" name="page_set_option_noshare_msg" value="1" id="page_set_option1" <?php  if($article['page_set_option_noshare_msg']=='1') { ?>checked="checked"<?php  } ?>> 禁止分享给好友</label>
                                </div>
                            </div>
                        </div>
                        <div class="line2" style="width: 410px;">
                            <div class="input-group form-group">
                                <span class="input-group-addon">举报按钮</span>
                                <div class="form-control">
                                    <label for="article_report1" class="radio-inline"><input type="radio" name="article_report" value="1" id="article_report1" <?php  if($article['article_report']==1) { ?>checked="true"<?php  } ?>> 模拟举报(使用有风险)</label>&nbsp;&nbsp;&nbsp;
                                        <label for="article_report0" class="radio-inline"><input type="radio" name="article_report" value="0" id="article_report0" <?php  if($article['article_report']==0) { ?>checked="true"<?php  } ?>> 不显示</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="line2" style="margin-right: 10px;">
                            <div class="input-group form-group">
                                <span class="input-group-addon">页面关键字</span>
                                <input type="text" name="article_keyword" class="form-control judge" value="<?php  if($aid) { ?><?php  echo $article['article_keyword'];?><?php  } ?>" placeholder="页面关键字">
                            </div>
                        </div>
                        <div class="line2">
                            <div class="input-group form-group">
                                <span class="input-group-addon"><span style="color:red">*</span> 是否开启</span>
                                <div class="form-control">&nbsp;
                                        <label for="article_state_1" class="radio-inline"><input type="radio" name="article_state" value="1" id="article_state_1" <?php  if(!$aid || $article['article_state']==1) { ?>checked="true"<?php  } ?>> 开启</label>&nbsp;&nbsp;&nbsp;
                                        <label for="article_state_0" class="radio-inline"><input type="radio" name="article_state" value="0" id="article_state_0" <?php  if($aid && $article['article_state']==0) { ?>checked="true"<?php  } ?>> 关闭(关闭后手机端不显示)</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="input-group form-group"> 
                            <span class="input-group-addon">文章介绍(封面)</span>
                            <input type="text" name="resp_desc" class="form-control" value="<?php  if($aid) { ?><?php  echo $article['resp_desc'];?><?php  } ?>" placeholder="文章介绍(封面 50字以内)">
                        </div>
                    </div>
                    <div class="line">
                        <div class="input-group form-group">
                            <span class="input-group-addon">文章图片(封面)</span>
                            <input type="text" name="resp_img" class="form-control" value="<?php  if($aid) { ?><?php  echo $article['resp_img'];?><?php  } ?>" data-id="resp_img">
                            <span class="input-group-addon btn nav-imgp" style="border-left: 0px; cursor: pointer;" data-id="resp_img">预览图片</span>
                            <span class="input-group-addon btn btn-default nav-imgc" style="background: #fff;" data-id="resp_img">选择图片</span>
                        </div>
                    </div>
                </form>
                </div>
            </div>
            <div class="fart-editor-content" step="1" style="display: block;">
                <div class="menu">
                    <div class="nav1">富文本编辑器
                        <div class=" trash" title="清空编辑器内容"><i class="fa fa-trash-o"></i></div>
                    </div>
                    <div class="nav2">素材库(点击插入)
                        <div class="tip">颜色:</div>
                        <input type="color" class="color" title="设置模板颜色" />
                    </div>
                </div>
                <div class="content">
                    <div class="con1">
                        <script  id="editor" style="width:100%;"> <?php  echo htmlspecialchars_decode($article['article_content'])?></script>
                    </div>
                    <div class="con2">
                        <div class="tab">
                            <div n="1" class="nav navon">标题</div>
                            <div n="2" class="nav">正文</div>
                            <div n="3" class="nav">图文</div>
                            <div n="4" class="nav">关注(图)</div>
                            <div n="5" class="nav">分割(图)</div>
                            <div n="6" class="nav">原文</div>
                            <div n="7" class="nav">其他</div>
                        </div>
                        <div id="tabcon">
                            <div n="1" class="con" style="display: block">
                                <div class="itembox" title=""><section style="margin: 5px auto;white-space: normal;"><section class="btc" style="margin:2em 0 0;padding:.5em 0;max-width:100%;font-family:inherit;font-size:1em;line-height:25px;white-space:normal;background-color:#fff;border-style:solid none none;border-top-width:1px;border-top-color:#f54242;text-decoration:inherit;color:#a6a6a6;box-sizing:border-box!important;word-wrap:break-word!important"><section style="margin:-1.2em 0 0;padding:0;max-width:100%;text-align:center;border:none;line-height:1.4;box-sizing:border-box!important;word-wrap:break-word!important"><span class="bc" style="margin:0;padding:8px 23px;max-width:100%;font-family:inherit;border-top-left-radius:25px;border-top-right-radius:25px;border-bottom-right-radius:25px;border-bottom-left-radius:25px;color:#fff;font-size:1em;text-decoration:inherit;border-color:#70d8ff;background-color:#f54242;box-sizing:border-box!important;word-wrap:break-word!important"><span style="margin:0;padding:0;max-width:100%;line-height:22.4px;text-indent:28px;box-sizing:border-box!important;word-wrap:break-word!important">这里输入标题</span></span></section></section></section></div>
                                <div class="itembox" title=""><section style="margin: 5px auto;white-space: normal;"><section class="bc" style="display:inline-block;float:left;color:#fff;border-color:#acc488;background-color:#059d7f"><section style="display:inline-block;vertical-align:middle;padding:5px 8px;color:inherit"><section style="color:inherit"><strong style="color:inherit"><span style="color:inherit">1</span></strong></section></section></section><section class="blc brc" style="border-left-width:8px;border-right-width:0;border-left-style:solid;border-left-color:#059d7f;border-right-color:#059d7f;display:inline-block;float:left;color:inherit;margin-top:8px;border-bottom-width:8px!important;border-top-width:8px!important;border-top-style:solid!important;border-bottom-style:solid!important;border-top-color:transparent!important;border-bottom-color:transparent!important"></section><section style="padding-left:40px;padding-top:2px"><span style="color:inherit;font-size:16px">请输入标题</span></section></section></div>
                                <div class="itembox" title=""><section style="margin: 5px auto;white-space: normal;"><section style="margin:0;padding:0;max-width:100%;box-sizing:border-box;color:#3e3e3e;font-size:16px;line-height:25px;white-space:normal;display:inline-block;background-color:#fefefe;word-wrap:break-word!important"><p style="margin-top:0;margin-right:10px;margin-bottom:0;padding:0;max-width:100%;clear:both;min-height:1em;white-space:pre-wrap;box-sizing:border-box!important;word-wrap:break-word!important"><span style="margin:0;padding:0;max-width:100%;color:#7f7f7f;box-sizing:border-box!important;word-wrap:break-word!important">这里是标题</span></p></section><section style="margin:-12px 0 30px;padding:0;max-width:100%;box-sizing:border-box;font-size:16px;line-height:25px;white-space:normal;height:2px;width:506px;color:#fff;background-color:#ff8124;word-wrap:break-word!important" class="bc"></section></section></div>
                                <div class="itembox" title="水滴编号标题"><section><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight:bold;font-size:16px;line-height:28px;  max-width: 100%;color:rgb(0, 112, 192); min-height: 32px;border-bottom: 2px solid rgb(0, 112, 192); text-align: justify;" class="bdc"><span style="background-color:rgb(0, 112, 192); border-radius:80% 100% 90% 20%; color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" placeholder="1" class="bc" title="">1</span><strong class="tc">第一标题</strong></h2></section></div>
                                <div class="itembox" title="右尖角标题"><section><section style="max-width: 100%;margin: 0.8em 0px 0.5em; overflow: hidden; "><section data-brushtype="text" placeholder="请输入标题" style="box-sizing: border-box !important;  height:36px;display: inline-block;color: #FFF; font-size: 16px;font-weight:bold; padding:0 10px;line-height: 36px;float: left; vertical-align: top; background-color: rgb(249, 110, 87); " class="bc">请输入标题</section><section style="box-sizing: border-box !important; display: inline-block;height:36px; vertical-align: top; border-left-width: 9px; border-left-style: solid; border-left-color: rgb(249, 110, 87); border-top-width: 18px !important; border-top-style: solid !important; border-top-color: transparent !important; border-bottom-width: 18px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important;" class="blc"></section></section></section></div>
                                <div class="itembox" title="圆形编号标题"><section><section style="margin: 0.8em 0 0.5em 0;font-size: 16px;line-height: 32px; font-weight: bold;"><section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; background-color: rgb(72, 192, 163); border-color: rgb(72, 192, 163);" class="bc"><section style="display: table; width: 100%; color: inherit; border-color: rgb(72, 192, 163);"><section style="display: table-cell;text-indent: 0; vertical-align: middle; font-style: normal; color: rgb(255, 255, 255); border-color: rgb(72, 192, 163);">1</section></section></section><section data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(72, 192, 163); border-color: rgb(72, 192, 163);" class="tc">请输入标题</section></section></section></div>
                                <div class="itembox" title="牙刷标题"><section><section style="clear: both; padding: 0px; border: 0px none; margin:5px 0px;"><section style="border-top-width: 2.5px; border-top-style: solid; border-color: rgb(235, 103, 148); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); box-sizing: border-box;" class="bdc"><section style="border: 0px rgb(235, 103, 148); margin: 2px 0px 0px; overflow: hidden; padding: 0px; color: inherit;"><section style="display: inline-block; font-size: 1em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: inherit; border-color: rgb(235, 103, 148); background-color: transparent;"><section style="display: inline-block; line-height: 1.4em; padding: 5px 10px; height: 32px; vertical-align: top; font-size: 16px; font-family: inherit; font-weight: bold; float: left; color: inherit; box-sizing: border-box !important; border-color: rgb(229, 58, 116); background: rgb(235, 103, 148);" class="bc">请输入标题</section><section style="display: inline-block; vertical-align: top; font-size: 16px; width: 0px; height: 0px; border-top-width: 32px; border-top-style: solid; border-top-color: rgb(235, 103, 148); border-right-width: 32px; border-right-style: solid; border-right-color: transparent; border-top-right-radius: 4px; border-bottom-left-radius: 2px; box-sizing: border-box !important; color: inherit;" class="btc"></section></section></section></section></section></section></div>
                                <div class="itembox" title="斜线编号标题"><section><section style="margin: 0.8em 0 0.5em 0;font-size: 16px;line-height: 32px; font-weight: bold;"><section style="display: inline-block; float: left; min-width: 32px; height: 32px; vertical-align: top; text-align: center; "><section style="display: table; width: 100%; color: inherit; border-color: rgb(72, 192, 163);"><section style="display: table-cell;text-indent: 0; vertical-align: middle; font-style: normal; color: rgb(255, 255, 255); border-color: rgb(72, 192, 163);"><span style="color:rgb(198,198,199); font-size:50px" class="tc">1</span></section><section style="width: 10px; height: 70px;margin-left: -6px; margin-top:5px;border-left:1px solid rgb(198,198,199);background-color: rgb(254,254,254); box-sizing: border-box;-webkit-transform: rotate(35deg);transform: rotate(35deg);" class="blc"></section></section></section><section style="margin-left: 40px;padding-top:18px; font-style:normal;font-size:30px; color: #737373; border-color: rgb(72, 192, 163);"><span data-brushtype="text" style="color:#737373; font-size:20px" class="tc">请输入标题</span></section></section></section></div>
                                <div class="itembox" title="普通竖线标题"><section><h2 placeholder="请输入标题" style="border-left:5px solid #666765;font-size: 16px;font-weight:bold; line-height: 32px;color:#666;padding: 5px 10px; margin: 10px 0px;" class="blc tc">请输入标题</h2></section></div>
                                <div class="itembox" title="一行短标题"><section><section style="margin: 2px 0.8em 1em 0; text-align: center; font-size: 1em; vertical-align: middle; white-space: nowrap;"><section style="height: 0px; white-space: nowrap; /* margin: 0px 1em; */ border-top: 1.5em solid rgb(71, 193, 168); border-bottom: 1.5em solid rgb(71, 193, 168); border-left-width: 1.5em ! important; border-left-style: solid ! important; border-right-width: 1.5em ! important; border-right-style: solid ! important; border-color: rgb(71, 193, 168);" class="bdc"></section><section style="height: 0; white-space: nowrap; margin: -2.75em 1.65em;border-top: 1.3em solid #ffffff;border-bottom: 1.3em solid #ffffff;border-left: 1.3em solid transparent;border-right: 1.3em solid transparent;"></section><section style="height: 0px; white-space: nowrap; margin: 0.45em 2.1em; vertical-align: middle; border-top: 1.1em solid rgb(71, 193, 168); border-bottom: 1.1em solid rgb(71, 193, 168); border-left-width: 1.1em ! important; border-left-style: solid ! important; border-right-width: 1.1em ! important; border-right-style: solid ! important; border-color: rgb(71, 193, 168);" class="bdc"><section data-ct="fix" placeholder="一行短标题" style="max-height: 1em; padding: 0px; margin-top: -0.5em; color: rgb(254, 255, 253); font-size: 1.2em; line-height: 1em; white-space: nowrap; overflow: hidden; font-style: normal;">一行短标题</section></section></section></section></div>
                                <div class="itembox" title="圆圈编号标题"><section><section style="margin: 0.5em 0px 0px; padding: 0px; max-width: 100%; box-sizing: border-box; min-width: 0px; color: rgb(62, 62, 62); font-size: 15px; line-height: 24px; border: none; word-wrap: break-word !important; "><section><section style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; display: inline-block; vertical-align: top; height: 1.8em; width: 1.8em; border-radius: 50%; border: 3px solid rgb(142, 201, 101); font-size: 1.6em; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(142, 201, 101); word-wrap: break-word !important;background: #FeFeFe;" class="bdc"><section style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; line-height: 1.6em; word-wrap: break-word !important;" class="tc">1</section></section></section><section style="margin: -1.56em 0px 1em 0.5em; padding: 0px;float: left; border-radius: 1em; font-size: 1.2em; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(142, 201, 101); word-wrap: break-word !important; background-color: rgb(142, 201, 101);z-index: -1;" class="bc"><span data-brushtype="text" style="box-sizing:border-box; display:inline-block; float:left; font-family:inherit; line-height:1.6em; margin:0px 5px; max-width:100%; padding:0px 10px 0px 2em; vertical-align:top; word-wrap:break-word !important">请输入标题</span></section></section></section></div>
                                <div class="itembox" title="方块编号标题"><section><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(89, 195, 249); min-height: 32px; border-bottom-width: 1.5px; border-bottom-style: solid; border-color: rgb(89, 195, 249); text-align: justify;" class="bdc"><span style="background-color:rgb(89, 195, 249); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" class="bc">1</span><strong style="border-color:rgb(89, 195, 249);" class="tc">请输入标题</strong></h2></section></div>
                                <div class="itembox" title="肆意青春样式"><section><section style="margin: 0.5em 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); font-size: medium; line-height: 25px; white-space: normal; border: none rgb(255, 175, 205); word-wrap: break-word !important; text-align: right;"><section style="margin: 0px; padding: 1.5em 0px; max-width: 100%; box-sizing: border-box; width: 12.5em; height: 9.3em;  text-align: center; color: rgb(175, 0, 66); word-wrap: break-word !important; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjxFuq93OVYKgv5yURhwD85BtS4pLH7HgotCCMjVpdp5fGoyeWUHb5ILcC7KJme6f4A3d1eia7xypA/0); background-color: rgb(255, 175, 205); background-size: cover;display:inline-block" class="bc"><section data-width="160px" style="margin: 0px 0px 0px 20px; padding: 0px; max-width: 100%; box-sizing: border-box; width: 160px; overflow: hidden; -webkit-transform: rotate(-13deg); font-size: 22px;  font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); word-wrap: break-word !important;"><section style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">肆意</section></section><section data-width="150px" style="margin: 10px 20px; padding: 0px; max-width: 100%; box-sizing: border-box; width: 150px; overflow: hidden; -webkit-transform: rotate(-15deg);transform: rotate(-15deg); font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); word-wrap: break-word !important;"><section style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><p>青春，背景色你的地盘你做主</p></section></section></section></section></section></div>
                                <div class="itembox" title="悬挂式标题"><section><section style="clear: both; padding: 0px; border: 0px none; margin: 1em 0px 0.5em;"><section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(142, 201, 101); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); box-sizing: border-box;" class="bdc"><section style="padding: 0px 0.5em; background-color: rgb(142, 201, 101); display: inline-block; font-size: 16px;" class="bc">请输入标题</section></section></section></section></div>
                                <div class="itembox" title="引导关注标题"><section><section style="border: none; margin: 0.8em 0px 0.3em; box-sizing: border-box; padding: 0px;"><section style="text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(0, 112, 192); box-sizing: border-box;"><section style="width: 0px; margin: 0px 0px 0px 90px; border-bottom-width: 0.8em; border-bottom-style: solid; border-bottom-color: rgb(0, 112, 192); border-top-color: rgb(0, 112, 192); box-sizing: border-box; height: 10px; border-left-width: 0.8em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 0.8em !important; border-right-style: solid !important; border-right-color: transparent !important; color: inherit;" class="bbc"></section><section style="padding: 0.5em; line-height: 1.2em; font-size: 1em; box-sizing: border-box; color: inherit; border-color: rgb(61, 161, 233); background-color: rgb(0, 112, 192);border-radius: 4px;" class="bc"><strong style="color:inherit">点击标题下「蓝色微信名」可快速关注</strong></section></section></section></section></div>
                                <div class="itembox" title="引导关注标题"><section><section style="max-width: 100%; color: rgb(62, 62, 62); margin: 0px; border-radius: 2em; height: 2.5em;line-height: 2.5em; color: rgb(255, 255, 255);  font-size:14px; word-wrap: break-word !important; box-sizing: border-box !important; background-color: rgb(189, 221, 34);" class="bc"><img src="https://mmbiz.qlogo.cn/mmbiz/yqVAqoZvDibEaicDyIvX7dLE9icYnwb2tlOWcD2BP99V6iaCfkk81RZlQARicbNr7amQ7a0Lc3tFgpNJNEVaY188ZVQ/0?wx_fmt=png" style="border:0px rgb(189, 221, 34); box-sizing:border-box !important; float:left; height:auto !important; margin:3px 10px; vertical-align:top; visibility:visible !important; width:auto !important; word-wrap:break-word !important"><p style="max-width: 100%; color: inherit; display: inline-block; font-size:16px; ">关注一下又不会怀孕！</p></section></section></div>
                                <div class="itembox" title=""><fieldset style="border: 0px; margin: 1em 0px; "><span style="float: left; padding-right: 0.1em; font-size: 2.7em; line-height: 1em; font-family: inherit; text-align: inherit; text-decoration: inherit; color: rgb(0, 187, 236);" class="tc">请</span>这里输入文字内容... 在线微信内容编辑器</fieldset></div>
                                <div class="itembox" title=""><blockquote class="blc" style="margin:0;max-width: 100%; word-wrap: break-word; padding: 15px 25px; top: 0px; line-height: 24px; font-size: 14px; vertical-align: baseline; border-left-color: #00BBEC; border-left-width: 10px; border-left-style: solid; display: block; background-color: #efefef;"><p >可在这输入内容， 文章编辑器，微信编辑首选。</p></blockquote></div>
                                <div class="itembox" title=""><section style="margin: 5px auto;white-space: normal;"><section style="border:0 none;padding:0;box-sizing:border-box;margin:0;font-size:16px;font-family:微软雅黑"><section class="btc" style="margin-top:2em;padding:.5em 0;white-space:normal;border-style:solid none none;border-top-width:1px;border-top-color:#00bbec;font-size:1em;font-family:inherit;text-decoration:inherit;color:#a6a6a6;box-sizing:border-box"><section style="margin-top:-1.2em;text-align:center;padding:0;border:none;line-height:1.4;box-sizing:border-box"><span class="bc" style="background-color:#00bbec;border-color:#00bbec;color:#fff;font-family:inherit;font-size:1em;padding:8px 23px;text-decoration:inherit">标题</span></section></section></section></section></div>
                                <div class="itembox" title=""><section style="margin: 5px auto;white-space: normal;"><section style="border:0 none;padding:0;box-sizing:border-box;margin:0;font-size:16px;font-family:微软雅黑"><section style="border:0;box-sizing:border-box;width:100%;clear:both;padding:0;margin:0" data-width="100%"><section style="box-sizing:border-box;float:left;padding:0 .1em 0 0;color:inherit;margin:0"><section class="bc" style="width:5em;height:5em;text-align:center;padding:12px 5px;color:#fff;border-color:#00bbec;background-color:#00bbec;box-sizing:border-box;margin:0" data-width="5em"><p style="color:inherit;white-space:normal">2015年<span style="color:inherit;line-height:1.6em">7月10日</span></p></section></section><section style="display:inline-block;width:75%;box-sizing:border-box;float:left;padding:0 .5em;color:inherit;margin:0" data-width="75%"><section class="bbc" style="border-bottom-width:2px;border-bottom-style:solid;border-bottom-color:#00bbec;padding:5px;margin:5px 0 0;color:inherit;box-sizing:border-box"><p class="yead2" style="margin-right:.5px;color:#00bbec;border-color:#00bbec;white-space:normal"><span class="bdc" style="border-color:#00bbec;color:#000;font-family:微软雅黑,microsoft yahei;font-size:18px">我是标题</span></p></section><p class="bdc" style="padding:5px;color:#00bbec;line-height:1.5em;border-color:#00bbec;white-space:normal"><span style="color:#000;font-family:微软雅黑,microsoft yahei;font-size:15px">我是副标题</span></p></section></section><section style="width:0;height:0;clear:both;box-sizing:border-box;padding:0;margin:0"></section></section></section></div>
                                <div class="itembox" title="阴影方形标题"><section style="margin: 5px auto;white-space: normal;"><section style="border:0 none;padding:0;box-sizing:border-box;margin:10px 0;font-size:15px;font-family:微软雅黑"><section class="bc" style="margin-top:0;margin-bottom:0;padding:10px;max-width:100%;line-height:2em;word-wrap:break-word;word-break:normal;text-align:center;background-color:#499ef3;box-sizing:border-box"><span style="color:#fff">请输入标题</span></section><p style="margin-top:0;white-space:normal"><img src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0007.jpg" style="height:auto!important;width:100%"></p><section style="width:0;height:0;clear:both;box-sizing:border-box;padding:0;margin:0"></section></section></section></div>
                                <div class="itembox" title="倒影文字标题"><section style="margin: 5px auto;white-space: normal;"><section style="border: 0px none; padding: 0px; box-sizing: border-box; margin: 0px; font-family: 微软雅黑;"><section style="-webkit-box-reflect: below 0px -webkit-gradient(linear, 0% 0%, 0% 100%, from(transparent), color-stop(0.2, transparent), to(rgba(250, 250, 250, 0.298039))); margin-top: 15px; line-height: 20px; box-sizing: border-box; padding: 0px;"><p style="text-align: center; color: inherit; box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 0px;"><span class="tc" style="color: rgb(0,187,236);"><strong class="tc" style="color: inherit; font-size: 30px; border-color: rgb(216, 40, 33); box-sizing: border-box; padding: 0px; margin: 0px;">文字倒影效果样式</strong></span></p></section></section></section></div>
                                <div class="itembox" title="下划线文字标题"><section style="margin: 5px auto;white-space: normal;"><h2 style="font-family: 微软雅黑, 宋体, tahoma, arial; margin: 8px 0px 0px; padding: 0px; font-size: 12px; font-weight: normal; white-space: normal; border:0; height: 32px; line-height: 18px;"><span class="bbc tc" style="font-family: 微软雅黑, sans-serif !important; font-size: 14px; color: #00BBEC; display: block; float: left; padding: 0px 2px 3px; line-height: 28px; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #00BBEC; font-weight: bold;">这可输入标题</span></h2></section></div>
                               <div class="itembox" title="下划线文字标题"><section style="margin: 5px auto;white-space: normal;"><h2 style="font-family: 微软雅黑, 宋体, tahoma, arial; margin: 8px 0px 0px; padding: 0px; font-size: 12px; font-weight: normal; white-space: normal; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(227, 227, 227); height: 32px; line-height: 18px;"><span class="tc bbc" style="font-family: 微软雅黑, sans-serif !important; font-size: 14px; color: #00BBEC; display: block; float: left; padding: 0px 2px 3px; line-height: 28px; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #00BBEC; font-weight: bold;">这可输入标题</span></h2></div>
                                <div class="itembox" title="方形背景标题"><p style="margin: 0px; padding: 0px; color: rgb(255, 255, 255); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: pre-wrap; word-wrap: break-word !important; min-height: 1.5em; max-width: 100%; font-size-adjust: none; font-stretch: normal; -webkit-text-stroke-width: 0px;"><strong><span class="bc" style="padding: 4px 10px; color: rgb(255, 255, 255); font-family: 微软雅黑,Microsoft YaHei; margin-right: 8px; word-wrap: break-word !important; max-width: 100%; background-color:#00BBEC;">这可输入标题</span></strong></p></section></div>
                                <div class="itembox" title="圆角北京标题"><p style="margin: 0px; padding: 0px; color: rgb(255, 255, 255); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: pre-wrap; word-wrap: break-word !important; min-height: 1.5em; max-width: 100%; font-size-adjust: none; font-stretch: normal; -webkit-text-stroke-width: 0px;"><strong><span class="bc" style="padding: 4px 10px; color: rgb(255, 255, 255); font-family: 微软雅黑,Microsoft YaHei; margin-right: 8px; word-wrap: break-word !important; max-width: 100%; background-color:#00BBEC; border-radius:8px;">这可输入标题</span></strong></p></section></div>
                                <p style="text-align:center; line-height:30px; color:#999;">没有更多啦...</p>
                            </div>
                            <div n="2" class="con">
                                <div class="itembox" title="边框阴影内容区域"><section><section style="margin: 3px; padding: 15px;color: rgb(62, 62, 62); line-height: 24px;box-shadow: rgb(170, 170, 170) 0px 0px 3px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-box-shadow: rgb(170, 170, 170) 0px 0px 3px;"><p>边框阴影内容区域</p></section><section style="display: block; width: 0; height: 0; clear: both;"></section></section></div>
                                <div class="itembox" title="左侧编号内容样式"><section><section style="color: inherit; font-size: 16px; padding: 5px 10px 0px 35px; margin-left: 27px; border-left-width: 2px; border-left-style: dotted; border-left-color: rgb(228, 228, 228);"><section style="width: 32px; height: 32px; margin-left: -53px; margin-top: 23px; color: rgb(255, 255, 255); text-align: center; line-height: 32px; border-top-left-radius: 16px; border-top-right-radius: 16px; border-bottom-right-radius: 16px; border-bottom-left-radius: 16px; background: rgb(14, 184, 58);" class="bc">1</section><section style="margin-top: -30px;padding-bottom: 10px; color: inherit;"><p style="clear: both; line-height: 1.5em; font-size: 14px; color: inherit;"><span style="color:inherit; font-size:16px"><strong style="color:inherit">如何进入【XXXX商城】？</strong></span></p><p style="clear: both; line-height: 1.5em; font-size: 14px; color: inherit;">网页搜索“XXXX商城”，点击第一条搜索结果即可进入编辑器页面</p></section></section></section></div>
                                <div class="itembox" title="边框样式"><section><section style="width:92px;margin-bottom:0px;"><p style="text-align: center; color: inherit; line-height: 2em;"><span style="border-color:rgb(255, 129, 36); color:rgb(255, 129, 36); font-size:16px" class="tc"><strong style="border-color:rgb(255, 129, 36); color:inherit">文章编辑器</strong></span></p></section><section style="margin-top: 0px; padding: 0px 5px; line-height: 10px; color: inherit; border: 1px solid rgb(255, 129, 36);" class="bdc"><section style="padding: 0px; font-size: 16px; color: inherit; height: 8px; margin: -8px 0px 0px 140px; width: 50%; background-color: rgb(254, 254, 254);"><section style="width: 8px; height: 8px; border-radius: 100%; line-height: 1; box-sizing: border-box; font-size: 18px; text-decoration: inherit; border-color: rgb(255, 129, 36); display: inline-block; margin: 0px; color: inherit; background-color: rgb(255, 129, 36);" class="bc"></section></section><section style="padding: 0px; line-height: 2em; color: rgb(62, 62, 62); font-size: 14px; margin: 15px;"><p style="color: inherit;"><span style="font-size:14px">文章编辑器编辑器是一个在线图文编辑工具，大量节省您排版的时间，让工作更轻松高效。</span></p></section><section style="padding: 0px; background-color: rgb(254, 254, 254); font-size: 16px; color: inherit; text-align: right; height: 10px; margin: 0px 0px -4px 25px; width: 65%;"><section style="margin: 0px auto 1px; border-radius: 100%; line-height: 1; box-sizing: border-box; text-decoration: inherit; background-color: rgb(255, 129, 36); border-color: rgb(255, 129, 36); display: inline-block; height: 8px; width: 8px; color: inherit;" class="bc"></section></section></section></section></div>
                                <div class="itembox" title="斜标题介绍"><section><section style="margin: 1.5em 1em 1em; padding: 0px; border: 0px rgb(255, 179, 167); border-image-source: none; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); font-size: 16px; line-height: 25px; word-wrap: break-word !important;display:inline-block;"><section style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box; line-height: 1.4; margin-left: -0.5em;"><section style="max-width: 100%; box-sizing: border-box; border-color: rgb(0, 0, 0); padding: 3px 8px; border-radius: 4px;color: rgb(167, 23, 0); font-size: 1em;display: inline-block; -webkit-transform: rotateZ(-10deg);transform: rotate(-10deg);transform-origin: left center 0; -webkit-transform-origin: 0% 100%; word-wrap: break-word !important; background-color: rgb(255, 179, 167);" class="bc"><span style="color:rgb(255, 255, 255)">文章编辑器</span></section></section><section font-size:14px" style="max-width: 100%; box-sizing: border-box; padding: 22px 16px 16px; border: 1px solid rgb(255, 179, 167);color: rgb(0, 0, 0); font-size: 14px;margin-top: -24px;" class="bdc"><p style="line-height:24px;"><span style="color:rgb(89, 89, 89); font-size:14px">文章编辑器提供非常好用的微信图文编辑器。可以随心所欲的变换颜色调整格式，更有神奇的自动配色方案。</span></p></section></section></section></div>
                                <div class="itembox" title="内容介绍"><section><blockquote style="margin: 3px; padding: 10px 15px; border-width: 3px; border-color: rgb(107, 77, 64); border-top-left-radius: 50px; border-bottom-right-radius: 50px; box-shadow: rgb(165, 165, 165) 5px 5px 2px; background-color: rgb(250, 250, 250);" class="bdc"><section><p style="margin-top: 15px; margin-bottom: 0px; padding: 0px; color: rgb(107, 77, 64); line-height: 2em; font-size: 20px; border-color: rgb(107, 77, 64);"><span style="font-size:18px" class="tc"><strong style="border-color:rgb(107, 77, 64); color:inherit">读而思</strong></span></p></section><p style="margin-top: -10px; margin-bottom: 0px; padding: 0px; line-height: 2em; min-height: 1.5em; color: inherit;"><span style="font-size:12px"><strong style="background-color:rgb(107, 77, 64); border-bottom-left-radius:20px; border-bottom-right-radius:20px; color:rgb(255, 255, 255); font-size:13px; padding:0px 15px" class="bc">duersi</strong></span></p><section><p><span style="font-size:14px">编辑完成后，进入第三步即可保存或预览(不要忘记设置页面信息哦)。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; font-size: 16px; min-height: 1.5em; color: inherit;"><br></p></section></blockquote></section></div>
                                <div class="itembox" title="通知公告"><section><section style=" padding: 5px; border: 1px solid rgb(204, 204, 204); max-width: 100%; color: rgb(62, 62, 62); line-height: 24px; text-align: justify; box-shadow: rgb(165, 165, 165) 5px 5px 2px; background-color: rgb(250, 250, 250);margin-top: 20px;"><section style=" padding: 0px;  text-align: left;margin-left: 20px;width: auto;border:none;margin-top: -15px;"><strong><strong style="background-color:rgb(255, 255, 245); color:rgb(102, 102, 102); line-height:20px"><span style="background-color:rgb(255,0,0); border-bottom-left-radius:1em; border-bottom-right-radius:0.2em; border-top-left-radius:0.2em; border-top-right-radius:1em; box-shadow:rgb(165, 165, 165) 4px 4px 2px; color:white; max-width:100%; padding:4px 10px; text-align:justify" class="bc">公告通知</span></strong></strong></section><section><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; min-height: 1.5em; line-height: 2em;"><span style="font-size:14px">各位小伙伴们，微信图文美化编辑器正式上线了，欢迎大家多使用多提供反馈意见。使用<span style="color:inherit"><strong>谷歌与火狐浏览器</strong></span>，可获得与手机端一致的显示效果。ie内核的低版本浏览器可能有不兼容的情况</span></p></section></section><section style="display: block; width: 0; height: 0; clear: both;"></section></section></div>
                                <div class="itembox" title="外宽内窄边框标题"><section ><section style="border: 3px solid rgb(255, 129, 36); padding: 5px;" class="bdc"><section style="border: 1px solid rgb(255, 158, 87); padding: 15px; text-align: center; color: inherit;" class="bdc"><p style="color: inherit;font-size: 12px;"><span style="font-family:arial">XXXX商城</span></p><p style="color:inherit;"><strong style="color:inherit"><span style="color:inherit; font-size:16px">服务好，插件多，牛！</span></strong></p></section></section></section></div>
                                <div class="itembox" title="边框样式"><section><section style="border:none;margin:0.8em 5% 0.3em;"><section style="color: #FF6450;font-size: 20px;letter-spacing: 3px;padding: 9px 4px 14px 4px;text-align: center;margin: 0 auto;border:4px solid #FF6450;-webkit-border-radius: 8px;border-radius: 8px;" class="bdc tc">理念<span style="display:block; font-size:10px; line-height:12px">PHILOSOPHY</span></section><section style="width: 0px; margin-right: auto; margin-left: auto; border-top-width: 0.6em; border-top-style: solid; border-bottom-color: #FF6450; border-top-color:#FF6450; height: 10px; border-left-width: 0.7em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 0.7em !important; border-right-style: solid !important; border-right-color: transparent !important;" class="btc"></section></section></section></div>
                                <div class="itembox" title="分号引用区域"><section><section style="font-size: 14px; line-height: 22.39px;margin: 10px 0px; padding:15px 20px 15px 45px; outline: 0px; border: 0px currentcolor; color: rgb(62, 62, 62); vertical-align: baseline; background-image: url(http://img1.wx135.com/img/bg/left_quote.jpg); background-color: rgb(241, 241, 241); background-position: 1% 5px; background-repeat: no-repeat no-repeat;"><p style="text-align:left;">这里插入分号引用样式的内容。</p></section></section></div>
                                <div class="itembox" title="线框样式"><section><section style="width:100%;text-align:center;"><section style="width: 100%; background-color: rgb(255, 255, 255); padding: 0px; border-top-width: 2px; border-top-style: solid; border-top-color: rgb(172, 29, 16); border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: rgb(172, 29, 16); color: inherit; font-size: 14px; margin: 15px 0px; display: inline-block; " class="bdc"><section style="padding: 30px; margin: -15px 15px; border-right-width: 2px; border-right-style: solid; border-right-color: rgb(172, 29, 16); border-left-width: 2px; border-left-style: solid; border-left-color: rgb(172, 29, 16); color: inherit; " class="bdc"><p style="line-height: 24px; text-align: center; color: rgb(172, 29, 16); border-color: rgb(172, 29, 16); "><span style="color:rgb(12, 12, 12); font-size:16px"><strong style="color:inherit">请输入内容</strong></span></p></section></section></section></section></div>
                                <div class="itembox" title="折角正文样式"><section><section style="border: 0px; margin: 5px 0px; box-sizing: border-box; padding: 0px;"><section style="height: 25px; box-sizing: border-box; color: inherit;"><section style="height: 100%; width: 50px; float: left; border-top-width: 2px; border-top-style: solid; border-color: rgb(172, 29, 16); border-left-width: 2px; border-left-style: solid; box-sizing: border-box; color: inherit;" class="bdc"></section><section style="display: inline-block; color: rgb(172, 29, 16); clear: both; box-sizing: border-box; border-color: rgb(172, 29, 16);"></section></section><section style="margin: -0.8em 0.3em; padding: 0.8em; box-sizing: border-box; color: inherit;"><p style="color: rgb(51, 51, 51); font-size: 1em; line-height: 1.75em; word-break: break-all; word-wrap: break-word; text-align: justify;"><span style="font-family:微软雅黑"><span style="color:rgb(0, 0, 0); font-size:14px">文章编辑器是一个微信文章美化工具，操作简单方便，旨在提供丰富的样式，精美的模板。编辑文章时，就像拼积木一样，挑选样式，调整文字，搭配颜色，最后形成排版优质的文章，让读者更赏心悦目。</span></span></p></section><section style="height: 25px; box-sizing: border-box; color: inherit;"><section style="height: 100%; width: 50px; float: right; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(172, 29, 16); border-right-width: 2px; border-right-style: solid; box-sizing: border-box; color: inherit;" class="bdc"></section></section></section></section></div>
                                <div class="itembox" title="线框"><section><section style="margin: 10px 0px; padding: 0px; line-height: 10px; color: inherit; border: 1px solid rgb(89, 195, 249);display:inline-block;width:100%;" class="bdc"><section style="padding: 0px; font-size: 16px; color: inherit; height: 8px; margin: -8px 0px; "><section style="margin: 0px auto -2px -4px; border-top-left-radius: 100%; border-top-right-radius: 100%; border-bottom-right-radius: 100%; border-bottom-left-radius: 100%; line-height: 1; box-sizing: border-box; text-decoration: inherit; background-color: rgb(89, 195, 249); border-color: rgb(89, 195, 249); display: inline-block; height: 8px; width: 8px; color: rgb(255, 255, 255); " class="bc"></section><section style="margin: 4px -4px -4px; border-top-left-radius: 100%; border-top-right-radius: 100%; border-bottom-right-radius: 100%; border-bottom-left-radius: 100%; line-height: 1; box-sizing: border-box; text-decoration: inherit; background-color: rgb(89, 195, 249); border-color: rgb(89, 195, 249); display: inline-block; height: 8px; width: 8px; color: rgb(255, 255, 255); float: right; " class="bc"></section><section style="padding: 5px; line-height: 2em; color: rgb(62, 62, 62); font-size: 14px; margin: 10px;display: block;"><p style="color: inherit; text-align: center; ">点与线的简单结合</p></section><section style="margin: 0px auto -2px -4px; border-top-left-radius: 100%; border-top-right-radius: 100%; border-bottom-right-radius: 100%; border-bottom-left-radius: 100%; line-height: 1; box-sizing: border-box; text-decoration: inherit; background-color: rgb(89, 195, 249); border-color: rgb(89, 195, 249); display: inline-block; height: 8px; width: 8px; color: rgb(255, 255, 255); " class="bc"></section><section style="margin: 6px -4px -4px; border-top-left-radius: 100%; border-top-right-radius: 100%; border-bottom-right-radius: 100%; border-bottom-left-radius: 100%; line-height: 1; box-sizing: border-box; text-decoration: inherit; background-color: rgb(89, 195, 249); border-color: rgb(89, 195, 249); display: inline-block; height: 8px; width: 8px; color: rgb(255, 255, 255); float: right; " class="bc"></section></section></section></section></div>
                                <div class="itembox" title="背景色标题白色内容"><section><blockquote style="max-width: 100%; margin: 0px; padding: 5px 15px; color: rgb(160, 160, 162); line-height: 25px; font-weight: bold; text-align: left; border-radius: 5px 5px 0px 0px; border: 0px; background-color: rgb(33, 33, 34);" class="bc"><span style="color:rgb(255, 255, 255)">这输入标题</span></blockquote><blockquote style="max-width: 100%; margin: 0px; padding: 10px 15px 20px; border-radius: 0px 0px 5px 5px; border: 1px solid rgb(33, 33, 34); line-height: 25px;" class="bdc"><p style="color: inherit;">可在这输入内容，我的编辑器，做微信图文美化最方便的编辑器。</p></blockquote></section></div>
                                <div class="itembox" title="底部内容版式"><section><section style="max-width: 100%; margin: 2px; padding: 0px;"><section style="max-width: 100%;margin-left:1em; line-height: 1.4em;"><span style="font-size:14px"><strong style="color:rgb(62, 62, 62); line-height:32px; white-space:pre-wrap"><span style="background-color:rgb(86, 159, 8); border-radius:5px; color:rgb(255, 255, 255); padding:4px 10px" class="bc">关于文章编辑器</span></strong></span></section><section style="font-size: 1em; max-width: 100%; margin-top: -0.7em; padding: 10px 1em; border: 1px solid rgb(192, 200, 209); border-radius: 0.4em; color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);"><p><span placeholder="提供非常好用的微信文章编辑工具。">非常好用的在线图文编辑工具，欢迎将XXX商城推荐给您的朋友，将他/她从痛苦的编辑中解脱出来。</span></p><p><br></p><p style="text-align: center;"><img alt="" src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0003.jpg" width="100%"></p></section></section></section></div>
                                <div class="itembox" title="圆角虚线边框"><p style="margin: 15px; max-width: 100%; word-wrap: normal; min-height: 1.5em; white-space: pre-wrap; padding: 20px; border: 1px dotted rgb(0, 187, 236); text-align: justify; color: rgb(73, 68, 41); line-height: 2em; font-family: 微软雅黑; font-size: 14px; border-bottom-right-radius: 15px; border-bottom-left-radius: 10px; background-color: rgb(255, 255, 255); box-sizing: border-box !important;" class="bdc"><span style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important; color: rgb(0, 187, 236);"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;" class="tc">请输入内容</strong></span></p></div>
                                <div class="itembox" title="左上标签"><section style="margin-top: 1.5em; display: inline-block; height: 2em; max-width: 100%; line-height: 1em;box-sizing: border-box; border-top: 1.1em solid #00BBEC; border-bottom: 1.1em solid #00BBEC; border-right: 1em solid transparent;" class="btc bbc"><section style="height: 2em; margin-top: -1em; color: white; padding: 0.5em 1em; max-width: 100%; white-space: nowrap;text-overflow: ellipsis;">事项1</section></section><section style="padding: 1em;"><p>请输入活动内容<br>请输入活动内容<br>......</p></section></div>
                                <div class="itembox" title="左上标签+标题"><fieldset style="border: 0px; margin: 0.5em 0px; padding: 0px; box-sizing: border-box;"><section class="bdc" style="margin-left: 1%;border: 1px solid rgb(0, 187, 236); border-top-left-radius: 0px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 0px; font-size: 1em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(52, 54, 60); background-color: rgb(255, 255, 255); box-sizing: border-box;"><section style="margin-top: 5%; float: left; margin-right: 8px; margin-left: -8px; font-size: 0.8em; font-family: inherit; font-style: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); background-color: transparent; border-color: rgb(0,187,236); box-sizing: border-box;"><span class="bc" style="display: inline-block; padding: 0.3em 0.5em; border-top-left-radius: 0px; border-top-right-radius: 0.5em; border-bottom-right-radius: 0.5em; border-bottom-left-radius: 0px; font-size: 1em; background-color: rgb(0,187,236); font-family: inherit; box-sizing: border-box;"><section style="box-sizing: border-box;">文章编辑器</section></span><section class="brc btc" style="width: 0px; border-right-width: 4px; border-right-style: solid; border-right-color: rgb(0,187,236); border-top-width: 4px; border-top-style: solid; border-top-color: rgb(0,187,236); border-left-width: 4px !important; border-left-style: solid !important; border-left-color: transparent !important; border-bottom-width: 4px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important; box-sizing: border-box;"></section></section><section style="margin-top: 5%; padding: 0px 8px; font-size: 1.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box;"><section style="box-sizing: border-box;">微信文章标题</section></section><section style="clear: both; box-sizing: border-box;"></section><section style="padding: 8px; box-sizing: border-box;"><p>编辑文字的时候，提倡大家复制素材到微信公众平台素材管理里面进行编辑，本编辑器不带保存功能，大家使用时候注意！</p></section></section></fieldset></div>
                                <div class="itembox" title=""><section style="border: 0px none; padding: 0px; box-sizing: border-box; margin: 0px; font-family: 微软雅黑;"><section style="border: none rgb(0,187,236); margin: 0.8em 5% 0.3em; box-sizing: border-box; padding: 0px;"><section class="tc bdc" style="color: rgb(0,187,236); font-size: 20px; letter-spacing: 3px; padding: 9px 4px 14px; text-align: center; margin: 0px auto; border: 4px solid rgb(0,187,236); border-top-left-radius: 8px; border-top-right-radius: 8px; border-bottom-right-radius: 8px; border-bottom-left-radius: 8px; box-sizing: border-box;">理念<span class="tc" style="display: block; font-size: 10px; line-height: 12px; border-color: rgb(0,187,236); color: inherit; box-sizing: border-box; padding: 0px; margin: 0px;">PHILOSOPHY</span></section><section class="btc" style="width: 0px; margin-right: auto; margin-left: auto; border-top-width: 0.6em; border-top-style: solid; border-bottom-color: rgb(0,187,236); border-top-color: rgb(0,187,236); height: 10px; color: inherit; border-left-width: 0.7em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 0.7em !important; border-right-style: solid !important; border-right-color: transparent !important; box-sizing: border-box; padding: 0px;"></section></section></section></div>
                                <div class="itembox" title="虚线边框区域"><section style="margin: 5px auto;white-space: normal;"><blockquote class="bdc" style="margin:5px 0;padding:0 10px;max-width:100%;border:2px dashed rgb(153, 153, 153);color:#3e3e3e;font-size:14px;white-space:normal;line-height:30px;box-sizing:border-box!important;word-wrap:break-word!important;background-color:#fff"><p>这里输入内容</p></blockquote></section></div>
                                <div class="itembox" title="圆点区域"><section style="margin: 5px auto;white-space: normal;"><section class="bdc" style="line-height:30px;border:2px solid #999;border-radius:.8em;font-family:inherit;font-weight:inherit;font-size:16px;text-align:center;text-decoration:inherit;color:#333;box-sizing:border-box;background-color:#fff"><section style="padding:10px;box-sizing:border-box"><section class="bc" style="width:.5em;height:.5em;float:left;border-radius:100%;box-sizing:border-box;background-color:#999"></section><section class="bc" style="width:.5em;height:.5em;float:right;border-radius:100%;box-sizing:border-box;background-color:#999"></section><section style="clear:both;box-sizing:border-box"></section></section><section style="padding-right:20px;padding-left:20px;box-sizing:border-box"><section class="tc" style="box-sizing:border-box;">这里输入内容</section></section><section style="padding:10px;box-sizing:border-box"><section class="bc" style="width:.5em;height:.5em;float:left;border-radius:100%;box-sizing:border-box;background-color:#999"></section><section class="bc" style="width:.5em;height:.5em;float:right;border-radius:100%;box-sizing:border-box;background-color:#999"></section><section style="clear:both;box-sizing:border-box"></section></section></section></section></div>
                                <p style="text-align:center; line-height:30px; color:#999;">没有更多啦...</p>
                            </div>
                            <div n="3" class="con">
                                <div class="itembox" title="上图下标题样式"><section><section style="border: none; margin: 0.8em 0px 0.3em; box-sizing: border-box; padding: 0px;"><section style="line-height: 0; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhmHR6CZlTyWUy3W8Hc3bmQz9Lj4bWrMrcs9YdFDKOQDDYzSJo1yUmcHdtjVVicehqbvANPLhjAUtw/0" style="border:0px; box-sizing:border-box; display:inline-block; height:auto !important; width:100%"></section><section data-width="30%" style="width: 30%; display: inline-block; float: left; text-align: right; margin: 15px 0px 0px; padding: 0px; box-sizing: border-box;"><section style="float: right; text-align: center; margin-top: -15px; box-sizing: border-box;"><section style="width: 1px; height: 1.2em; margin-left: 13px; background-color: rgb(102, 102, 102); box-sizing: border-box;"></section><section style="width: 2em; height: 2em; border: 1px solid rgb(102, 102, 102); border-radius: 50%; line-height: 2em; font-size: 1em;font-weight: inherit; text-decoration: inherit; box-sizing: border-box;"><section data-brushtype="text" style="box-sizing: border-box;">简</section></section><section style="width: 2em; height: 2em; border: 1px solid rgb(102, 102, 102); margin-top: 2px; border-radius: 50%; line-height: 2em; font-size: 1em;  font-weight: inherit; text-decoration: inherit; box-sizing: border-box;"><section data-brushtype="text" style="box-sizing: border-box;">单</section></section></section></section><section data-width="65%" style="width: 65%; float: left; margin-top: 20px; line-height: 1.5em; padding-left:20px; font-size: 1em;  font-weight: inherit; text-decoration: inherit; color: rgb(39, 44, 51); box-sizing: border-box;"><section style="box-sizing: border-box;"><section data-brushtype="text" style="box-sizing:border-box; font-size:175%;margin:5px 0px">Cafe</section><section style="box-sizing: border-box;font-size:16px">伟提尼亚记忆</section></section></section><p style="clear:both"><br></p></section><section style="display: block; width: 0; height: 0; clear: both;"></section></section></div>
                                <div class="itembox" title="图文居中大标题"><section><section style="margin: 0.3em 0px; padding-bottom: 1.5em; font-size: 14px; font-weight: bold; text-align: center; text-decoration: inherit; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/yqVAqoZvDibHWvgOv2I0TKCIUiahNEhjlcjshRAyupvciamTNUtcWibOVznETw9WujpFNNntd0PiaRYSiajWQCp0fZXQ/0?wx_fmt=jpeg" style="border-radius: 50%; color: inherit; height: 112px !important; vertical-align: middle; width: 112px; margin: 0px;" height="112" border="0" width="112"><section class="blc" style="border-left-width: 1px; border-left-style: solid; border-color: rgb(211,172,156); padding-left: 1em; text-align: left; display: inline-block; height: 6em; vertical-align: top;color: rgb(211,172,156); margin-top: 1em;margin-left: 10px;"><h2 class="tc" style="width: 100%; overflow: hidden; height: 50%; font-size: 1.5em; margin-top: -0.15em; border-color: rgb(211,172,156); color: inherit;margin-bottom:0.5em;">计划</h2><section class="tc" style="font-size: 16px; border-color: rgb(211,172,156); color: inherit;"><p>=Planning=</p></section></section></section><section style="display: block; width: 0; height: 0; clear: both;"></section></section></div>
                                <div class="itembox" title="段落-左上图"><section style="margin: 5px auto;white-space: normal;"><section style="box-sizing:border-box"><img style="width:200px;float:left;margin-right:10px;margin-bottom:5px" src="https://mmbiz.qlogo.cn/mmbiz/nia02yQdMmJYtefUDWxib97nFdn4NXCluK2LQaKAQxG3icIHcYxt5rd5lfnsn0vCTklaAMYgJG6fK7q46YiazuyCeQ/0?wx_fmt=jpeg"><section style="font-size:14px;font-family:inherit;line-height:30px;text-decoration:inherit"><section>人没安全感，总会不确定。试着去接受一个爱你的人，也只有在与之相处的过程里你才会体会到，这到底是怎样的爱。过度的怕和试探忐忑的矫情，也许会让你看的更清透，但也同样会让你错过感情最美的时候，情感的递增需要一个过程，而它的开始是心动。当有一天你懂了，那时你失去的也许是你的全世界</section></section></section></section></div>
                                <div class="itembox" title="段落-右图有边框"><section style="margin: 5px auto;white-space: normal;"><section style="background:#fff;text-align:center;border-style:none;clear:both;overflow:hidden"><span class="bdc" style="padding:5px;margin-left:6px;border:1px solid #bfbfbf;float:right"><img src="https://mmbiz.qlogo.cn/mmbiz/nia02yQdMmJYtefUDWxib97nFdn4NXCluKrCVibMFfoD9lmExfkNb6WS4YLsob0ichibFibkyOZUogtyCxnF3fPdADicQ/0?wx_fmt=jpeg" style="display:block;width:200px;"></span><section style="line-height:1.5;text-align:left;font-size:14px"><p style="display:inline">智慧本身就是好的。有一天我们都会死去，追求智慧的道路还会有人在走着。死掉以后的事我看不到。但在我活着的时候，想到这件事，心里就很高兴。</p></section></section></section></div>
                                <div class="itembox" title="段落-左图有边框"><section style="margin: 5px auto;white-space: normal;"><section style="background:#fff;text-align:center;border-style:none;clear:both;overflow:hidden"><span class="bdc" style="margin-right:6px;padding:5px;border:solid 1px #bfbfbf;float:left"><img src="https://mmbiz.qlogo.cn/mmbiz/nia02yQdMmJYtefUDWxib97nFdn4NXCluKz7btPicbQ8QT4ibNCZzy0U7pmGg0vqla0eOewqjlicxX4V8WQSl62gdPw/0?wx_fmt=jpeg" style="display:block;width:200px"></span><section style="line-height:30px;text-align:left;font-size:14px"><p style="display:inline">&nbsp;智慧本身就是好的。有一天我们都会死去，追求智慧的道路还会有人在走着。死掉以后的事我看不到。但在我活着的时候，想到这件事，心里就很高兴。</p></section></section></section></div>
                                <div class="itembox" title="段落-右图无边框"><section style="margin: 5px auto;white-space: normal;"><section style="background:#fff;text-align:center;border-style:none;clear:both;overflow:hidden"><span style="float:right"><img src="https://mmbiz.qlogo.cn/mmbiz/nia02yQdMmJYtefUDWxib97nFdn4NXCluKa3Zg9ORT9OC8F68xQkngTGdRTVG8umEJ1iaIAQrxTibDLicNA6wUzEH6w/0?wx_fmt=jpeg" style="width:200px;margin-left:6px"></span><section style="line-height:30px;text-align:left;font-size:14px"><p style="display:inline">智慧本身就是好的。有一天我们都会死去，追求智慧的道路还会有人在走着。死掉以后的事我看不到。但在我活着的时候，想到这件事，心里就很高兴。</p></section></section></section></div>
                                <div class="itembox" title="段落-左图无边框"><section style="margin: 5px auto;white-space: normal;"><section style="background:#fff;text-align:left;border-style:none;width:100%;clear:both;overflow:hidden"><span style="float:left"><img src="https://mmbiz.qlogo.cn/mmbiz/nia02yQdMmJYtefUDWxib97nFdn4NXCluKziaLicUNjYoL6GVdFH3RGhXA0gQqqaPoVLg9U7zn8asPDno23yaJHwhA/0?wx_fmt=jpeg" style="margin-right:6px;width:200px"></span><section style="line-height:30px;text-align:left;font-size:14px"><p style="display:inline">智慧本身就是好的。有一天我们都会死去，追求智慧的道路还会有人在走着。死掉以后的事我看不到。但在我活着的时候，想到这件事，心里就很高兴。</p></section></section></section></div>
                                <div class="itembox" title="封面标题"><section style="margin: 5px auto;white-space: normal;"><section style="margin-top:.5em;margin-bottom:.5em;box-sizing:border-box"><section style="width:100%;float:left;padding:0 .1em 0 0"><img style="width:100%;height:auto!important" src="https://mmbiz.qlogo.cn/mmbiz/nia02yQdMmJaPxA41ZKLufUaxCOblZ0nL5BptWrqvXWdQQbLlYtvCjLdicBkRCsexIOvKW5OLygfYJaSodLKicF4Q/0?wx_fmt=jpeg"><section class="tc" style="line-height:1.4;padding:.3em 1em;float:right;width:76%;font-size:14px;margin-top:-12em;opacity:.7;color:#efefef;background-color:#000"><section style="border:none;margin-top:.5em;margin-bottom:.5em;padding-right:3px;padding-left:3px"><section><section class="bc" style="width:9px;height:9px;margin-left:-3px;border-radius:100%;margin-top:1em;float:left;background-color:#ccc"></section><section class="tc" style="padding:3px 10px;font-size:16px;font-family:inherit;text-decoration:inherit;float:left"><section>请输入标题</section></section></section><section style="width:100%"><section class="bdc" style="border-top-width:2px;border-top-style:solid;border-color:#ccc;width:95%;float:left"></section></section><section style="width:0;height:0;clear:both"></section></section><p>咖啡就是人生，苦与甜都包含其中。。。。。</p></section></section><section style="width:0;height:0;clear:both"></section></section></section></div>
                                <div class="itembox" title="右上角标签封面"><section style="margin: 5px auto;white-space: normal;"><section style="margin-top:.5em;margin-bottom:.5em;box-sizing:border-box"><section style="overflow:hidden"><section class="bc" style="width:10em;height:2em;line-height:2em;margin-top:1em;margin-bottom:-4em;margin-right:-3em;-webkit-transform:rotate(45deg);font-size:1.5em;font-family:inherit;font-weight:inherit;text-align:center;text-decoration:inherit;color:#fff;border-color:#fff;box-sizing:border-box;float:right;background-color:#c53f46"><section style="box-sizing:border-box">咖啡物语</section></section><img style="box-sizing:border-box;width:100%" src="https://mmbiz.qlogo.cn/mmbiz/nia02yQdMmJaPxA41ZKLufUaxCOblZ0nL5BptWrqvXWdQQbLlYtvCjLdicBkRCsexIOvKW5OLygfYJaSodLKicF4Q/0?wx_fmt=jpeg"></section></section></section></div>
                                <div class="itembox" title="图片左右滑动"><section style="margin: 5px auto;white-space: normal;"><section style="width:100%"><section style="overflow-x:auto;overflow-y:hidden;white-space:nowrap"><img src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQudlGPWdtETkGkLZxjTibiaygibLGsibekNJPaDdb99lHjyXA5TpkR4DtcG7rune49x3KIibOYJ7QwwOWKA/0?wx_fmt=png" style="height:150px;padding:0"><img src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQudlGPWdtETkGkLZxjTibiaygibAWItyUrYHgkRsgsqOVkvnXuSNp56jwESHxRQvYRz525HFWiaAdXUPSw/0?wx_fmt=png" style="height:150px;padding:0"><img src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQudlGPWdtETkGkLZxjTibiaygibcRVopDVqJv72lxiaDWdda561mphgD4eLHk3pQC2ibJsFjcqmrl9XJ3sg/0?wx_fmt=png" style="height:150px;padding:0"><img src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQudlGPWdtETkGkLZxjTibiaygibAWItyUrYHgkRsgsqOVkvnXuSNp56jwESHxRQvYRz525HFWiaAdXUPSw/0?wx_fmt=png" style="height:150px;padding:0"><img src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQudlGPWdtETkGkLZxjTibiaygibcRVopDVqJv72lxiaDWdda561mphgD4eLHk3pQC2ibJsFjcqmrl9XJ3sg/0?wx_fmt=png" style="height:150px;padding:0"></section><p style="color:#aaa;text-align:center;padding-bottom:10px">图片左右滑动</p></section></section></div>
                                <div class="itembox" title=""><section style="margin: 5px auto;white-space: normal;"><section style="border:0;box-sizing:border-box;width:100%;margin-top:.8em;margin-bottom:.5em;clear:both"><img style="box-sizing:border-box;width:100%" src="http://img.yzcdn.cn/upload_files/2015/08/06/d35c557390f53f351a93d34b12557c66.jpg"><section style="box-sizing:border-box;width:9em;float:right;margin-top:-2em;margin-right:1em;border-radius:12em;-webkit-transform:rotate3d(0,0,1,15deg);transform:rotate3d(0,0,1,15deg);opacity:.99"><img style="box-sizing:border-box;width:100%;border:2px solid white" src="http://img.yzcdn.cn/upload_files/2015/08/06/9ebf40dca0a2623f60eda2dadc9ff9d1.jpg"></section><section style="box-sizing:border-box;margin-top:.5em;margin-right:11em;margin-bottom:.5em;color:#666;font-size:.9em;font-family:inherit;font-weight:inherit;text-align:inherit;text-decoration:inherit"><section style="box-sizing:border-box">这里输入内容</section></section><section style="clear:both;box-sizing:border-box"></section></section></section></div>
                                <div class="itembox" title=""><section style="margin: 5px auto;white-space: normal;"><section style="border:0;box-sizing:border-box;clear:both;overflow:hidden;padding:15px 10px;margin:0"><section style="box-sizing:border-box;width:50%;float:left;padding:10px 0 10px 4px;-webkit-transform:rotate(10deg);transform:rotate(10deg);margin:0"><img src="http://img.yzcdn.cn/upload_files/2015/08/06/9ebf40dca0a2623f60eda2dadc9ff9d1.jpg" style="box-sizing:border-box;margin:0;padding:0;width:100%;height:auto!important"></section><section style="box-sizing:border-box;width:50%;float:right;padding:15px 6px 10px 0;margin:0;-webkit-transform:rotate(-15deg);transform:rotate(-15deg)"><img src="http://img.yzcdn.cn/upload_files/2015/08/06/d35c557390f53f351a93d34b12557c66.jpg" style="box-sizing:border-box;margin:0;padding:0;width:100%;height:auto!important"></section></section></section></div>
                                <p style="text-align:center; line-height:30px; color:#999;">没有更多啦...</p>
                            </div>
                            <div n="4" class="con">
                                <div class="itembox" title="点击蓝字加关注"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3YMVZq8vPMnMiaKsDVFDZcic4g2U3sBaNxBiaIicoLB6QvWhrz8fU0Aay3w/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="点击蓝字加关注"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3YfT9k626AtJ5ggI2VUqRBsDaMzOE8Y7OGjfGcnKu92vy959voCWc0g/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="点击蓝字加关注"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3t1CsHDz13B4iaUgncMnJNUFngThmB8iaV7o7WZ5q7QraAk58fBatf3hw/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="点击蓝字加关注"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/DCE5nxPSl5QEJxRJI0dvChhaicNhf7LfFAPv4NxBgy8MxXxJKFUoS4R2iaV7fSUjUmZuGbKyDqRzMZQVJSesibHTg/0?wx_fmt=jpeg"></p></div>
                                <div class="itembox" title="差一点我们就擦肩而过了"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq34QZrusKq3oL67icn9F8kGEIdMzjWH0icEyYm7PjmWlCPsC5FftF7BB9g/0?wx_fmt=png"></p></div>
                                <div class="itembox" title="点击蓝字加关注"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3qNJDzspGItOoP9IVUBYWUX25KIFsuo9EzHRgOZticVbSuKK6KO7jMsA/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="点击蓝字加关注"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3my2ob9d9icNmM4J4sicuibTdicicJeeTwSVvC0mRa2aHUoIrrKPZF62CVVw/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="点击蓝字加关注-蜡笔小新"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3e1m8oD3XKSciaWrCjJt3JMKQTkLPiaKibvfpOuwlImdvIssicIqYaXKVicw/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="点击蓝字加关注-流浪兔"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3rnowrN26pp5piaZruxPibVvmRxuAtibGAtmVG5g0ticiaA9jJDSMh51Xjpg/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="gif手指"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3m6RmtLIMyjYZwhZQrMnJkiaVCiauUlq0icQYCLhgNXaLYMdr7IatKCiaBg/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="加关注你懂的"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq38Ya0Eu0LiaS8yzQ9ZibQ62RDx8iazMy1kpviaibaGlD9HXBrAcg5XtK4Vog/0?wx_fmt=jpeg"></p></div>
                                <div class="itembox" title="长按识别图中二维码"><section style="margin: 5px auto;white-space: normal;"><blockquote style="margin:0 auto;width:360px;border:none #ff8124;box-sizing:border-box;background-image:url(https://mmbiz.qlogo.cn/mmbiz/buNzDicETA2lEDXPPWQ02ibNweHZzeqmcAUz5Kycmhga9FSvHX0zpWqiaFFrytUzBibvbaoViaOPNe7KGugBGsiakOwA/0);background-position:right 0;background-size:contain;background-repeat:no-repeat"><section style="padding:10px 3px"><img style="max-width:50%!important" src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0003.jpg" data-width="150px" width="150" border="0" vspace="0" title="" alt=""></section></blockquote></section></div>
                                <div class="itembox" title="长按识别图中二维码"><section style="margin: 5px auto;white-space: normal;"><section style="border-style:none;clear:both;overflow:hidden;font-size:12px;text-align:center;width:286px;margin:15px auto"><span style="text-align:center;width:80%;margin:10px auto"><span style="vertical-align:middle;clear:both;display:block"><section style="display:inline-block;text-align:center;float:left;width:50%;margin:0 auto 10px"><img src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0003.jpg" style="margin:0 auto;width:115px;display:block">微信ID：XXXXXX</section><section style="width:50%;text-align:center;margin-top:20px;display:inline-block;float:right"><img src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0004.gif" style="margin:0 auto;width:75px;margin-bottom:18px;display:block">长按左侧二维码关注</section></span></span></section></section></div>
                                <div class="itembox" title="长按识别图中二维码-绿色激光"><section style="margin: 5px auto;white-space: normal;"><section data-style="font-size:14px;text-align:center" style="line-height:25px;color:inherit;background-image:url(../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0005.gif);background-size:contain;background-position:50% 50%;background-repeat:no-repeat"><p style="text-align:center"><img src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0003.jpg" style="opacity:.55"></p></section></section></div>
                                <div class="itembox" title="长按识别图中二维码-红色激光"><section style="margin: 5px auto;white-space: normal;"><section data-style="font-size:14px;text-align:center" style="line-height:25px;color:inherit;background-image:url(../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0006.gif);background-size:contain;background-position:50% 50%;background-repeat:no-repeat"><p style="text-align:center"><img src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0003.jpg" style="opacity:.55"></p></section></section></div>
                                <div class="itembox" title="举牌二维码"><section style="margin: 5px auto;white-space: normal;"><blockquote style="max-width:100%;padding:5px 15px;border:none #ff8124;word-wrap:break-word!important;box-sizing:border-box!important;background-size:contain;background-position:50% 50%;background-repeat:no-repeat;background-image:url(https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4ia60XHTNaF1wNJVrjD3aNkJDJRjW4wxsYXGia5yCpAHqxATFfu3StYicg/0)"><section><p><br></p><section style="border:0;margin:0 -1px;box-sizing:border-box;width:100%;clear:both;padding:0" data-width="100%"><section style="margin:0 auto;width:130px;height:130px;box-sizing:border-box;text-align:center" data-width="130px"><img style="width:120px;height:120px" src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0003.jpg" width="120" height="120" border="0" vspace="0" title="" alt=""></section></section></section><p style="text-align:center"><span style="font-size:12px;line-height:21px;text-align:justify;text-decoration:underline;text-indent:28px;white-space:pre-wrap">长按上图，识别二维码关注</span></p><p style="text-align:center"><span style="font-size:12px;line-height:21px;text-align:justify;text-indent:28px;white-space:pre-wrap">一更多精彩一</span></p><p><br></p><p><br></p><p><br></p><p><br></p></blockquote></section></div>
                                <p style="text-align:center; line-height:30px; color:#999;">没有更多啦...</p>
                            </div>
                            <div n="5" class="con">
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjhXdiaw8ibquYYw8MI1InGKpUJlXdAuAicDHKWuf1sXQEwticoDZ5T5Q0yicjIJyrBCHktl1JHX2DCJLg/0/mmbizgif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjhXdiaw8ibquYYw8MI1InGKpr6JV7kJAvBybMCebbQbMh7ZLL2GMGPTV9KhMcwJOMHIkyDibyJsTIhA/0/mmbizgif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjhXdiaw8ibquYYw8MI1InGKpF17tUGszhvf58vVQTZjfpzD1icTlNCcz4ibTFjhST44tH0dYQpagg5ag/0/mmbizgif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhuxibIOsThcH7HF1lpQ0YvkYedyfd5kNTYhg6ZcVyV0J6M2N6lYlueToTr0ebAzibPibn8I8v3Qiandw/0/mmbizgif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjhXdiaw8ibquYYw8MI1InGKpNkaSe1ryqXSFkphB7EQLFT34NHCA4oQPh4QrJdNvQS11MiatXLV2CDQ/0/mmbizgif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/yqVAqoZvDibFmpaG1bHyLIFpk6h6SygXFmcfFdC6hYdLWyF4byicIc9ia7OzuUnOoN2PzTrCn8ILN9YmI11pQZOicQ/0?wx_fmt=jpeg"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhuxibIOsThcH7HF1lpQ0YvkUeBWCIdSiamRg8cFeYM8zl7TrvI2X7tsGhOpb2y56aFJwYibiaqUxeDNg/0/mmbizgif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhuxibIOsThcH7HF1lpQ0YvkicGBV51TmkSCfh6T9DmLKx7v6tXmulYESt4kdEUWNOW0eW6N82zCqYg/0/mmbizgif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiaB5wTN4rt8SiaLwWPOGjzszGdVn0IBuhK3YdplBpxYKRFzCKicnWRZFVMdkLw1gMv8Rcuy1vNJEXNA/0"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPia3RFX6Mvw06kePJ7HbmI7bibbbzG3uqZ8S8QicFSnqobkGSPq4X5D9btObvy1zy6EyibLlplicicszCSg/0?wx_fmt=png"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQudCxhicVdD2GDlvfZSnCRbKEdic5ul1RvXMG9zRZNZPlXsdMktH471NSlpg0iccTcfvc7uMFUwRHibcCw/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3qiaEPlAYy8iaicRvzj1icRvFyaxwhN92gj1VGP4DIsZ71DVzEmGKehM21g/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3icp0qCHwh8WL0G1YPib8Eibqxibbnudk4sgnjqBuoj7ciaiaofV3uTg0vJyA/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3iajxh0aTgUk4bmsNZjsiamJSTWazjrpCgtObspbwURLpDP8cegpwVTjA/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3fB0biaicZUwG4RWvgwy8CHAlibicomftPwiazq2lz0o9dbMLXBsrfUmBnmg/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3UYok4TTGsyQRoWZkuqWHUmNib7OE1sBTMoTdEoNcJ45BZeg2robQnSQ/0?wx_fmt=jpeg"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3RfygZYDWf0nFNib5iclyRs7M7xiaSicvibPxz8toENPH9dia1ZlYPYrm5UNQ/0?wx_fmt=jpeg"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/jZlB3L4cckX0gAhfFZrBHHODjVdTtCnw4ErS97dmE14s1d4D2WypOjA8MTKJrRCcLXSosibh5bUbZUibP2uHRwyQ/0"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/6xsuhALdNEr0ibLDATPbiaQoI0OyJzZP813MfewdMGP0CRRUqTgCGJO4tKibZJLcrVESQxnmTNDFSzuTCnVjV6iaxw/0"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/6xsuhALdNEr0ibLDATPbiaQoI0OyJzZP81jDYTckoPrfeX088lekl55f4B43DyAGgGfvtCXmEmg8KtLjtQ7yMLiaw/0"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/6xsuhALdNEr0ibLDATPbiaQoI0OyJzZP81KAjkO1amv78GtEQkLiag8ibQ7NibgTdnj0tUpmhMo2DsYvZkLAQzH8edw/0"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/6xsuhALdNEr0ibLDATPbiaQoI0OyJzZP81jUpsBzUCDBCf1wr2YyIhQoqRTQ8D5ArKPDE0ZFSdicuP8ug1LJcbokA/0"></p></div>
                                <div class="itembox" title="普通分割线样式"><p><img width="100%" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3V9snSZ9J0LPay4mY55B8JIPHZ1ib2QE3fmufRBKb0I2ORdW5uD1EShA/0?wx_fmt=png"></p></div>
                                <p style="text-align:center; line-height:30px; color:#999;">没有更多啦...</p>
                            </div>
                            <div n="6" class="con">
                                <div class="itembox" title=""><section style="max-width:100%;font-family:inherit;font-size:1em;padding:.7em 0;line-height:1.4em;border-top-width:1px;border-top-style:solid;border-top-color:#3f474e;font-family:微软雅黑;border-bottom-width:1px;border-bottom-style:solid;border-bottom-color:#3f474e;font-style:italic;color:#3f474e;word-wrap:break-word!important;box-sizing:border-box!important"><span style="max-width:100%;word-wrap:break-word!important;box-sizing:border-box!important;font-size:12px"><strong style="max-width:100%;word-wrap:break-word!important;box-sizing:border-box!important"><em style="max-width:100%;word-wrap:break-word!important;box-sizing:border-box!important">点击“<span style="max-width:100%;word-wrap:break-word!important;box-sizing:border-box!important;font-size:16px;color:#c0504d">阅读原文</span>”体验一次简单不过的微信编辑体验，不用太久，不用太难，<span style="max-width:100%;word-wrap:break-word!important;box-sizing:border-box!important;font-size:16px;color:#9bbb59">瞬间</span>即可！</em></strong></span></section></div>
                                <div class="itembox" title=""><section><section style="height: 8em; white-space: nowrap; overflow: hidden;"><img style="max-width: 100%;max-height: 100%;" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3jx3mEndgOXP3ibxYMusKuyrA2761tRBDLG2CZDS4L4pkPiabefhv833Q/0?wx_fmt=png"></section><section style="height: 2em; margin: -7.2em 0.5em 5.5em; font-size: 1em; line-height: 1.6em; padding: 0.5em;"><span style="color: inherit; white-space: nowrap; overflow: hidden; font-size: 0.9em; font-family: inherit; font-style: normal;">点击下方</span><span style="color: rgb(64, 84, 115); white-space: nowrap; overflow: hidden; font-size: 0.9em; font-family: inherit; font-style: normal;">“阅读原文”</span><span style="color: inherit; white-space: nowrap; overflow: hidden; font-size: 0.9em; font-family: inherit; font-style: normal;">查看更多</span></section></section></div>
                                <div class="itembox" title=""><section><section class="awb-s1" style="margin: 0px; height: 0.1em; background-color: #00BBEC;"></section><section class="awb-s1" style="margin: 0.3em 0px; height: 0.3em; background-color: #00BBEC;"></section><section class="awb-s3" style="margin: 0; background-color: white; border: 1px solid #00BBEC; box-shadow: #e2e2e2 0em 1em 0.1em -0.8em;font-size: 1em; line-height: 1.6em; padding: 0.5em;"><span style="color: inherit; font-size: 1em; font-family: inherit; font-style: normal;">点击下方</span><span style="color: rgb(64, 84, 115); font-size: 1em; font-family: inherit; font-style: normal;">“阅读原文”</span><span style="color: inherit; font-size: 1em; font-family: inherit; font-style: normal;">查看更多</span></section><section class="awb-s4" style="color: #00BBEC; font-size: 2em;">↓↓↓</section></section></div>
                                <div class="itembox" title=""><section><p class="awb-s1" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; min-height: 1.5em; word-wrap: break-word; word-break: normal; white-space: pre-wrap; line-height: 36px; font-family: 微软雅黑; text-align: center; background-color: #00BBEC; color: #ffffff; border-radius: 5px;">点击左下角“阅读原文”查看更多</p><p class="awb-s2" style="margin: -5px 0 0 50px;display: inline-block;border-left-width: 1em;border-left-style: solid;border-left-color: transparent !important;border-right-width: 1em;border-right-style: solid;border-right-color: transparent !important;border-top-width: 1.5em !important;border-top-style: solid !important;border-top-color: #00BBEC;"></p></section></div>
                                <div class="itembox" title="卡通猛戳"><p><img style="height: auto !important;" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3XG6TtnvtgiaJQIfog0be4o0SYAIDAMSQtnnXfm8rP1AFBY4kadMLdibg/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="卡通点这"><p><img style="height: auto !important;" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3eDrpBicLicv1gBF89W3klKic1D1wxgxZb9a22MxQRttBw03jYf30Yic17g/0?wx_fmt=gif"></p></div>
                                <div class="itembox" title="99%的人点击了阅读原文"><p><img style="height: auto !important;" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufaFonP5uahBudGuINbPKsALeKOvnhykkEIjOu3oMBk4diadMKEDQayIcNjPFwPlDSgGa8DcAE8EVQ/0?wx_fmt=gif"></p></div>
                                <p style="text-align:center; line-height:30px; color:#999;">没有更多啦...</p>
                            </div>
                            <div n="7" class="con">
                                <div class="itembox" title="对话框左"><section><section style="text-align: left;"><img style="vertical-align: top; width: 40px;" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq31pvIqv5RLcdOw2A6Kj0JN0uaUH6TJbVJSa4L2YMtljNVaUdlzkaJqA/0?wx_fmt=png"><img style="vertical-align: top; margin-top: 1.8em;" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3MORYLSvWXHib8vkfbs3CKKquxureFEUTnqS5fSFdx7Pgss3vIjjwvGQ/0?wx_fmt=png"><section style="display: inline-block; width: 40%; margin-top: 0.7em; margin-left: -0.4em; padding: 1em; background-color: #ffe4c8; border-radius: 1em;"><p>请输入对话</p></section></section></section></div>
                                <div class="itembox" title="对话框右"><section><section style="text-align: right;"><section style="display: inline-block; width: 40%; margin-top: 0.7em; margin-right: -0.4em; padding: 1em; background-color: #bce3f9; border-radius: 1em; text-align: left;"><p>请输入对话</p></section><img style="vertical-align: top; margin-top: 1.8em;" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3Kslkc89QvoG0l55hTd2iaThbhOibq8v62hfFfMzlBDhqWPsqnVQw7lGA/0?wx_fmt=png"><img style="vertical-align: top; width: 40px;" src="https://mmbiz.qlogo.cn/mmbiz/h1VV7TJtQufpoja8icV1RNvaDQ7ZryBq3HRcrSD65J3w4nuOAydqCQCXeUWqrNmqKuN3WUaIZhl1ib91LT7ShgpQ/0?wx_fmt=png"></section></section></div>
                                <div class="itembox" title="时间地点"><section><section class="bdc" style="background-color: white; border: 1px solid #00BBEC; box-shadow: rgb(165, 165, 165) 0em 1em 0.1em -0.6em; line-height: 1.6em;"><section class="bc" style="padding: 1em; text-align: center; font-size: 1.4em; font-weight: bold; line-height: 1.4em; color: white;background-color: #00BBEC; ">请输入名称</section><section style="text-align: left; margin-top: 1.5em;"><img style="vertical-align: top; margin-left: 1em; width: 30px;" src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0001.png"><section style="display: inline-block; width: 40%; margin-left: 0.5em; padding: 0.2em;">时间</section></section><section style="text-align: left; margin-top: 1em;"><img style="vertical-align: top; margin-left: 1em; width: 30px;" src="../addons/ewei_shop/plugin/article/template/imgsrc/itembox/0002.png"><section style="display: inline-block; width: 40%; margin-left: 0.5em; padding: 0.2em;">地点</section></section><br><br><br></section></section></div>
                                <div class="itembox" title="我们的印记-右脚丫"><section style="margin: 5px auto;white-space: normal;"><section style="margin-top:.5em;margin-bottom:.5em;box-sizing:border-box"><section style="margin:auto;width:3em;height:3em;border-radius:100%;background-image:url(https://mmbiz.qlogo.cn/mmbiz/buNzDicETA2muaRvbnPLDow1icrOiaic83yu5KMxde0RZdRduBtPkRf1DTrSq2PpBOD7ISBBOCPEEia4fA6hPmiaWejw/0?wx_fmt=jpeg);background-size:cover;background-position:50% 50%;background-repeat:no-repeat"></section><section class="bdc" style="width:0;height:4em;border-left-width:3px;border-left-style:dotted;border-color:#999;margin:auto"></section></section><section style="float:right;width:40%;margin-top:-7.8em;font-family:inherit;text-decoration:inherit;border-color:#ffca00"><section class="brc" style="width:0;border-right-width:8px;border-right-style:solid;display:inline-block;margin-top:1.2em;vertical-align:top;border-right-color:#999;border-top-width:6px!important;border-top-style:solid!important;border-top-color:transparent!important;border-bottom-width:6px!important;border-bottom-style:solid!important;border-bottom-color:transparent!important"></section><section style="width:90%;display:inline-block;vertical-align:middle"><section class="bc" style="color:#fff;padding:10px;display:inline-block;border-radius:.5em;line-height:1.5em;font-family:inherit;background-color:#999"><section>我们的印记</section></section></section></section></section></div>
                                <div class="itembox" title="我们的印记-左脚丫"><section style="margin: 5px auto;white-space: normal;"><section style="margin-top:.5em;margin-bottom:.5em;box-sizing:border-box"><section style="margin:auto;width:3em;height:3em;border-radius:100%;background-image:url(https://mmbiz.qlogo.cn/mmbiz/buNzDicETA2muaRvbnPLDow1icrOiaic83yuHr9CqDKk78vaMzkGC0Qw2ERlv5hQXzJxz4sZyp9iak4e3nOjARBrjBw/0?wx_fmt=jpeg);background-size:cover;background-position:50% 50%;background-repeat:no-repeat"></section><section class="bdc" style="width:0;height:4em;border-left-width:3px;border-left-style:dotted;border-color:#999;margin:auto"></section></section><section style="float:left;width:40%;margin-top:-7.8em;font-family:inherit;text-align:right;text-decoration:inherit;border-color:#8ec965"><section style="width:90%;display:inline-block;vertical-align:middle"><section class="bc" style="color:#fff;padding:10px;display:inline-block;border-radius:.5em;line-height:1.5em;font-family:inherit;background-color:#999"><section>快跟上步伐</section></section></section><section class="blc" style="width:0;border-left-width:8px;border-left-style:solid;display:inline-block;margin-top:1.2em;vertical-align:top;border-left-color:#999;border-top-width:6px!important;border-top-style:solid!important;border-top-color:transparent!important;border-bottom-width:6px!important;border-bottom-style:solid!important;border-bottom-color:transparent!important"></section></section></section></div>
                                <div class="itembox" title="我们的印记-结束"><section style="margin: 5px auto;white-space: normal;"><section style="margin-top:.5em;margin-bottom:.5em;box-sizing:border-box"><section style="text-align:center"><section class="bdc" style="width:0;height:3em;border-left-width:3px;border-left-style:dotted;border-color:#ffa921;margin:auto"></section><section class="bc" style="display:inline-block;margin:auto;padding:3px 10px;border-radius:1em;font-family:inherit;text-align:left;text-decoration:inherit;color:#fff;border-color:#ffe83b;background-color:#ffa921"><section>七月初七 2015</section></section></section></section></section></div>
                                <div class="itembox" title="我们的印记-开始"><section style="margin: 5px auto;white-space: normal;"><section style="margin-top:.5em;margin-bottom:.5em;box-sizing:border-box"><section style="text-align:center"><section class="bc" style="display:inline-block;margin:auto;padding:3px 10px;border-radius:1em;font-family:inherit;text-align:left;text-decoration:inherit;color:#fff;border-color:#ffe83b;background-color:#5faaff"><section>七月初七 2015</section></section><section class="bdc" style="width:0;height:3em;border-left-width:3px;border-left-style:dotted;border-color:#5faaff;margin:auto"></section><section style="width:0;height:0;clear:both"></section></section></section></section></div>
                                <div class="itembox" title="黑板"><section style="margin: 5px auto;white-space: normal;"><section style="box-sizing:border-box;padding:0;margin:1em auto;border:none;width:319px;text-align:center"><section style="box-sizing:border-box;padding:20px 20px 0;margin:0;font-size:16px;color:#fff;border:4px solid #fbc16c;background-color:#254932;min-height:18px;width:319px;position:relative;line-height:1.4"><section style="box-sizing:border-box;padding:0;margin:0;line-height:1.6;font-size:17px"><p style="box-sizing:border-box;padding:0;margin-top:0;margin-bottom:10px">埋怨了你四年，依然舍不得说再见埋怨了你四年</p></section><span style="box-sizing:border-box;padding:0;margin:15px 0 0 54.19px;border:none;background-color:#fff;width:20px;height:4px;display:block"></span><span style="box-sizing:border-box;padding:0;margin:0 0 0 54.19px;border:none;background-color:#84ccc9;width:20px;height:4px;display:block"></span></section></section></section></div>
                                <div class="itembox" title="列表"><section><fieldset style="padding: 5px; min-width: 0px; color: rgb(62, 62, 62); line-height: 25.6000003814697px; white-space: normal; border: 1px solid rgb(204, 204, 204); list-style: none; font-family: 微软雅黑, sans-serif;">这里可以放广告/本期预览/下期引导：</fieldset><fieldset style="padding: 5px; min-width: 0px; color: rgb(62, 62, 62); line-height: 25.6000003814697px; white-space: normal; border: 1px solid rgb(204, 204, 204); list-style: none; font-family: 微软雅黑, sans-serif;"><strong style="font-size: 12px; line-height: 32px; color: inherit;"><span style="margin-right: 8px; padding: 4px 10px; word-break: normal; line-height: 1.42em; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; color: rgb(255, 255, 255); background-color: rgb(0, 187, 236);" class="bc">广告A</span></strong>xxxxxxxxxxxxxxxxxx</fieldset><fieldset style="padding: 5px; min-width: 0px; color: rgb(62, 62, 62); line-height: 25.6000003814697px; white-space: normal; border: 1px solid rgb(204, 204, 204); list-style: none; font-family: 微软雅黑, sans-serif;"><strong style="font-size: 12px; line-height: 32px; color: inherit;"><span style="margin-right: 8px; padding: 4px 10px; word-break: normal; line-height: 1.42em; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; color: rgb(255, 255, 255); background-color: rgb(0, 187, 236);" class="bc">广告B</span></strong>xxxxxxxxxxxxxxxxxx</fieldset><fieldset style="padding: 5px; min-width: 0px; color: rgb(62, 62, 62); line-height: 25.6000003814697px; white-space: normal; border: 1px solid rgb(204, 204, 204); list-style: none; font-family: 微软雅黑, sans-serif;"><strong style="font-size: 12px; line-height: 32px; color: inherit;"><span style="margin-right: 8px; padding: 4px 10px; word-break: normal; line-height: 1.42em; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; color: rgb(255, 255, 255); background-color: rgb(0, 187, 236);" class="bc">广告C</span></strong>xxxxxxxxxxxxxxxxx</fieldset><fieldset style="padding: 5px; min-width: 0px; color: rgb(62, 62, 62); line-height: 25.6000003814697px; white-space: normal; border: 1px solid rgb(204, 204, 204); list-style: none; font-family: 微软雅黑, sans-serif;"><strong style="font-size: 12px; line-height: 32px; color: inherit;"><span style="margin-right: 8px; padding: 4px 10px; word-break: normal; line-height: 1.42em; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; color: rgb(255, 255, 255); background-color: rgb(0, 187, 236);" class="bc">广告D</span></strong><span style="color: inherit;">xxxxxxxxxxxxxxxxxxxx</span></fieldset></section></div>
                                <p style="text-align:center; line-height:30px; color:#999;">没有更多啦...</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fart-editor-content" step="3" style="overflow-y: auto;">
                <div class="fart-form">
                    <div class="line">
                            <div class="input-group form-group">
                                <span class="input-group-addon">营销产品显示设置</span> 
                                <div class="form-control">&nbsp;
                                        <label for="product_advs_type1" class="radio-inline"><input type="radio" class="product_advs_type" name="product_advs_type" value="0" id="product_advs_type1" <?php  if($article['product_advs_type']==0) { ?>checked="true"<?php  } ?>> 关闭此功能</label>&nbsp;&nbsp;&nbsp;
                                        <label for="product_advs_type2" class="radio-inline"><input type="radio" class="product_advs_type" name="product_advs_type" value="1" id="product_advs_type2" <?php  if($article['product_advs_type']==1) { ?>checked="true"<?php  } ?>> 只显示第一张</label>&nbsp;&nbsp;&nbsp;
                                        <label for="product_advs_type3" class="radio-inline"><input type="radio" class="product_advs_type" name="product_advs_type" value="2" id="product_advs_type3" <?php  if($article['product_advs_type']==2) { ?>checked="true"<?php  } ?>> 随机显示</label>&nbsp;&nbsp;&nbsp;
                                        <label for="product_advs_type4" class="radio-inline"><input type="radio" class="product_advs_type" name="product_advs_type" value="3" id="product_advs_type4" <?php  if($article['product_advs_type']==3) { ?>checked="true"<?php  } ?>> 轮播显示</label>
                                </div>
                            </div>
                    </div>
                    <div class="product" <?php  if($article['product_advs_type']!=0) { ?>style="display:block;"<?php  } ?>>
                        <div class="line">
                            <div class="input-group form-group">
                                <span class="input-group-addon">推广产品标题</span>
                                <input type="text" name="product_advs_title"  class="form-control" value="<?php  if($aid) { ?><?php  echo $article['product_advs_title'];?><?php  } ?>" placeholder="推广产品标题，不填则不显示标题" bind-in="product_adv_title" bind-de="精品推荐">
                            </div>
                        </div>
                        <div class="line">
                            <div class="input-group form-group">
                                <span class="input-group-addon">推广产品底部文字</span>
                                <input type="text" name="product_advs_more"  class="form-control" value="<?php  if($aid) { ?><?php  echo $article['product_advs_more'];?><?php  } ?>" placeholder="推广产品底部文字，不填则不显示" bind-in="product_adv_more" bind-de="更多精彩">
                            </div>
                        </div>
                        <div class="line">
                            <div class="input-group form-group">
                                <span class="input-group-addon">推广产品底部链接</span>
                                <input type="text" name="product_advs_link"  class="form-control" value="<?php  if($aid) { ?><?php  echo $article['product_advs_link'];?><?php  } ?>" placeholder="推广产品底部文字链接，可直接输入或者选择系统连接 (请以http://开头)" data-id="PAL-00000">
                                <span class="input-group-addon btn btn-default nav-link" style="background: #fff;" data-id="PAL-00000">选择链接</span>
                            </div>
                        </div>
                        <div class="advs">
                            <div id="advs">
                                <?php  if(!empty($aid) && !empty($advs)) { ?>
                                    <?php  if(is_array($advs)) { foreach($advs as $i=>$adv) { ?>
                                        <div class="adv">
                                            <div class="del">×</div>
                                            <div class="img"><img src="<?php  if(empty($adv['img'])) { ?>../addons/ewei_shop/plugin/article/template/imgsrc/nochooseimg.jpg<?php  } else { ?><?php  echo $adv['img'];?><?php  } ?>" data-id="PAI-<?php  echo time()+$i+1?>" /></div>
                                            <div class="info">
                                                <div class="input-group form-group" style="margin-top:5px; margin-bottom:0px; margin-right:5px;">
                                                    <span class="input-group-addon">广告图片</span>
                                                    <input type="text" class="form-control post-adv-img" placeholder="推广广告图，可直接输入或者选择系统图片 (请以http://开头)" value="<?php  echo $adv['img'];?>" data-id="PAI-<?php  echo time()+$i+1?>">
                                                    <span class="input-group-addon btn btn-default nav-imgc" style="background: #fff;" data-id="PAI-<?php  echo time()+$i+1?>">选择图片</span>
                                                </div>
                                                <div class="input-group form-group" style="margin-top:10px; margin-bottom:0px; margin-right:5px;">
                                                    <span class="input-group-addon">广告链接</span>
                                                    <input type="text" class="form-control post-adv-link" placeholder="推广广告链接，可直接输入或者选择系统连接 (请以http://开头，单规格商品可直接下单)" value="<?php  echo $adv['link'];?>" data-id="PAL-<?php  echo time()+$i+1?>" >
                                                    <span class="input-group-addon btn btn-default nav-link" style="background: #fff;" data-id="PAL-<?php  echo time()+$i+1?>">选择链接</span>
                                                </div>
                                            </div>
                                        </div>
                                    <?php  } } ?>
                                <?php  } ?>
                            </div>
                            <div class="addbtn"><i class="fa fa-plus"></i> 添加一个</div>
                        </div>
                    </div>
                </div> 
            </div>  
        </div>
    </div>
</div>
<?php  } else if($operation == 'category') { ?>
<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">筛选</div>
        <div class="panel-body">
            <form action="./index.php" method="get" class="form-horizontal" role="form">
                <input type="hidden" name="c" value="site">
                <input type="hidden" name="a" value="entry">
                <input type="hidden" name="m" value="ewei_shop">
                <input type="hidden" name="do" value="plugin">
                <input type="hidden" name="p" value="article">
                <input type="hidden" name="op" value="category">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-1 control-label">筛选</label>
                    <div class="col-sm-8 col-xs-12">
                            <div class="col-xs-12 col-sm-8 col-lg-9">
                                <input class="form-control" name="keyword" id="" type="text" value="<?php  echo $_GPC['keyword'];?>" placeholder="请输入分类标题关键字进行检索">
                            </div>
                            <div class="col-xs-12 col-sm-2 col-lg-2">
                                <button class="btn btn-default"><i class="fa fa-search"></i> 搜索</button>
                            </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading"> 分类列表 (总数: <span id="categorynum"><?php  echo $categorynum;?></span>)</div>
    <div class="panel-body">
        <table class="table" style="">
            <thead>
                <tr>
                    <th style="width:50px; text-align:center;">ID</th>
                    <th style="width:500px;">分类名称</th>
                    <th style="width:100px; text-align:center;">操作</th>
                </tr>
            </thead>
            <tbody>
                <?php  if(empty($list)) { ?>
                    <tr class="noarticle"> 
                        <td style="text-align: center; line-height: 100px;" colspan="8">亲~您还没有添加文章分类哦~<?php if(cv('article.cate.addcate')) { ?>您可以尝试 ↙ 左下角的 “<a class="nav-add" href="javascript:;">添加文章分类</a>”<?php  } ?></td>
                    </tr>
                <?php  } else { ?>
                    <?php  if(is_array($list)) { foreach($list as $row) { ?>
                    <tr cid="<?php  echo $row['id'];?>" cname="<?php  echo $row['category_name'];?>">
                        <td class="cid"><?php  echo $row['id'];?></td>
                        <td class="cname"><?php  echo $row['category_name'];?></td>
                        <td style="text-align:center;">
                            <?php if(cv('article.cate.editcate')) { ?>
                                <a class='btn btn-default nav-edit' href="javascript:;"><i class="fa fa-edit"></i></a>
                                <?php  } else { ?>-
                            <?php  } ?>
                            <?php if(cv('article.cate.delcate')) { ?>
                                <a class='btn btn-default nav-del' href="javascript:;"><i class="fa fa-trash-o"></i></a>
                                <?php  } else { ?>-
                            <?php  } ?>
                        </td>
                    </tr>
                    <?php  } } ?> 
                <?php  } ?>
            </tbody>
        </table>
        <?php  echo $pager;?>
    </div>
    <div class='panel-footer'>
        <a class="btn btn-default" href="<?php  echo $this->createPluginWebUrl('article')?>"><i class="fa fa-reply"></i> 返回文章列表</a>
        <?php if(cv('article.cate.addcate')) { ?>
            <a class="btn btn-default nav-add" href="javascript:;"><i class="fa fa-plus"></i> 添加文章分类</a>
        <?php  } ?>
    </div>
</div>
<!-- 编辑/保存 分类 -->
    <div id="modal-add" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="width:600px;margin:0px auto;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                    <h3>loading...</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group" style="overflow:hidden;">
                        <label class="col-xs-12 col-sm-3 col-md-2 control-label" style='width: 100px; line-height:34px;'>分类名称:</label>
                        <div class="col-sm-9 col-xs-12" style='width: 450px'>
                            <input type="hidden" name="category_id" id="category_id" class="form-control" />
                            <input type="text" name="category_name" id="category_name" class="form-control" />
                        </div>
                    </div>
                    <div id="module-menus"></div>
                </div>
                <div class="modal-footer">
                    <a class="btn btn-primary span2 nav-save">保存</a>
                    <a href="#" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</a>
                </div>
            </div>
        </div>
    </div>
<script>
    $(function(){
        $("tbody").on("click",".nav-del",function(){
            var cid = $(this).parent().parent().attr("cid")
            if(confirm("确定要删除？此操作不可恢复！")){ 
                $.ajax({
                    type: 'POST',
                    url: "<?php  echo $this->createPluginWebUrl('article',array('method'=>'api','apido'=>'delcategory'))?>",
                    data: {cid:cid}, 
                    dataType:'json',
                    success: function(data){
                        if(data.result=='success'){
                            $("tr[cid="+cid+"]").fadeOut();
                        }
                        else if(data.result=='error2'){
                            alert("删除失败！请先删除分类下的文章后重试");
                        }
                        else{
                            alert('删除失败！文章分类已删除或不存在！请刷新页面重试');
                        }
                    }
                });
            }
        });
        $(".nav-add").click(function(){
            $("#modal-add .modal-header h3").text("添加分类");
            $("#category_id").val("");
            $("#category_name").val("");
            $("#modal-add").modal();
        });
        $("tbody").on("click",".nav-edit",function(){
            var cid = $(this).parent().parent().attr("cid");
            var cname = $(this).parent().parent().attr("cname");
            if(!cid){
                alert("参数错误! 点击确定刷新页面");
                location.reload();
                return;
            }
            $("#modal-add .modal-header h3").text("编辑分类");
            $("#category_id").val(cid);
            $("#category_name").val(cname);
            $("#modal-add").modal();
        });
        $(".nav-save").click(function(){
            var cid = $("#category_id").val();
            var cname = $("#category_name").val();
            if(!cname){
                $("#category_name").focus();
                alert("分类名称不能为空！");
                return;
            }
            $.ajax({
                    type: 'POST',
                    url: "<?php  echo $this->createPluginWebUrl('article',array('method'=>'api','apido'=>'postcategory'))?>",
                    data: {cid:cid,cname:cname}, 
                    dataType:'json',
                    success: function(data){
                        if(data.result=='success-add' && data.cid && data.cname){
                            var html = "<tr cid="+data.cid+" cname="+data.cname+">";
                                  html+="<td class='cid'>"+data.cid+"</td>";
                                  html+="<td class='cname'>"+data.cname+"</td>";
                                  html+="<td style='text-align:center;'>";
                                  html+="<a class='btn btn-default nav-edit' href='javascript:;'><i class='fa fa-edit'></i></a>";
                                  html+="<a class='btn btn-default nav-del' href='javascript:;'><i class='fa fa-trash-o'></i></a>";
                                  html+="</td>";
                                  html+="</tr>";
                            $("tbody").append(html);
                            $(".noarticle").remove();
                            var num = $("#categorynum").text();
                            $("#categorynum").text(parseInt(num)+1);
                            $("#modal-add .close").click();
                        }
                        else if (data.result=='success-edit') {
                            $("tr[cid="+cid+"]").find("td[class=cname]").text(data.cname);
                            $("#modal-add .close").click();
                        }
                        else{
                            alert(data.desc);
                        }
                    }
            });
        });
    });
</script>
<?php  } else if($operation == 'other') { ?>
<div class='panel panel-default form-horizontal form'>
    <div class='panel-heading'>其他设置</div>
    <div class='panel-body'>
        <div class="form-group" style="padding-top:20px;">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">奖励发放通知</label>
            <div class="col-sm-9 col-xs-12">
                <input type="text" name="article_message" class="form-control" value="<?php  echo $article_sys['article_message'];?>" />
                <div class="help-block">公众平台模板消息编号: OPENTM200605630 (同分销 任务处理通知 一个模板id)</div>
            </div>
        </div>
        <div class="form-group" style="padding-top:20px;">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">文章列表标题</label>
            <div class="col-sm-9 col-xs-12">
                <input type="text" name="article_title" class="form-control" value="<?php  echo $article_sys['article_title'];?>" placeholder="文章列表页面标题与封面标题同为此标题" />
            </div>
        </div>
        <div class="form-group" style="padding-top:20px;">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">文章列表图片</label>
            <div class="col-sm-9 col-xs-12">
                <?php  echo tpl_form_field_image('article_image', $article_sys['article_image'])?>
            </div>
        </div>
        <div class="form-group" style="padding-top:20px;">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">文章列表默认数量</label>
            <div class="col-sm-9 col-xs-12">
                <input type="text" name="article_shownum" class="form-control" value="<?php  echo $article_sys['article_shownum'];?>" placeholder="空则默认显示20条记录" />
                <span class="help-block">提示：默认模板(列表)时限制文章显示数量，历史消息样式模板时限制显示天数</span>
            </div>            
        </div>
        <div class="form-group" style="padding-top:20px;">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">文章列表默认模板</label>
            <div class="col-sm-9 col-xs-12">
                <label for="article_temp_0" class="radio-inline"><input type="radio" name="article_temp" value="0" id="article_temp_0" <?php  if($article_sys['article_temp']==0) { ?>checked="cheaked"<?php  } ?>> 默认模板(列表)</label>
                <label for="article_temp_1" class="radio-inline"><input type="radio" name="article_temp" value="1" id="article_temp_1" <?php  if($article_sys['article_temp']==1) { ?>checked="cheaked"<?php  } ?>> 历史消息样式</label>
                <label for="article_temp_2" class="radio-inline"><input type="radio" name="article_temp" value="2" id="article_temp_2" <?php  if($article_sys['article_temp']==2) { ?>checked="cheaked"<?php  } ?>> 分类列表样式</label>
            </div>
        </div> 
        <div class="form-group" style="padding-top:20px;">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">文章列表进入关键字</label>
            <div class="col-sm-9 col-xs-12">
                <input type="text" name="article_keyword" class="form-control" value="<?php  echo $article_sys['article_keyword'];?>" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
            <div class="col-sm-9">
                <span  class="btn btn-primary col-lg-1" id='save'>保存</span>
            </div> 
        </div>
    </div>
</div>
<script>
    $(function(){
        $("#save").click(function(){
            var article_message = $("input[name=article_message]").val();
            var article_title = $("input[name=article_title]").val();
            var article_image = $("input[name=article_image]").val();
            var article_shownum = $("input[name=article_shownum]").val();
            var article_keyword = $("input[name=article_keyword]").val();
            var article_temp = $("input[name=article_temp]:checked").val();

            if(!article_title){
                $("input[name=article_title]").focus();
                alert('文章封面标题不能为空！');
                return;
            }
            if(!article_keyword){
                $("input[name=article_keyword]").focus();
                alert('文章列表页面关键字不能为空！');
                return;
            }
            $.ajax({
                type: 'POST',
                url: "<?php  echo $this->createPluginWebUrl('article',array('method'=>'api','apido'=>'savesys'))?>",
                data: {
                    article_message:article_message,
                    article_title:article_title,
                    article_image:article_image,
                    article_shownum:article_shownum,
                    article_keyword:article_keyword,
                    article_temp:article_temp
                }, 
                dataType:'json',
                success: function(data){
                    if(data.result=='success'){
                        alert("保存成功！");
                        //console.log()
                    }
                    else if(data.result=='err-key'){
                        alert("保存失败！关键字已存在")
                        //console.log(data.desc);
                    }
                }
            });
        });
    });
</script>
<?php  } else if($operation == 'list_read') { ?>
<div class="panel panel-default">
    <div class="panel-heading"> 数据统计 (id: <?php  echo $aid;?>)</div>
    <div class="panel-body">
        <div class="alert alert-info">
            <p>文章标题：<?php  echo $article['article_title'];?></p>
            <p>文章分类：<?php  echo $article['category_name'];?></p>
            <p>触发关键字：<?php  echo $article['article_keyword'];?></p>
            <p>创建时间：<?php  echo $article['article_date'];?></p>
            <p>阅读量(真实+虚拟=总数)：<?php  echo intval($article['article_readnum'])?> + <?php  echo intval($article['article_readnum_v'])?> = <?php  echo intval($article['article_readnum_v'])+intval($article['article_readnum'])?></p>
            <p>点赞数(真实+虚拟=总数)：<?php  echo intval($article['article_likenum'])?> + <?php  echo intval($article['article_likenum_v'])?> = <?php  echo intval($article['article_likenum_v'])+intval($article['article_likenum'])?></p>
            <p>积分累计发放数量：<?php  echo $add_credit;?> 积分</p>
            <p>余额累计发放数量：<?php  echo $add_money;?> 元</p>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th style="width:80px;">记录ID</th>
                    <th style="width:300px;">会员昵称</th>
                    <th style="width:100px; text-align:center;">阅读次数</th>
                    <th style="width:100px; text-align:center;">点赞状态</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                 <?php  if(empty($list_reads)) { ?>
                        <tr>
                            <td  colspan="7" style="line-height:30px;">没有查询到记录！</td>
                        </tr>
                 <?php  } else { ?>
                    <?php  if(is_array($list_reads)) { foreach($list_reads as $list_read) { ?>
                       <tr style="border-bottom:0px;">
                           <td><?php  echo $list_read['id'];?></td>
                           <td><?php  if(!empty($list_read['nickname'])) { ?><?php  echo $list_read['nickname'];?><?php  } else { ?>* 未更新用户信息<?php  } ?></td>
                           <td style="text-align:center;"><?php  echo $list_read['read'];?></td>
                           <td style="text-align:center;">
                           <?php  if($list_read['like']==1) { ?>
                               <label class="label label-success">已点赞</label>
                           <?php  } else { ?>
                               <label class="label label-default">未点赞</label>
                           <?php  } ?>
                           </td>
                           <td></td>
                       </tr>
                   <?php  } } ?>
                       <tr>
                           <?php  if(!empty($pager)) { ?>
                               <td colspan="5"><?php  echo $pager;?></td>
                           <?php  } ?>
                       </tr>
                <?php  } ?>
            </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <a class="btn btn-default" href="<?php  echo $this->createPluginWebUrl('article')?>"><i class="fa fa-reply"></i> 返回文章列表</a>
        <a class="btn btn-default" href="<?php  echo $this->createPluginWebUrl('article',array('op'=>'list_share','aid'=>$_GPC['aid']))?>" style="margin-left:10px;"><i class="fa fa-list"></i> 查看分享记录</a>
    </div>
</div>
<?php  } else if($operation == 'list_share') { ?>
<div class="panel panel-default">
    <div class="panel-heading"> 数据统计 (id: <?php  echo $aid;?>)</div>
    <div class="panel-body">
        <div class="alert alert-info">
            <p>文章标题：<?php  echo $article['article_title'];?></p>
            <p>文章分类：<?php  echo $article['category_name'];?></p>
            <p>触发关键字：<?php  echo $article['article_keyword'];?></p>
            <p>创建时间：<?php  echo $article['article_date'];?></p>
            <p>阅读量(真实+虚拟=总数)：<?php  echo intval($article['article_readnum'])?> + <?php  echo intval($article['article_readnum_v'])?> = <?php  echo intval($article['article_readnum_v'])+intval($article['article_readnum'])?></p>
            <p>点赞数(真实+虚拟=总数)：<?php  echo intval($article['article_likenum'])?> + <?php  echo intval($article['article_likenum_v'])?> = <?php  echo intval($article['article_likenum_v'])+intval($article['article_likenum'])?></p>
            <p>积分累计发放数量：<?php  echo $add_credit;?> 积分</p>
            <p>余额累计发放数量：<?php  echo $add_money;?> 元</p>
        </div>
        <table class="table">
                    <thead>
                        <tr>
                            <th style="width:80px;">记录ID</th>
                            <th style="width:300px;">分享者</th>
                            <th style="width:300px;">点击者</th>
                            <th style="width:150px; text-align:center;">点击时间</th>
                            <th style="width:150px; text-align:center;">为分享者增加的积分</th>
                            <th style="width:150px; text-align:center;">为分享者增加的余额</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php  if(empty($list_shares)) { ?>
                        <tr>
                            <td  colspan="7" style="line-height:30px;">没有查询到记录！</td>
                        </tr>
                        <?php  } else { ?>
                            <?php  if(is_array($list_shares)) { foreach($list_shares as $list_share) { ?>
                                <tr style="border-bottom:0px;">
                                    <td><?php  echo $list_share['id'];?></td>
                                    <td><?php  if(!empty($list_share['share_user'])) { ?><?php  echo $list_share['share_user'];?><?php  } else { ?>* 未更新用户信息<?php  } ?></td>
                                    <td><?php  if(!empty($list_share['click_user'])) { ?><?php  echo $list_share['click_user'];?><?php  } else { ?>* 未更新用户信息<?php  } ?></td>
                                    <td style="text-align:center;"><?php  echo date("Y-m-d H:m:s",$list_share['click_date'])?></td>
                                    <td style="text-align:center;"><?php  echo $list_share['add_credit'];?></td>
                                    <td style="text-align:center;"><?php  echo $list_share['add_money'];?>元</td>
                                    <td></td>
                                </tr>
                            <?php  } } ?>
                            <tr>
                                <?php  if(!empty($pager)) { ?>
                                    <td colspan="7"><?php  echo $pager;?></td>
                                <?php  } ?>
                            </tr>
                        <?php  } ?>
                    </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <a class="btn btn-default" href="<?php  echo $this->createPluginWebUrl('article')?>"><i class="fa fa-reply"></i> 返回文章列表</a>
        <a class="btn btn-default" href="<?php  echo $this->createPluginWebUrl('article',array('op'=>'list_read','aid'=>$_GPC['aid']))?>" style="margin-left:10px;"><i class="fa fa-list"></i> 查看阅读/点赞记录</a>
    </div>
</div>
<?php  } else if($operation == 'report') { ?>
<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">筛选</div>
        <div class="panel-body">
            <form action="./index.php" method="get" class="form-horizontal" role="form">
                <input type="hidden" name="c" value="site">
                <input type="hidden" name="a" value="entry">
                <input type="hidden" name="m" value="ewei_shop">
                <input type="hidden" name="do" value="plugin">
                <input type="hidden" name="p" value="article">
                <input type="hidden" name="op" value="report">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-1 control-label">筛选</label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="row row-fix tpl-category-container">
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <select class="form-control tpl-category-parent" name="aid">
                                            <option value="">全部文章</option>
                                            <?php  if(is_array($articles)) { foreach($articles as $article) { ?>
                                                <option value="<?php  echo $article['id'];?>" <?php  if($_GPC['aid']==$article['id']) { ?>selected="selected"<?php  } ?>><?php  echo $article['article_title'];?></option>
                                            <?php  } } ?>
                                    </select>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3" style='padding:0px 10px;'>
                                    <select class="form-control tpl-category-parent" name="cid">
                                            <?php  if(is_array($categorys)) { foreach($categorys as $ccid => $cname) { ?>
                                                <option value="<?php  echo $ccid;?>" <?php  if($_GPC['cid']==$ccid) { ?>selected="selected"<?php  } ?>><?php  echo $cname;?></option>
                                            <?php  } } ?>
                                    </select>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-lg-9" style="width:400px;">
                                <input class="form-control" name="keyword" id="" type="text" value="<?php  echo $_GPC['keyword'];?>" placeholder="请输入举报内容关键字进行检索（选择分类减小检索范围）">
                            </div>
                            <div class="col-xs-12 col-sm-2 col-lg-2">
                        <button class="btn btn-default"><i class="fa fa-search"></i> 搜索</button>
                    </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 举报列表 -->
<div class='panel panel-default'>
    <div class='panel-heading'> 举报记录 <?php  if($reportnum) { ?>(总数: <?php  echo $reportnum;?>)<?php  } ?></div>
    <div class='panel-body'>
        <table class="table" style="width:1190px;">
            <thead>
                <tr>
                    <th style="width:60px; text-align: center;">ID</th>
                    <th style="width:100px; text-align: center;">会员ID</th>
                    <th style="width:150px;">会员名字</th>
                    <th style="width:100px; text-align: center;">文章ID</th>
                    <th style="width:250px;">文章标题</th>
                    <th style="width:150px; text-align: center;">违规分类</th>
                    <th style="width:600px;">举报描述</th>
                </tr>
            </thead>
            <tbody>
                <?php  if(!empty($datas)) { ?>
                    <?php  if(is_array($datas)) { foreach($datas as $data) { ?>
                        <tr>
                            <td style="text-align: center;"><?php  echo $data['id'];?></td>
                            <td style="text-align: center;"><?php  echo $data['mid'];?></td>
                            <td><?php  echo $data['nickname'];?></td>
                            <td style="text-align: center;"><?php  echo $data['aid'];?></td>
                            <td><?php  echo $data['article_title'];?></td>
                            <td style="text-align: center;"><?php  echo $data['cate'];?></td>
                            <td style="word-break:break-all"><?php  echo $data['cons'];?></td>
                        </tr>
                    <?php  } } ?>
                <?php  } else { ?>
                    <tr> 
                        <td style="text-align: center; line-height: 100px;" colspan="7"><?php  if(!empty($_GPC['cid']) || !empty($_GPC['keyword']) || !empty($_GPC['aid'])) { ?>啊哦~没有搜索到相关记录哦~<?php  } else { ?>亲~您的文章还没有被举报过哦~<?php  } ?></td>
                    </tr>
                <?php  } ?>     
                <tr><td colspan="7" style="padding:0px; margin: 0px;"><?php  echo $pager;?></td></tr>
            </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <a class='btn btn-default' href="<?php  echo $this->createPluginWebUrl('article')?>"><i class="fa fa-reply"></i> 返回文章列表</a>
    </div>
</div>
<?php  } ?>

<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('web/_footer', TEMPLATE_INCLUDEPATH)) : (include template('web/_footer', TEMPLATE_INCLUDEPATH));?>