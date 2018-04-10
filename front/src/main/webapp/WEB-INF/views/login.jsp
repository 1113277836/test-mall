<%--
  Created by IntelliJ IDEA.
  User: 隔壁小王
  Date: 2017/11/16
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en" dir="ltr">
<head>
    <%@include file="common.jsp"%>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
    <title>iCart HTML Version</title>
    <style type="text/css">
        /* content */
        #content .content {
            padding: 10px;
            overflow: auto;
            margin-bottom: 20px;
            width:350px;float:left;
            background-color: #eee;
            border: 1px solid #BBBBBB;
            box-shadow: 1px 1px 1px #FFFFFF inset;
            margin-right:20px;

        }
    </style>
</head>
<body>

<div style="width:1000px;margin: 0 auto;margin-top:10px;">
    <div class="linktree">
        <a href="index.jsp">首页</a>
        &raquo; <a href="login.jsp">登录</a>
    </div>

    <h1 style="margin-top:-10px;">Account Login</h1>

    <br>




    <div id="column-right">
        <div class="box">
            <div class="box-heading_left">账户</div>
            <div class="box-content" style="background:none;border: solid 1px #E3E3E2;"><div class="box-category">
                <ul>
                    <li><a href="login.jsp">登录</a> / <a href="register.jsp">注册</a></li>
                    <li><a href="setpassword.jsp">忘记密码</a></li>
                    <li><a href="account.jsp">我的账户</a></li>
                    <li><a href="queryorder">订单记录</a></li>
                </ul>
            </div>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="login-content">
            <div class="left">
                <h2>新客户</h2>
                <div class="content">
                    <p><b>注册账户</b></p>
                    <p>通过创建一个帐户，您将能够更快地购物，获得订单状态的最新信息，并跟踪您之前所做的订单.</p>
                    <a href="${ctx}/member/toResg" class="button"><span>继续</span></a>
                </div>
            </div>
            <div class="right">
                <h2>老客户</h2>
                <%
                    String path =request.getContextPath();
                %>
                <form action="${ctx}/member/login" id="login" method="post">
                    <div class="content">
                        <p>我是老客户</p>
                        <input type="hidden" name="returnUrl" value="${param.returnUrl}">
                        <b>账号:</b><br />
                        <input type="text" name="username" value="" />
                        <br />
                        <br />
                        <b>密码:</b><br />
                        <input type="password" name="password" value="" />
                        <br />
                        <a href="${ctx}/member/toSet">忘记密码</a><br />
                        <br />
                        <input type="submit" value="登录">
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@include file="commonf.jsp"%>
</body>
</html>
