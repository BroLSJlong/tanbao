<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/13
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.GoodsImg"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="java.util.List"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="order by dede58.com"/>
    <title>我的收藏</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/public.js"></script>
</head>
<body>
	<%
	/**查询所有（商品）图片*/
    Object object2 = (Object)request.getAttribute("goodsImg");
    List<GoodsImg> list2 = (List<GoodsImg>)object2;
    if (null == list2) {
		request.getRequestDispatcher("/GoodsServlet?m=goodsImgAllGWC&name=shoucang").forward(request, response);
	}else{
	 %>
<!--商品收藏和店铺收藏-->
<div class="locfre">
    <a href="/tanbao/ColloctionServlet?m=getGoods" class="zuliyesi">商品收藏</a>
    <a href="/tanbao/ColloctionServlet?m=getStore">店铺收藏</a>
    <a href="/tanbao/ColloctionServlet?m=deletGoodsAll" style=" float:right">全部删除</a>
</div>
<script>
    $(function(){
        $(".locfre a").click(function(){
            $(this).addClass("zuliyesi").siblings().removeClass("zuliyesi")
        })
    })
</script>
<!--收藏的商品列表-->
<div class="feizhoum">
    <ul>
    	<%
    		
    		Object p = request.getAttribute("listGoods");
	    	List<Goods> list = null;
			if(p != null) {
				list = (List<Goods>)p;
			}
    		if(list == null)response.sendRedirect("/tanbao/ColloctionServlet?m=getGoods");
    		else{
    			for(Goods g : list){
    					String tplj = request.getContextPath()+"/userImgs/logo.jpg";
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
    				<li>
    					<img src="<%=tplj%>">
    					<span>
    						<a href="#" style="width: 212px;white-space: nowrap;overflow: hidden;ext-overflow: ellipsis;"><%=g.getGoodsName() %>&nbsp;<%=g.getGoodsClass() %>&nbsp;<%=g.getGoodsDescript() %></a>
                            <em style="color: red;" >￥<%=g.getGoodsOutPrice()%></em>
							<a>&nbsp</a>
                            <a href="/tanbao/ColloctionServlet?m=deleteGood&id=<%=g.getGoodsId() %>" style="display:block; width:40px; height:20px; text-align:center; line-height:20px; font-size:12px; color:#fff; background:#09f; margin-top:12px">删除</a>
    					</span>
    				</li>
    				<%
    			}
    		}
			}
    	%>
    </ul>
</div>
<!--收藏商品列表结束-->

</body>
</html>





