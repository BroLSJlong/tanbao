<%@page import="tanbao.entity.LoginUser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="tanbao.util.StrUtil" %>
<%@ page import="tanbao.entity.entitytable.User" %>
<%
	LoginUser user = (LoginUser)session.getAttribute("user");
	String yhtx = request.getContextPath()+"/userImgs/head.jpg";
	if(null != user && StrUtil.isNotEmpty(user.getMyInfo().getHeadImg())){
		yhtx = request.getContextPath()+"/userfile/"+user.getMyInfo().getHeadImg();
	}
	
	/**获取登录用户信息*/
	Object p = session.getAttribute("user");
    LoginUser loginUser = null;
    if(p != null){
    	loginUser = (LoginUser)p;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!--个人中心首页 -->
<div class="thetoubu">
    <!--头部-->
    <div class="thetoubu1">
        <b>
            <img src="<%=yhtx%>" />
        </b>
        <em><%=user.getMyInfo().getUserName()%></em>
        <em>欢迎来到会员中心</em>
        <a href="${pageContext.request.contextPath}/index.jsp">探宝</a>
    </div>
    <!--详细列表-->
    <div class="xiangxilbnm">
        <!--left-->
        <div class="liefyu">
            <h2>交易管理</h2>
            <div class="conb">
                <a href="gouwuche.jsp" target="content">我的购物车</a>
                <a href="jiaoyidindan.jsp" target="content">交易订单</a>
                <a href="myshoucang.jsp" target="content">我的收藏</a>
                <a href="file:///C:/Users/86136/AppData/Local/Temp/47f4ebe0b20c075dcba7262ffb197b50.jpeg" target="content">交易评价/晒单</a>
            </div>
            <h2>客户服务</h2>
            <div class="conb">
                <a href="/tanbao/admin/view/shop.jsp" target="content">我的店铺</a>
                <a href="/tanbao/user/view/tuihuo.jsp" target="content">退款及退货</a>
                <a href="file:///C:/Users/86136/AppData/Local/Temp/47f4ebe0b20c075dcba7262ffb197b50.jpeg" target="content">平台客服</a>
            </div>
            <h2>资料管理</h2>
            <div class="conb">
                <a href="myinfo.jsp" target="content">账户信息</a>
                <a href="updateH.jsp" target="content">账户修改</a>
                <a href="dizhiguanli.jsp" target="content">地址管理</a>
                <a href="file:///C:/Users/86136/AppData/Local/Temp/47f4ebe0b20c075dcba7262ffb197b50.jpeg" target="content">我的消息</a>
            </div>
        </div>
        <script type="text/javascript">
            $(function(){
                $(".liefyu h2").click(function(){
                    $(this).next(".conb").slideToggle()(".con").slideUp()
                })
            })
        </script>
        <div class="zuirifip">
            <iframe src="gouwuche.jsp" name="content" width="100%" height="100%" frameborder="no" id="testFrame" ></iframe>
        </div>
    </div>
</div>
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






