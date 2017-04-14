<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YZH
  Date: 2017/4/14
  Time: 0:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>球队详情</title>

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
    <h1>球队详情</h1>
    <h2>${teamName}</h2>

    <table class="table table-bordered table-striped">
        <tr>
            <th>赛季</th>
            <th>球队缩写</th>
            <th>From</th>
            <th>To</th>
            <th>建队时间</th>
            <th>比赛场次</th>
            <th>赢球场次</th>
            <th>输球场次</th>
            <th>总冠军数</th>
            <th>主教练</th>
            <th>球馆</th>
        </tr>

        <c:forEach items="${teamList}" var="team">
            <tr>
                <td>${team.teamSeason}</td>
                <td>${team.teamAbbr}</td>
                <td>${team.teamFrom}</td>
                <td>${team.teamTo}</td>
                <td>${team.teamYrs}</td>
                <td>${team.teamG}</td>
                <td>${team.teamW}</td>
                <td>${team.teamL}</td>
                <td>${team.teamChamp}</td>
                <td>${team.teamCoaches}</td>
                <td>${team.arena}</td>
            </tr>
        </c:forEach>

    </table>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>