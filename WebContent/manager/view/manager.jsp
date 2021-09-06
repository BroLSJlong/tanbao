<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.LoginUser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>探宝后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css">
    <script src="${pageContext.request.contextPath}/admin/js/html5.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
     <%
     /**获取用户信息*/
		    Object p = session.getAttribute("user");
		    LoginUser loginUser = null;
		    if(p != null){
		    	loginUser = (LoginUser)p;
		    }
		    %>
</head>
<body>
<header>
    <h1><img src="${pageContext.request.contextPath}/admin/images/admin_logo.png"/></h1>
    <ul class="rt_nav">
        <li><a href="${pageContext.request.contextPath}/index.jsp" target="_blank" class="website_icon">站点首页</a></li>
        <li><a href="#" class="admin_icon">C E O</a></li>
        <li><a href="#" class="set_icon">账号设置</a></li>
        <li><a href="${pageContext.request.contextPath}/index.jsp" class="quit_icon">安全退出</a></li>
    </ul>
</header>


<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
    <h2><a>你好，<%=loginUser.getMyInfo().getUserName() %></a></h2>
    <ul>
        <li>
            <dl>
                <dt>商品管理</dt>
                <dd ><a href="product_list_all.jsp"  target="content">总商品列表</a></dd>
                <dd><a href="product_add.jsp"  target="content">商品上传</a></dd>
                <dd><a href="productimg_gl.jsp"  target="content">商品图片管理</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>订单管理</dt>
                <dd><a href="/tanbao/OrderServlet?m=managerOrderSelect" target="content">订单列表</a></dd>

            </dl>
        </li>
        <li>
            <dl>
                <dt>用户管理</dt>
                <dd><a href="user_list_all.jsp" target="content">用户列表</a></dd>
            </dl>
        </li>
            <%-- 下面这个就随便吧未来实现再说       --%>

        <li>
            <p class="btm_infor">探宝 CEO</p>
        </li>
    </ul>
</aside>

<style>
    .dataStatistic{width:400px;height:200px;border:1px solid #ccc;margin:0 auto;margin:10px;overflow:hidden}
    #cylindrical{width:400px;height:200px;margin-top:-15px}
    #line{width:400px;height:200px;margin-top:-15px}
    #pie{width:400px;height:200px;margin-top:-15px}
</style>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <iframe style="overflow-y:auto" id="testFrame" src="/tanbao/GoodsServlet?m=selectAll&name=listAll" name="content" width="100%" height="100%" frameborder="no"></iframe>
    </div>
</section>

<script type="text/javascript">
    var testFrame = document.getElementById('testFrame');
    testFrame.addEventListener('load', function() {
        testFrame.height = getHeight(testFrame.contentDocument);;
    });

    function getHeight(doc) {
        var body = doc.body,
            html = doc.documentElement;

        var height = Math.max( body.scrollHeight, body.offsetHeight,
            html.clientHeight, html.scrollHeight, html.offsetHeight );
        return height;
    }
</script>
</body>
</html>
