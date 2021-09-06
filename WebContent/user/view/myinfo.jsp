<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/13
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.common.TypeConversion"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>修改资料</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/user/js/cityJson.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/citySet.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/Popt.js"></script>
</head>

<body>

<div class="basedexinxi">
    <a href="#">基本信息</a>
</div>
<!--基本信息结束-->
<!--修改基本信息开始-->
<div class="baseopxg">
    <!--第一部分-->
    <div class="tirstbf" id="headImg">
                	<span>
                    	<img src="<%=yhtx%>" />
                        <a href="updateImg.jsp">编辑头像</a>
                    </span>
    </div>
    <!--第二部分-->

    <div class="thetwobf">
        <em style="position: relative;left: 220px;">昵称：</em>
        <h5 style="position: relative;left: 220px;"><%=user.getMyInfo().getUserName()%></h5>
    </div>
    <div class="thetwobf">
        <em style="position: relative;left: 220px;">性别：</em>
        <h5 style="position: relative;left: 220px;"><%=TypeConversion.userSexConversion(user.getMyInfo().getUserSex())%></h5>
    </div>
    <div class="thetwobf">
        <em style="position: relative;left: 220px;">电话：</em>
        <h5 style="position: relative;left: 220px;"><%=user.getMyInfo().getPhone()%></h5>
    </div>
    <div class="thetwobf">
        <em style="position: relative;left: 220px;">邮箱：</em>
        <h5 style="position: relative;left: 220px;"><%=user.getMyInfo().getEmail()%></h5>
    </div>
    <div class="thetwobf">
        <em style="position: relative;left: 220px;">出生日期：</em>
        <h5 style="position: relative;left: 220px;"><%=user.getMyInfo().getUserBorn()%></h5>
    </div>
</div>
<!--修改基本信息结束-->


</body>
</html>





