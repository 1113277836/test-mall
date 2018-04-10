
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
    <script type="text/javascript" src="${ctx}/static/slider/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a[name=add]").click(function () {
                alert("添加成功！");
                var pid= $(this).next("input[name='pid']").val();
                console.log(pid);
                //点击按钮，发起ajax请求
                $.ajax({
                    //请求地址
                    url: "${ctx}/product/addCart",
                    //请求类型
                    type: "POST",
                    //请求参数
                    data: {
                        pid:$(this).next("input[name='pid']").val()
                    },
                    //请求成功
                    success: function (result) {
                        console.log(result.msg);



                    },
                    error: function (error) {

                    }
                });
            });
        });
    </script>
</head>
<body>



<div style="width:1000px;margin: 0 auto;margin-top:10px;">
    <div class="linktree">

        <a href="index.jsp">首页</a>&raquo; <a href="wishlist.jsp">商品</a>



        <br>
        <h1 style="margin-top:0px;">商品</h1>

        <br>

        <div id="content">
            <form action="" method="post" id="wishlist">
                <div class="wishlist-product">
                    <table>
                        <thead>
                        <tr>
                            <td class="image">图片</td>
                            <td class="name">产品名称</td>
                            <td class="model">描述</td>
                            <td class="stock">库存</td>
                            <td class="price">价格</td>
                            <td class="cart">添加至购物车</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.list}" var="map">
                            <tr>
                                <td class="image"><a href="${ctx}/product/query?id=${map.id}"><img src="${ctx}/${map.picture}" alt="iMac" title="iMac" /></a>
                                </td>
                                <td class="name"><a href="${ctx}/product/query?id=${map.id}">${map.pname}</a></td>
                                <td class="model">${map.describes}</td>
                                <td class="stock">${map.inventory}</td>
                                <td class="price"><div class="price">${map.xprice}</div>
                                </td>
                                <td class="cart">
                                    <a name="add" href="#" class="button"><span>Add to Cart</span></a>
                                    <input type="hidden" name="pid" value="${map.id}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </form>
            <div class="buttons">
                <div class="left"><a href="${ctx}/product/list" class="button"><span>返回首页</span></a></div>
                <div class="right"><a href="${ctx}/product/queryCartByMid" class="button"><span>购物车</span></a></div>
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
