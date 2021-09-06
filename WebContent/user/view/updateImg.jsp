<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="tanbao.common.TypeConversion"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@ page import="tanbao.util.StrUtil" %>
<%@ page import="tanbao.entity.entitytable.User" %>
<%
	LoginUser user = (LoginUser)session.getAttribute("user");
	String yhtx = request.getContextPath()+"/userImgs/head.jpg";
	if(null != user && StrUtil.isNotEmpty(user.getMyInfo().getHeadImg())){
		yhtx = request.getContextPath()+"/userfile/"+user.getMyInfo().getHeadImg();
	}
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改头像</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/updateImg.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/user/js/cityJson.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/citySet.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/Popt.js"></script>
</head>

<body>
<div class="baseopxg">
	<div id="box">
	    <form enctype="multipart/form-data" name="form1" method="post" action="${pageContext.request.contextPath}/UserHeadImgUploadServlet">
			<input type="file" name="yhtx" id="pic" accept="image/*"/>
			<input type="button" value="上 传" id="upload" onclick="uploadFile()"/>
		</form>
		<div id="showInfo">&nbsp;</div>
	    <div id="uimg">
	         <span>
	               <img id="ui" src="<%=yhtx %>" />
	         </span>
	    </div>
    </div>
 </div>
 <script>
function uploadFile(){
	if(form1.yhtx.value == ""){
		document.getElementById("showInfo").innerText = "请选择图片";
	}else{
		document.getElementById("showInfo").innerText = "上传中...";
		form1.submit();
	}
}
</script>
</body>
</html>
