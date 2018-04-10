<%--
  Created by IntelliJ IDEA.
  User: 隔壁小王
  Date: 2017/11/16
  Time: 15:41
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
        <a href="index.jsp">首页</a>
        &raquo; <a href="#">${requestScope.map.pname}</a>
    </div>

    <h1 style="margin-top:-10px;">${requestScope.map.pname}</h1>
</div>
<div id="container_bg">


    <style type="text/css">

        .linktree {
            margin-top:0px;
            margin-bottom:10px;
            margin-left:3px;
        }

        .linktree a {
            color:#666;
            text-decoration:none;
            font-size:11px;
        }

        #menu {
            border-radius:5px;
        }
    </style>



    <div id="content">
        <div class="block-white">
            <div class="block-content">

            </div>
            <div class="separator"></div>
            <div class="block-content">
                <div class="product-info">

                    <div class="left">
                        <div class="image"><a href="#" title="iMac" ><img src="${requestScope.map.picture}" title="${requestScope.map.describes}" alt="iMac" id="image" /></a></div>
                    </div>

                    <div class="right">
                        <div id="tabs" class="tabs">
                            <a href="#tab-information" class="selected"><img alt="Information" src="${ctx}/static/images/Info.png" style="margin-top:6px;" /><div></div></a>
                        </div>

                        <div id="tab-information" class="tab-content">
                            <div id="information"></div>


                            <div class="description">
                                <span>&raquo;&nbsp;名称:</span> <a href="#">${requestScope.map.pname}</a><br />
                                <span>&raquo;&nbsp;描述:</span> ${requestScope.map.describes}<br />
                                <span>&raquo;&nbsp;库存:</span> ${requestScope.map.inventory}
                            </div>

                            <div class="price">
                                <span class="price-new">￥${requestScope.map.xprice}</span>
                                <div class="price-tax">运费: ￥10.00</div>
                            </div>
                            <br>
                            <div class="cart">
                                <%--<div>Qty:<input class="quantity" type="text" name="quantity" size="2" value="1" />--%>
                                    <input type="hidden" name="product_id"  value="41" />
                                    &nbsp;
                                    <a name="add" href="#" class="button"><span>Add to Cart</span></a>
                                    <input type="hidden" name="pid" value="${requestScope.map.id}">
                                </div>
                            </div>
                            <div>
                                Just when you thought iMac had everything, now there is even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife 2008, and it is more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.</div>
                        </div>
                        <div class="price">
                        </div>
                    </div>
                </div>
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
