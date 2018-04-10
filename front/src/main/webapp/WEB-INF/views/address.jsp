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
        <a href="#">首页</a>
        &raquo; <a href="#">地址</a>
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
                <h2>收货地址</h2>
                <div class="content">
                    <p><b>选择收货地址</b></p>
                    <p>通过选择或创建一个帐户,商家才能及时下单，将商品发货</p>
                </div>
            </div>
            <div class="right">
                <table>
                    <tr>
                        <td></td>
                        <td>收货人姓名</td>
                        <td>收货地址</td>
                    </tr>
                    <tbody>
                    <c:forEach items="${requestScope.maps1}" var="map">
                        <tr>
                            <td><input name="a" type="radio"></td>
                            <td>${map.name}</td>
                            <td>${map.addre}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <h2>老客户</h2>
                <form action="${ctx}/member/addAddress" id="login" method="post">
                    <div class="content">
                        <b>姓名:</b><br />
                        <input type="text" name="name" value="" />
                        <br />
                        <br />
                        <b>地址:</b><br />
                        <input type="text" name="addre" value="" />
                        <br />
                        <br />
                        <input type="submit" value="确定">
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
