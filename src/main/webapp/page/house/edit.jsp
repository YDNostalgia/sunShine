<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
<%--    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>--%>
    <script src="../../layui-v2.7.6/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../layui-v2.7.6/layui/css/layui.css" media="all">
    <style type="text/css">
        #main-body{
            margin-top: 5%;
            padding-left:30% ;
        }
    </style>
</head>
<body>
<div id="main-body">
    <form class="layui-form">

        <input type="hidden" name="id" id="id"  autocomplete="off" class="layui-input">
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="we-red">*</span>所属小区
            </label>
            <div class="layui-input-inline">
                <select name="community" lay-filter="community" id="community" >
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="we-red">*</span>楼栋名称
            </label>
            <div class="layui-input-inline">
                <input type="text" name="building"  id="building" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="we-red">*</span>房产编码
            </label>
            <div class="layui-input-inline">
                <input type="text" name="estateCodes" id="estateCodes" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="we-red">*</span>房产名称
            </label>
            <div class="layui-input-inline">
                <input type="text" name="estateName" id="estateName" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label f class="layui-form-label">
                <span class="we-red">*</span>户主名称
            </label>
            <div class="layui-input-inline">
                <input type="text" name="protagonist" id="protagonist" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="we-red">*</span>联系方式
            </label>
            <div class="layui-input-inline">
                <input type="text" name="contact" id="contact"  autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="we-red">*</span>房间数
            </label>
            <div class="layui-input-inline">
                <input  type="text" name="rooms" id="rooms" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="we-red">*</span>单元
            </label>
            <div class="layui-input-inline">
                <input  type="text" name="element" id="element" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="we-red">*</span>楼层
            </label>
            <div class="layui-input-inline">
                <input  type="text" name="floor" id="floor"  autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="we-red">*</span>描述
            </label>
            <div class="layui-input-inline">
                <input  type="text" name="depict" id="depict" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="save" >立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary" id="closeBtn" >重置</button>
            </div>
        </div>
    </form>
</div>
</body>

<script>
    layui.use([ 'jquery','form'], function() {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;

        $.ajax({
            type:'post',
            url:'../communityInformation/list',
            dataType:'json',
            success:function(data){
                //遍历
                var OptionStr = "";
                $.each(data,function(index,item){
                    OptionStr += "<option value='"+item.name+"'>"+item.name+"</option>"
                })

                $("#community").html(OptionStr);

                // form.render('select');//渲染整个表单 只是渲染表单中的某个组件，我们这里渲染select
                $("#id").val("${house.id}");
                $("#community").val("${house.community}");
                $("#building").val("${house.building}");
                $("#estateCodes").val("${house.estateCodes}");
                $("#estateName").val("${house.estateName}");
                $("#protagonist").val("${house.protagonist}");
                $("#contact").val("${house.contact}");
                $("#rooms").val("${house.rooms}");
                $("#element").val("${house.element}");
                $("#floor").val("${house.floor}");
                $("#depict").val("${house.depict}");
                form.render();
            }
        })


        // form.on('select',function () {
        //     var name=$("#community").val()
        //     $.ajax({
        //         type:'post',
        //         url:'../buildingsInformation/list',
        //         data:"name="+name,
        //         dataType:'json',
        //         success:function(data){
        //             //遍历
        //             var OptionStr = "";
        //             $.each(data,function(index,item){
        //                 OptionStr += "<option value='"+item.buildingName+"'>"+item.buildingName+"</option>"
        //             })
        //
        //             $("#building").html(OptionStr);
        //
        //             form.render('select');
        //         }
        //     })
        // })

        form.on('submit(save)',function (data) {
            $.ajax({
                type: "post",
                url: "update",
                async:false,
                data: "id="+data.field.id+"&community="+data.field.community+"&building="+data.field.building+"&estateCodes="+data.field.estateCodes + "&estateName="+data.field.estateName+"&protagonist="+data.field.protagonist + "&contact="+data.field.contact+"&rooms="+data.field.rooms+"&element="+data.field.element+"&floor="+data.field.floor + "&depict="+data.field.depict,
                dataType:'json',
                success:function(obj){
                    alert("成功")
                    console.log(obj.code)
                    if(obj.code === 0){//成功
                        //刷新表格
                        window.parent.location.reload();
                    }

                    var iframeIndex = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(iframeIndex);
                },
                error:function () {
                    alert("错误")
                }
            });
        })
    })
</script>
</html>
