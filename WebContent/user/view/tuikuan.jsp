<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退货退款</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/vipcenter.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/public.js"></script>
</head>
<body>

<div class="locfre">
    <a href="#" class="zuliyesi">退款申请</a>
    <a href="tuihuo.jsp">退货申请</a>
</div>
<div class="pipixia" style=" background:#FFF">
    <tbody><tr>
        <td>&nbsp;</td>
        <th><i style=" font-size:14px">申请时间</i></th>
        <td class="w240">
            <input type="text" style=" border:1px solid #bbb; height:26px">&nbsp;–&nbsp;
            <input type="text" style=" border:1px solid #bbb; height:26px">
        </td>
        <th>
            <select style=" border:1px solid #bbb; height:28px">
                <option>订单编号</option>
                <option>商品ID</option>
                <option>商品名称</option>
            </select>
        </th>
        <td class="w160"><input type="text" style=" border:1px solid #bbb; line-height:26px"></td>
        <td class="w70 tc">
            <label>
                <input type="submit" value="搜索" style=" border:1px solid #bbb; line-height:24px">
            </label>
        </td>
    </tr>
    </tbody>
</div>

<script>
    $(function(){
        $(".locfre a").click(function(){
            $(this).addClass("zuliyesi").siblings().removeClass("zuliyesi")
        })
        $(".feifeidg").mouseenter(function(){
            $(this).css({background:"#0059a7"})
        })
        $(".feifeidg").mouseleave(function(){
            $(this).css({background:"#006DCC"})
        })
        $(".tutudg").mouseenter(function(){
            $(this).css({background:"#3a9d3a"})
        })
        $(".tutudg").mouseleave(function(){
            $(this).css({background:"#5BB75B"})
        })
        $(".paopaodg").mouseenter(function(){
            $(this).css({background:"#dd7200"})
        })
        $(".paopaodg").mouseleave(function(){
            $(this).css({background:"#fe8300"})
        })
    })
</script>

<div class="zhuzhuxia" style=" margin-top:10px">
    <span>商品</span>
    <span>退款金额</span>
    <span>审核状态</span>
    <span>平台确认</span>
    <span>操作</span>
</div>
<!--一条列表开始-->
<div class="zhuzhuxia" style=" background:#FAFAFA">
    <em style=" padding-left:10px">商品ID：<s>xxxxxxxxxxxxxxxxxxxx</s></em>
    <em>申请时间：<s>2016-6-6&nbsp;14:46</s></em>
    <a href="#"><em style=" color:#09f">店铺：<s>Team7自营店</s></em></a>
    <a href="#"><em style=" color:#09f">手机号：<s>1285447957</s></em></a>
</div>
<div class="zhuzhuxia">
            	<span>
                	<p style=" color:#999">订单商品全部退款</p>
                    <p style=" color:#999">订单编号：<a href="#" class="yansb" style="color:#111">xxxxxxxxxxxxxxxxxxxx</a></p>
                </span>
    <span style=" line-height:58px; color:#999">100</span>
    <span style=" line-height:58px; color:#999">同意</span>
    <span style=" line-height:58px; color:#999">已完成</span>
    <span><a href="#" style=" line-height:58px; color:#111" class="yseal">查看</a></span>
</div>
<!--一条列表结束-->
<script>
    $(function(){
        $(".yansb").mouseenter(function(){
            $(this).css({color:"#f00"})
        });
        $(".yansb").mouseleave(function(){
            $(this).css({color:"#111"})
        })
        $(".yseal").mouseenter(function(){
            $(this).css({color:"#f00"})
        });
        $(".yseal").mouseleave(function(){
            $(this).css({color:"#111"})
        })
    })
</script>

</body>
</html>
