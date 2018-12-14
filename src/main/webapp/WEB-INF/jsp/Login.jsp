<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
</head>
<style>
    body {
        background: url("/ssm/images/5.jpg");
        background-size: 100%;
        animation-name: myfirst;
        animation-duration: 12s;
        /*变换时间*/
        animation-delay: 2s;
        /*动画开始时间*/
        animation-iteration-count: infinite;
        /*下一周期循环播放*/
        animation-play-state: running;
        /*动画开始运行*/
    }

    @keyframes myfirst {
        0% {
            background: url("/ssm/images/5.jpg");
            background-size: 100%;
        }
        34% {
            background: url("/ssm/images/6.jpg");
            background-size: 100%;
        }
        67% {
            background: url("/ssm/images/7.jpg");
            background-size: 100%;
        }
        100% {
            background: url("/ssm/images/5.jpg");
            background-size: 100%;
        }

    }

    .form {
        background: rgba(255, 255, 255, 0.2);
        background-size: 100%;
        width: 400px;
        margin: 120px auto;
    }

    /*阴影*/
    .fa {
        display: inline-block;
        top: 27px;
        left: 6px;
        position: relative;
        color: #ccc;
    }

    input[type="text"], input[type="password"] {
        padding-left: 26px;
    }

    .checkbox {
        padding-left: 21px;
    }

</style>
<body style="background: url(/images/2.jpg)">
<div class="container">
    <div class="form row">
        <%--<form action="check" method="post">--%>
            <table>
                <div class="form-horizontal col-md-offset-3" id="login_form"><h3 class="form-title">LOGIN</h3>
                    <div class="col-md-9">
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <input class="form-control required"
                                   type="text" placeholder="Username"
                                   id="username" name="username"
                                   autofocus="autofocus" maxlength="20"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required"
                                   type="password" placeholder="Password"
                                   id="password" name="password"
                                   maxlength="8"/></div>
                        <div class="form-group"><label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label></div>
                        <div class="form-group col-md-offset-9">
                            <button type="button" onclick="loginSubmit()" class="btn btn-success pull-right">登录</button>
                        </div>
                    </div>
                </div>
            </table>
        <%--</form>--%>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script>
    function loginSubmit() {
        var username = $('#username').val();
        var password = $('#password').val();
        // 判断
        if (username.length == 0) {
            $("#username").tips({msg: "请输入用户名。"});
            return;
        }
        if (password.length == 0) {
            $("#password").tips({msg: "请输入密码。"});
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/check_login",
            type:"post",
            data:{"username":username,"password":password},
            dataType:"json",
            success:function(d) {
                if (d.message == "success") {
                    $(location).attr("href","findUsers")
                    alert("欢迎您")
                }else{
                    $(location).attr("href","toLogin")
                    alert("用户名密码错误")
                }
            }
        });
    }
</script>

</html>
