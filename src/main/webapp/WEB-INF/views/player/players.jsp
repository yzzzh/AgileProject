<%--
  Created by IntelliJ IDEA.
  User: YZH
  Date: 2017/6/9
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="nba statics analysis">
    <meta name="author" content="BN">

    <title>Players</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" class="navbar navbar-default navbar-fixed-top ">
    <link href="/static/css/agilecss.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://manos.malihu.gr/repository/custom-scrollbar/demo/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="/static/js/echarts.min.js"></script>
</head>
<body  background="/static/image/players.jpg" style="background-size: cover">
<nav class="navbar navbar-default navbar-fixed-top mynav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">NBA盒子</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="/players">PLAYERS</a></li>
                <li><a href="/teams">TEAMS</a></li>
                <li><a href="/coaches">COACHES</a></li>
                <li><a href="/arenas">ARENAS</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mycontainer tableContainer">
    <div class="row">
        <div class="col-md-2 col-md-push-2 indexContainer">
            <div class="form-group mysearch">
                <input type="text" id="playerName" class="form-control" placeholder="Search" onkeypress="findPlayer()">
            </div>

            <div  class="user-option sidebar slide" >
                <ul class="nav nav-sidebar indexItem">
                    <c:forEach items="${playerList}" var="player">
                        <li >
                            <a href="/players/${player}">${player}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="col-md-6 col-md-push-2">
            <div id="detailContainer" class="detail">
                <c:if test="${!empty playerDetailList}">
                    <header>${playerName}</header>
                    <table id="detailTable" class="table mytable">
                        <tr>
                            <th>赛季</th>
                            <th>年龄</th>
                            <th>分数</th>
                            <th>比赛场次</th>
                            <th>联盟</th>
                            <th>所属队伍</th>
                        </tr>
                        <c:forEach items="${playerDetailList}" var="playerDetail">
                            <tr>
                                <td>${playerDetail.season}</td>
                                <td>${playerDetail.age}</td>
                                <td>${playerDetail.pts}</td>
                                <td>${playerDetail.g}</td>
                                <td>${playerDetail.lg}</td>
                                <td><a href="/teams/${playerDetail.teamName}">${playerDetail.teamName}</a></td>
                            </tr>
                        </c:forEach>
                    </table>

                </c:if>
            </div>
            <c:if test="${!empty playerDetailList}">
            <div class="detail"style="overflow: auto">
                <div id="main" style="max-height: 400px; height: 1000px">
                </div>

            </div>
            </c:if>
        </div>
    </div>
    <!--<c:if test="${!empty playerDetailList}">
        <div class="row col-md-2 col-md-push-2 indexContainer" style="width: 600px;height:400px">
            <div id="main" style="width: 600px;height:400px"></div>
        </div>
    </c:if>-->
</div>
<script>
    function findPlayer()
    {
        if (event.keyCode == 13) {
            var playerName = document.getElementById("playerName").value;
            location.href = "/players/" + playerName;
        }
    }
</script>
<script>
    var pageName = 'players';
</script>
<script src="/static/js/myjs.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    var table = document.getElementById('detailTable');
    var xSeasons = new Array();
    var yPoints = new Array();
    for(var i=1;i<table.rows.length;i++)
    {
        xSeasons[i-1] = table.rows[i].cells[0].innerHTML;
        yPoints[i-1] = table.rows[i].cells[2].innerHTML;
    }
    xSeasons.reverse()
    yPoints.reverse()
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '球员得分',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip: {},
        legend: {
        },
        xAxis: {
            data: xSeasons,
        },
        yAxis: {},
        axisLabel: {
            show: true,
            textStyle: {
                color: '#fff'
            }
        },
        axisLine:{
            lineStyle:{
                color:'#fff',
                width:8,//这里是为了突出显示加上的，可以去掉
            }
        },
        series: [{
            name: '得分',
            type: 'bar',
            barWidth: '60%',
            data: yPoints
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>