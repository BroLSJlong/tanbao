<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品图片上传</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/goodsimg.css">
	<script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body>
<div class="page_title">
    <h2 class="fl">商品图片管理</h2>
</div>
<input type="text" class="td1" id="keywords" />
<input type="submit" value="查询" onclick="selectGoods()"/>
<table class="table">
<tbody id="tbody"></tbody>
</table>
<div class="baseopxg">
	<div id="box">
	    <form id="form1" enctype="multipart/form-data" name="form1" method="post" action="${pageContext.request.contextPath}/GoodsImgUploadServlet">
			<%--商品id --%>
			<input id="currentid" name="currentid"  type="hidden" value="">
			<%--商品图片 --%>
			<input type="file" name="yhtx" id="pic" accept="image/*"/>
			<input type="submit" value="上 传" id="upload" onclick="addFile()"/>
		</form>
		<div id="showInfo">&nbsp;</div>
    </div>
 </div>
 <script src="../../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
function addFile(){
	if(form1.currentid.value == ""){
		document.getElementById("showInfo").innerText = "请搜索商品";
	}else{
		if(form1.yhtx.value == ""){
			document.getElementById("showInfo").innerText = "请选择图片";
		}else{
			document.getElementById("showInfo").innerText = "上传中...";
			var action = "/tanbao/GoodsImgUploadServlet";
			action += "?currentid="+document.form1.currentid.value;
			document.form1.action = action;
			document.form1.submit();
			form1.submit();
		}
	}
}

function getGoodsImg(){
	$.post("/tanbao/GoodsServlet?m=goodImgSelect",{"goodId":keywords},function(list){
		goodsImgs = list;
		$("#tbody").children().remove();
		tr = $("<tr>");
		if(list != null){
			for(i = 0; i < list.length; i++){
				if(i % 5 == 0){
					$("#tbody").append($(tr));
					tr = $("<tr>");
				}
				$(tr).append($("<td>").append("<img src='/tanbao/goodsfile/"+list[i]+"' style='width:80px;height:80px;'>")
										.append($("<button onclick='deleteImg("+i+")' >").html("删除")));
			}
				$("#tbody").append($(tr));
		}
	},"json");
}

function selectGoods(){
	keywords = $("#keywords").val();
	if(keywords != null){
		$("#currentid").val(keywords);
		getGoodsImg();
	}else{
		alert("未输入商品ID");
	}
}

function deleteImg(n){
	$.post("/tanbao/GoodsServlet?m=deleteGoodsImg",{"imgId":goodsImgs[n]},function(){
		getGoodsImg();
	});
}
</script>
</body>
</html>