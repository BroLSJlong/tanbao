<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.GoodsImg"%>
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
<%
	/**查询所有（商品）图片*/
    Object object2 = (Object)request.getAttribute("goodsImg");
    List<GoodsImg> list2 = (List<GoodsImg>)object2;
    if (null == list2) {
		request.getRequestDispatcher("/GoodsServlet?m=goodsImgAllGoods&name=dingdan").forward(request, response);
	}else{
	 %>
<div class="page_title">
    <h2 class="fl">订单详情示例</h2>
</div>
<%
	Object p = request.getAttribute("listGoods");
	Object p2 = request.getAttribute("orderPrice");
	Object p3 = request.getAttribute("listAddress");
	Object p4 = request.getAttribute("listNum");
	List<Goods> listGoods = null;
	List<Address> listAddress = null;
	String orderPrice  = null;
	List<String> listNum = null;
	if(p != null && p2 != null){
		listGoods = (List<Goods>)p;
		orderPrice = (String)p2;
		listAddress = (List<Address>)p3;
		listNum = (List<String>)p4;
	}
	if(listGoods == null);
	else{
		%>
<table class="table"> 
    <tr>
    	<td>
		<select hidden="hidden" class="address" onchange="changeAddress(0)">
			<%
				for(int i = 0; i < listAddress.size(); i++){
			%>
			<option value="<%=listAddress.get(i).getAddressId() %>"></option>
			<%
				}
			%>
		</select>
		<select class="address" onchange="changeAddress(1)">
			<%
				for(int i = 0; i < listAddress.size(); i++){
			%>
			<option>收件人：<%=listAddress.get(i).getName() %></option>
			<%
				}
			%>
		</select>
		</td>
		<td>
		<select class="address" onchange="changeAddress(2)">
			<%
				for(int i = 0; i < listAddress.size(); i++){
			%>
			<option>联系电话：<%=listAddress.get(i).getPhone() %></option>
			<%
				}
			%>
		</select>
		</td>
		<td>
		<select class="address" onchange="changeAddress(3)">
			<%
				for(int i = 0; i < listAddress.size(); i++){
			%>
			<option>收件地址：<%=listAddress.get(i).getAddress() %></option>
			<%
				}
			%>
		</select>
		</td>
    	
    </tr>
    <tr>
        <td colspan="2">订单状态：<a><%=TypeConversion.orderTypeConversion("1") %></a></td>
    	<td colspan="1">点单总价：<strong class="rmb_icon" style="color:red"><%=orderPrice %></strong></td>
    </tr>
</table>
<table class="table">
		<%
			String tplj = request.getContextPath()+"/userImgs/logo.jpg";
			for(int i = 0; i < listGoods.size(); i++){
				Goods g = listGoods.get(i);
				/**循环判定该商品是否有点图片*/
				for(int u = 0; u < list2.size(); u++){
    				GoodsImg img = list2.get(u);
    				if(img.getGoodsId().equals(g.getGoodsId())){
    					tplj = request.getContextPath()+"/goodsfile/"+img.getImgId();
    					break;
    				}else{
    					tplj = request.getContextPath()+"/userImgs/logo.jpg";
    				}
    			}
		%>
		<tr>
        <td class="center"><img src="<%=tplj%>" width="50" height="50"/></td>
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

    <input type="button" value="确认订单" class="group_btn" onclick="addOrder()"/>
    <input type="button" value="取消订单" class="group_btn" onclick="returnOrder()"/>

</aside>
	<%
	}
	}
    %>
<script type="text/javascript">
	address = document.getElementsByClassName("address");
	function changeAddress(j){
		index = address[j].selectedIndex;
		for(var i = 0; i < 4; i++){ 
			address[i].options[index].selected= true;
		}
	}
	function addOrder(){
		if(address[0].value != ""){
			window.location.href = "/tanbao/OrderServlet?m=orderAdd&addressId="+address[0].value;
		}else {
			alert("请填去地址管理填写好地址");
		}
	}
	function returnOrder(){
		window.parent.location.href = "/tanbao/user/view/admin.jsp";
	}
</script>
</body>
</html>
