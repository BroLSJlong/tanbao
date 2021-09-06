<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.GoodsImg"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css">
    <script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
window.onload=function() {
	<%
			try{
			/**查询所有商品*/
			Object object1 = (Object)request.getAttribute("goods");
			List<Goods> list1 = (List<Goods>)object1;
		    if (null == list1) {
		    	request.getRequestDispatcher("/GoodsServlet?m=selectAll&name=listAll").forward(request, response);
			}
		    /**查询所有（商品）图片*/
			Object object3 = (Object)request.getAttribute("goodsImg");
			List<GoodsImg> list2 = (List<GoodsImg>)object3;
			if (null == list2) {
				request.getRequestDispatcher("/GoodsServlet?m=goodsImgAllManager").forward(request, response);
			}
	%>
}
</script>
</head>
<body>
<div class="page_title">
    <h2 class="fl">商品列表示例</h2>
</div>
<section class="mtb">
<form action="/tanbao/GoodsServlet?m=goodsSelectByName&name=produce_list_all" method="post">
  	<input type="text" class="td1" name="keywords" />
  	<input type="submit" value="查询" />
</form>
  
  
</section>
<table class="table" >
    <tr>
        <th>商品图</th>
        <th>商品名</th>
        <th>商品id</th>
        <th>进价</th>
        <th>售价</th>
        <th>简介</th>
        <th>类型</th>
        <th>数量</th>
        <th>操作</th>
    </tr>
    <tr>
    	<%
            	for(int i = 0; i < list1.size(); i++){
            		Goods goods = list1.get(i);
            		String tplj = request.getContextPath()+"/userImgs/logo.jpg";
        			for(int u = 0; u < list2.size(); u++){
        				GoodsImg img = list2.get(u);
        				if( img.getGoodsId().equals(goods.getGoodsId())){
        						tplj = request.getContextPath()+"/goodsfile/"+img.getImgId();
        						break;
        				}else{
        					tplj = request.getContextPath()+"/userImgs/logo.jpg";
        				}
        			}
            %>
            <tr>
            	<td class="center"><img src="<%=tplj%>" width="50" height="50"/></td>
				<td class="center"><%=goods.getGoodsName() %></td>
				<td class="center"><textarea class="center" cols="10" rows="3" readonly="readonly" style="font-size:12px;"><%=goods.getGoodsId()%></textarea></td>
				<td class="center">￥<%=goods.getGoodsInPrice()%></td>
				<td class="center">￥<%=goods.getGoodsOutPrice()%></td>
				<td class="center"><textarea class="center" cols="15" rows="4" readonly="readonly" style="font-size:10px;"><%=goods.getGoodsDescript()%></textarea></td>
				<td class="center"><%=goods.getGoodsClass()%></td>
				<td class="center"><%=goods.getGoodsNum()%></td>
				<td class="center">
				 	<a href="/tanbao/GoodsServlet?m=toUpdate&goodsId=<%=goods.getGoodsId()%>"  class="link_icon">
						<button >&#101;</button>	 
					</a>
					 <a href="/tanbao/GoodsServlet?m=goodsDelete&goodsId=<%=goods.getGoodsId()%>"  class="link_icon">
						<button onclick="sure()">&#100;</button>	 
					</a>
				</td>
				
           	</tr>
            <% }}catch(Exception e){} %>
    </tr>
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
	     if(confirm("确定要删除该商品吗?"))
	     {
	       return true;
	     }else{
		   return false;
		 }
	}
</script>
</html>
