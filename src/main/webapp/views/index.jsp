<!-- UTF-8 지정해야 한글로 출력-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Bitter:wght@600&family=Nanum+Myeongjo:wght@800&display=swap">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="/js/index0421.js"></script> <!-- /js 처럼 꼭 / 앞에 써야 한다!!!!! -->
    <!-- 카카오 지도 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fedd7ae53186e30e0b2f11f102dd9180"></script>
    <!-- https://www.highcharts.com/demo/spline-symbols -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <!-- 3D charts -->
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <!-- donut chart -->

    <!-- bubble chart -->
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <!-- distribution of seats -->
    <script src="https://code.highcharts.com/modules/item-series.js"></script>
    <!-- dynamic chart -->
    <script src="https://code.highcharts.com/modules/data.js"></script>


    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {
            height: 650px
        }

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
        <h4>${rcust.id}</h4>
            .row.content {
                height: auto;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Logo</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="/">Home</a></li>
                <li><a href="/jsp">Jsp</a></li>
                <li><a href="/map">Map</a></li>
                <li><a href="/chart">Chart</a></li>
                <li><a href="/ajax">Ajax</a></li>
                <li><a href="/cust">Cust</a></li>
                <li><a href="/item">Item</a></li>
                <c:if test="${logincust!=null}">
                    <li><a href="/contact">Contact</a></li>
                </c:if>
            </ul>

            <c:choose>
                <c:when test="${logincust==null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <li><a href="/register"><span class="glyphicon glyphicon-log-in"></span> Register</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span> logout</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <!-- Left Menu start -->
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp"/>
            </c:otherwise>

        </c:choose>
        <!-- Left Menu end -->

        <!-- Main Center Start -->
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>

        </c:choose>
        <!-- Main Center End -->

        <div class="col-sm-2 sidenav">
            <div class="well">
                <p>ADS</p>
            </div>
            <div class="well">
                <p>ADS</p>
            </div>
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
    <p>Footer Text</p>
</footer>

</body>
</html>