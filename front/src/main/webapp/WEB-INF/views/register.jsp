
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
    <%@ include file="common.jsp"%>
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
    <script src="${ctx}/static/slider/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //页面加载完成之后执行
            $("input[name=username]").blur(function () {
                //点击按钮，发起ajax请求
                $.ajax({
                    //请求地址
                    url: "${ctx}/member/resgName",
                    //请求类型
                    type: "POST",
                    //请求参数
                    data: {
                        username: $(this).val()
                    },
                    //请求成功
                    success: function (result) {
                        console.log("success");
                        console.log(result.msg);
                        //在按钮下方添加p标签，标签内容就是result
                        $("span[id=ts]").text(result.msg);
                    },
                    error: function (error) {
                        console.log("error:" + error);
                        console.log(error);
                    }
                });
            });
            $("input[name=passwordd]").blur(function () {
               if($("input[name=passwordd]").val()!=$("input[name=password]").val()){
                   $("span[id=tss]").text("密码不一致");
               }else {
                   $("span[id=tss]").text("密码一致");
               }
            });
        });


    </script>
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
                    <li><a href="#">忘记密码</a></li>
                    <li><a href="#">我的账户</a></li>
                    <li><a href="#">愿望清单</a></li>
                    <li><a href="#">订单记录</a></li>
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
                    <p>身份证号用来找回密码，手机号便于我们联系您</p>
                </div>
            </div>
            <div class="right">
                <h2>新客户</h2>
                <%
                    String path=request.getContextPath();
                %>
                <form action="${ctx}/member/resg" id="resg" method="post">
                    <div class="content">
                        <p>我是新客户</p>
                        <b>账号:</b><br />
                        <input type="text" name="username" value="" /><span id="ts"></span>
                        <br />
                        <br />
                        <b>密码:</b><br />
                        <input type="password" name="password" value="" />
                        <br />
                        <br/>
                        <b>确认密码:</b><br />
                        <input type="password" name="passwordd" value="" /><span id="tss"></span>
                        <br />
                        <br />
                        <b>身份证:</b><br />
                        <input type="text" name="id_number" value="" />
                        <br />
                        <br />
                        <b>联系方式:</b><br />
                        <input type="text" name="tel" value="" />
                        <br />
                        <br />
                        <input type="submit" value="注册">
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
