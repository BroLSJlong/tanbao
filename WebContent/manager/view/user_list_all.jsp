<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/15
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.common.TypeConversion"%>
<%@page import="tanbao.entity.entitytable.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="tanbao.dao.UserDao"%>
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
    <script type="text/javascript">
window.onload=function() {
	<%
			try{
				Object object1 = (Object)request.getAttribute("users");
				List<User> list1 = (List<User>)object1;
			    if (null == list1) {
			     	request.getRequestDispatcher("/UserServlet?m=userSelect").forward(request, response);
				}
		   
			
	%>
}
</script>
<%
TypeConversion typeConversion = new TypeConversion();
%>
</head>
<body>

<div class="page_title">
    <h2 class="fl">用户列表</h2>
</div>
<section class="mtb">

    <form action="/tanbao/UserServlet?m=userSelectbyph" method="post" >
    <input type="text" class="textbox textbox_225" placeholder="输入手机号查询..." name="key"/>
    <input type="submit" value="查询" class="group_btn"/>
    </form>
</section>
<table class="table">
    <tr>
        <th>用户昵称</th>
        <th width="10%">用户头像</th>
        <th>手机号码</th>
        <th width="20%">电子邮件</th>
        <th width="5%">性别</th>
        <th>用户身份</th>
        <th colspan="2">身份证</th>
        <th>操作</th>
    </tr>
    <%  
    
    	for(int i = 0;i<list1.size();i++ ){
    	 User user1 = list1.get(i);
   %>
    <tr>
        <td class="center"><%=user1.getUserName()%></td>
        <td class="center"><img src="${pageContext.request.contextPath}/admin/upload/user_002.png" width="50" height="50"/></td>
        <td class="center"><%=user1.getPhone()%></td>
        <td class="center"><%=user1.getEmail()%></td>
        <td class="center"><%=user1.getUserSex()%></td>
        <td class="center"><%=typeConversion.userTypeConversion(user1.getUserClass()) %></td>
        <td class="center" colspan="2">
           <%=user1.getIdCard()%>
        </td>
        <td class="center">
            <a href="user_list_allselect.jsp?userId=<%=user1.getUserId()%>
            &&userName=<%=user1.getUserName()%>
            &&phone=<%=user1.getPhone()%>
            &&userPwd=<%=user1.getUserPwd()%>
            &&userSex=<%=user1.getUserSex()%>
            &&userBorn=<%=user1.getUserBorn()%>
            &&idCard=<%=user1.getIdCard()%>
            &&email=<%=user1.getEmail()%>
            &&headImg=<%=user1.getHeadImg()%>
            &&userClass=<%=user1.getUserClass()%>
            " title="查看" class="link_icon"><button>&#101;</button></a>
            <a href="/tanbao/UserServlet?m=userDelete&&userId=<%=user1.getUserId()%>" title="删除" class="link_icon">
           <button onclick="sure()" >&#100;</button>	 
            </a>
        </td>
    </tr>
    <%
     }}catch(Exception e){} 
    %>
    
</table>
<aside class="paging">
    <a>1</a>
    <a>2</a>
    <a>3</a>
    <a>…</a>
</aside>
</body>
<script type="text/javascript">
	function sure(){
	     if(confirm("确定要注销该用户吗?"))
	     {
	       return true;
	     }else{
		   return false;
		 }
	}
</script>
</html>
