<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/13
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.LoginUser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="tanbao.util.StrUtil" %>
<%@ page import="tanbao.entity.entitytable.User" %>
<%
	LoginUser user = (LoginUser)session.getAttribute("user");
	String yhtx = request.getContextPath()+"/userHeadImg/head.jpg";
	if(null != user && StrUtil.isNotEmpty(user.getMyInfo().getHeadImg())){
		yhtx = request.getContextPath()+"/file/"+user.getMyInfo().getHeadImg();
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/userupdate.css"/>
    <script src="${pageContext.request.contextPath}/user/js/userupdate.js"></script>
</head>
<body>


<div id="div">
    <div id="div1">
        <div class="div2"><h1>账号信息修改</h1></div>

        <table>
            <tr>
                <td>用户名：</td>
                <td><input type="text" id="yhm" value="<%=user.getMyInfo().getUserName()%>" /></td>
                <td style="padding: 0;"><span >首位不得为下划线、特殊字符</span></td>
            </tr>
       		    
            <tr>
                <td>邮箱</td>
                <td><input type="text" id="yx" value="<%=user.getMyInfo().getEmail()%>" /></td>
                <td><span>请填写可用邮箱</span></td>
            </tr>
            <tr>
                <td>手机号：</td>
                <td><input type="text" id="sjh" value="<%=user.getMyInfo().getPhone()%>" /></td>
                <td><span>请填写可用手机号码</span></td>
            </tr>
            <tr>
                <td>身份证号：</td>
                <td><input type="text" id="zjh" value="<%=user.getMyInfo().getIdCard()%>" /></td>
                <td><span></span></td>
            </tr>
            <tr>
                <td>生日：</td>
                <td>
                    <select id="nian">
                        <optgroup label="年" class="op">
                            <option>1991</option><option>1992</option><option>1993</option><option>1994</option><option>1995</option><option>1996</option><option>1997</option><option>1998</option><option>1999</option><option>2000</option><option>2001</option><option>20002</option>
                        </optgroup>
                    </select >
                    <select id="yue">
                        <optgroup label="月" class="op">
                            <option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>9</option><option>10</option><option>11</option><option>12</option>
                        </optgroup>
                    </select>
                    <select id="ri">
                        <optgroup label="日" class="op">
                            <option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>9</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option>
                        </optgroup>
                    </select>
                </td>
                <td><span></span></td>
            </tr>
            <tr>
                <td>性别：<input id="dqsex" type=hidden value="<%=user.getMyInfo().getUserSex()%>" /></td>
                <td><input id="nan" type="radio" style="margin: 0 10px;" name="xb" value="1" />男<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input id="nv" type="radio" style="margin: 0 10px;"  name="xb" value="0"/>女</td>
                <td><span></span></td>
            </tr>
        </table>
        <div style="top:400px;position: absolute;left: 200px;">
			 <div class="div3"><p>确认修改</p></div>
			 <span id="tupian" style=" display: none;"><img src="/tanbao/user/img/duigou.png"/></span>
		 </div>
        <input type="hidden" id="mm" placeholder="<%=user.getMyInfo().getUserPwd()%>" />
    </div>
</div>

</div>
</body>
</html>
