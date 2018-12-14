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
<form action="Update" method="post">
    <div class="container" class="text-center " style="width: 80%">
        <table class="table table-striped table-hover table-bordered">
            <caption>修改用户</caption>

            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">ID  </span>
                        <input type="text" id="classid" name="classid" class="form-control" aria-describedby="basic-addon1" value="${user.classid}">
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon2" >User </span>
                        <input type="text" id="username" name="username" class="form-control" value="${user.username}" aria-describedby="basic-addon1">
                    </div>
                </td>
            </tr>


            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon3">Pwd</span>
                        <input type="text" id="password" name="password" class="form-control" value="${user.password}" aria-describedby="basic-addon1">
                    </div>
                </td>
            </tr>
        <tr align="center">
            <td>
            <button type="submit" id="btn1" class="btn btn-success">修改</button>
            <button type="button" class="btn btn-warning" onclick="fn()">返回</button>
            </td>
        </tr>
    </table>
    </div>
</form>
</body>
<%--<!--必须要先引入jQuery库--> <script type="text/javascript" src="/library/js/jquery-1.4.4.min.js"></script> <script>--%>
    <%--$(function(){--%>
        <%--$("btn1").click(function(){--%>
            <%--$.ajax({--%>
                <%--//发送请求URL，可使用相对路径也可使用绝对路径--%>
                <%--url:"${pageContext.request.contextPath}/Update",--%>
                <%--//发送方式为GET，也可为POST，需要与后台对应--%>
                <%--type:"post",--%>
                <%--//设置接收格式为JSON--%>
                <%--dataType:"json",--%>
                <%--//编码设置--%>
                <%--contentType:"application/json;charset=utf-8",--%>
                <%--//向后台发送的数据--%>
                <%--data:{--%>
                    <%--classid:$("#classid").val(),--%>
                    <%--username:$("#username").val(),--%>
                    <%--password:$("#password").val(),--%>
                    <%----%>
                <%--},--%>
                <%--//后台返回成功后处理数据，data为后台返回的json格式数据--%>
                <%--success:function(data){--%>
                    <%--if(data != null){--%>
                        <%--$("#classid").val(data.classid);--%>
                        <%--$("#username").val(data.haveNum);--%>
                        <%--$("#password").val(data.name);--%>
                    <%--}--%>
                    <%--else{--%>
                        <%--$("#bookName").val("该书籍不存在");--%>
                    <%--}--%>
                <%--}--%>
                <%--//查询错误处理--%>
                <%--error:function(){--%>
                    <%--$("#bookName").val("查询异常");--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>
    <%--});--%>

<%--</script>--%>
<script>
    function fn() {
        location.href="${pageContext.request.contextPath}/findUsers";
    }

</script>



</html>
