<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<title>分类管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 分类管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="${ctx}javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form class="Huiform" method="post" action="" target="_self">
			<input type="text" name="name" placeholder="分类名称" value="" class="input-text" style="width:120px">
			<%--<span class="btn-upload form-group">--%>
			<%--<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly style="width:200px">--%>
			<%--<a href=}${ctx}}"javascript:void();" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 上传logo</a>--%>
			<%--<input type="file" multiple name="file-2" class="input-file">--%>
			<%--</span> <span class="select-box" style="width:150px">--%>
			<%--<select class="select" name="brandclass" size="1">--%>
				<%--<option value="1" selected>国内品牌</option>--%>
				<%--<option value="0">国外品牌</option>--%>
			<%--</select>--%>
			<button type="button" class="btn btn-success"  name="picture_colume_add"><i class="Hui-iconfont">&#xe600;</i> 添加</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="${ctx}javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span> <span class="r">共有数据：<strong>${requestScope.i}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="70">ID</th>
					<%--<th width="80">排序</th>--%>
					<%--<th width="200">LOGO</th>--%>
					<th width="120">分类名称</th>
					<%--<th>具体描述</th>--%>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.list}" var="map">
				<tr class="text-c">

					<td><input name="" type="checkbox" value=""></td>
					<td>${map.id}</td>
					<%--<td><input type="text" class="input-text text-c" value="1"></td>--%>
					<%--<td><img src="temp/brand/dongpeng.jpeg"></td>--%>
					<td class="text-l"><img title="国内品牌" src="${ctx}/static/h-ui.admin/images/cn.gif"> ${map.name}</td>
					<%--<td class="text-l">东鹏陶瓷被评为“中国名牌”、“国家免检产品”、“中国驰名商标”、http://www.dongpeng.net/</td>--%>
					<td class="f-14 product-brand-manage">
						<a style="text-decoration:none" name="picture_colume_update" href="#" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
						<input type="hidden" name="id" value="${map.id}"><a style="text-decoration:none" name="picture_colume_dele" class="ml-5" href="#" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>

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
        $("button[name=picture_colume_add]").click(function () {
            var name= $(this).prev("input[name='name']").val();
            console.log(name);
            //点击按钮，发起ajax请求
            $.ajax({
                //请求地址
                url: "${ctx}/category/addCategory",
                //请求类型
                type: "POST",
                //请求参数
                data: {
                    name:$(this).prev("input[name='name']").val()
                },
                //请求成功
                success: function (result) {
                    alert("添加成功");
					location.reload();
                },
                error: function (error) {
                    alert("添加失败");
                }
            });
        });
    });
    $(function () {
        $("a[name=picture_colume_update]").click(function () {
            var name= $(this).prev("input[name='name']").val();
            console.log(name);
            //点击按钮，发起ajax请求
            $.ajax({
                //请求地址
                url: "${ctx}/brand/addBrand",
                //请求类型
                type: "POST",
                //请求参数
                data: {
                    name:$(this).prev("input[name='name']").val()
                },
                //请求成功
                success: function (result) {

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
                url: "${ctx}/category/deleteCategory",
                //请求类型
                type: "POST",
                //请求参数
                data: {
                    id:$(this).prev("input[name='id']").val()
                },
                //请求成功
                success: function (result) {
                    alert("删除成功");
					location.reload();
                },
                error: function (error) {
                    alert("因为某些原因，删除失败");
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