<%--
  Created by IntelliJ IDEA.
  User: YZH
  Date: 2017/4/13
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>球队管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>球队列表</h1>
    <input type="text" id = "teamName"  style="width:100px"></input>
    <button type="button" onclick="findTeam()">查找</button>

    <!-- 如果用户列表非空 -->
    <c:if test="${!empty teamList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>球队名字</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${teamList}" var="coach">

                <tr>
                    <td>${coach.teamName}</td>
                    <td>
                        <a href="/team/detail/${coach.teamName}" type="button" class="btn btn-sm btn-danger">详情</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <a href = "/team/1" >首页</a>
    <c:if test="${currentPage>1}">
        <a href = "/team/${currentPage-1}" >上一页</a>
    </c:if>
    <c:if test="${currentPage==1}">
        <a href = "/team/1" aria-disabled="true">上一页</a>
    </c:if>
    <c:if test="${currentPage<pageCount}">
        <a href = "/team/${currentPage+1}" >下一页</a>
    </c:if>
    <c:if test="${currentPage==pageCount}">
        <a href = "/team/${pageCount}" aria-disabled="true">下一页</a>
    </c:if>
    <a href = "/team/${pageCount}" >尾页</a>
    第<input type="text" id = "page" value = ${currentPage} style="width:30px">页</input>/共${pageCount}页
    <button type="button" onclick="turnPage()" />跳转
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    function turnPage()
    {
        var page = document.getElementById("page").value;
        location.href="/team/"+page;
    }
    function findTeam()
    {
        var teamName = document.getElementById("teamName").value;
        location.href="/team/detail/"+teamName;
    }
</script>
</body>
</html>

