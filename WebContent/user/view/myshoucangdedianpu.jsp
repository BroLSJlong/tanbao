<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/13
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.Store"%>
<%@page import="tanbao.entity.entitytable.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="order by dede58.com"/>
    <title>我收藏的店铺</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/public.js"></script>
</head>

<body>
<!--商品收藏和店铺收藏-->
<div class="locfre">
    <a href="/tanbao/ColloctionServlet?m=getGoods" >商品收藏</a>
    <a href="/tanbao/ColloctionServlet?m=getStore" class="zuliyesi">店铺收藏</a>
    <a href="/tanbao/ColloctionServlet?m=deleteStoreAll" style=" float:right">全部删除</a>
</div>
<script>
    $(function(){
        $(".locfre a").click(function(){
            $(this).addClass("zuliyesi").siblings().removeClass("zuliyesi")
        })
    })
</script>
<!--收藏的商品列表-->
<div class="nanmeizhou">
    <!--一条列表开始-->
    <ul>
    	<%
	    	Object p = request.getAttribute("listStore");
    		Object p2 = request.getAttribute("listUser");
    		Object p3 = request.getAttribute("types");
	    	List<User> listUser = null;
	    	List<String> listStoreName = null;
	    	List<String> types = null;
			if(p2 != null && p != null) {
				listUser = (List<User>)p2;
				listStoreName = (List<String>)p;
				types = (List<String>)p3;
			}
			if(listUser == null || listStoreName == null)response.sendRedirect("/tanbao/ColloctionServlet?m=getStore");
			for(int i = 0; i < listUser.size(); i++){
				%>
					<li>
			            <a href="#"><img src="${pageContext.request.contextPath}/img/logo2.jpg"/></a>
			            <a href="#" style=" display:block; padding-left:20px; line-height:60px; font-size:14px; float:left"><%=listStoreName.get(i) %></a>
			            <em style=" float:left; padding-left:20px; font-size:12px; color:#666; line-height:60px">联系方式：<s><%=listUser.get(i).getPhone() %></s></em>
			            <em style=" float:left; padding-left:20px; font-size:12px; color:#666; line-height:60px">店主：<s><%=listUser.get(i).getUserName() %></s></em>
			            <em style=" float:left; padding-left:20px; font-size:12px; color:#666; line-height:60px">主要商品类型：<s><%=types.get(i) %></s></em>
			            <a href="/tanbao/ColloctionServlet?m=deleteStore&id=<%=listUser.get(i).getUserId() %>" style=" display:block; padding-right:20px; line-height:60px; font-size:14px; float:right; text-decoration:none">[删除]</a>
	       			</li>
				<%
			}
    	%>
    </ul>
    <!--一条列表结束-->
</div>
<!--收藏商品列表结束-->
</body>
</html>
