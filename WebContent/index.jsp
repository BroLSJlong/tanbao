<%@page import="tanbao.entity.entitytable.GoodsImg"%>
<%@page import="tanbao.service.GoodsService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="java.util.List"%>
<%@page import="tanbao.dao.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
window.onload=function() {
	<%
		//计算显示商品的数量
		int count = 0;
	
		try{
			/**查询所有商品*/
			Object object1 = (Object)request.getAttribute("goods");
			List<Goods> list1 = (List<Goods>)object1;
		    if (null == list1) {
		    	request.getRequestDispatcher("GoodsServlet?m=selectAll").forward(request, response);
			}
		    /**查询所有（商品）图片*/
			Object object2 = (Object)request.getAttribute("goodsImg");
			List<GoodsImg> list2 = (List<GoodsImg>)object2;
		    if (null == list2) {
		    	request.getRequestDispatcher("/GoodsServlet?m=goodsImgAll").forward(request, response);
			}
		    /**获取用户信息*/
		    Object p = session.getAttribute("user");
		    LoginUser loginUser = null;
		    if(p != null){
		    	loginUser = (LoginUser)p;
		    }
	%>
}
</script>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/shouye.css" />
    <script src="js/shouye.js"></script>
    
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
        	if(loginUser == null){
        %>
            <a href="login.jsp" target="_blank">登录</a>|
            <a href="zhuce.jsp" target="_blank">注册</a>|
        <%
        	}else {
        		 List<Goods> listGoods = new ArrayList<Goods>();
        		GoodsService goodsService = new GoodsService();
        		for(String i : loginUser.getMyShopping().keySet()) {
        			Goods goods = goodsService.select(i);
        			listGoods.add(goods);
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
            <a href="#" target="_blank"><img src="img/logo2.jpg"/></a>
            <ul>
                <li><a href="/tanbao/GoodsServlet?m=randomSelect&type=手机" target="_blank" class="er_a">手机</a></li>
                <li><a href="/tanbao/GoodsServlet?m=randomSelect&type=机器人" target="_blank">机器人</a></li>
                <li><a href="/tanbao/GoodsServlet?m=randomSelect&type=摄像头" target="_blank">摄像头</a></li>
                <li><a href="/tanbao/GoodsServlet?m=randomSelect&type=衣服" target="_blank">衣服</a></li>
                <li><a href="/tanbao/GoodsServlet?m=randomSelect&type=零食" target="_blank">零食</a></li>
                <li><a href="/tanbao/GoodsServlet?m=randomSelect&type=手表" target="_blank">手表</a></li>
                <li><a href="/tanbao/GoodsServlet?m=randomSelect&type=厨具" target="_blank">厨具</a></li>

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
    <div id="er_er2">
        <div id="er2zhong">
            <div class="kuai">
            <%
            	for(int i = 0; i < 6;i++){
            		Goods goods = list1.get(i);
            		if("手机".equals(goods.getGoodsClass())){
            			count++;
            			
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
					            	<div class="div1">
					            		<a href="/tanbao/GoodsServlet?m=select&goodsId=<%=goods.getGoodsId() %>">
					            		<img src="<%=tplj%>"/>
					            		</a>
					                    <p class="p1"><a href="" target="_blank"><%=goods.getGoodsName() %></a></p>
					                    <p class="p2"><%=goods.getGoodsOutPrice() %>元 </p>
					            	</div>
            					<%	
            			
            %>
            <%
            	if(count==6) break;
            } }
                %>
                
               
            </div>
            <div class="kuai">
            
                <%
                	for(int j = 0; j < list1.size();j++){
            		Goods goods = list1.get(j);
            		
            		if("机器人".equals(goods.getGoodsClass())){
            			count++;
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
            
            	<div class="div1">
            		<a href="/tanbao/GoodsServlet?m=select&goodsId=<%=goods.getGoodsId() %>">
            		<img src="<%=tplj%>"/>
            		</a>
                    <p class="p1"><a href="" target="_blank"><%=goods.getGoodsName() %></a></p>
                    <p class="p2"><%=goods.getGoodsOutPrice() %>元 </p>
            	</div>
            <%
            	if(count==6) break;
            } }
                %>
            </div>
            <div class="kuai">
                <%
                 
                	for(int j = 0; j < list1.size();j++){
            		Goods goods = list1.get(j);
            		
            		if("摄像头".equals(goods.getGoodsClass())){
            			count++;
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
            
            	<div class="div1">
            		<a href="/tanbao/GoodsServlet?m=select&goodsId=<%=goods.getGoodsId() %>"><img src="<%=tplj%>"/></a>
                    <p class="p1"><a href="" target="_blank"><%=goods.getGoodsName() %></a></p>
                    <p class="p2"><%=goods.getGoodsOutPrice() %>元 </p>
            	</div>
            <%
            	if(count==6) break;
            } }
                %>
            </div>
            <div class="kuai">
                 <%
            
            	for(int i = 0; i < 6;i++){
            		Goods goods = list1.get(i);
            		if("衣服".equals(goods.getGoodsClass())){
            			count++;
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
            	<div class="div1">
            		<a href="/tanbao/GoodsServlet?m=select&goodsId=<%=goods.getGoodsId() %>"><img src="<%=tplj%>"/></a>
                    <p class="p1"><a href="" target="_blank"><%=goods.getGoodsName() %></a></p>
                    <p class="p2"><%=goods.getGoodsOutPrice() %>元 </p>
            	</div>
            <%
            	if(count==6) break;
            } };
                %>
            </div>
            <div class="kuai">
                 <%
            
            	for(int i = 0; i < 6;i++){
            		Goods goods = list1.get(i);
            		if("零食".equals(goods.getGoodsClass())){
            			count++;
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
            	<div class="div1">
            		<a href="#"><img src="<%=tplj%>.jpg"/></a>
                    <p class="p1"><a href="" target="_blank"><%=goods.getGoodsName() %></a></p>
                    <p class="p2"><%=goods.getGoodsOutPrice() %>元 </p>
            	</div>
            <%
            	if(count==6) break;
            } };
                %>
            </div>
            <div class="kuai">
                 <%
            
            	for(int i = 0; i < 6;i++){
            		Goods goods = list1.get(i);
            		if("手表".equals(goods.getGoodsClass())){
            			count++;
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
            	<div class="div1">
            		<a href="/tanbao/GoodsServlet?m=select&goodsId=<%=goods.getGoodsId() %>"><img src="<%=tplj%>"/></a>
                    <p class="p1"><a href="" target="_blank"><%=goods.getGoodsName() %></a></p>
                    <p class="p2"><%=goods.getGoodsOutPrice() %>元 </p>
            	</div>
            <%
            	if(count==6) break;
            } };
                %>
            </div>
            <div class="kuai">
                 <%
            
            	for(int i = 0; i < 6;i++){
            		Goods goods = list1.get(i);
            		if("厨具".equals(goods.getGoodsClass())){
            			count++;
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
            	<div class="div1">
            		<a href="/tanbao/GoodsServlet?m=select&goodsId=<%=goods.getGoodsId() %>"><img src="<%=tplj%>"/></a>
                    <p class="p1"><a href="" target="_blank"><%=goods.getGoodsName() %></a></p>
                    <p class="p2"><%=goods.getGoodsOutPrice() %>元 </p>
            	</div>
            <%
            	if(count==6) break;
            } };
                %>
                <div>
                    <a href="#"><img src="img/zhineng (6).jpg"/></a>
                    <p class="p1">查看全部</p>
                    <p class="p1">智能硬件</p>
                </div>
            </div>
        </div>
    </div>
    <div class="er_er">
        <div id="banner">
            <a href="#" target="_blank"><img src="img/1fb99a48-bff9-4eae-9787-774fb5a29a2f.jpg" style="display: block;"/></a>
            <a href="#" target="_blank"><img src="img/382846bd-7cc4-4d01-88cb-e5ce5e650bc3.jpg"/></a>
            <a href="#" target="_blank"><img src="img/60f0e2e5-0962-49dd-ace7-757a737623cb.jpg"/></a>
            <a href="#" target="_blank"><img src="img/6289d433-866f-429e-a9e9-de892dc86178.jpg"/></a>
            <a href="#" target="_blank"><img src="img/c79db0ac-73be-4c90-a52f-63be1d90b77a.jpg"/></a>
        </div>
        <div id="jian">
            <span id="span1" style="font-size: 60px; color: #CCCCCC;">&lt;</span>
            <span id="span2" style="font-size: 60px; color: #CCCCCC;">&gt;</span>
        </div>
        <div id="er_dian">
            <p class="dian"></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
        </div>
        <div id="er_daohang">
            <ul>
                <li>
                    <span class="span1">手机&nbsp;电话卡</span>
                    <span class="span2">&gt;</span>
                    <ul class="er_daohang_a">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">探宝NOTA2</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">红米4</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝MIX</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">红米4A</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">对比手机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝5S</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">红米NOTE4</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝移动 电话卡</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝5S Plus</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">红米手机3s</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a></a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝手机5</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">红米PRO</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a></a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝Max</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">红米手机3X</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a></a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">笔记本&nbsp;平板</span><span class="span2">&gt;</span>
                    <ul class="er_daohang_a" ">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">探宝笔记本</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                               <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝平板2</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">USB-C转接器</a></td>
                               <td class="td1"><a href="#" target="_blank">选购</a></td>
                               <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝笔记本内胆包</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝便携鼠标</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">电视&nbsp;盒子</span>
                    <span class="span2">&gt;</span>
                    <ul class="er_daohang_a">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">探宝电视3S&nbsp;&nbsp;43英寸</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝电视3&nbsp;&nbsp;55英寸</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝盒子&nbsp;&nbsp;mini</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝电视3S&nbsp;&nbsp;48英寸</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝电视3&nbsp;&nbsp;60英寸</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝电视主机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝电视3S&nbsp;&nbsp;55英寸</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝电视3&nbsp;&nbsp;70英寸</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝低音炮</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝电视3S&nbsp;&nbsp;60英寸</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝盒子3S</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">蓝牙手柄</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝电视3S&nbsp;&nbsp;65英寸</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝盒子3C</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">家庭音响</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝电视3S&nbsp;&nbsp;65英寸&nbsp;曲面</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝盒子3&nbsp;增强版</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">电视盒子配件</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">路由器&nbsp;智能硬件</span><span class="span2">&gt;</span>
                    <ul class="er_daohang_a">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">米家扫地机器人</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">手表</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">米兔积木机器人</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝VR眼睛</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">米家智能电饭煲</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">智能灯</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝路由器</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">摄像机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">米兔智能故事机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">九号平衡车</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">净化器及滤芯</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a></a></td>
                                <td><a></a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">电助力折叠自行车</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">净水器及滤芯</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">手环及配件</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">米家恒温电水壶</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">血压计</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">体重秤</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">移动电源&nbsp;电池&nbsp;插线板</span><span class="span2">&gt;</span>
                    <ul class="er_daohang_a"">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">探宝移动电源</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">彩虹5号电池</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝插线板</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">彩虹7号电池</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">品牌移动电源</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">移动电源附件</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">电池</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">充电器</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">耳机&nbsp;音箱</span><span class="span2">&gt;</span>
                    <ul class="er_daohang_a">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">探宝圈铁耳机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝网络音响</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝音乐闹钟</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝胶囊二级</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝蓝牙音箱</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝米兔音箱</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝活塞耳机基础版</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝随身蓝牙音箱</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">网络收音机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝蓝牙耳机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">小钢炮音箱2</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">品牌音箱</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝运动蓝牙耳机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">小钢炮音箱&nbsp;&nbsp;青春版</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">品牌耳机</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝方盒子音箱</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">保护套&nbsp;贴膜</span><span class="span2">&gt;</span>
                    <ul class="er_daohang_a">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">贴膜</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">保护套/保护壳</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                                         <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                                     <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">线材&nbsp;支架&nbsp;储存卡</span><span class="span2">&gt;</span>
                    <ul class="er_daohang_a">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">线材</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">自拍杆</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">手机支架</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">储存卡</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">大耳朵图图手机支架</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">移动联想联合DIY储存卡</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">箱包&nbsp;服饰</span><span class="span2">&gt;</span>
                    <ul class="er_daohang_a" ">
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">箱包</a></td>
                                                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                 <td><a href="#" target="_blank">箱包</a></td>
                                                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                 <td><a href="#" target="_blank">箱包</a></td>
                                                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                 <td><a href="#" target="_blank">箱包</a></td>
                                                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">箱包</a></td>
                                                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">箱包</a></td>
                                                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                    <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
                <li>
                    <span class="span1">米兔&nbsp;周边生活</span><span class="span2">&gt;</span>
                    <ul class="er_daohang_a" >
                        <table>
                            <tr>
                                <td><a href="#" target="_blank">米兔玩偶</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的宝物</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">鼠标垫</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝的豪</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝鼠标</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">生活周边</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝口杯</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">我的毛巾</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">《探宝》会刊</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝兔子玩偶</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">探宝6</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" target="_blank">8H乳胶枕</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">白光兔</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">月亮兔</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                            <tr>
                             <td><a href="#" target="_blank">8H乳胶枕</a></td>
                            <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">7H枕头</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                                <td><a href="#" target="_blank">好易购抱枕</a></td>
                                <td class="td1"><a href="#" target="_blank">选购</a></td>
                            </tr>
                        </table>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
    <div id="er_san">
        <div class="div1"></div>
        <a href="#" target="_blank"><img src="img/a409b9e8-7f9d-417a-a253-8a7d65c49969.jpg"/></a>
        <a href="#" target="_blank"><img src="img/c57a57f9-161b-4947-9220-168cf3df4f22.jpg"/></a>
        <a href="#" target="_blank"><img src="img/2a7540d0-0d1b-49e5-b31c-db06901d8d2a.jpg"/></a>
    </div>
    <div id="er_si">
        <p>明星热销榜</p>
        <div id="er_si_yi" style="width: 1226px; height: 360px;">
        	<%
            	for(int i = 0; i < 5;i++){
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
            	<div class="lun">
            		<a href="#" target="_blank"><img src="<%=tplj%>"/></a>
            		<p class="p1"><a href="#" target="_blank"><%=goods.getGoodsName() %></a></p>
                	<p class="p2"><%=goods.getGoodsDescript() %></p>
                	<p class="p3"><%=goods.getGoodsOutPrice() %>元起</p>
            	</div>
            <% } %>
            <!-- <div class="lun">
                <a href="#" target="_blank"><img src="img/T146YgBKhv1RXrhCrK.jpg"/></a>
                <p class="p1"><a href="#" target="_blank">探宝盒子3 增强版</a></p>
                <p class="p2">高端 4K 网络机顶盒</p>
                <p class="p3">399元起</p>
            </div>
            <div class="lun">
                <a href="#" target="_blank"><img src="img/17fc57e5-e332-4452-bba4-ef341f6e59fd.png"/></a>
                <p class="p1"><a href="#" target="_blank">探宝移动电源2</a></p>
                <p class="p2">双向快充，高密度锂聚合物电芯</p>
                <p class="p3">79元起</p>
            </div>
            <div class="lun">
                <a href="#" target="_blank"><img src="img/T1d__jBQYT1RXrhCrK.jpg"/></a>
                <p class="p1"><a href="#" target="_blank">探宝空气净化器2</a></p>
                <p class="p2">10分钟，房间空气焕然一新</p>
                <p class="p3">699元起</p>
            </div>
            <div class="lun">
                <a href="#" target="_blank"><img src="img/70c9c449-9e21-4cc1-b92a-1efa77c7a6e5.png"/></a>
                <p class="p1"><a href="#" target="_blank">探宝便携鼠标</a></p>
                <p class="p2">轻薄便携，含电池仅重 77.5g</p>
                <p class="p3">99元起</p>
            </div>
            <div class="lun">
                <a href="#" target="_blank"><img src="img/1d33d6ed-4a5e-4203-86c1-99f61c52a6c4.png"/></a>
                <p class="p1"><a href="#" target="_blank">探宝VR眼镜Play</a></p>
                <p class="p2">逼真沉浸感 舒适观看新体验</p>
                <p class="p3">39元起</p>
            </div> -->
        </div>
        <div id="er_si_er" style="width: 1226px; height: 360px;">
        
        <%
            	for(int i = 5; i < 10;i++){
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
            	<div class="lun">
            		<a href="#" target="_blank"><img src="<%=tplj%>"/></a>
            		<p class="p1"><a href="#" target="_blank"><%=goods.getGoodsName() %></a></p>
                	<p class="p2"><%=goods.getGoodsDescript() %></p>
                	<p class="p3"><%=goods.getGoodsOutPrice() %>元起</p>
            	</div>
            <% } %>
        </div>
    </div>
</div>
<div id="san">
    <div class="san_zhong">
        <div class="san_yi">
            <p class="p1">任意分类</p>
            <p class="p2">
                <a href="#" target="_blank">查看全部</a>
            </p>
        </div>
        <div class="san_er">
            <div class="san_sa">
                <a href="#" target="_blank"><img src="img/f4477ae4-ef06-4f19-af30-e30fa647b4e2.jpg"/></a>
			
            </div>
            <div class="san_s">
            	<div class="div1">
            	<img style="width: 234px;height: 300px;float: left;position: absolute;margin-left: 0px;z-index: -1;" src="/tanbao/userImgs/lingshi.jpg"/>
                    <p class="P1" ><a href="" target="_blank">？香酥不腻</a></p>
                    <p class="p2" >玛卡巴卡的零食</p>
                    <p class="p3" ><a href="" target="_blank">点我！</a> </p>
            	</div>
            	<div class="div1">
            	<img style="width: 234px;height: 300px;float: left;position: absolute;margin-left: 0px;z-index: -1;" src="/tanbao/userImgs/xianjian.jpg"/>
                    <p class="P1" ><a href="" target="_blank">仙剑7超火小说！</a></p>
                    <p class="p2" >小豪的仙剑书</p>
                    <p class="p3" ><a href="" target="_blank">点我！</a> </p>
            	</div>
            	<div class="div1">
            	<img style="width: 234px;height: 300px;float: left;position: absolute;margin-left: 0px;z-index: -1;" src="/tanbao/userImgs/bag.jpg"/>
                    <p class="P1" ><a href="" target="_blank">背上匡威书包上小学！</a></p>
                    <p class="p2" >匡威书包做回自己！</p>
                    <p class="p3" ><a href="" target="_blank">点我！</a> </p>
            	</div>
            	<div class="div1">
            	<img style="width: 234px;height: 300px;float: left;position: absolute;margin-left: 0px;z-index: -1;" src="/tanbao/userImgs/vivo.jpg"/>
                    <p class="P1" ><a href="" target="_blank">vivoiqoo7最新款！</a></p>
                    <p class="p2" >vivoiqoo7最新款！</p>
                    <p class="p3" ><a href="" target="_blank">点我！</a> </p>
            	</div>
            	<div class="div1">
            	<img style="width: 234px;height: 300px;float: left;position: absolute;margin-left: 0px;z-index: -1;" src="/tanbao/userImgs/siwa.jpg"/>
                    <p class="P1" ><a href="" target="_blank">超薄丝袜，夏日专享！</a></p>
                    <p class="p2" >超薄丝袜，夏日专享！</p>
                    <p class="p3" ><a href="" target="_blank">点我！</a> </p>
            	</div>
            	<div class="div1">
            	<img style="width: 234px;height: 300px;float: left;position: absolute;margin-left: 0px;z-index: -1;" src="/tanbao/userImgs/coverse.jpg"/>
                    <p class="P1" ><a href="" target="_blank">冬季情侣布鞋！</a></p>
                    <p class="p2" >冬季情侣布鞋！</p>
                    <p class="p3" ><a href="" target="_blank">点我！</a> </p>
            	</div>
            	<div class="div1">
            	<img style="width: 234px;height: 300px;float: left;position: absolute;margin-left: 0px;z-index: -1;" src="/tanbao/userImgs/ipad.jpg"/>
                    <p class="P1" ><a href="" target="_blank">苹果iPad享受一个人的时光！</a></p>
                    <p class="p2" >苹果iPad享受一个人的时光！</p>
                    <p class="p3" ><a href="" target="_blank">点我！</a> </p>
            	</div>
            	<div class="div1">
            	<img style="width: 234px;height: 300px;float: left;position: absolute;margin-left: 0px;z-index: -1;" src="/tanbao/userImgs/xiaomi.jpg"/>
                    <p class="P1" ><a href="" target="_blank">小米Yyds！</a></p>
                    <p class="p2" >小米手机！小米！</p>
                    <p class="p3" ><a href="" target="_blank">点我！</a> </p>
            	</div>
             <%  }catch(Exception e){}%>
                
            </div>
        </div>
    </div>
</div>
<div class="floot">
    <div class="juzhong">
        <div class="work12">
            <p>
                <span><a href="#" target="_blank">预约维修服务 </a></span>
                <span><a href="#" target="_blank">7天无理由退货 </a></span>
                <span><a href="#" target="_blank">15天免费退货 </a></span>
                <span><a href="#" target="_blank">满150元包邮</a></span>
                <span><a href="#" target="_blank">520余家售后网店</a></span>
            </p>
            <div id="xian"></div>
        </div>
        <div class="footer">
            <h5>帮助中心</h5>
            <p>账户管理</p>
            <p>购物指南</p>
            <p>订单操作</p>
        </div>
        <div class="footer">
            <h5>服务支持</h5>
            <p>售后政策</p>
            <p>自助服务</p>
            <p>相关下载</p>
        </div>
        <div class="footer">
            <h5>关于探宝</h5>
            <p>了解探宝</p>
            <p>加入探宝</p>
            <p>联系我们</p>
        </div>
        <div class="footer">
            <h5>关注我们</h5>
            <p>新浪微博</p>
            <p>探宝部落</p>
            <p>探宝移动</p>
        </div>
        <div class="footer">
            <h5>特色服务</h5>
            <p>F码通道</p>
            <p>探宝移动</p>
            <p>防伪查询</p>
        </div>
        <div class="work15">
            <div class="work13">
                <h2>400-100-5678</h2>
                <p>周一至周日 8：00-18：00</p>
                <span>（仅收市话费）</span>
            </div>
            <div class="work14">
                <p>24小时在线服务</p>
            </div>
        </div>
    </div>
</div>
<div class="div4">
    <div class="juzhong">
        <div class="work16">
            <p>
                <a href="#" target="_blank">探宝商城 | </a>
                <a href="#" target="_blank">MIUI | </a>
                <a href="#" target="_blank">多看书城 | </a>
                <a href="#" target="_blank">探宝路由器|</a>
                <a href="#" target="_blank">视频电话|</a>
                <a href="#" target="_blank">探宝后院 | </a>
                <a href="#" target="_blank">探宝天猫店| </a>
                <a href="#" target="_blank">探宝淘宝直营店| </a>
                <a href="#" target="_blank">探宝网盟|</a>
                <a href="#" target="_blank">Select Region</a>
            </p>
        </div>
        <div class="work17">
							<span>&copy;mi.com京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]
									0059-0009号
							</span>
            <span>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</span>
        </div>
        <div class="work18">
            <img src="img/seal.png"/>
            <img src="img/v-logo-2.png"/>
            <img src="img/v-logo-1.png"/>
            <img src="img/v-logo-3.png" />
        </div>
    </div>
</div>
<div id="jianti">
    <p id="p1">导航</p>
    <p id="p2">热销</p>
    <p id="p3">分类</p>
    <p id="hui">回到顶部</p>
</div>
</body>

</html>
