<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/15
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.common.TypeConversion"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css">
</head>
<body>
<div class="thetwobf">
	<%
	 request.setCharacterEncoding("UTF-8");
	 String userId = request.getParameter("userId");
	 String userName = request.getParameter("userName");
	 String phone = request.getParameter("phone");
	 String userPwd = request.getParameter("userPwd");
	 String userSex = request.getParameter("userSex");
	 String userBorn = request.getParameter("userBorn");
	 String idCard = request.getParameter("idCard");
	 String email = request.getParameter("email");
	 String headImg = request.getParameter("headImg");
	 String userClass = request.getParameter("userClass");
	 TypeConversion typeConversion =new TypeConversion();
	%>
    <em>用户Id：</em>
    <input   style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= userId%>" />
    <br/>
    <br/>
    <em>用户昵称：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= userName%>" />
    <br/>
    <br/>
    <em>手机号：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= phone%>" />
   	<br/>
   	<br/>
    <em>用户密码：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= userPwd%>" />
   	<br/>
   	<br/>
    <em>性别：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= userSex%>" />
   	<br/>
   	<br/>
    <em>出生日期：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= userBorn%>" />
   	<br/>
   	<br/>
    <em>身份证：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= idCard%>"/>
   	<br/>
   	<br/>
    <em>邮箱：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= email%>" />
   	<br/>
   	<br/>
    <em>头像：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= headImg%>" />
   	<br/>
   	<br/>
    <em>用户类型：</em>
    <input  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= typeConversion.userTypeConversion(userClass)%>"/>
   	<br/>
   	<br/>
    <a href="user_list_all.jsp" style="position: relative; left: 350px;font-size: 20px;" target="content">返回</a>
    
</div>

</body>
</html>