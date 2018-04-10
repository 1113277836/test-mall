<%--
  Created by IntelliJ IDEA.
  User: 隔壁小王
  Date: 2017/11/17
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>



<div class="menu">
    <ul>
        <li style="width:0px;"><a></a></li>
        <li><a href="${ctx}/product/list" class="home">首页</a></li>
        <li><a href="${ctx}/product/queryOrders" class="wishlist">订单列表</a></li>
        <li><a href="${ctx}/member/toAccount" class="account">我的账户</a></li>
        <li><a href="${ctx}/product/queryCartByMid" class="cart">购物车</a></li>
        <li><a class="checkout">Checkout</a></li>
        <c:if test="${fn:length(sessionScope.username)<=0}">
            <li class="active" style="float:right;"><a href="${ctx}/member/toLogin" class="login">登录/注册</a></li>
        </c:if>
        <c:if test="${fn:length(sessionScope.username)>0}">
            <li class="active" style="float:right;">${sessionScope.username}</li>
            <li style="float:right;"><a href="${ctx}/member/zx" class="off">注销</a></li>
        </c:if>

    </ul>
</div>

<div style="width:1000px;margin:0 auto;">
   <%-- <div id="cart">
        <div class="heading">
            <a style="padding:8px;margin-left:-14px;">购物车</a><span style="font-size:14px;color:#fff;">&raquo;</span>
            <a><span id="cart_total">0件商品- $0.00</span></a></div>
        <div class="content"></div>
    </div>--%>
    <%--<div id="search">
        <div class="button-search"></div>
        <input type="text" name="filter_name" value="Search"  onkeydown="this.style.color = '#888';" />
    </div>--%>
    <form action="${ctx}/product/search" method="post">
        <input type="text"  name="value"  placeholder="请输入关键字" onkeydown="this.style.color = '#888';">
        <input type="submit" value="搜索">
    </form>

</div>

<div class="header">
    <div class="logo_img"><a href="${ctx}/product/list"><img alt="Site Name" src="${ctx}/static/images/logo.png"></a>
    </div>
</div>

<div id="menu">
    <c:forEach items="${applicationScope.CBs}" var="list">
        <ul>
            <li>
                <a href="${ctx}/product/queryByCid?id=${list.category.ID}">${list.category.NAME}</a>

                <div>
                        <ul>
                            <c:forEach items="${list.brand}" var="ct">
                            <li><a href="${ctx}/product/queryByBCid?cid=${list.category.ID}&bid=${ct.id}">${ct.NAME}</a></li>
                            </c:forEach>
                        </ul>
                </div>

            </li>
        </ul>
    </c:forEach>

</div>


