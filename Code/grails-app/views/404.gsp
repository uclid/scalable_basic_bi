<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/18/2015
  Time: 8:53 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>404 - D2 Business Intelligence</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">

</head>

<body>

<div class="navbar navbar-fixed-top">

    <div class="navbar-inner">

        <div class="container">

            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <a class="brand" href="index/dashboard.gsp">
                D2 Business Intelligence
            </a>

            <div class="nav-collapse">
                <ul class="nav pull-right">

                    <li class="">

                        <<g:link action="dashboard" class="">
                            <i class="icon-chevron-left"></i>
                            Back to Dashboard
                        </g:link>

                    </li>
                </ul>

            </div><!--/.nav-collapse -->

        </div> <!-- /container -->

    </div> <!-- /navbar-inner -->

</div> <!-- /navbar -->



<div class="container">

    <div class="row">

        <div class="span12">

            <div class="error-container">
                <h1>404</h1>

                <h2>Whoa! bad trip man. No more pixels for you.</h2>

                <div class="error-details">
                    Sorry, an error has occurred! Why not try going back to the <g:link action="dashboard">home page</g:link> or perhaps try following!

                </div> <!-- /error-details -->

                <div class="error-actions">
                    <g:link action="dashboard" class="btn btn-large btn-primary">
                        <i class="icon-chevron-left"></i>
                        &nbsp;
                        Back to Dashboard
                    </g:link>

                </div> <!-- /error-actions -->

            </div> <!-- /error-container -->

        </div> <!-- /span12 -->

    </div> <!-- /row -->

</div> <!-- /container -->


<script src="${resource(dir: 'js', file: 'jquery-1.7.2.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>

</body>

</html>