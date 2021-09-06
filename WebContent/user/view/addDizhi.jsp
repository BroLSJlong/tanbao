<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/15
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.LoginUser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/user/js/cityJson.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/citySet.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/Popt.js"></script>
</head>
<body>
<div class="thetwobf">
	<%
	Object p = session.getAttribute("user");
	LoginUser loginUser = null;
	if(p != null)loginUser = (LoginUser)p;
	%>
    <form action="/tanbao/AddressServlet?m=addressAdd&userId=<%=loginUser.getMyInfo().getUserId() %>" method="post">
    <em>居住地址：</em><input name="address" type="text" id="city" value="点击选择地区" style=" height:28px;width:200px; font-size:12px; border:1px solid #bbb; float:left">
    <script type="text/javascript">
        $("#city").click(function (e) {
            SelCity(this,e);
        });
    </script>
    <br/>
    <br/>
    <em>街道：</em>
    <input  name="address1" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" placeholder="山东省济南市历下区黄台电子商务产业园3030室" required />
    <br/>
    <br/>
    <em>收件人：</em>
    <input name="name" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" placeholder="某某某" required />
    <br/>
    <br/>
    <em>手机号：</em>
    <input name="phone" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" placeholder="15087265931" required />
   	<br/>
   	<br/>
    <input type="submit" value="添加" style="margin: 0px 20px;font-size: 20px;position: relative;left: 250px"/>
    <a href="dizhiguanli.jsp" style="position: relative; left: 350px;font-size: 20px;" target="content">返回</a>
    </form>
</div>
</body>
</html>
