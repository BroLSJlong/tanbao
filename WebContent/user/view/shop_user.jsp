<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.LoginUser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <h2 class="fl">店铺基础设置</h2>
</div>
<section>
<%
	Object p = session.getAttribute("user");
	LoginUser loginUser = null;
	if(p != null)loginUser = (LoginUser)p;
%>
    <form action="/tanbao/StoreServlet?m=storeAdd" method="post" >
    <input type="hidden" name="userId" value="<%=loginUser.getMyInfo().getUserId() %>"  />
    <ul class="ulColumn2">
        <li>
            <span class="item_name" style="width:120px;">店铺名称：</span>
            <input type="text" name="storeName" class="textbox textbox_225" placeholder="店铺名称..."/>
            <span class="errorTips">一般不超过80个字符</span>
        </li>
        <li>
            <span class="item_name" style="width:120px;">上传logo：</span>
            <label class="uploadImg">
                <input type="file"/>
                <span>上传站点logo</span>
            </label>
        </li>
        <li>
            <span class="item_name" style="width:120px;">店铺简介：</span>
            <input type="text" name="storeDescript" class="textbox textbox_295" placeholder="店铺简介..."/>
            <span class="errorTips">一般不超过200个字符</span>
        </li>
        <li>
            <span class="item_name" style="width:120px;"></span>
            <input type="submit" class="link_btn" value="保存"/>
        </li>
    </ul>
    </form>
</section>
</body>
</html>
