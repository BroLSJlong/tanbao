<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.LoginUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tanbao.service.GoodsService"%>
<%@page import="tanbao.entity.entitytable.GoodsImg"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="tanbao.dao.GoodsDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	/**查询所有（商品）图片*/
	Object object2 = (Object)request.getAttribute("goodsImg");
	List<GoodsImg> list2 = (List<GoodsImg>)object2;
	if (null == list2) {
		request.getRequestDispatcher("GoodsServlet?m=goodsImgAllFenlei").forward(request, response);
	}else{
		/**查询商品*/
		Object p = request.getAttribute("goods");
		List<Goods> goods = null;
		List<String> goodImgs = null;
		if(p != null){
			goods = (List<Goods>)p;
		}
		if(goods == null)response.sendRedirect("/tanbao/GoodsServlet?m=randomSelect");
		else {
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>列表页</title>
    <link rel="stylesheet" type="text/css" href="css/top.css"/>
    <link rel="stylesheet" type="text/css" href="css/liebiao.css"/>
    <link type="text/css" rel="stylesheet" href="css/shouye.css" />
    <script src="js/shouye.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/public.js"></script>

</head>

<body>
<div id="yi">
    <div class="yi_zhong">
        <div class="zuo" style="position: relative; z-index: 10;">
             <a href="index.jsp" target="_blank">探宝</a>|
            <a href="index.jsp" target="_parent">首页</a>|
            <a href="/tanbao/GoodsServlet?m=goodsSelectByName&keywords=" target="_blank">去逛逛</a>|
        </div>
        <div class="you" style="position: relative;z-index: 10;">
        <%
           	Object qq = session.getAttribute("user");
		    LoginUser loginUser = null;
		    if(qq != null){
		    	loginUser = (LoginUser)qq;
		    }
        	if(loginUser == null){
        %>
            <a href="login.jsp" target="_blank">登录</a>|
            <a href="zhuce.jsp" target="_blank">注册</a>|
        <%
        	}else {
        		List<Goods> listGoods = new ArrayList<Goods>();
        		GoodsService goodsService = new GoodsService();
        		for(String i : loginUser.getMyShopping().keySet()) {
        			Goods gg = goodsService.select(i);
        			listGoods.add(gg);
        		}
        %>
        	<a href="/tanbao/user/view/admin.jsp" target="_blank">
        		<img src="img/logo.jpg" style="border-radius:50%;width: 20px;height: 20px;position:relative; float: left; top: 8px" />
        	</a>
        	<a class="logout" href="/tanbao/user/view/admin.jsp"><span id="yhm" style="color:red"><%=loginUser.getMyInfo().getUserName() %></span></a>
            <a href="#" target="_blank"></a>
            <a href="/tanbao/user/view/admin.jsp" target="_blank" class="gou">购物车（<%=listGoods.size() %>）</a>
        <%
        	}
        %>
        </div>
    </div>


</div>
<div id="er">
    <div style="width: 100%; height: 100px; background: white; position: relative; z-index: 30;">
        <div class="er_yi">
            <div class="div">
            	<form action="/tanbao/GoodsServlet?m=goodsSelectByName" method="post">
            		<input type="text" class="td1" name="keywords"/>
                	<div class="td2"><button><img src="img/sousuo1.png"/></button></div>
            	</form>
                

            </div>

        </div>
    </div>
    <!--全部商品分类-->
    <div class="qbspfl">
        <div class="djfl">
            商品种类
        </div>
        <div class="morelist">
        <%
        	Object p2 = request.getAttribute("types");
        	List<String> types = (List<String>)p2;
        	for(String s : types){
        	%>
        		 <a href="/tanbao/GoodsServlet?m=randomSelect&type=<%=s %>"><%=s %></a>
        	<%
        	}
        %>
        </div>
    </div>
    <script>
        $(function(){
            $("#banner_menu_wrap").mouseleave(function(){
                $(this).hide()
                $("#big_banner_wrap").hide()
            });
            $(".djfl").mouseenter(function(){
                $("#big_banner_wrap").show()
                $("#banner_menu_wrap").show()
            });
        })

    </script>

    <!--商品列表-->
    <div class="shopliebiao">
        <ul>
        <%
        	for(int i = 0; i < goods.size(); i++){
        		Goods g = goods.get(i);
        		String tplj = request.getContextPath()+"/userImgs/logo.jpg";
    			for(int u = 0; u < list2.size(); u++){
    				GoodsImg img = list2.get(u);
    				if( img.getGoodsId().equals(g.getGoodsId())){
    						tplj = request.getContextPath()+"/goodsfile/"+img.getImgId();
    						break;
    				}else{
    					tplj = request.getContextPath()+"/userImgs/logo.jpg";
    				}
    			}
        %>
            <li>
                <a href="/tanbao/GoodsServlet?m=select&goodsId=<%=g.getGoodsId() %>" class="wocici">
	                <input type="hidden" id="goodImgId" value="<%=g.getGoodsId() %>" />	
                    <b id="tp">
                        <img src="<%=tplj%>"/>
                    </b>
                    <h2><%=g.getGoodsName() %></h2>
                    <p><%=g.getGoodsDescript() %></p>
                    <span><%=Double.parseDouble(g.getGoodsOutPrice()) %></span>
                </a>
            </li>
        <%
        		}
        %>
            </ul>
        </div>
    </div>

</div>
</body>
<%
	}
%>
<script>
$(function(){
});

function doList(){
	$.get("/tanbao/GoodsServelet?m=goodImgSelect",
			{
			goodId:$("#goodImgId").val()
		},
		function(goodImgs){
		if(null != goodImgs && goodImgs.length < 1){
			$("#tp").append();
		}else{
			for(i = 0; i < users.length; i++){
			}
		}
	},"json")
}
</script>
</html>
<%
	}
%>
