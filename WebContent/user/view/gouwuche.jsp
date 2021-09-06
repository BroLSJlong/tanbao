<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.GoodsImg"%>
<%@page import="tanbao.dao.GoodsImgDao"%>
<%@page import="tanbao.service.ShoppingService"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@page import="tanbao.dao.ShoppingDao"%>
<%@page import="tanbao.servlet.ShoppingServlet"%>
<%@page import="tanbao.entity.entitytable.Shopping"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="tanbao.dao.GoodsDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%	
	//拿到shoppingServlet传过来的list	
	Object p = request.getAttribute("goodsList");
	Object p2 = session.getAttribute("user");
	GoodsImgDao goodServlet = new GoodsImgDao();
	List<Goods> listGoods = null;
	LoginUser loginUser = null;
	if(p != null && p2 != null){
		listGoods = (List<Goods>)p;
		loginUser = (LoginUser)p2;
	}
	if(listGoods == null || loginUser == null)response.sendRedirect("/tanbao/ShoppingServlet?m=shoppingSelect");
	else{
			%>
			
			
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
<div class="page_title">
    <h2 class="fl">我的购物车</h2>
    <a target =_top href="/tanbao/index.jsp" class="fr top_rt_btn add_icon">去逛逛</a>
</div>
<table class="table">
    <tr>
        <th width="25%">商品图</th>
        <th width="20%">商品名</th>
        <th width="10%">售价</th>
        <th width="10%">类型</th>
        <th width="15%">数量</th>
        <th width="20%">操作</th>
    </tr>
    <%
    	int i = 0;
	    /**查询所有（商品）图片*/
		Object object2 = (Object)request.getAttribute("goodsImg");
		List<GoodsImg> list2 = (List<GoodsImg>)object2;
		if (null == list2) {
			request.getRequestDispatcher("/GoodsServlet?m=goodsImgAllGWC").forward(request, response);
		}else{
    	String tplj = request.getContextPath()+"/userImgs/logo.jpg";
    	for(String o : loginUser.getMyShopping().keySet()){
    		if(list2 != null){
    			for(int u = 0; u < list2.size(); u++){
    				GoodsImg img = list2.get(u);
    				if(img.getGoodsId().equals(listGoods.get(i).getGoodsId())){
    					tplj = request.getContextPath()+"/goodsfile/"+img.getImgId();
    					break;
    				}else{
    					tplj = request.getContextPath()+"/userImgs/logo.jpg";
    				}
    			}
    		}
    		
    	%>
    	<tr>
	        <td class="center"><img src="/tanbao/userImgs/<%=tplj%>.jpg" width="50" height="50"/></td>
	        <td id="goodsName"><%=listGoods.get(i).getGoodsName() %></td>
	        <td class="center"><strong class="rmb_icon" id="goodsPrice"><%=listGoods.get(i).getGoodsOutPrice() %></strong></td>
	        <td class="center"><a><%=listGoods.get(i).getGoodsClass() %></a></td>
	        <td class="center">
	            <input type="button" value="+" onclick="addOne(<%=i %>)" />
	            <input style="width: 60px; text-align: center;" type="text" id="num<%=i %>" value="1" />
	            <input type="button" value="-" onclick="jianOne(<%=i %>)" />
				<input type="hidden" id="goodsId<%=i %>" value="<%=listGoods.get(i).getGoodsId()%>" />
	        </td>
	        <td class="center">
	            <a href="#" title="预览" class="link_icon" target="_blank">&#118;</a>
	           <a href="/tanbao/ShoppingServlet?m=shoppingDelete&goodsId=<%=listGoods.get(i).getGoodsId()%>" title="删除" class="link_icon">&#100;</a>
	        </td>
    	</tr>
    	
    	<%
    		i++;
   			 }
		}
    	%>
    <tr>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th colspan="2">总价：</th>
    </tr>
</table>

<aside class="mtb" style="text-align:right;">
    		<input type="button" value="确认购买" class="group_btn" onclick="createOrder()"/>
		</aside>
<script type="text/javascript" src="../../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	 function addOne(i) {
	        var num = document.getElementById("num"+i);
	        num.value = parseInt(num.value) + 1;
	    }
	 
	 function jianOne(i) {
	        var num = document.getElementById('num'+i);
	        if(num.value != 1){
	        	num.value = parseInt(num.value) - 1;
	        }
	    }
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$.post("/tanbao/ShoppingServlet?m=getListGoodsNum",function(listNum){
			for(var i = 0; i < listNum.length; i++){
				$("#num".concat(i)).val(listNum[i]);
			}
		},"json");
	});
	function createOrder(){
		$.post("/tanbao/OrderServlet?m=clearOrderData",function(){
			for(var i = 0; i < <%=listGoods.size() %>; i++){
				$.post("/tanbao/OrderServlet?m=getOrderData",{
					"goodsId":$("#goodsId" + i).val(),
					"num":$("#num" + i).val()
				},function(b){
					if(b == <%=listGoods.size() %>)window.parent.location.href = "/tanbao/OrderServlet?m=createOrder"
				});
			}
		});
	}
</script>
</body>
</html>
<%
		
	}
%>
