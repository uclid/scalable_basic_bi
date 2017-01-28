<%--
  Created by IntelliJ IDEA.
  User: uclid
  Date: 3/17/2015
  Time: 7:33 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Dashboard</title>
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
        <link href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" rel="stylesheet">
        <link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet">
        <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">
        <link href="${resource(dir: 'css/pages', file: 'dashboard.css')}" rel="stylesheet">
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
                        <li class="active"><g:link action="dashboard"><i class="icon-dashboard"></i><span>Dashboard</span></g:link></li>
                        <li><g:link action="summary"><i class="icon-list-alt"></i><span>Summary</span></g:link></li>
                        <li><g:link action="charts"><i class="icon-bar-chart"></i><span>Charts</span></g:link></li>
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
                            <div class="widget widget-nopad">
                                <div class="widget-header"> <i class="icon-list-alt"></i>
                                    <h3>Sales and Visits</h3>
                                </div>
                                <!-- /widget-header -->
                                <div class="widget-content">
                                    <div class="widget big-stats-container">
                                        <div class="widget-content">
                                            <h6 class="bigstats">Welcome to D2 Business Intelligence - A secure, interactive and sustainable Business Intelligence system that enables data visualization and predictive analysis.</h6>
                                            <div id="big_stats" class="cf">
                                                <div class="stat"> <i title="Visitors" class="icon-group"></i> <span class="value">${webVisitors}</span> </div>
                                                <!-- .stat visitors-->

                                                <div class="stat"> <i title="Orders" class="icon-shopping-cart"></i> <span class="value">${orders}</span> </div>
                                                <!-- .stat orders-->

                                                <div class="stat"> <i title="Items in Stock" class="icon-truck"></i> <span class="value">${itemsInStock}</span> </div>
                                                <!-- .stat stock-->

                                                <div class="stat"> <i title="Total Sales Worth" class="icon-money"></i> <span class="value">Rs.${totalSales}k</span> </div>
                                                <!-- .stat sales-->
                                            </div>
                                        </div>
                                        <!-- /widget-content -->

                                    </div>
                                </div>
                            </div>
                            <div class="widget widget-table action-table">
                                <div class="widget-header"> <i class="icon-th-list"></i>
                                    <h3>Most Sold Products</h3>
                                </div>
                                <!-- /widget-header -->
                                <div class="widget-content">
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th> Product Name </th>
                                            <th> Product Value</th>
                                            <th class="td-actions"> In Stock </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td> ${top[1][0]} </td>
                                            <td> Rs. 1,260 </td>
                                            <td class="td-actions"><a href="javascript:;" class="btn btn-success btn-small"><i class="btn-icon-only icon-ok"> </i></a></td>
                                        </tr>
                                        <tr>
                                            <td> ${top[2][0]} </td>
                                            <td> Rs. 10,625 </td>
                                            <td class="td-actions"><a href="javascript:;" class="btn btn-success btn-small"><i class="btn-icon-only icon-ok"> </i></a></td>
                                        </tr>
                                        <tr>
                                            <td> ${top[3][0]} </td>
                                            <td> Rs. 22,950 </td>
                                            <td class="td-actions"><a href="javascript:;" class="btn btn-success btn-small"><i class="btn-icon-only icon-ok"> </i></a></td>
                                        </tr>
                                        <tr>
                                            <td> ${top[4][0]} </td>
                                            <td> Rs. 3,420 </td>
                                            <td class="td-actions"><a href="javascript:;" class="btn btn-success btn-small"><i class="btn-icon-only icon-ok"> </i></a></td>
                                        </tr>
                                        <tr>
                                            <td> ${top[5][0]} </td>
                                            <td> Rs. 5,100 </td>
                                            <td class="td-actions"><a href="javascript:;" class="btn btn-success btn-small"><i class="btn-icon-only icon-ok"> </i></a></td>
                                        </tr>
                                        <tr>
                                            <td> ${top[6][0]} </td>
                                            <td> Rs. 16,150 </td>
                                            <td class="td-actions"><a href="javascript:;" class="btn btn-success btn-small"><i class="btn-icon-only icon-ok"> </i></a></td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- /widget-content -->
                            </div>
                        </div>
                        <!-- /span6 -->
                        <div class="span6">
                            <div class="widget">
                                <div class="widget-header"> <i class="icon-bookmark"></i>
                                    <h3>Quick Stats</h3>
                                </div>
                                <!-- /widget-header -->
                                <div class="widget-content">
                                    <div class="shortcuts">
                                        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-sitemap"></i>
                                            <span class="shortcut-label">${galleryItems} Gallery Items</span></a>
                                        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-eye-open"></i>
                                            <span class="shortcut-label">${visibleItems} Visible Items</span> </a>
                                        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-gift"></i>
                                            <span class="shortcut-label">${activeDiscounts} Active Discounts</span> </a>
                                        <a href="javascript:;" class="shortcut"> <i class="shortcut-icon icon-search"></i>
                                            <span class="shortcut-label">${searches} Searches</span> </a>
                                        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-user"></i>
                                            <span class="shortcut-label">${backendUsers} Backend Users</span> </a>
                                        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-bar-chart"></i>
                                            <span class="shortcut-label">${itemsViewed} Items Viewed</span> </a>
                                        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-check"></i>
                                            <span class="shortcut-label">${compared} Compared</span> </a>
                                        <a href="javascript:;" class="shortcut"> <i class="shortcut-icon icon-pushpin"></i>
                                            <span class="shortcut-label">${wishlist} in Wishlist</span> </a>
                                    </div>
                                    <!-- /shortcuts -->
                                </div>
                                <!-- /widget-content -->
                            </div>
                            <!-- /widget -->
                            <div class="widget">
                                <div class="widget-header"> <i class="icon-signal"></i>
                                    <h3> Orders vs Sold Products</h3>
                                </div>
                                <!-- /widget-header -->
                                <div class="widget-content">
                                    <canvas id="area-chart" class="chart-holder" height="250" width="538"> </canvas>
                                    <div id="bar-legend" class="chart-legend"></div>
                                    <!-- /area-chart -->
                                </div>
                                <!-- /widget-content -->
                            </div>
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

            var lineChartData = {
                labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
                datasets: [
                    {
                        fillColor: "rgba(220,220,220,0.5)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        data: [${g[0]},${g[1]},${g[2]},${g[3]},${g[4]},${g[5]},${g[6]},${g[7]},${g[8]},${g[9]},${g[10]},${g[11]}],
                        label: "Orders"
                    },
                    {
                        fillColor: "rgba(151,187,205,0.5)",
                        strokeColor: "rgba(151,187,205,1)",
                        pointColor: "rgba(151,187,205,1)",
                        pointStrokeColor: "#fff",
                        data: [${g[12]},${g[13]},${g[14]},${g[15]},${g[16]},${g[17]},${g[18]},${g[19]},${g[20]},${g[21]},${g[22]},${g[23]}],
                        label:"Sold"
                    }
                ]

            }

            var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);
            document.getElementById('bar-legend').innerHTML = myLine.generateLegend();

        </script>
    </body>
</html>