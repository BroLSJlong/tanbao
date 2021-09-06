<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.Address"%>
<%@page import="tanbao.common.TypeConversion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="tanbao.dao.OrderDao"%>
<%@page import="tanbao.dao.GoodsDao"%>
<%@page import="tanbao.entity.entitytable.Order"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="tanbao.dao.OrderDetailDao"%>
<%@page import="tanbao.entity.entitytable.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css">
    <script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>
        (function($){
            $(window).load(function(){

                $("a[rel='load-content']").click(function(e){
                    e.preventDefault();
                    var url=$(this).attr("href");
                    $.get(url,function(data){
                        $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                        //scroll-to appended content
                        $(".content").mCustomScrollbar("scrollTo","h2:last");
                    });
                });

                $(".content").delegate("a[href='top']","click",function(e){
                    e.preventDefault();
                    $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
                });

            });
        })(jQuery);
    </script>
</head>
<body>

<div class="page_title">
    <h2 class="fl">订单详情示例</h2>
</div>
<%
	Object p = request.getAttribute("listGoods");
	Object p2 = request.getAttribute("order");
	Object p3 = request.getAttribute("address");
	Object p4 = request.getAttribute("listNum");
	List<Goods> listGoods = null;
	Order order = null;
	Address address = null;
	List<String> listNum = null;
	if(p != null && p2 != null){
		listGoods = (List<Goods>)p;
		order = (Order)p2;
		address = (Address)p3;
		listNum = (List<String>)p4;
	}
	if(listGoods == null || order == null);
	else{
		%>
<table class="table"> 
    <tr>
        <td>收件人：<%=address.getName() %></td>
        <td>联系电话：<%=address.getPhone() %></td>
        <td>收件地址：<%=address.getAddress() %></td>
    </tr>
    <tr>
        <td colspan="3">订单状态：<a><%=TypeConversion.orderTypeConversion(order.getState()) %></a></td>
    </tr>
</table>
<table class="table">
		<%
			for(int i = 0; i < listGoods.size(); i++){
				Goods g = listGoods.get(i);
		%>
		<tr>
        <td class="center"><img src="upload/goods01.jpg" width="50" height="50"/></td>
        <td><%=g.getGoodsName() %></td>
        <td class="center"><strong class="rmb_icon"><%=g.getGoodsOutPrice() %></strong></td>
        <td class="center">
            <p><%=g.getGoodsClass() %></p>
        </td>
        <td class="center"><strong><%=listNum.get(i) %></strong></td>
		</tr>
    	<%
			}
		%>
</table>
	
<aside class="mtb" style="text-align:right;">

    <input type="button" value="返回" class="group_btn" onclick="bagkPage()"/>

</aside>
	<%
		
	}
    %>
 <script type="text/javascript">
 	function bagkPage(){
 		window.history.back();
 	}
 </script>
</body>
</html>
