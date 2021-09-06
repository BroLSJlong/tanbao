<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>

<%@page import="tanbao.entity.entitytable.Goods"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css">
</head>
<body>
<div class="page_title">
    <h2 class="fl">商品上传</h2>
    <a class="fr top_rt_btn" href="/tanbao/manager/view/product_list_all.jsp">返回产品列表</a>
</div>
<section>
		<form action="/tanbao/GoodsServlet?m=goodsAdd" method="post" id="f">
	    <ul class="ulColumn2">
	        <li>
	        	<input type="hidden" name="goodsId" id="goodsId">
	        	<input type="hidden" name="m"  value="goodsAdd" />
	            <span class="item_name" style="width:120px;">商品名称：</span>
	            <input name="goodsName" type="text" class="textbox textbox_295" placeholder="商品名称..." id="goodsName"/>
	
	        </li>
	        <li>
	            <span class="item_name" style="width:120px;">商品售价：</span>
	            <input name="goodsOutPrice" type="text" class="textbox" placeholder="商品售价..." id="goodsOutPrice"/>
	        </li>
	        <li>
	            <span class="item_name" style="width:120px;">商品进价：</span>
	            <input name="goodsInPrice" type="text" class="textbox" placeholder="商品进价..." id="goodsInPrice"/>
	
	        </li>
	        <li>
	            <span class="item_name" style="width:120px;">类型：</span>
	            <select class="select" name="goodsClass" id="goodsClass">
	                <option value="手机">手机</option>
	                <option value="机器人">机器人</option>
	                <option value="厨具">厨具</option>
	                <option value="台灯">台灯</option>
	                <option value="血压计">血压计</option>
	                <option value="零食">零食</option>
	            </select>
	
	        </li>
	        <li>
	            <span class="item_name" style="width:120px;">数量：</span>
	            <input name="goodsNum" type="text" class="textbox" placeholder="数量..." id="goodsNum"/>
	        </li>
	        <li>
	            <span class="item_name" style="width:120px;">产品简介：</span>
	            <textarea cols="40" rows="4" name="goodsDescript" id="goodsDecript"></textarea>
	        </li>
	        <li>
	            <span class="item_name" style="width:120px;"></span>
	            <input type="submit" class="link_btn" value="提交"/>
	        </li>
	    </ul>
    </form>
</section>
<%
	Object p = request.getAttribute("goods");
	Goods goods = null;
	if(p != null){
		goods = (Goods)p;
		%>
			<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.0.min.js"></script>
			<script type="text/javascript">
				$("#goodsName").val("<%=goods.getGoodsName()%>");
				$("#goodsOutPrice").val("<%=goods.getGoodsOutPrice()%>");
				$("#goodsInPrice").val("<%=goods.getGoodsInPrice()%>");
				$("#goodsClass").attr("selected","<%=goods.getGoodsClass()%>");
				$("#goodsNum").val("<%=goods.getGoodsNum()%>");
				$("#goodsDecript").html("<%=goods.getGoodsDescript()%>");
				$("#f").attr("action","/tanbao/GoodsServlet?m=goodsUpdate");
				$("#goodsId").val("<%=goods.getGoodsId()%>");
			</script>
		<%
	}
	
%>
</body>

</html>
