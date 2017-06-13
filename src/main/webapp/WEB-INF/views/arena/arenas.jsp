<%--
  Created by IntelliJ IDEA.
  User: YZH
  Date: 2017/6/9
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="nba statics analysis">
    <meta name="author" content="BN">

    <title>Arenas</title>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" class="navbar navbar-default navbar-fixed-top ">
    <link href="/static/css/agilecss.css" rel="stylesheet">

    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/static/js/echarts.min.js"></script>
</head>
<body  background="/static/image/arenas.jpg" style="background-size: cover">
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
                <li><a href="/players">PLAYERS</a></li>
                <li><a href="/teams">TEAMS</a></li>
                <li><a href="/coaches">COACHES</a></li>
                <li class="active"><a href="/arenas">ARENAS</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mycontainer tableContainer">
    <div class="row">
        <div class="col-md-2 col-md-push-2 indexContainer">

            <div class="form-group mysearch">
                <input type="text" id="arenaName" class="form-control" placeholder="Search" onkeypress="findArena()"/>
            </div>

            <div class="user-option sidebar slide">
                <ul class="nav nav-sidebar slide">
                    <c:forEach items="${arenaList}" var="arena">
                        <li >
                        <a href="/arenas/${arena}">${arena}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="col-md-6 col-md-push-2 ">
            <div id="detailContainer" class="detail">
                <c:if test="${!empty arenaDetailList}">
                    <header>${arenaName}</header>
                    <table id="detailTable" class="table mytable">
                        <tr>
                            <th>所属球队</th>
                            <th>Start-End</th>
                            <th>位置</th>
                            <th>容量</th>
                        </tr>
                        <c:forEach items="${arenaDetailList}" var="arenaDetail">
                            <tr>
                                <td><a href="/teams/${arenaDetail.arenaTeam}">${arenaDetail.arenaTeam}</a></td>
                                <td>${arenaDetail.arenaStartEnd}</td>
                                <td>${arenaDetail.arenaLocation}</td>
                                <td>${arenaDetail.arenaCapacity}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
            <div class=detail style="height:500px;overflow: auto">
                <div id="main" style="height:500px;"></div>
            </div>
        </div>
    </div>
    <!--<div class="row col-md-2 col-md-push-2 detail" style="height:500px;width:1000px">
        <div style="height:500px;width:1000px;overflow: auto">
            <div id="main" style="height:500px;width: 1000px"></div>
        </div>
    </div>-->
</div>
<script>
    function findArena()
    {
        if (event.keyCode == 13) {
            var arenaName = document.getElementById("arenaName").value;
            location.href = "/arenas/" + arenaName;
        }
    }
</script>
<script>
    var pageName = 'arenas';
</script>
<script src="/static/js/myjs.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '球馆人数',
            textStyle: {
                color: '#fff',
                align:'center'
            }
        },
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '10%',
            containLabel: true
        },
        yAxis : [
            {
                type : 'category',
                data : ['Superdome','MunicipalAuditorium','Kingdome','Alamodome','CharlotteColiseum','HubertH.HumphreyMetrodome','SkyDome','Silverdome','UnitedCenter','GeorgiaDome','ModaCenter','VerizonCenter','PalaceofAuburnHills','StaplesCenter','QuickenLoansArean'].reverse(),
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        xAxis : [
            {
                type : 'value'
            }
        ],
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
        series : [
            {
                name:'人数',
                type:'bar',
                barWidth: '60%',
                data:[55675,55675,40192,25557,24042,23000,22911,22366,21711,21570,21538,21500,21454,21000,20562].reverse()
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>