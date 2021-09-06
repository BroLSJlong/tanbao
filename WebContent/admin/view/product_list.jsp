<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
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
<script type="text/javascript">
window.onload=function() {
	<%
			try{
			/**查询所有商品*/
			Object object1 = (Object)request.getAttribute("goods");
			List<Goods> list1 = (List<Goods>)object1;
		    if (null == list1) {
		    	request.getRequestDispatcher("/GoodsServlet?m=selectAdmin&name=listAll_admin").forward(request, response);
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
<form action="/tanbao/GoodsServlet?m=goodsSelectByName_admin&name=product_list" method="post">
  	<input type="text" class="td1" name="keywords" />
  	<input type="submit" value="查询" />
</form>
  
  
</section>
<table class="table">
    <tr>
        <th>商品图</th>
        <th>商品名</th>
        <th>商品id</th>
        <th>售价</th>
        <th>简介</th>
        <th>类型</th>
        <th>数量</th>
        <th>操作</th>
    </tr>
    <tr>
    	<%
            	for(int i = 0; i < list1.size();i++){
            		Goods goods = list1.get(i);
            %>
            <tr>
            	<td class="center"><img src="upload/goods01.jpg" width="50" height="50"/></td>
				<td><%=goods.getGoodsName() %></td>
				<td><%=goods.getGoodsId()%></td>
				<td><%=goods.getGoodsOutPrice()%></td>
				<td><%=goods.getGoodsDescript()%></td>
				<td><%=goods.getGoodsClass()%></td>
				<td><%=goods.getGoodsNum()%></td>
				<td>
					<a href="/tanbao/GoodsServlet?m=goodsDelete&goodsId=<%=goods.getGoodsId()%>">
						删除	 
					</a>
				</td>
				
           	</tr>
            <% }}catch(Exception e){} %>
        
    </tr>
</table>
<aside class="paging">
    <a>第一页</a>
    <a>1</a>
    <a>2</a>
    <a>3</a>
    <a>…</a>
    <a>1004</a>
    <a>最后一页</a>
</aside>
</body>
</html>
