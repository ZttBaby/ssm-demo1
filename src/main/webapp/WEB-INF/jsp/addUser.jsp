<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<form>
    <div class="container" class="text-center " style="width: 80%">
        <table class="table table-striped table-hover table-bordered">
            <caption>添加新用户</caption>

            <tr>
                <td>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">ID  </span>
                    <input type="text" id="classid" name="classid" class="form-control" placeholder="如:大帅哥" aria-describedby="basic-addon1">
                </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon2" >User </span>
                        <input type="text" id="username" name="username" class="form-control" placeholder="如:a123123" aria-describedby="basic-addon1">
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon3">Pwd</span>
                        <input type="text" id="password" name="password" class="form-control" placeholder="如:c123123" aria-describedby="basic-addon1">
                    </div>
                </td>
            </tr>
        <tr align="center">
            <td>
            <button type="button" onclick="addSubmit()" name="btn1" class="btn btn-primary btn-sm" data-toggle="button" aria-pressed="false" autocomplete="off">
                保存
            </button>
            <button type="reset" name="btn2"  class="btn btn-danger btn-sm" data-toggle="button" aria-pressed="false" autocomplete="off">
                重置
            </button>
            </td>
        </tr>
    </table>
    </div>
</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script>
    function addSubmit() {
        var classid = $('#classid').val();//获取inpur的zhi
        var username = $('#username').val();
        var password = $('#password').val();

        if (username.length == 0) {
            $("#username").tips({msg: "请输入用户名。"});
            return;
        }
        if (password.length == 0) {
            $("#password").tips({msg: "请输入密码。"});
            return;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/addUser",
            type:"post",
            data:{"classid":classid,"username":username,"password":password},
            dataType:"json",
            success:function(d){
                if (d.message == "success") {
                    $(location).attr("href","findUsers")
                    alert("添加成功")
                }else{
                    $(location).attr("href","toaddUser")
                    alert("添加失败")
                }
            }
        });
    }
</script>
</html>
