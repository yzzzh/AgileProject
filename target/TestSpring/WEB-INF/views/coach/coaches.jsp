<%--
  Created by IntelliJ IDEA.
  User: YZH
  Date: 2017/6/9
  Time: 19:24
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
    <title>Coaches</title>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" class="navbar navbar-default navbar-fixed-top ">
    <link href="/static/css/agilecss.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
</head>
<body background="/static/image/coaches.png" style="background-size: cover">
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
                <li class="active"><a href="/coaches">COACHES</a></li>
                <li><a href="/arenas">ARENAS</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mycontainer tableContainer">
    <div class="row">
        <div class="col-md-2 col-md-push-2 indexContainer">
            <div class="form-group mysearch">
                <input type="text" id="coachName" class="form-control" placeholder="Search" onkeypress="findCoach()">
            </div>
            <div class="user-option sidebar slide">
                <ul class="nav nav-sidebar indexItem">
                    <c:forEach items="${coachList}" var="coach">
                        <li >
                            <a href="/coaches/${coach}">${coach}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="col-md-6 col-md-push-2 detail">
            <div id="detailContainer" >
                <c:if test="${!empty coachDetailList}">
                    <header>${coachName}</header>
                    <table id="detailTable" class="table mytable">
                        <tr>
                            <th>赛季</th>
                            <th>所在球队</th>
                        </tr>
                        <c:forEach items="${coachDetailList}" var="coachDetail">
                            <tr>
                                <td>${coachDetail.teamSeason}</td>
                                <td><a href="/teams/${coachDetail.teamName}">${coachDetail.teamName}</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script>
    function findCoach()
    {
        if (event.keyCode == 13) {
            var coachName = document.getElementById("coachName").value;
            location.href = "/coaches/" + coachName;
        }
    }
</script>
<script>
    var pageName = 'coaches';
</script>
<script src="/static/js/myjs.js"></script>
</body>
</html>