<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            <a href="user/view/admin.jsp" target="_blank">探宝</a>|
            <a href="fenlei.jsp" target="_blank">xsl</a>|
            <a href="select.jsp" target="_blank">ljy</a>|
            <a href="#" target="_blank">hcy</a>|
            <a href="#" target="_blank">ysj</a>|
            <a href="#" target="_blank">hwh</a>|
            <a href="#" target="_blank">ljh</a>
        </div>
        <div class="you" style="position: relative;z-index: 10;">
            <a href="login.jsp" target="_blank">登录</a>|
            <a href="zhuce.jsp" target="_blank">注册</a>|
            <a href="#" target="_blank">消息通知</a>
            <a href="#" target="_blank" class="gou">购物车（0）</a>
        </div>
        <div class="g">
            <p>购物车还没有商品，赶紧来选购吧！</p>
        </div>
    </div>


</div>
<div id="er">
    <div style="width: 100%; height: 100px; background: white; position: relative; z-index: 30;">
        <div class="er_yi">
            <a href="#" target="_blank"><img src="img/logo2.jpg"/></a>

            <ul>
                <li><a href="#" target="_blank" class="er_a">准备商品</a></li>
                <li><a href="#" target="_blank">准备商品</a></li>
                <li><a href="#" target="_blank">准备商品</a></li>
                <li><a href="#" target="_blank">准备商品</a></li>
                <li><a href="#" target="_blank">准备商品</a></li>
                <li><a href="#" target="_blank">准备商品</a></li>
                <li><a href="#" target="_blank">准备商品</a></li>
                <li><a href="#" target="_blank">准备商品</a></li>

            </ul>
            <div class="div">
               <!-- <input type="text" class="td1" /> -->
			   <form action="/tanbao/GoodsServlet" method="post">
				   <input type="text" class="td1" name="goodsName" placeholder="手机"/>
			   </form>
				   <div class="td2"><img src="img/sousuo1.png"/></div>
            </div>
        </div>
    </div>
    <!--相关搜索-->
    <div class="zhxlxp"><span style=" background:#111; color:#fff; margin-left:0; padding-left:10px">搜索相关</span></div>
    <div class="tuijiansp">
        <div class="shopliebiao">
            <ul>
                <li>
                    <a href="#" class="wocici">
                        <b>
                            <img src="img/logo2.jpg"/>
                        </b>
                        <h2>商品名称</h2>
                        <p>商品简介/介绍</p>
                        <span>6666元</span>
                    </a>
                    <em class="wocaca">
                        <a href="#">Team7自营店</a>
                        <a href="#" style=" border-right:hidden">联系卖家</a>
                    </em>
                </li>
                <li>
                    <a href="#" class="wocici">
                        <b>
                            <img src="img/logo2.jpg"/>
                        </b>
                        <h2>商品名称</h2>
                        <p>商品简介/介绍</p>
                        <span>6666元</span>
                    </a>
                    <em class="wocaca">
                        <a href="#">Team7自营店</a>
                        <a href="#" style=" border-right:hidden">联系卖家</a>
                    </em>
                </li>
                <li>
                    <a href="#" class="wocici">
                        <b>
                            <img src="img/logo2.jpg"/>
                        </b>
                        <h2>商品名称</h2>
                        <p>商品简介/介绍</p>
                        <span>6666元</span>
                    </a>
                    <em class="wocaca">
                        <a href="#">Team7自营店</a>
                        <a href="#" style=" border-right:hidden">联系卖家</a>
                    </em>
                </li>
                <li>
                    <a href="#" class="wocici">
                        <b>
                            <img src="img/logo2.jpg"/>
                        </b>
                        <h2>商品名称</h2>
                        <p>商品简介/介绍</p>
                        <span>6666元</span>
                    </a>
                    <em class="wocaca">
                        <a href="#">Team7自营店</a>
                        <a href="#" style=" border-right:hidden">联系卖家</a>
                    </em>
                </li>
                <li>
                    <a href="#" class="wocici">
                        <b>
                            <img src="img/logo2.jpg"/>
                        </b>
                        <h2>商品名称</h2>
                        <p>商品简介/介绍</p>
                        <span>6666元</span>
                    </a>
                    <em class="wocaca">
                        <a href="#">Team7自营店</a>
                        <a href="#" style=" border-right:hidden">联系卖家</a>
                    </em>
                </li>

            </ul>
        </div>
    </div>

</div>
</body>
<script src="js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
<script>
	$(document).ready(function(){
		$(".td2").click(function(){
			$("form").submit();
		})
	})
</script>
</html>



















