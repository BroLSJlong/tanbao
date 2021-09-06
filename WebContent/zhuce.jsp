<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/12
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/zhuce.css"/>
    <script src="js/zhuce.js"></script>
</head>
<body>
<div id="toutou">
    <div class="zhong">
        <div class="logo"><a href="index.jsp" target="_blank"><img src="img/logo.jpg"/></a></div>

    </div>
</div>

<div id="div">
    <div id="div1">
        <div class="div2"><h1>探宝注册</h1></div>

        <table>
            <tr>
                <td>用户名：</td>
                <td><input type="text" id="yhm" placeholder="请输入用户名" name="userName"/></td>
                <td style="padding: 0;"><span >首位不得为下划线、特殊字符</span></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" id="mm" placeholder="请输入密码" name="userPwd"/></td>
                <td  style="padding: 0;"><span>请以字母开头，并不少于6位</span></td>
            </tr>
            <tr class="mqb">
                <td>&nbsp;</td>
                <td class="mq">密码强度：<label class="sp1"></label><label class="sp2"></label><label class="sp3"></label></td>
                <td></td>
            </tr>
            <tr>
                <td>确认密码：</td>
                <td><input type="password" id="qr" placeholder="确认密码" /></td>
                <td><span></span></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" id="yx" placeholder="请输入邮箱" /></td>
                <td><span>请填写可用邮箱</span></td>
            </tr>
            <tr>
                <td>手机号：</td>
                <td><input type="text" id="sjh" placeholder="请输入手机号" /></td>
                <td><span>请填写可用手机号码</span></td>
            </tr>
            <tr>
                <td>身份证号：</td>
                <td><input type="text" id="zjh" placeholder="请输入证件号" /></td>
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
                <td>性别：</td>
                <td><input id="nan" type="radio" style="margin: 0 10px;" name="xb" value="1" checked="checked"/>男<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input id="nv" type="radio" style="margin: 0 10px;"  name="xb" value="0"/>女</td>
                <td><span></span></td>
            </tr>
        </table>
        <div class="div3"><p>确认注册</p></div>
        <span id="tupian" style=" display: none;"><img src="img/duigou.png"/></span>
        <div class="yi">
            <p><span>已有探宝账号</span><span><u><a href="login.jsp">登录</a></u></span></p>
        </div>
    </div>
</div>
<div id="div3">
    <div class="zhong">
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

