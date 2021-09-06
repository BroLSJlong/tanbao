<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/13
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@page import="tanbao.dao.AddressDao"%>
<%@page import="tanbao.entity.entitytable.Address"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<%
	Object p = session.getAttribute("user");
	Object p2 = request.getAttribute("addresses");
	ArrayList<Address> addresses = null;
	LoginUser loginUser = null;
	if( p != null && p2 != null ){
		loginUser = (LoginUser)p;
		addresses = (ArrayList)p2;
	}
	if( addresses == null )response.sendRedirect("/tanbao/AddressServlet?m=addressSelect");
	else{
		%>
<head>
    <meta charset="utf-8">
    <title>地址管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!--地址列表和新增地址-->
<div class="dfdaspjtk" style=" margin-top:0">
    <span style=" display:block; float:left; font-size:14px; font-weight:bold; line-height:34px; padding-left:20px; padding-right:20px; color:#666">地址列表</span>
    <a href="/tanbao/user/view/addDizhi.jsp" style=" line-height:34px; font-weight:bold; color:#09f; float:right" class="zcznmdfc1">添加地址</a>
    <s style=" font-size:12px; color:#111; line-height:34px; display:block">注：最多保存20个地址</s>
</div>

<!--一条地址开始-->
<div class="adressdeliebi">
    <%	
		for(Address a : addresses){
    	%>
    <div class="adressfive">
        <div class="shrtm">
            <span>收货人</span>
            <p><%=a.getName()%></p>
        </div>
        <div class="shrszdq">
            <span>所在地区街道地址</span>
            <p><%=a.getAddress()%></p>
        </div>
        <div class="shrjbdh">
            <span>联系方式</span>
            <p><%=a.getPhone()%></p>
        </div>
        <div class="shrtmdcz" style=" float:right">
            <span>操作</span>
            <a href="/tanbao/user/view/dizhibianji.jsp?name=<%=a.getName()%>&address=<%=a.getAddress()%>&phone=<%=a.getPhone()%>&addressId=<%=a.getAddressId()%>">编辑</a>
            <a href="/tanbao/AddressServlet?m=addressDelete&addressId=<%=a.getAddressId()%>&userId=<%=a.getUserId()%>">删除</a>
        </div>
    </div>
    <%
		}
    %>
</div>
</body>
</html>
    <%
		}
    %>


