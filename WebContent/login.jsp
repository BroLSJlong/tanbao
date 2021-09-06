<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/12
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.Goods"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/denglu.css"/>
    <script src="js/denglu.js"></script>
</head>
<body>
<div id="div1">
    <div class="center">
        <div class="logo"><a href="index.jsp" target="_blank"><img src="img/logo2.jpg"/></a></div>
        <div class="tou">
            <p class="p1">探宝</p>
            <p class="p2">Team7 的良心之作</p>
        </div>
    </div>
</div>
<div id="div2">
    <div class="center">
        <div id="zuo">
            <div class="zuoa">
                <div class="zi">
                    <p class="p1">登录探宝</p>
                    <p class="p2">开始寻宝之旅</p>
                    <p class="p3">百万好货等你挑选</p>

                </div>
                <div>
                    <img src="img/shulogo.png" style="height: 590px;"/>
                </div>
            </div>
        </div>
        <div id="you">
            <div id="zhang">
                <span class="span1" id="denglu" style="color: #FF6700;">帐号登录</span>
                <span class="span2">|</span>
                <span class="span3" id="saoma" >扫码登录</span>
            </div>
            <div id="you2"><img src="img/logo.jpg"/></div>
            <div id="you1">
                <div id="zhang1" style="height: 0;">
                    <form action="/tanbao/LoginServlet" method="post">
                    <input name="phone" type="text" id="inp1" placeholder="邮箱/手机号码/探宝帐号"/>
                    <input name="pwd" type="password" id="inp2"  placeholder="密码"/>
                    <input id="deng" type="submit" value="立即登录">
                    </form>
					<%
                    	String s = (String)request.getAttribute("LoginMessage");
	                    if(s != null)out.print("<p style='position:relative; top:50px; text-align:center; color: red;'>" + s + "</p>");
                    %>
					
                    <div id="wang">
                        <span class="span1"><a href="zhuce.jsp">注册探宝账户</a></span>
                        <span class="span2">|</span>
                        <span class="span3"><a href="#">忘记密码？</a></span>
                    </div>
                </div>
            </div>
            <div id="zhang2">
                <p class="p1"></p>
                <p class="p2">其他方式登录</p>
                <p class="p1"></p>
            </div>
            <div id="zhang3">
                <a href="#"><img src="img/qq.png"/></a>
                <a href="#"><img src="img/weibo.png"/></a>
                <a href="#"><img src="img/zzz.png"/></a>
            </div>


        </div>
    </div>
</div>
<div id="div3">
    <div class="center">
        <div class="xia1" style="width: 300px;">
            <span>简体</span>|
            <span>繁体</span>|
            <span>English</span>|
            <span>常见问题</span>
        </div>

    </div>
</div>

</body>
</html>

