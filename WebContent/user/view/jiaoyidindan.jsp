<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.common.TypeConversion"%>
<%@page import="tanbao.entity.entitytable.Address"%>
<%@page import="tanbao.entity.entitytable.Order"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	Object p = (Object)request.getAttribute("listOrder");
	Object p2 = (Object)request.getAttribute("listAddress");
	List<Order> listOrder = null;
	List<Address> listAddress = null;
	if(p != null && p2 != null){
		listOrder = (List<Order>)p;
		listAddress = (List<Address>)p2;
	}
	if(listOrder == null || listAddress == null)response.sendRedirect("/tanbao/OrderServlet?m=selectMyOrder");
	else {
%>
<html>

<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css">
    <script type="text/javascript" src="../../js/jquery-1.8.0.min.js"></script>
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
<%
  TypeConversion typeConversion = new TypeConversion();
%>
<body>
<div class="page_title">
    <h2 class="fl">订单列表示例</h2>
    <a class="fr top_rt_btn add_icon" onclick="addGoods()">购买商品</a>
    <script type="text/javascript">
    	function addGoods() {
			window.parent.location.href = "/tanbao/GoodsServlet?m=goodsSelectByName&keywords=";
		}
    </script>
</div>
<section class="mtb">
    <select class="select">
        <option>订单状态</option>
        <option>未付款</option>
        <option>已付款</option>
        <option>已发货</option>
        <option>待收货</option>
        <option>已签收</option>
        <option>待评价</option>
        <option>订单已取消</option>
        <option>交易完成</option>
    </select>
    <input type="text" class="textbox textbox_225" placeholder="输入订单编号或收件人姓名/电话..."/>
    <input type="button" value="查询" class="group_btn"/>
</section>
<table class="table">
    <tr>
        <th>编号</th>
        <th>收件人</th>
        <th>联系电话</th>
        <th>收件人地址</th>
        <th>订单金额</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
	<%
		for(int i = 0; i < listOrder.size(); i++){
			if(Integer.parseInt(listOrder.get(i).getState()) < 6){
	%>
	<tr>
        <td class="center"><%=i+1 %></td>
        <td><%=listAddress.get(i).getName() %></td>
        <td><%=listAddress.get(i).getPhone() %></td>
        <td>
            <address><%=listAddress.get(i).getAddress() %></address>
        </td>
        <td class="center"><strong class="rmb_icon"><%=listOrder.get(i).getOrderPrice() %></strong></td>
        <td class="center"><%=typeConversion.orderTypeConversion(listOrder.get(i).getState()) %></td>
        <td class="center">
        <form>
        	<a href="/tanbao/OrderServlet?m=orderSelect&orderId=<%=listOrder.get(i).getOrderId() %>" title="查看订单" class="link_icon" >&#118;</a>
        </form>
            
        </td>
    </tr>
    <%
			}
		}
    %>
</table>
<!-- <aside class="paging">
    <a>第一页</a>
    <a>1</a>
    <a>2</a>
    <a>3</a>
    <a>…</a>
    <a>1004</a>
    <a>最后一页</a>
</aside> -->
</body>
</html>
<%
	}
%>
