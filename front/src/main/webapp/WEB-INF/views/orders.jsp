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
    <script type="text/javascript" src="${ctx}/static/slider/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a[name=sm]").click(function () {
                //点击按钮，发起ajax请求
                $.ajax({
                    //请求地址
                    url: "${ctx}/product/addOrders_detail",
                    //请求类型
                    type: "POST",
                    data: {
                        aid:$(":checked").val()
                    },
                    //请求成功
                    success: function (result) {
                    alert("成功!");
                    location.reload();
                },
                error: function (error) {
                }
                })
            });
        });
        $(function () {
            $("a[name=pay]").click(function () {
                alert("支付成功！");
                var id= $(this).next("input[name='id']").val();
                console.log(id);
                //点击按钮，发起ajax请求
                $.ajax({
                    //请求地址
                    url: "${ctx}/product/pay",
                    //请求类型
                    type: "POST",
                    //请求参数
                    data: {
                        id:$(this).next("input[name='id']").val()
                    },
                    //请求成功
                    success: function (result) {
                        location.reload();
                        console.log(result.msg);
                    },
                    error: function (error) {

                    }
                });
            });
        });
        $(function () {
            $("a[name=qx]").click(function () {
                var id= $(this).next("input[name='id']").val();
                console.log(id);
                //点击按钮，发起ajax请求
                $.ajax({
                    //请求地址
                    url: "${ctx}/product/qxdd",
                    //请求类型
                    type: "POST",
                    //请求参数
                    data: {
                        id:$(this).next("input[name='id']").val()
                    },
                    //请求成功
                    success: function (result) {
                        alert("取消成功");
                        location.reload();
                    },
                    error: function (error) {
                        alert("因为某些原因，取消失败");
                    }
                });
            })
        })

    </script>
</head>
<body>



<div style="width:1000px;margin: 0 auto;margin-top:10px;">
    <div class="linktree">

        <a href="index.jsp">首页</a>&raquo; <a href="#">商品</a>



        <br>
        <h1 style="margin-top:0px;">商品</h1>

        <br>

        <div id="content">

                <div class="wishlist-product">
                    <table>
                        <tr>
                            <td></td>
                            <td>收货人姓名</td>
                            <td>收货地址</td>
                        </tr>
                        <tbody>
                        <c:forEach items="${requestScope.maps1}" var="map">
                            <tr>
                                <td><input name="a" type="radio" value="${map.id}"></td>
                                <td>${map.name}</td>
                                <td>${map.addre}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <a href="#" name="sm" >提交</a>
                    <form action="${ctx}/product/addAddress">
                        <input type="text" placeholder="收货人" name="name">
                        <input type="text" placeholder="收货地址" name="addre">
                        <input type="submit" value="添加">
                    </form>
                    <br/>
                    <br/>
                    <table>
                        <thead>
                        <tr>
                            <td class="image">订单编号</td>
                            <td class="model">下单时间</td>
                            <td class="stock">支付时间</td>
                            <td class="price">价格</td>
                            <td>状态</td>
                            <td>订单详情</td>
                            <td>结账</td>
                            <td>取消订单</td>
                            <td>收货人</td>
                            <td>收货地址</td>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${requestScope.maps}" var="map">
                            <tr>
                                <td class="model">${map.id}</td>
                                <td class="stock">${map.create_time}</td>
                                <td class="price"><div class="price">${map.pay_time}</div>
                                <td class="stock">${map.price}</td>
                               <td>${map.S}</td>
                                <td><a href="${ctx}/product/queryOrdersByOid?oid=${map.id}">查看</a></td>
                                <c:if test="${fn:endsWith(map.S,'待付款' )==true}">
                                    <td><a href="#" name="pay">结账</a>
                                        <input type="hidden" name="id" value="${map.id}">
                                        </td>
                                    <td><a href="#" name="qx">取消订单</a>
                                        <input type="hidden" name="id" value="${map.id}">
                                    </td>
                                </c:if>
                                <c:if test="${fn:endsWith(map.S,'待收货')==true}">
                                    <td>待发货</td>
                                    <td><a href="#" name="qx">取消订单</a>
                                        <input type="hidden" name="id" value="${map.id}">
                                    </td>
                                </c:if>
                                <c:if test="${fn:endsWith(map.S,'已发货')==true}">
                                    <td>已发货</td>
                                    <td><a href="#" name="qx">取消订单</a>
                                        <input type="hidden" name="id" value="${map.id}">
                                    </td>
                                </c:if>
                                <c:if test="${fn:endsWith(map.S,'已取消')==true}">
                                    <td>已取消</td>
                                    <td>已取消</td>
                                </c:if>
                                <td>${map.name}</td>
                                <td>${map.addre}</td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>

            <div class="buttons">
                <div class="left"><a href="${ctx}/product/list" class="button"><span>返回首页</span></a></div>
                <%--<div class="right"><a href="pay" class="button"><span>结账</span></a></div>--%>
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
