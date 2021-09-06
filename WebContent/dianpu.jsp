<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/15
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.Store"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList"%>
<%@page import="tanbao.service.GoodsService"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="java.util.List"%>
<%@page import="tanbao.dao.GoodsDao"%>
<%@page import="tanbao.dao.StoreDao"%>
<%
	Object p = request.getAttribute("store");
	Object p3 = request.getAttribute("storeType");
	Store store = null;
	String storeType = null;
	if(p != null){
		store = (Store)p;
		storeType = (String)p3;
	}
	if(store != null){
%>
<html>
<head>
    <title>Title</title>
	<link type="text/css" rel="stylesheet" href="css/top.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/shouye.css" />
    <script src="js/shouye.js"></script>
    <script src="${pageContext.request.contextPath}/js/prefixfree.min.js"></script>
    <link rel="stylesheet" type="text/css" href="user/css/top.css"/>
    <link rel="stylesheet" type="text/css" href="css/liebiao.css"/>
    <script src="js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/public.js"></script>

</head>
<body>
<div id="yi">
    <div class="yi_zhong">
        <div class="zuo" style="position: relative; z-index: 10;">
            <a href="user/view/admin.jsp" target="_blank">探宝</a>|
            <a href="fenlei.jsp" target="_blank">xsl</a>|
            <a href="select.jsp" target="_blank">ljy</a>|
            <a href="#" target="_blank">hcy</a>|
            <a href="#" target="_blank">ysj</a>|
            <a href="#" target="_blank">hwh</a>|
            <a href="#" target="_blank">ljh</a>
        </div>
        <div class="you" style="position: relative;z-index: 10;">
                <%
           	Object p2 = session.getAttribute("user");
		    LoginUser loginUser = null;
		    if(p != null){
		    	loginUser = (LoginUser)p2;
		    }
        	if(loginUser == null){
        %>
            <a href="login.jsp" target="_blank">登录</a>|
            <a href="zhuce.jsp" target="_blank">注册</a>|
        <%
        	}else {
        %>
        	<a href="/tanbao/user/view/admin.jsp" target="_blank">
        		<img src="img/logo.jpg" style="border-radius:50%;width: 20px;height: 20px;position:relative; float: left; top: 8px" />
        	</a>
        	<a class="logout" href="/tanbao/user/view/admin.jsp"><span id="yhm" style="color:red"><%=loginUser.getMyInfo().getUserName() %></span>，欢迎您！</a>
            <a href="#" target="_blank">消息通知</a>
            <a href="/tanbao/user/view/admin.jsp" target="_blank" class="gou">购物车（0）</a>
        <%
        	}
        %>
        </div>
        <div class="g">
            <p>购物车还没有商品，赶紧来选购吧！</p>
        </div>
    </div>
</div>

<div id="er">
        <div class="headingWrapper color-bright">
            <a href="" class="header header--pushDown header--shadow"><%=store.getStoreName() %></a>
        </div>
        <div class="headingWrapper">
            <a href="" class="header header--pushDown header--shadow">本店主要销售: <%=storeType %></a>
        </div>
    <div class="qbspfl">
        <div class="djfl">
            本店商品
        </div>
        <div class="morelist">
            <!-- <a href="#">手机</a>
            <a href="#">耳机</a>
            <a href="#">一次类退</a>
            <a href="#">标题一</a>
            <a href="#">标题一</a>
            <a href="#">标题一</a> -->
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
    <!--分类搜索-->
    <div class="zhxlxp">
        <!-- <span style=" background:#000; color:#fff; margin-left:0;">排序方式</span>
        <a href="#">综合</a>
        <a href="#" title="7天销量降序排列">销量</a>
        <a href="#" title="上架时间降序排列">新品</a>
        <a href="#" title="销售价格降序排列">价格</a> -->
        <div class="td2" style="float: right">
        	<input type="image" style="height:30px;width:30px; "src="img/sousuo1.png" onclick="searchKeywords()" /></div>
        <div style="float: right">
        	<input type="text" style="height:28px ;" id="keywords" />
        </div>
    </div>
    <!--商品列表-->
  <div class="shopliebiao" id="listGoods"></div>
</div>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">

function getListGoods(list){
	for(i = 0; i < list.length; i++){
		if(i == 0 ||  i % 5 == 0){
			$("#listGoods").append($(ul));
			var ul = $("<ul>");
		}
		$(ul).append($("<li>")
					.append($("<a href='/tanbao/GoodsServlet?m=select&goodsId="+list[i].goodsId+"' class='wocici'>")
							.append($("<b>").append($(" <img id='goodsImg"+i+"'/>")))
							.append($("<h2>").html(list[i].goodsName))
							.append($("<p>").html(list[i].goodsDescript))
							.append($("<span>").html(list[i].goodsOutPrice))
					)
					.append($("<em class='wocaca'>")
							.append($("<a href='/tanbao/GoodsServlet?m=select&goodsId="+list[i].goodsId+"'>").html("查看详情"))
							.append($("<a href='/tanbao/GoodsServlet?m=select&goodsId="+list[i].goodsId+"'>").html("加入购物车"))
					)
		);
	}
	$("#listGoods").append($(ul));
	j = 0;
	for(var i = 0; i < list.length; i++){
		$.post("/tanbao/StoreServlet?m=getGoodsImg",{"goodsId":list[i].goodsId},function(goodsImg){
			$("#goodsImg" + j).attr("src",goodsImg);
			j++;
		})
	}
}

	$(document).ready(function(){
		
		$.post("/tanbao/StoreServlet?m=storeSelectAll&sellerId=<%=store.getSellerId()%>",getListGoods,"json");

	})
	
	function searchKeywords() {
			$("#listGoods").children().remove();
			$.post("/tanbao/StoreServlet?m=selectStoreGoods&keywords="+$("#keywords").val(),getListGoods,"json");
		}
</script>
</body>

</html>
<%
	}
%>