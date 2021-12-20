<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/19/2015
  Time: 5:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Summary</title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">

    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">

    <link href="${resource(dir: 'css/pages', file: 'summary.css')}" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>

<body>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="dashboard.gsp"><img src ="${resource(dir: 'images', file: 'applogo.png')}" alt="logo"/>&nbsp;D2 - Business Intelligence</a>
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
                <li class="active"><g:link action="summary"><i class="icon-list-alt"></i><span>Summary</span></g:link></li>
                <li><g:link action="charts"><i class="icon-bar-chart"></i><span>Charts</span></g:link></li>
                <li><g:link action="prediction"><i class="icon-cogs"></i><span>Predictions</span></g:link></li>
                <li><g:link action="account"><i class="icon-user"></i><span>Account</span></g:link></li>
                <li><g:link action="guidely"><i class="icon-question-sign"></i><span>About</span></g:link></li>

            </ul>

        </div> <!-- /container -->

    </div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->



<div class="main">

    <div class="main-inner">

        <div class="container">

            <div class="row">

                <div class="span12">

                    <div class="info-box">
                        <div class="row-fluid stats-box">
                            <div class="span4">
                                <div class="stats-box-title">Visitors</div>
                                <div class="stats-box-all-info"><i class="icon-user" style="color:#3366cc;"></i> <g:formatNumber number="${g[36]/1000}" format="0.00"/>k</div>
                                <div class="wrap-chart"><div id="visitor-stat" class="chart" style="padding: 0px; position: relative;"><canvas id="bar-chart1" class="chart-holder" height="150" width="325"></canvas></div></div>
                            </div>

                            <div class="span4">
                                <div class="stats-box-title">Product Views</div>
                                <div class="stats-box-all-info"><i class="icon-eye-open"  style="color:#F30"></i> <g:formatNumber number="${g[37]/1000}" format="0.00"/>k</div>
                                <div class="wrap-chart"><div id="order-stat" class="chart" style="padding: 0px; position: relative;"><canvas id="bar-chart2" class="chart-holder" height="150" width="325"></canvas></div></div>
                            </div>

                            <div class="span4">
                                <div class="stats-box-title">Orders</div>
                                <div class="stats-box-all-info"><i class="icon-shopping-cart" style="color:#3C3"></i> ${g[38]}</div>
                                <div class="wrap-chart">

                                    <div id="user-stat" class="chart" style="padding: 0px; position: relative;"><canvas id="bar-chart3" class="chart-holder" height="150" width="325"></canvas></div>

                                </div>
                            </div>
                        </div>


                    </div>


                </div>
            </div>

            <!-- /row -->

            <div class="row">

                <div class="span6">

                    <div class="widget">

                        <div class="widget-header">
                            <i class="icon-star"></i>
                            <h3>Popular Products</h3>
                        </div> <!-- /widget-header -->

                        <div class="widget-content">
                            <canvas id="pie-chart" class="chart-holder" height="250" width="538"></canvas>
                            <div id="pie-legend" class="chart-legend"></div>
                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->




                </div> <!-- /span6 -->


                <div class="span6">

                    <div class="widget">

                        <div class="widget-header">
                            <i class="icon-list-alt"></i>
                            <h3>Items in Gallery and Visible Items</h3>
                        </div> <!-- /widget-header -->

                        <div class="widget-content">
                            <canvas id="bar-chart" class="chart-holder" height="250" width="538"></canvas>
                            <br/><br/>
                            <div id="bar-legend" class="chart-legend"></div>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                </div> <!-- /span6 -->

            </div> <!-- /row -->







        </div> <!-- /container -->

    </div> <!-- /main-inner -->

</div> <!-- /main -->




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
</div> <!-- /footer -->


<script src="${resource(dir: 'js', file: 'jquery-1.7.2.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'excanvas.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'chart.min.js')}" type="text/javascript"></script>
<script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
<script src="${resource(dir: 'js', file: 'base.js')}"></script>
<script>

    var pieData = [
        {
            value: <g:formatNumber number="${g[38]*4/10}" format="0"/>,
            color: "#F38630",
            label: "Office"
        },
        {
            value: <g:formatNumber number="${g[38]*5/10}" format="0"/>,
            color: "#E0E4CC",
            label: "Personal"
        },
        {
            value: <g:formatNumber number="${g[38]/10}" format="0"/>,
            color: "#69D2E7",
            label: "Others"
        }

    ];

    var myPie = new Chart(document.getElementById("pie-chart").getContext("2d")).Pie(pieData);
    document.getElementById('pie-legend').innerHTML = myPie.generateLegend();

    var barChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                data: [41, 56, 49, 35, 43, 66, 47, 24, 65, 46, 45, 24],
                label: "Items in Gallery"
            },
            {
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,1)",
                data: [6, 7, 5, 0, 2, 7, 3, 0, 0, 15, 4, 0],
                label: "Visible Items"
            }
        ]

    }

    var visitors = {
        labels: ["Jan-Feb","Mar-Apr", "May-Jun","Jul-Aug","Sep-Oct", "Nov-Dec"],
        //labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                data: [${g[0]}+${g[1]}, ${g[2]}+${g[3]}, ${g[4]}+${g[5]}, ${g[6]}+${g[7]}, ${g[8]}+${g[9]}, ${g[10]}+${g[11]}],
                label: "Visitors"
            }
        ]

    }

    var views = {
        labels: ["Jan-Feb","Mar-Apr", "May-Jun","Jul-Aug","Sep-Oct", "Nov-Dec"],
        //labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                data: [${g[12]}+${g[13]}, ${g[14]}+${g[15]}, ${g[16]}+${g[17]}, ${g[18]}+${g[19]}, ${g[20]}+${g[21]}, ${g[22]}+${g[23]}],
                label: "Product Views"
            }
        ]

    }
    var orders = {
        labels: ["Jan-Feb","Mar-Apr", "May-Jun","Jul-Aug","Sep-Oct", "Nov-Dec"],
        //labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                data: [${g[24]}+${g[25]}, ${g[26]}+${g[27]}, ${g[28]}+${g[29]}, ${g[30]}+${g[31]}, ${g[32]}+${g[33]}, ${g[34]}+${g[35]}],
                label: "Orders"
            }
        ]

    }

    var myBar = new Chart(document.getElementById("bar-chart").getContext("2d")).Bar(barChartData);
    var visit = new Chart(document.getElementById("bar-chart1").getContext("2d")).Bar(visitors);
    var view = new Chart(document.getElementById("bar-chart2").getContext("2d")).Bar(views);
    var order = new Chart(document.getElementById("bar-chart3").getContext("2d")).Bar(orders);
    document.getElementById('bar-legend').innerHTML = myBar.generateLegend();

</script>


</body>

</html>