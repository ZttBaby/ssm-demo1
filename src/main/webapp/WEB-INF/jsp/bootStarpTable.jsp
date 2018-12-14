<%--
  Created by IntelliJ IDEA.
  User: cxx
  Date: 2018/12/13
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css">--%>
    <%--<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap-table.min.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/js/locale/bootstrap-table-zh-CN.js"></script>--%>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入bootstrap-table样式 -->
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <!-- jquery -->
    <script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> <!-- bootstrap-table.min.js -->
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script> <!-- 引入中文语言包 -->
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>

</head>
<body>

<table id="table"></table>

</table>

</body>
<script>
    $("#table").bootstrapTable({// 对应table标签的id//
        url:"${pageContext.request.contextPath}/Test1",
        // 获取表格数据的url
        cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
        striped: true, //表格显示条纹，默认为false
        pagination: true, // 在表格底部显示分页组件，默认false
        pageList: [5,10, 20], // 设置页面可以显示的数据条数
        pageSize: 5, // 页面数据条数
        pageNumber: 1, // 首页页码
        sidePagination: 'server', // 设置为服务器端分页
        queryParams: function (params) {
            // 请求服务器数据时发送的参数，
            // 可以在这里添加额外的查询参数，
            // 返回false则终止请求
            return {
                pageSize: params.limit, // 每页要显示的数据条数
                offset: params.offset, // 每页显示数据的开始行号
                sort: params.sort, // 要排序的字段
                sortOrder: params.order, // 排序规则
                dataId: $("#dataId").val() // 额外添加的参数
            }
        },
        sortName: 'id', // 要排序的字段
        sortOrder: 'desc', // 排序规则
        columns: [
            {
                checkbox: true,// 显示一个勾选框
                align: 'center' // 居中显示
            }, {
                field: 'username', // 返回json数据中的name
                title: '姓名', // 表格表头显示文字
                align: 'center', // 左右居中
                valign: 'middle' // 上下居中
            }, {
                field: 'password',
                title: '密码',
                align: 'center',
                valign: 'middle'
            }, {
                title: "操作",
                align: 'center',
                valign: 'middle',
                width: 160, // 定义列的宽度，单位为像素px
                formatter: function (value, row, index) {
                    return '<button class="btn btn-primary btn-sm" onclick="del(\'' + row.stdId + '\')">删除</button>';
                }
            }
        ],
        onLoadSuccess: function () { //加载成功时执行
            console.info("加载成功");
        },
        onLoadError: function () { //加载失败时执行
            console.info("加载数据失败");
        }
    })


</script>
</html>
