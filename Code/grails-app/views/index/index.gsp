<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/10/2015
  Time: 8:28 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Login - D2 Business Intelligence</title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet" type="text/css" />
    <link href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" rel="stylesheet" type="text/css" />
    <link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet" type="text/css">
    <link href="${resource(dir: 'css/pages', file: 'signin.css')}" rel="stylesheet" type="text/css">

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

            <a class="brand">
                <img src ="${resource(dir: 'images', file: 'applogo.png')}" alt="logo"/>
                &nbsp;D2 - Business Intelligence
            </a>


        </div> <!-- /container -->

    </div> <!-- /navbar-inner -->

</div> <!-- /navbar -->



<div class="account-container">

    <div class="content clearfix">

        <g:form action="login" controller="index" method="post">

            <h1>Member Login</h1>

            <div class="login-fields">

                <p>Please provide your details</p>

                <div class="field">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="" placeholder="Username" class="login username-field" />
                </div> <!-- /field -->

                <div class="field">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="" placeholder="Password" class="login password-field"/>
                </div> <!-- /password -->
                <g:if test="${flash.message}">
                    ${flash.message}
                </g:if>
            </div> <!-- /login-fields -->

            <div class="login-actions">
                <button class="button btn btn-success btn-large" type="submit">Sign In</button>
            </div> <!-- .actions -->

        </g:form>

    </div> <!-- /content -->

</div> <!-- /account-container -->

<div class="span12"> &copy; 2015 D2 Business Intelligence. </div>

<script src="${resource(dir: 'js', file: 'jquery-1.7.2.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>

<script src="${resource(dir: 'js', file: 'signin.js')}"></script>

</body>

</html>