<%--
  Created by IntelliJ IDEA.
  User: 隔壁小王
  Date: 2017/11/16
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en" dir="ltr">
<head>
    <%@include file="common.jsp"%>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
    <title>iCart HTML Version</title>
</head>
<body>

<div style="width:1000px;margin: 0 auto;margin-top:10px;">
    <div id="content">
        <h2>我的账户</h2>
        <div class="content">
            <ul>
                <li><a href="${ctx}/member/toResg">注册账户</a></li>
                <li><a href="${ctx}/member/toSet">修改密码</a></li>
                <li><a href="#">Modify your address book entries</a></li>
                <li><a href="#">Modify your wish list</a></li>
            </ul>
        </div>
        <h2>我的订单</h2>
        <div class="content">
            <ul>
                <li><a href="${ctx}/product/queryOrders">查看订单历史</a></li>
                <li><a href="#">Downloads</a></li>
                <li><a href="#">Your Reward Points</a></li>
                <li><a href="#">View your return requests</a></li>
                <li><a href="#">Your Transactions</a></li>
            </ul>
        </div>
        <h2>通讯</h2>
        <div class="content">
            <ul>
                <li><a href="#">Subscribe / unsubscribe to newsletter</a></li>
            </ul>
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
