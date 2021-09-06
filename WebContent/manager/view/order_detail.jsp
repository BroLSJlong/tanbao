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
	 String orderId = request.getParameter("orderId");
	 String buyId = request.getParameter("buyId");
	 String sellerId = request.getParameter("sellerId");
	 String orderPrice = request.getParameter("orderPrice");
	 String state = request.getParameter("state");
	 String address = request.getParameter("address");
	 String addressId = request.getParameter("addressId");
	%>
    <em>订单Id：</em>
    <input id="orderId"  style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" readonly="readonly" value="<%= orderId%>" />
    <br/>
    <br/>
    <em>收货人：</em>
    <input id="buyId" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= buyId%>" />
    <br/>
    <br/>
    <em>卖家：</em>
    <input id="sellerId" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="90c005d1560f42ecafdbd002e63d006f" />
   	<br/>
   	<br/>
    <em>总价：</em>
    <input id="orderPrice" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= orderPrice%>" />
   	<br/>
   	<br/>
    <em>状态：</em>
    <input id="state" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%=TypeConversion.orderTypeConversion(state)%>" />
   	<br/>
   	<br/>
    <em>地址：</em>
    <input id="address" style="float:left; border:1px solid #bbb; box-shadow:none; height:28px; font-size:12px; text-indent:6px; width:420px" type="text" class="shuru" value="<%= address%>" />
   	<br/>
   	<br/>
   	<input type="hidden" id="addressId" value=""/>
    <a href="/tanbao/OrderServlet?m=managerOrderSelect" style="position: relative; left: 350px;font-size: 20px;" target="content">返回</a>
     <a href="#" style="position: relative; left: 350px;font-size: 20px;" target="content" onclick="mod()">修改</a>
</div>
<script src="../../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	function mod(){
		$.post("/tanbao/OrderServlet?m=orderUpdate",{
			"orderId":$("#orderId").val(),
			"buyId":$("#buyId").val(),
			"sellerId":$("#sellerId").val(),
			"orderPrice":$("#orderPrice").val(),
			"state":$("#state").val(),
			"address":$("#address").val(),
			"addressId":$("#addressId").val()
		},function(b){
			if(b){
				if(confirm("修改成功是否返回?"))window.location.href = "/tanbao/OrderServlet?m=managerOrderSelect";
			}else {
				alert("修改失败");
			}
		})
	}
</script>
</body>
</html>