<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/19/2015
  Time: 5:13 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Predictions</title>
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
                <li class="active"><g:link action="prediction"><i class="icon-cogs"></i><span>Predictions</span></g:link></li>
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

                    <div class="widget ">

                        <div class="widget-header">
                            <i class="icon-bar-chart"></i>
                            <h3>Sales Forecasting</h3>
                        </div> <!-- /widget-header -->

                        <div class="widget-content">



                            <div class="tabbable">
                                <ul class="nav nav-tabs">
                                    <li class = "active">
                                        <a href="#regression" data-toggle="tab">Regressiom Analysis</a>
                                    </li>

                                </ul>

                                <br>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="regression">
                                        <g:form id= "predict" class="form-horizontal" action="regression" controller="index" method="post">
                                            <fieldset>

                                                <div class="control-group">
                                                    <label class="control-label" for="forecast_type">Forecast Parameter</label>
                                                    <div class="controls">
                                                        <select class="span6" id="forecast_type" name="forecast_type">
                                                            <option value="amount">Sales Amount</option>
                                                            <option value="value">Sales Value</option>
                                                        </select>
                                                        <p class="help-block">Select one of above options for forecasting.</p>
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->

                                                <div class="control-group">
                                                    <label class="control-label" for="time">Forecast for Date</label>
                                                    <div class="controls">
                                                        <input type="date" name="time" id="time">
                                                        <p class="help-block">Select a date of forecast.</p>
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->


                                                <div class="control-group">
                                                    <label class="control-label" for="result">Result</label>
                                                    <div class="controls">
                                                        <input type="text" class="span6" id="result" placeholder="result" disabled value="${result}">
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->

                                                <br />


                                                <div class="form-actions">
                                                    <button type="submit" class="btn btn-primary">Predict</button>
                                                </div> <!-- /form-actions -->
                                            </fieldset>
                                        </g:form>
                                    </div>

                                </div>

                            </div>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                    <div class="widget ">

                        <div class="widget-header">
                            <i class="icon-sitemap"></i>
                            <h3>Sales Classification</h3>
                        </div> <!-- /widget-header -->

                        <div class="widget-content">



                            <div class="tabbable">
                                <ul class="nav nav-tabs">
                                    <li class = "active">
                                        <a href="#decision" data-toggle="tab">Decision Tree</a>
                                    </li>

                                </ul>

                                <br>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="decision">
                                        <g:form id= "classify" class="form-horizontal" action="decision" controller="index" method="post">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label" for="pname">Product Name</label>
                                                    <div class="controls">
                                                        <input type="text" name="pname" id="pname">
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->

                                                <div class="control-group">
                                                    <label class="control-label" for="price">Price (NPR)</label>
                                                    <div class="controls">
                                                        <input type="text" name="price" id="price" required>
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->

                                                <div class="control-group">
                                                    <label class="control-label" for="ship_type">Shipping Type</label>
                                                    <div class="controls">
                                                        <select class="span6" id="ship_type" name="ship_type">
                                                            <option value="flat">Flat Rate - Fixed</option>
                                                            <option value="free">Free Shipping - Free</option>
                                                        </select>
                                                        <p class="help-block">Select one of the shipping plans for this product.</p>
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->

                                                <div class="control-group">
                                                    <label class="control-label" for="discount">Discount Amount</label>
                                                    <div class="controls">
                                                        <input type="text" name="discount" id="discount" required>
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->

                                                <div class="control-group">
                                                    <label class="control-label" for="sales">Quantity Ordered</label>
                                                    <div class="controls">
                                                        <input type="text" name="sales" id="sales" required>
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->

                                                <div class="control-group">
                                                    <label class="control-label" for="result2">Result</label>
                                                    <div class="controls">
                                                        <input type="text" class="span6" id="result2" placeholder="result" disabled value="${decision}">
                                                    </div> <!-- /controls -->
                                                </div> <!-- /control-group -->

                                                <br />

                                                <div class="form-actions">
                                                    <button type="submit" class="btn btn-primary">Classify</button>
                                                </div> <!-- /form-actions -->
                                            </fieldset>
                                        </g:form>
                                    </div>

                                </div>

                            </div>

                        </div> <!-- /widget-content -->

                    </div> <!-- /widget -->

                </div>

            </div> <!-- /widget-content -->

        </div> <!-- /widget -->



    </div> <!-- /span8 -->



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
<script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
<script src="${resource(dir: 'js', file: 'base.js')}"></script>


</body>

</html>