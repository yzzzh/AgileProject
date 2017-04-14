<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YZH
  Date: 2017/4/14
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>球员详情</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="/static/js/echarts.min.js"></script>
</head>
<body>
<div class="container">
    <h1>球员详情</h1>
    <h2>${playerName}</h2>

    <table class="table table-bordered table-striped" id = "players">
        <tr>
            <th>Season</th>
            <th>Age</th>
            <th>Points</th>
            <th>Games</th>
            <th>League</th>
            <th>Team</th>
        </tr>

        <c:forEach items="${playerList}" var="player">
            <tr>
                <td>${player.season}</td>
                <td>${player.age}</td>
                <td>${player.pts}</td>
                <td>${player.g}</td>
                <td>${player.lg}</td>
                <td>${player.teamName}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    var table = document.getElementById("players");
    var xSeasons = new Array();
    var yPoints = new Array();
    for(var i=1;i<table.rows.length;i++)
    {
        xSeasons[i-1] = table.rows[i].cells[0].innerHTML;
        yPoints[i-1] = table.rows[i].cells[2].innerHTML;
    }
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '球员得分'
        },
        tooltip: {},
        legend: {
            data:['得分']
        },
        xAxis: {
            data: xSeasons
        },
        yAxis: {},
        series: [{
            name: '得分',
            type: 'bar',
            data: yPoints
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>