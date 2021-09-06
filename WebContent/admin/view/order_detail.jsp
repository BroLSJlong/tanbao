<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
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
    <h2 class="fl">订单详情示例</h2>
</div>
<table class="table">
    <tr>
        <td>收件人：Team7</td>
        <td>联系电话：18300000000</td>
        <td>收件地址：陕西省西安市雁塔区丈八路2000集都市印象18栋2160室</td>
        <td>付款时间：2021-7-14 13:56</td>
    </tr>
    <tr>
        <td>下单时间：2021-7-14 13:56</td>
        <td>付款时间：2021-7-14 13:56</td>
        <td>确认时间：2021-7-14 13:56</td>
        <td>评价时间时间：---</td>
    </tr>
    <tr>
        <td>订单状态：<a>已付款，待发货</a></td>
        <td colspan="3">订单备注：<mark>这不得送个东西？</mark></td>
    </tr>
</table>
<table class="table">
    <tr>
        <td class="center"><img src="upload/goods01.jpg" width="50" height="50"/></td>
        <td>商品名称</td>
        <td class="center">A15902</td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>
        <td class="center">
            <p>商品属性</p>
        </td>
        <td class="center"><strong>数量</strong></td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>

    </tr>
    <tr>
        <td class="center"><img src="upload/goods01.jpg" width="50" height="50"/></td>
        <td>商品名称</td>
        <td class="center">A15902</td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>
        <td class="center">
            <p>商品属性</p>
        </td>
        <td class="center"><strong>数量</strong></td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>

    </tr>
    <tr>
        <td class="center"><img src="upload/goods01.jpg" width="50" height="50"/></td>
        <td>商品名称</td>
        <td class="center">A15902</td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>
        <td class="center">

            <p>商品属性</p>
        </td>
        <td class="center"><strong>数量</strong></td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>

    </tr>
</table>
<aside class="mtb" style="text-align:right;">
    <label>管理员操作：</label>
    <input type="text" class="textbox textbox_295" placeholder="管理员操作备注"/>
    <input type="button" value="确认订单" class="group_btn"/>
    <input type="button" value="付款" class="group_btn"/>
    <input type="button" value="配货" class="group_btn"/>
    <input type="button" value="发货" class="group_btn"/>
    <input type="button" value="确认发货" class="group_btn"/>
</aside>
</body>
</html>
