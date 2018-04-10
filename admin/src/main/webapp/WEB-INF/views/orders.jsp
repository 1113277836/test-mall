<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="commons.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/html5shiv.js"></script>
<script type="text/javascript" src="${ctx}/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${ctx}/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>订单管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 订单管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="${ctx}javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<%--<div class="text-c">--%>
		<%--<form class="Huiform" method="post" action="" target="_self">--%>
			<%--<input type="text" name="name" placeholder="分类名称" value="" class="input-text" style="width:120px">--%>
			<%--&lt;%&ndash;<span class="btn-upload form-group">&ndash;%&gt;--%>
			<%--&lt;%&ndash;<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly style="width:200px">&ndash;%&gt;--%>
			<%--&lt;%&ndash;<a href=}${ctx}}"javascript:void();" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 上传logo</a>&ndash;%&gt;--%>
			<%--&lt;%&ndash;<input type="file" multiple name="file-2" class="input-file">&ndash;%&gt;--%>
			<%--&lt;%&ndash;</span> <span class="select-box" style="width:150px">&ndash;%&gt;--%>
			<%--&lt;%&ndash;<select class="select" name="brandclass" size="1">&ndash;%&gt;--%>
				<%--&lt;%&ndash;<option value="1" selected>国内品牌</option>&ndash;%&gt;--%>
				<%--&lt;%&ndash;<option value="0">国外品牌</option>&ndash;%&gt;--%>
			<%--&lt;%&ndash;</select>&ndash;%&gt;--%>
			<%--<button type="button" class="btn btn-success"  name="picture_colume_add"><i class="Hui-iconfont">&#xe600;</i> 添加</button>--%>
		<%--</form>--%>
	<%--</div>--%>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="r">共有数据：<strong>${requestScope.i}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-sort">
			<thead>
				<tr class="text-c">
					<%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
					<th width="70">订单编号</th>
					<%--<th width="200">LOGO</th>--%>
					<th width="100">创建时间</th>
					<th width="100">支付时间</th>
					<th width="80">订单价格</th>
						<th>收货人</th>
						<th>收货地址</th>
					<th>订单状态</th>
					<th width="100">操作</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.maps}" var="map">
				<tr class="text-c">

					<%--<td><input name="" type="checkbox" value=""></td>--%>
					<td>${map.id}</td>
					<%--<td><input type="text" class="input-text text-c" value="1"></td>--%>
					<%--<td><img src="temp/brand/dongpeng.jpeg"></td>--%>
					<td class="text-l">${map.create_time}</td>
					<td class="text-l">${map.pay_time}</td>
					<td class="text-l">${map.price}</td>
						<td>${map.name}</td>
						<td>${map.addre}</td>
					<td class="text-l">${map.S}</td>
					<c:if test="${fn:endsWith(map.S,'待付款' )==true}">
					<td class="f-14 product-brand-manage">
						<p>提醒顾客付款</p>
						</c:if>
						<c:if test="${fn:endsWith(map.S,'待收货')==true}">
					<td class="f-14 product-brand-manage">
						<a style="text-decoration:none" name="picture_colume_update" href="#" title="发货"><i class="Hui-iconfont">&#xe6df;</i></a>
						<input type="hidden" name="id" value="${map.id}">
						<a style="text-decoration:none" name="picture_colume_dele" class="ml-5" href="#" title="取消订单"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</c:if>
						<c:if test="${fn:endsWith(map.S,'已发货' )==true}">
					<td class="f-14 product-brand-manage">
						<input type="hidden" name="id" value="${map.id}">
						<a style="text-decoration:none" name="picture_colume_dele" class="ml-5" href="#" title="取消订单"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</c:if>
					<c:if test="${fn:endsWith(map.S,'已取消' )==true}">
					<td class="f-14 product-brand-manage">
						<p>订单已取消</p>
						</c:if>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $(function () {
        $("a[name=picture_colume_update]").click(function () {
            var id= $(this).next("input[name='id']").val();
            console.log(id);
            //点击按钮，发起ajax请求
            $.ajax({
                //请求地址
                url: "${ctx}/product/fh",
                //请求类型
                type: "POST",
                //请求参数
                data: {
                    id:$(this).next("input[name='id']").val()
                },
                //请求成功
                success: function (result) {
					alert("发货成功");
                    location.reload();
                },
                error: function (error) {
                }
            });
        });
    });
    $(function () {
        $("a[name=picture_colume_dele]").click(function () {
            var id= $(this).prev("input[name='id']").val();
            console.log(id);
            //点击按钮，发起ajax请求
            $.ajax({
                //请求地址
                url: "${ctx}/product/qx",
                //请求类型
                type: "POST",
                //请求参数
                data: {
                    id:$(this).prev("input[name='id']").val()
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
        });
    });
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,6]}// 制定列不参与排序
	]
});


</script>
</body>
</html>