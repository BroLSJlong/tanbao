<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/15
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.GoodsImg"%>
<%@page import="tanbao.service.GoodsService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	Object p = request.getAttribute("goods");
	Goods goods = null;
	if(p != null){
		goods = (Goods)p;
	}
	/**查询所有（商品）图片*/
	Object object2 = (Object)request.getAttribute("goodsImg");
	List<GoodsImg> list2 = (List<GoodsImg>)object2;
	if (null == list2) {
		request.getRequestDispatcher("GoodsServlet?m=goodsImgAllGoods").forward(request, response);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><%=goods.getGoodsName() %></title>
    <link rel="stylesheet" href="css/goods.css">
    <link rel="stylesheet" type="text/css" href="user/css/top.css"/>
    <link rel="stylesheet" type="text/css" href="css/liebiao.css"/>
    <link type="text/css" rel="stylesheet" href="css/shouye.css" />
    <script src="js/shouye.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/public.js"></script>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script   src="js/modernizr-custom-v2.7.1.min.js"></script>

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
           	Object p2 = session.getAttribute("user");
		    LoginUser loginUser = null;
		    if(p2 != null){
		    	loginUser = (LoginUser)p2;
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
        	<a class="logout" href="/tanbao/user/view/admin.jsp"><span id="yhm" style="color:red"><%=loginUser.getMyInfo().getUserName() %></span>，欢迎您！</a>
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
<%--            商家logo--%>
            <a href="#" target="_blank"><img src="img/logo2.jpg"/></a>
            <ul>
<%--                商家其它热门--%>
                <li><a href="#" target="_blank" class="er_a">防晒霜</a></li>
                <li><a href="#" target="_blank">水杯</a></li>
                <li><a href="#" target="_blank">男装衬衫</a></li>
                <li><a href="#" target="_blank">爆款外套</a></li>
                <li><a href="#" target="_blank">电动牙刷</a></li>
                <li><a href="#" target="_blank">手机</a></li>
                <li><a href="#" target="_blank">冰箱</a></li>
                <li><a href="#" target="_blank">充电宝</a></li>
            </ul>
            <div class="div">
                <input type="text" class="td1" id="search" name="keywords" />
                <div class="td2" style="margin: auto 15px"><img alt="" src="img/sousuo1.png" onclick="search()"></div>
                <script type="text/javascript">
                	function search(){
						keyword = document.getElementById("search").value;
                		window.location.href = "/tanbao/GoodsServlet?m=goodsSelectByName&keywords="+keyword;
                	}
                </script>
            </div>
        </div>
    </div>

<%--分割--%>
<div class="Xcontent">
    <ul class="Xcontent01">
<%--        商品图--%>
		<%
        		String tplj = request.getContextPath()+"/userImgs/logo.jpg";
				List<String> imgid = new ArrayList<String>();
				if(list2 != null){
					for(int u = 0; u < list2.size(); u++){
	    				GoodsImg img = list2.get(u);
	    				if( img.getGoodsId().equals(goods.getGoodsId())){
	    						tplj = request.getContextPath()+"/goodsfile/"+img.getImgId();
	    						imgid.add(tplj);
	    				}else{
	    					tplj = request.getContextPath()+"/userImgs/logo.jpg";
	    				}
	    			}
				}
    			String tp1 = request.getContextPath()+"/userImgs/logo2.jpg";
    			String tp2 = request.getContextPath()+"/userImgs/logo2.jpg";
    			String tp3 = request.getContextPath()+"/userImgs/logo2.jpg";
    			String tp4 = request.getContextPath()+"/userImgs/logo2.jpg";
    			String tp5 = request.getContextPath()+"/userImgs/logo2.jpg";
    			if(!imgid.isEmpty()){
    				tp1 = imgid.get(0);
    				if(imgid.size() > 1){
        				tp2 = imgid.get(1);
    					if(imgid.size() > 2){
    						tp3 = imgid.get(2);
    						if(imgid.size() > 3){
    							tp4 = imgid.get(3);
    							if(imgid.size() > 3){
    								tp5 = imgid.get(4);
    							}
    						}
    					}
    				}
    			}
        %>
        <div class="Xcontent06"><img  style="width: 429px;height: 430px;" src="<%=tp1%>"></div>
        <ol class="Xcontent08">
            <div class="Xcontent07"><img src="<%=tp1%>"></div>
            <div class="Xcontent09"><img src="<%=tp2%>"></div>
            <div class="Xcontent10"><img src="<%=tp3%>"></div>
            <div class="Xcontent11"><img src="<%=tp4%>"></div>
            <div class="Xcontent12"><img src="<%=tp5%>"></div>
        </ol>
        <ol class="Xcontent13">
            <div class="Xcontent14" onclick="toStore()"><a href="#"><p>物品名：<%=goods.getGoodsName() %></p></a></div>
            <div class="Xcontent15"><img src="${pageContext.request.contextPath}/img/goods/X11.png"></div>
            <div class="Xcontent16"><p>简介：<%=goods.getGoodsDescript() %></p></div>
            <div class="Xcontent17">
                <p class="Xcontent18">售价</p>
                <p class="Xcontent19">￥<span><%=goods.getGoodsOutPrice() %></span></p>
                <div class="Xcontent20">
                    <p class="Xcontent21">类型</p>
                    <p class="Xcontent25"><%=goods.getGoodsClass() %></p>
                </div>
                <div class="Xcontent23">
                    <p class="Xcontent24">服务</p>
                    <p class="Xcontent25">30天无忧退货&nbsp;&nbsp;&nbsp;&nbsp;  48小时快速退款 &nbsp;&nbsp;&nbsp;&nbsp;        满88元免邮</p>
                </div>
            </div>
            <div class="Xcontent26">
                <p class="Xcontent27">款式</p>
                <div class="Xcontent28"><img  src="${pageContext.request.contextPath}/img/goods/X14.png"></div>
                <div class="Xcontent29"><img  src="${pageContext.request.contextPath}/img/goods/X1.png"></div>
            </div>
            <div class="Xcontent30">
                <p class="Xcontent31">数量</p>
                <div class="Xcontent32"><img src="${pageContext.request.contextPath}/img/goods/X15.png"></div>
                <form action="/tanbao/OrderServlet?m=createOrderOne&goodsId=<%=goods.getGoodsId() %>" method="post">
                	<input id="num" name="num" class="input" value="1">
                <div class="Xcontent33"><img src="${pageContext.request.contextPath}/img/goods/16.png"></div>
            </div>
            <div class="Xcontent35"><input type="submit" value="立刻购买" class="group_btn" onclick="createOrder()"/></div>
            </form>
          	<div class="Xcontent35"><input type="button" id="shopping" value="加入购物车" class="group_btn" onclick="addShopping()"/></div>
			<div class="Xcontent35"><input type="button" id="collection" value="加入收藏" class="group_btn" onclick="addCollection()"/></div>
        </ol>
    </ul>

</div>
<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
		function toStore(){
			$.post("/tanbao/StoreServlet?m=toStore",{"goodsId":<%=goods.getGoodsId()%>},function(sellerId){
				window.location.href = "/tanbao/StoreServlet?m=selectStore&sellerId="+sellerId;
			})
		}
		function addShopping(){
			if($("#shopping").val() != "已加入购物车"){
				$.post("/tanbao/ShoppingServlet?m=shoppingAdd&num="+$("#num").val(),{"goodsId":<%=goods.getGoodsId()%>,"num":$("#num").val()},function(b){
					if(b){
						$("#shopping").val("已加入购物车");
					}else {
						window.location.href = "/tanbao/login.jsp";
					}
				},"json")
			}
		}
		function addCollection(){
			if($("#collection").val() != "已收藏"){
				$.post("/tanbao/ColloctionServlet?m=addCollectionGoods",{"goodsId":<%=goods.getGoodsId() %>},function(b){
					if(b){
						$("#collection").val("已收藏");
					}else {
						window.location.href = "/tanbao/login.jsp";
					}
				},"json")
			}
		}
		$(document).ready(function(){
			$.post("/tanbao/ColloctionServlet?m=isCollectionGoods",function(b){
				if(b){
					$("#collection").val("已收藏");
				}else {
					$("#collection").val("加入收藏");
				}
			},"json");
			$.post("/tanbao/ShoppingServlet?m=init",{"goodsId":<%=goods.getGoodsId() %>},function(b){
				if(b){
					$("#shopping").val("已加入购物车");
				}else {
					$("#shopping").val("加入购物车");
				}
			},"json");
			var $miaobian=$('.Xcontent08>div');
			var $huantu=$('.Xcontent06>img');
			var $miaobian1=$('.Xcontent26>div');
			$miaobian.mousemove(function(){miaobian(this);});
			$miaobian1.click(function(){miaobian1(this);});
			function miaobian(thisMb){
			    for(var i=0; i<$miaobian.length; i++){
			        $miaobian[i].style.borderColor = '#dedede';
			    }
			    thisMb.style.borderColor = '#cd2426';
			
			    $huantu[0].src = thisMb.children[0].src;
			}
			function miaobian1(thisMb1){
			    for(var i=0; i<$miaobian1.length; i++){
			        $miaobian1[i].style.borderColor = '#dedede';
			    }
			    $miaobian.css('border-color','#dedede');
			    thisMb1.style.borderColor = '#cd2426';
			    $huantu[0].src = thisMb1.children[0].src;
			}
			$(".Xcontent33").click(function(){
			    var value=parseInt($('.input').val())+1;
			    $('.input').val(value);
			})
			$(".Xcontent32").click(function(){
			    var num = $(".input").val()
			    if(num>1){
			        $(".input").val(num-1);
			    }
			})
		})
       

</script>
</body>
</html>

