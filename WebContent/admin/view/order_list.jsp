<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.LoginUser"%>
<%@page import="tanbao.common.TypeConversion"%>
<%@page import="tanbao.dao.AddressDao"%>
<%@page import="tanbao.entity.entitytable.Address"%>
<%@page import="tanbao.entity.entitytable.User"%>
<%@page import="tanbao.dao.UserDao"%>
<%@page import="tanbao.dao.OrderDao"%>
<%@page import="tanbao.entity.entitytable.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="java.util.List"%>
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

    <% 
    	List<Order> order = (List)request.getAttribute("Order");
    	List<User> user = (List)request.getAttribute("User");
    	List<Address> address  = (List)request.getAttribute("Address");
        TypeConversion typeConversion = new TypeConversion();
        
        /**获取用户信息*/
	    Object p = session.getAttribute("user");
	    LoginUser loginUser = null;
	    if(p != null){
	    	loginUser = (LoginUser)p;
	    }else{
	    	request.getRequestDispatcher("/tanbao/index.jsp").forward(request, response);
	    }
    %>

</head>
<body>
<div class="page_title">
    <h2 class="fl">订单列表</h2>
</div>
<table class="table">
    <tr>
        <th>订单编号</th>
        <th>收件人</th>
        <th>联系电话</th>
        <th>收件人地址</th>
        <th>订单金额</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
    <%
    for(int i = 0;i<order.size();i++){
    	Order order1 =order.get(i); 
    	User user1 =user.get(i); 
    	Address address1 =address.get(i);
    	if(null == loginUser.getMyInfo().getUserId()) break;
    	if(order1.getSellerId().equals(loginUser.getMyInfo().getUserId())){
    		System.out.print(123456);
    %>
    <tr>
        <td class="center"><%=i+1 %></td>
        <td><%=user1.getUserName()%></td>
        <td><%=user1.getPhone()%></td>
        <td>
            <%=address1.getAddress() %>
        </td>
        <td class="center"><strong class="rmb_icon"><%=order1.getOrderPrice() %></strong></td>
        <td class="center"><%=typeConversion.orderTypeConversion(order1.getState())%></td>
        <td class="center">
            <a href="/tanbao/manager/view/order_detail.jsp?orderId=<%=i+1 %>
            &&buyId=<%=user1.getUserName()%>
            &&sellerId=<%=order1.getSellerId()%>
            &&orderPrice=<%=order1.getOrderPrice()%>
            &&state=<%=order1.getState() %>
            &&address=<%=address1.getAddress() %>
            " title="查看订单" class="link_icon" target="content"><button>&#118;</button></a>
            <a href="/tanbao/OrderServlet?m=orderDelete&&orderId=<%=order1.getOrderId()%>" title="删除" class="link_icon">
            <button onclick="sure()" >&#100;</button>
            </a>
        </td>
    </tr>
   <%
    	} }
   %>
   
</table>
<aside class="paging">
    <a>1</a>
    <a>2</a>
    <a>3</a>
    <a>…</a>
</aside>
</body>
<script type="text/javascript">
function sure(){
    if(confirm("确定要删除该订单吗?"))
    {
      return true;
    }else{
	   return false;
	 }
}
</script>
</html>
