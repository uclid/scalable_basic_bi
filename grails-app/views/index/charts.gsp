<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/17/2015
  Time: 8:35 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Charts</title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="dashboard.gsp"><img src ="${resource(dir: 'images', file: 'applogo.png')}" alt="logo"/>&nbsp;D2 - Business Intelligence </a>
            <div class="nav-collapse">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i>
                        <g:if test="${flash.message}">
                            ${flash.message}
                        </g:if>
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><g:link action="account">Account</g:link></li>
                            <li><g:link action="logout">Logout</g:link></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
        <!-- /container -->
    </div>
    <!-- /navbar-inner -->
</div>
<!-- /navbar -->
<div class="subnavbar">
    <div class="subnavbar-inner">
        <div class="container">
            <ul class="mainnav">
                <li><g:link action="dashboard"><i class="icon-dashboard"></i><span>Dashboard</span></g:link></li>
                <li><g:link action="Summary"><i class="icon-list-alt"></i><span>Summary</span></g:link></li>
                <li class="active"><g:link action="charts"><i class="icon-bar-chart"></i><span>Charts</span></g:link></li>
                <li><g:link action="prediction"><i class="icon-cogs"></i><span>Predictions</span></g:link></li>
                <li><g:link action="account"><i class="icon-user"></i><span>Account</span></g:link></li>
                <li><g:link action="guidely"><i class="icon-question-sign"></i><span>About</span></g:link></li>
            </ul>
        </div>
        <!-- /container -->
    </div>
    <!-- /subnavbar-inner -->
</div>
<!-- /subnavbar -->
<div class="main">
    <div class="main-inner">
        <div class="container">
            <div class="row">
                <div class="span6">
                    <div class="widget">
                        <div class="widget-header">
                            <i class="icon-bar-chart"></i>
                            <h3>
                                Sales By Month</h3>
                        </div>
                        <!-- /widget-header -->
                        <div class="widget-content">
                            <canvas id="bar-chart" class="chart-holder" width="538" height="250">
                            </canvas>
                            <!-- /bar-chart -->
                        </div>
                        <!-- /widget-content -->
                    </div>
                    <!-- /widget -->
                    <div class="widget">
                        <div class="widget-header">
                            <i class="icon-bar-chart"></i>
                            <h3>
                                Compared Items and Wishlist Items by Month</h3>
                        </div>
                        <!-- /widget-header -->
                        <div class="widget-content">
                            <canvas id="area-chart" class="chart-holder" width="538" height="250">
                            </canvas>
                            <br/><br/>
                            <div id="line-legend" class="chart-legend"></div>
                            <!-- /line-chart -->
                        </div>
                        <!-- /widget-content -->
                    </div>
                </div>
                <!-- /span6 -->
                <div class="span6">
                    <div class="widget">
                        <div class="widget-header">
                            <i class="icon-bar-chart"></i>
                            <h3>
                                Top 5 Product Sales</h3>
                        </div>
                        <!-- /widget-header -->
                        <div class="widget-content">
                            <canvas id="donut-chart" class="chart-holder" width="538" height="250">
                            </canvas>
                            <!-- /bar-chart -->
                        </div>
                        <!-- /widget-content -->
                    </div>
                    <!-- /widget -->
                    <div class="widget">
                        <div class="widget-header">
                            <i class="icon-bar-chart"></i>
                            <h3>
                                Percentage of Orders Confirmed (i.e. Sold/Order)</h3>
                        </div>
                        <!-- /widget-header -->
                        <div class="widget-content">
                            <canvas id="line-chart" class="chart-holder" width="538" height="250">
                            </canvas>
                            <div id="polar-legend" class="chart-legend"></div>
                            <!-- /-chart -->
                        </div>
                        <!-- /widget-content -->
                    </div>
                    <!-- /widget -->
                </div>
                <!-- /span6 -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /main-inner -->
</div>
<!-- /main -->
<div class="extra">
    <div class="extra-inner">
        <div class="container">
            <div class="row">
                <div class="span3">
                    <h4>
                        Powered By:</h4>
                    <ul>
                        <li><img src= "${resource(dir: 'images', file: 'uclid.png')}" alt="uclid"/></li>
                    </ul>
                </div>
                <!-- /span3 -->
                <div class="span3">
                    <h4>
                        Data Provided By:</h4>
                    <ul>
                        <li><img src= "${resource(dir: 'images', file: 'logo.png')}" alt="uclid"/></li>
                    </ul>
                </div>
                <!-- /span3 -->
                <div class="span3">
                    <h4>
                        Specific Data Source:</h4>
                    <ul>
                        <li><img src= "${resource(dir: 'images', file: 'baleyo.png')}" alt="uclid"/></li>
                    </ul>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /extra-inner -->
</div>
<!-- /extra -->
<div class="footer">
    <div class="footer-inner">
        <div class="container">
            <div class="row">
                <div class="span12"> &copy; 2015 D2 Business Intelligence. </div>
                <!-- /span12 -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /footer-inner -->
</div>
<!-- /footer -->
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${resource(dir: 'js', file: 'jquery-1.7.2.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'excanvas.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'chart.min.js')}" type="text/javascript"></script>
<script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>

<script src="${resource(dir: 'js', file: 'base.js')}"></script>
<script>
    var doughnutData = [
        {
            value: ${top[1][1]},
            color: "#F7464A",
            label: '${top[1][0]}'
        },
        {
            value: ${top[2][1]},
            color: "#46BFBD",
            label: '${top[2][0]}'
        },
        {
            value: ${top[3][1]},
            color: "#FDB45C",
            label: '${top[3][0]}'
        },
        {
            value: ${top[4][1]},
            color: "#949FB1",
            label: '${top[4][0]}'
        },
        {
            value: ${top[5][1]},
            color: "#4D5360",
            label: '${top[5][0]}'
        }

    ];

    var myDoughnut = new Chart(document.getElementById("donut-chart").getContext("2d")).Doughnut(doughnutData);

    var lineChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                data: [${g[0]},${g[1]},${g[2]},${g[3]},${g[4]},${g[5]},${g[6]},${g[7]},${g[8]},${g[9]},${g[10]},${g[11]}],
                label:"Compared"
            },
            {
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [${g[12]},${g[13]},${g[14]},${g[15]},${g[16]},${g[17]},${g[18]},${g[19]},${g[20]},${g[21]},${g[22]},${g[23]}],
                label: "Wishlist"
            }
        ]

    }

    var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);
    document.getElementById('line-legend').innerHTML = myLine.generateLegend();

    var barChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                data: [${h[12]},${h[13]},${h[14]},${h[15]},${h[16]},${h[17]},${h[18]},${h[19]},${h[20]},${h[21]},${h[22]},${h[23]}]
            }
        ]

    }

    var newLine = new Chart(document.getElementById("bar-chart").getContext("2d")).Bar(barChartData);

    var chartData = [
        {
            value: ${(h[12]+h[13]+h[14]+h[21])/(h[0]+h[1]+h[2]+h[9])},
            color: "#D97041",
            label: "Personal"
        },
        {
            value: ${(h[16]+h[17]+h[18]+h[19])/(h[4]+h[5]+h[6]+h[7])},
            color: "#C7604C",
            label:"Office"
        },
        {
            value: ${(h[15]+ h[20]+h[22]+h[23])/(h[3]+ h[8]+h[10]+h[11])},
            color: "#21323D",
            label: "Others"
        },
    ];
    var myPolarArea = new Chart(document.getElementById("line-chart").getContext("2d")).PolarArea(chartData);
    document.getElementById('polar-legend').innerHTML = myPolarArea.generateLegend();
</script>
</body>
</html>