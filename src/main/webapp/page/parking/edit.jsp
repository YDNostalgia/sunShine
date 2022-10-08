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
                <select name="communityName" lay-filter="communityName" id="communityName" lay-search="">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="we-red">*</span>车位编号
            </label>
            <div class="layui-input-inline">
                <input  type="text" name="parkingNumber" id="parkingNumber" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="we-red">*</span>车位名称
            </label>
            <div class="layui-input-inline">
                <input type="text"  name="parkingName" id="parkingName" autocomplete="off" class="layui-input">
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

                $("#communityName").html(OptionStr);
                form.render('select');

                $("#id").val("${parking.id}");
                $("#communityName").val("${parking.communityName}");
                $("#parkingNumber").val("${parking.parkingNumber}");
                $("#parkingName").val("${parking.parkingName}");
            }
        })


        form.on('submit(save)',function (data) {
            console.log(data.field.sex)
            $.ajax({
                type: "post",
                url: "update",
                async:false,
                data: "id="+data.field.id+ "&communityName="+data.field.communityName+"&parkingNumber="+data.field.parkingNumber+ "&parkingName="+data.field.parkingName,
                dataType:'json',
                success:function(obj){
                    alert("成功")
                    if(obj.code === 0){//成功
                        //刷新表格
                        window.parent.location.reload();
                    }

                    var iframeIndex = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(iframeIndex);
                },
                error:function () {
                    alert("错误")
                    window.parent.location.reload();
                }
            });
        })
    })
</script>
</html>
