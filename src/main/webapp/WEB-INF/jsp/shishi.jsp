<%--
  Created by IntelliJ IDEA.
  User: cxx
  Date: 2018/12/12
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input class="form-control" id="username" name="username" type="text"/>
<input class="form-control" id="password" name="password" type="password"/>
<button type="button" onclick="loginSubmit()">立即登录</button>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script>
    function loginSubmit() {
        var username = $("#username").val(); // 获取id为username的<input>框数据
        var password = $("#password").val(); // 获取id为password的<input>框数据
        // 判断
        if (username.length == 0) {
            $("#username").tips({msg: "请输入用户名。"});
            return;
        }
        if (password.length == 0) {
            $("#password").tips({msg: "请输入密码。"});
            return;
        }
        // Ajax提交数据
        $.ajax({
            url: "${pageContext.request.contextPath}/check_login",
         // 提交到controller的url路径
            type: "post",
            // 提交方式
            data: {"username": username, "password": password},
        // data为String类型，必须为 Key/Value 格式。
            dataType: "json",
            // 服务器端返回的数据类型
            success: function (data) {
        // 请求成功后的回调函数，
        //其中的参数data为controller返回的map,
        //也就是说,@ResponseBody将返回的map转化为JSON格式的数据，
        //然后通过data这个参数取JSON数据中的值
                if (data.message == "success") {
                    //跳转到系统首页
                     alert("1111")
                $(location).attr("href","toLogin")
                } else {
                    alert("2222") }
                    }, }); }


</script>

</html>
