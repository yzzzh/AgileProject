<%--
  Created by IntelliJ IDEA.
  User: YZH
  Date: 2017/6/9
  Time: 17:09
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
    <title>Team</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" class="navbar navbar-default navbar-fixed-top ">
    <link href="/static/css/agilecss.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/static/js/echarts.min.js"></script>
</head>
<body background="/static/image/teams.jpg" style="background-size: cover">
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
                <li class="active selected"><a href="/teams">TEAMS</a></li>
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
                <input type="text" id="teamName" class="form-control" placeholder="Search" onkeypress="findTeam()">
            </div>
            <div class="user-option sidebar slide">
                <ul class="nav nav-sidebar indexItem">
                    <c:forEach items="${teamList}" var="team">
                        <li >
                            <a href="/teams/${team}">${team}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="col-md-6 col-md-push-2 ">
            <div id="detailContainer"class="detail" >
                <c:if test="${!empty teamDetailList}">
                    <header>${teamName}</header>
                    <table id="detailTable" class="table mytable">
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
                        <c:forEach items="${teamDetailList}" var="coachDetail">
                            <tr>
                                <td>${coachDetail.teamSeason}</td>
                                <td>${coachDetail.teamAbbr}</td>
                                <td>${coachDetail.teamFrom}</td>
                                <td>${coachDetail.teamTo}</td>
                                <td>${coachDetail.teamYrs}</td>
                                <td>${coachDetail.teamG}</td>
                                <td>${coachDetail.teamW}</td>
                                <td>${coachDetail.teamL}</td>
                                <td>${coachDetail.teamChamp}</td>
                                <td><a href="/coaches/${coachDetail.teamCoaches}">${coachDetail.teamCoaches}</a></td>
                                <td><a href="/arenas/${coachDetail.arena}">${coachDetail.arena}</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

            </div>
            <div class="detail"style="overflow: auto">
                <div id="main" style="max-height: 600px; height: 1000px">
                </div>
                <div id="main2" style="max-height: 500px; height:1000px"></div>
            </div>
        </div>
    </div>
<!--    <div class="row col-md-2 col-md-push-2 indexContainer" style="height:500px;width:1000px">
        <div style="height:500px;width:1000px;overflow: auto">
            <div id="main" style="height:500px;width: 1000px"></div>
            <div id="main2" style="height:500px;width: 1000px"></div>
        </div>
    </div>-->
</div>
<script>
    function findTeam()
    {
        if (event.keyCode == 13) {
            var teamName = document.getElementById("teamName").value;
            location.href = "/teams/" + teamName;
        }
    }
</script>
<script type="text/javascript">
    $(function(){
        $("#teamName").click(function(){
//            alert('xyz');
            $.ajax({
                type:"Get",
                url:"/x",
                dataType:"json",
                contentType:"application/json;charset=utf-8",
//                data:JSON.stringify({"userName":"ququ","address":"gr"}),
                success:function(data) {
//                    alert(data);
                },
                error:function(){alert("error");},
                fail:function(){alert("fail");}
            });
        });

    });
</script>
<script>
    var pageName = 'teams';
</script>
<script src="/static/js/myjs.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据

    option = {
        title: {
            text: '胜负场',
            textStyle: {
                color: '#fff',
                align:'center'
            }
        },
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data:['胜场', '负场']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        dataZoom: [
            {
                id: 'dataZoomX',
                type: 'slider',
                xAxisIndex: [0],
                filterMode: 'filter', // 设定为 'filter' 从而 X 的窗口变化会影响 Y 的范围。
                start: 30,
                end: 70
            },
            {
                id: 'dataZoomY',
                type: 'slider',
                yAxisIndex: [0],
                filterMode: 'empty',
                start: 20,
                end: 80
            }
        ],
        xAxis : [
            {
                type : 'value'
            }
        ],
        yAxis : [
            {
                type : 'category',
                axisTick : {show: false},
                data : ['Los Angeles Lakers','San Antonio Spurs','Oklahoma City Thunder','Boston Celtics','Brooklyn Nets','Rochester Royals','Capital Bullets','Syracuse Nationals','Utah Jazz','Phoenix Suns','St. Louis Hawks','Minneapolis Lakers','Portland Trail Blazers','Houston Rockets','Seattle SuperSonics'].reverse()
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
                name:'胜场',
                type:'bar',
                label: {
                    normal: {
                        show: true,
                        position: 'inside'
                    }
                },
                data:[2716,1828,240,3111,51,357,47,576,1551,2017,553,457,1846,1786,1745].reverse()
            },
            {
                name:'负场',
                type:'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true
                    }
                },
                data:[1576,1165,160,2128,37,263,35,437,1196,1632,452,382,1638,1617,1585].reverse()
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main2'));

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '胜率',
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
            bottom: '3%',
            containLabel: true
        },
        dataZoom: [
            {
                id: 'dataZoomX',
                type: 'slider',
                xAxisIndex: [0],
                filterMode: 'filter', // 设定为 'filter' 从而 X 的窗口变化会影响 Y 的范围。
                start: 30,
                end: 70
            },
            {
                id: 'dataZoomY',
                type: 'slider',
                yAxisIndex: [0],
                filterMode: 'empty',
                start: 20,
                end: 80
            }
        ],
        yAxis : [
            {
                type : 'category',
                data : ['Los Angeles Lakers','San Antonio Spurs','Oklahoma City Thunder','Boston Celtics','Brooklyn Nets','Rochester Royals','Capital Bullets','Syracuse Nationals','Utah Jazz','Phoenix Suns','St. Louis Hawks','Minneapolis Lakers','Portland Trail Blazers','Houston Rockets','Seattle SuperSonics'].reverse(),
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
                name:'胜率',
                type:'bar',
                barWidth: '60%',
                data:[0.632805219,0.610758436,0.6,0.593815614,0.579545455,0.575806452,0.573170732,0.568608095,0.564615945,0.552754179,0.550248756,0.544696067,0.529850746,0.524831031,0.524024024].reverse()
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>