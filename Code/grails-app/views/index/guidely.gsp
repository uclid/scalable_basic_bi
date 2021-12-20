<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/18/2015
  Time: 7:24 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>About</title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">
    <link href="${resource(dir: 'js/guidely', file: 'guidely.css')}" rel="stylesheet">

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
                <li><g:link action="summary"><i class="icon-list-alt"></i><span>Summary</span></g:link></li>
                <li><g:link action="charts"><i class="icon-bar-chart"></i><span>Charts</span></g:link></li>
                <li><g:link action="prediction"><i class="icon-cogs"></i><span>Predictions</span></g:link></li>
                <li><g:link action="account"><i class="icon-user"></i><span>Account</span></g:link></li>
                <li class="active"><g:link action="guidely"><i class="icon-question-sign"></i><span>About</span></g:link></li>
            </ul>

        </div> <!-- /container -->

    </div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->


<div class="main">

    <div class="main-inner">

        <div class="container">

            <div class="row">

                <div class="span12">

                    <div id="target-1" class="widget">

                        <div class="widget-content">

                            <h1>Dashboard</h1>

                            <p>As the main page, the dashboard has all the things that should catch your eyes first. From
                            important figures to subtle quick stats, the dashboard displays each and every number
                            that makes sense to your business decisions. This one page will show you the most relevant
                            figures before you dig deeper using other pages. The table and the graph also help in
                            looking at important statistics as soon as you enter the application.</p>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                </div> <!-- /span12 -->






                <div class="span6">

                    <div class="widget">

                        <div class="widget-content">

                            <h1>Summary</h1>

                            <p>The summary page has the monthly summary of trivial details of your
                            business. The monthly data can be seen as a trend that can provide
                            a sneak peek into possible outcomes in coming months.</p>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                </div> <!-- /span6 -->


                <div class="span6">

                    <div id="target-2" class="widget">

                        <div class="widget-content">

                            <h1>Charts</h1>

                            <p>The charts provide you an excellent way of visualizing data. Using the charts page, you can see
                            some of the important statistics of your business visually. Take a snapshot of the chart or use the page
                            directly for discussions.</p>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                </div> <!-- /span6 -->







                <div class="span4">

                    <div id="target-3" class="widget">

                        <div class="widget-content">

                            <h1>Predictions</h1>

                            <p>Predict the trends of the important aspects of your business based on the patterns
                            in your data and take wiser decisions using them.</p>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                </div> <!-- /span4 -->


                <div class="span4">

                    <div class="widget">

                        <div class="widget-content">

                            <h1>Accounts</h1>

                            <p>You can change your personal details and your password using accounts page.
                            The password provided by the administrator should be changed immediately.</p>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                </div> <!-- /span4 -->


                <div class="span4">

                    <div class="widget">

                        <div class="widget-content">

                            <h1>Recommendations <sup>BETA</sup></h1>

                            <p>The recommendation engine is the one feature that can be added in near future.
                            It is aimed at providing strategic recommendation about prioritizing products.</p>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                </div> <!-- /span4 -->

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
</div><!-- /footer -->


<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${resource(dir: 'js', file: 'jquery-1.7.2.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
<script src="${resource(dir: 'js', file: 'base.js')}"></script>
<script src="${resource(dir: 'js/guidely', file: 'guidely.min.js')}"></script>

<script>

    $(function () {

        guidely.add ({
            attachTo: '#target-1'
            , anchor: 'top-left'
            , title: 'Dashboard'
            , text: 'The dashboard is the home page of the application.'
        });

        guidely.add ({
            attachTo: '#target-2'
            , anchor: 'top-right'
            , title: 'Summary and Charts'
            , text: 'Summary and Charts pages have all the monthly trends and visualizations you need.'
        });

        guidely.add ({
            attachTo: '#target-3'
            , anchor: 'middle-middle'
            , title: 'Predictions and Accounts'
            , text: 'Predictions at your disposal and your account information.'
        });

        guidely.init ({ welcome: true, startTrigger: false });


    });

</script>
</body>

</html>