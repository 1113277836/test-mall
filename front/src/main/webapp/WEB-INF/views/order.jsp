<%--
  Created by IntelliJ IDEA.
  User: 隔壁小王
  Date: 2017/11/16
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en" dir="ltr">
<head>
    <%@include file="common.jsp"%>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
    <script src="${ctx}/static/slider/jquery-1.8.3.min.js" type="text/javascript"></script>
    <title>iCart HTML Version</title>

</head>
<body>



<div style="width:1000px;margin: 0 auto;margin-top:10px;">
    <div class="linktree">

        <a href="index.jsp">首页</a>&raquo; <a href="#">商品</a>



        <br>
        <h1 style="margin-top:0px;">商品</h1>

        <br>

        <div id="content">
            <form action="queryorder" method="post" id="wishlist">
                <div class="wishlist-product">

                    <table>
                        <thead>
                        <tr>
                            <td class="image">图片</td>
                            <td class="name">产品名称</td>
                            <td class="model">描述</td>
                            <td class="stock">数量</td>
                            <td class="price">价格</td>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${requestScope.list}" var="map">
                            <tr>
                                <td class="image"><a href="#"><img src="${ctx}/${map.PICTURE}" alt="iMac" title="iMac" /></a>
                                </td>
                                <td class="name"><a href="#">${map.PNAME}</a></td>
                                <td class="model">${map.DESCRIBES}</td>
                                <td class="stock">${map.count}</td>
                                <td class="price"><div class="price">${map.m}</div>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </form>
            <div class="buttons">
                <div class="left"><a href="${ctx}/product/list" class="button"><span>返回首页</span></a></div>
                <div class="right"><a href="${ctx}/product/queryOrders" class="button"><span>返回订单</span></a></div>
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
