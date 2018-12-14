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
<style>
    .col-lg-6{
        float: none;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>

<body>
<form action="Search" method="get">

<div class="container" class="text-center " style="width: 80%">
<table class="table table-striped table-hover table-bordered">
    <caption>搜索页面</caption>

    <tr>
    <td colspan="4">
            <div class="col-lg-6" align="center"  >
                <div id="div1">
                    <a href="toaddUser">添加用户</a>
                </div>
                <div class="input-group" id="div2">
                    <input type="text" name="search" class="form-control" placeholder="Search for..." value="${pageInfo.search}">
                    <span class="input-group-btn">
        <button class="btn btn-default" type="submit">Go!</button>
      </span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->

        </td>
    </tr>

    <tr>
        <td>id</td>
        <td>用户名</td>
        <td>密码</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${Users}" var="user">
        <tr>
            <td>${user.classid}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td>
                <a href="toUpdate?classid=${user.classid}">修改</a>
                <a href="deleteuser?classid=${user.classid}">删除</a>
            </td>
        </tr>
    </c:forEach>
    <tr align="center">
    <td colspan="4">
        <nav aria-label="Page navigation">
        <ul class="pagination">
        <c:if test="${pageInfo.pageIndex==1}">
                <li>
                        <span aria-hidden="true">上一页</span>
                </li>
        </c:if>
        <c:if test="${pageInfo.pageIndex!=1}">
                <li><a href="${pageContext.request.contextPath }/Search?page1=${pageInfo.pageIndex-1}&search=${pageInfo.search}">上一页</a></li>
        </c:if>

        <c:forEach begin="1" end="${pageInfo.totalPage}" var="page">

            <c:if test="${page==pageInfo.pageIndex  }">
                <li><span aria-hidden="true"><font color="red">${page }</font></span></li>
            </c:if>
             <c:if test="${page!=pageInfo.pageIndex  }">
           <li> <a href="${pageContext.request.contextPath }/Search?page1=${page}">${page }</a></li>
            </c:if>

        </c:forEach>

        <c:if test="${pageInfo.pageIndex==pageInfo.totalPage}">
            <li><span aria-hidden="true">下一页</span></li>
        </c:if>
        <c:if test="${pageInfo.pageIndex!=pageInfo.totalPage}">
            <li><a href="${pageContext.request.contextPath }/Search?page1=${pageInfo.pageIndex+1}&search=${pageInfo.search}">下一页</a></li>
        </c:if>
        </ul>
        </nav>
    </td>
    </tr>
    <tr>
        <td colspan="4"><button id="btn1" type="button" onclick="fn1()">回去</button></td>

    </tr>
</table>


    </div>
</form>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    function fn1() {
        location.href="${pageContext.request.contextPath}/findUsers";
    }
</script>
</body>
</html>
