<%--
  Created by IntelliJ IDEA.
  User: 隔壁小王
  Date: 2017/11/16
  Time: 15:39
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

<div id="wrapper">
    <div class="slider-wrapper theme-orman">
        <div class="ribbon"></div>
        <div id="slider" class="nivoSlider" style="border: 1px solid #444;box-shadow: 0 0 5px 0 #080808;">
            <a href="#"><img src="${ctx}/static/images/a.jpg" alt="" title="This is an example of a caption" /></a>
            <a href="#"><img src="${ctx}/static/images/b.jpg" alt="" title="This is an example of a caption" /></a>
        </div>
        <br>
        <div class="controlNav_box"></div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/slider/scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${ctx}/static/slider/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
</script>

<div class="container">
    <div class="text_box_left">亏血甩卖</div>

    <div class="box-product" style="float: left">
        <c:forEach items="${requestScope.list}" var="list" end="3">
        <div>
            <div class="showhim">
                <div class="image">
                    <a href="${ctx}/product/query?id=${list.id}"><img src="${ctx}/${list.picture}" alt="iMac" />
                        <div class="showme">
                            <div class="description_featured" style="min-height:110px;">
                                <p>${list.describes}</p>
                            </div>
                        </div>
                    </a>
                    <div class="name"><a href="${ctx}/product/query?id=${list.id}">${list.pname}</a></div>
                    <div class="priced">
                        <ul>
                            <li><c:choose>
                                    <c:when test="${list.xprice}>${list.yprice}">￥${list.yprice}</c:when>
                                    <c:otherwise>￥${list.xprice}</c:otherwise>
                                </c:choose>
                            </li
                                <li>
                                    <p style="font-size: 8px;text-decoration: line-through;">￥${list.yprice}</p>
                                </li>
                        </ul>
                    </div>
                    <div style="margin-top:24px;"></div>
                </div>
                <div class="showme">
                </div>
            </div>
        </div>
        </c:forEach>
    </div>

</div>


<br>
<%@include file="commonf.jsp"%>

</body>
</html>
