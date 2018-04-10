<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 隔壁小王
  Date: 2017/11/16
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>
<html lang="en" dir="ltr">
<head>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
    <title>iCart HTML Version</title>
    <script type="text/javascript" src="${ctx}/static/slider/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        /*$(function () {
            $("a[name=sm]").click(function () {
                alert("下单成功！");
                //点击按钮，发起ajax请求
                $.ajax({
                    //请求地址
                    url: "/product/addOrders_detail",
                    //请求类型
                    type: "POST",
                    //请求成功
                    success: function (result) {
                        console.log(result.msg);
                    },
                    error: function (error) {

                    }
                });
            });*/



            $("input[name=remove]").click(function () {
                    alert("删除成功！")
//                alert("haha");
             //   var remo = $(this).next("input[name='remo']").val();
                //点击按钮，发起ajax请求
                $.ajax({
                    //请求地址
                    url: "${ctx}/product/deleteCart",
                    //请求类型
                    type: "POST",
                    //请求参数
                    data: {
                        pid:$(this).next("input[name='remo']").val()
                    },
                    //请求成功
                    success: function (result) {
                        console.log(result.msg)
                    },
                    error: function (error) {

                    }
                });
            });




            $("input[name='quantity']").blur(function () {
                console.log($(this).val());
                console.log("cid-->"+$(this).next("input[name='cid']").val());
                console.log("price-->"+$(this).nextAll("input[name='price']").val());
                var app = this;
                $.ajax({
                    //请求地址
                    url: "${ctx}/product/setCart",
                    //请求类型
                    type: "POST",
                    //请求参数
                    data: {
                        quantity: $(this).val(),
//
                        pid:$(this).next("input[name='cid']").val(),
//
                        price:$(this).nextAll("input[name='price']").val()

                    },
                    //请求成功
                    success: function (result) {
                        console.log("success");
//                        console.log($(app).parent().next("td").next("td"))
//                        $("#aaa").text(result.msg);
                        $(app).parent().next("td").next("td").text(result.msg);
                        $("#sm ").text("￥"+result.sm+"结账")
                        //location.reload();
                    }

                });
            });
        });
    </script>
</head>
<body>

<div style="width:1000px;margin: 0 auto;margin-top:10px;">
    <div class="linktree">
        <a href="#">首页</a>
        &raquo; <a href="#">购物车</a>
    </div>
    <h1 style="margin-top:-10px;">购物车</h1>

    <br>
    <form action="${ctx}/product/queryCartByMid" method="post" id="basket">

        <div class="cart-info">
            <table>
                <thead>
                <tr>
                    <td class="remove">Remove</td>
                    <td class="image">图片</td>
                    <td class="name">商品名称</td>
                    <td class="quantity">数量</td>
                    <td class="price">单价</td>
                    <td class="total">合计</td>
                    <%--<td class="aaa">结账</td>--%>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${requestScope.list}" var="list"  varStatus="status">


                <tr>

                    <td>
                        <input type="submit" name="remove" value="删除">
                        <input name="remo" type="hidden" value="${list.pid}">
                    </td>
                    <td class="image"><a href="#"><img src="${ctx}/${list.PICTURE}" alt="iMac" title="iMac" /></a>
                    </td>
                    <td class="name"><a href="#">${list.PNAME}</a>
                        <div>
                        </div>
                    </td>
                    <td class="quantity">
                        <input style="width: 50px" type="number" min="1" name="quantity" value="${list.count}" size="3" />
                        <input type="hidden" name="cid" value="${list.pid}">
                        <input type="hidden" name="price" value="${list.XPRICE}">
                    </td>
                    <td class="price">${list.XPRICE}</td>
                    <td class="total">${list.m}</td>
                    <%--<td><a href="addd?id=${list.cid}&num=${list.num}&m=${list.m}">结账</a></td>--%>
                </tr>

                </c:forEach>

                </tbody>

            </table>
        </div>
    </form>

    <div class="buttons">

        <div class="right"><a href="${ctx}/product/queryOrders" name="sm" class="button">￥${requestScope.sm.s}</a></div>
        <div class="center"><a href="${ctx}/product/list"  class="button" style="width:120px;"><span>继续购物</span></a></div>
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