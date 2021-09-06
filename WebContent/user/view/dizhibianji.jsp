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
<%
request.setCharacterEncoding("UTF-8");
	Object p = session.getAttribute("user");
	LoginUser loginUser = null;
	if(p != null)loginUser = (LoginUser)p;
	 String name = request.getParameter("name");
	 String addressId = request.getParameter("addressId");
	 String address = request.getParameter("address");
	 String phone = request.getParameter("phone");
%>
<body>
<div class="thetwobf">
   <form action="/tanbao/AddressServlet?m=addressUpdate&userId=<%=loginUser.getMyInfo().getUserId()%>" method="post" >
   <input type="hidden" name="addressId" value="<%=addressId %>"/><br/>	
    <em>居住地址：</em><input name="address" type="text" id="city" value="点击选择地区" style=" height:28px;width:200px; font-size:12px; border:1px solid #bbb; float:left">
    <script type="text/javascript">
        $("#city").click(function (e) {
            SelCity(this,e);
        });
    </script>
    <br/>
    <br/>
    <em>街道：</em>
    <input name="address1" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%=address %>" required />
    <br/>
    <br/>
    <em>收件人：</em>
    <input name="name" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%=name %>"  required />
    <br/>
    <br/>
    <em>手机号：</em>
    <input name="phone" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%=phone %>" required />
   	<br/>
   	<br/>
    <input type="submit" value="修改" style="margin: 0px 20px;font-size: 20px;position: relative;left: 250px"/>
    <a href="dizhiguanli.jsp" style="position: relative; left: 350px;font-size: 20px;" target="content">返回</a>
    </form>
    
</div>

</body>
<body>
</body>
</html>