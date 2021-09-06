<%--
  Created by IntelliJ IDEA.
  User: 谢生龙
  Date: 2021/7/14
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@page import="tanbao.entity.entitytable.Store"%>
<%@page import="java.util.List"%>
<%@page import="tanbao.entity.LoginUser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	/**获取登录用户信息*/
	Object p = session.getAttribute("user");
    LoginUser loginUser = null;
    if(p != null){
    	loginUser = (LoginUser)p;
    }
    
    
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css">
    <script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body>
<div class="page_title">
    <h2 class="fl">欢迎入驻探宝！</h2>
</div>
<section>
    <form action="/tanbao/StoreServlet?m=storeAdd&userId=<%=loginUser.getMyInfo().getUserId() %>" method="post">
    <ul class="ulColumn2">
        <li>
            <span class="item_name" style="width:120px;">店铺名称：</span>
            <input type="text" id="storeName" class="textbox textbox_225" name="storeName" value="<%=loginUser.getMyStore().getStoreName()%> " onblur="jiaoyan()"/>
            <span class="errorTips">一般不超过10个字符</span>
        </li>
        <li>
            <span class="item_name" style="width:120px;margin-top:-80px;">
            	当前店铺简介：
            </span>
            <input name="oldDescript" type="hidden" class="textbox textbox_295" value="<%=loginUser.getMyStore().getStoreDescript()%>" />
			<textarea id="oldDescript" cols="50" rows="5" readonly="readonly"><%=loginUser.getMyStore().getStoreDescript()%></textarea>
        </li>
        
        <li>
        	<span class="item_name" style="width:120px;">编辑店铺新简介：</span>
        	<span class="errorTips">一般不超过100个字符</span>
            <script   name="storeDescript" id="editor" type="text/plain" style="width:700px;height:200px;margin-left:120px;margin-top:0;"></script>
        </li>
			
		<!-- <li>
			<span class="item_name" style="width:120px;">店铺商品管理</span>
		</li> -->
		
       <!--  <li>
            <span class="item_name" style="width:120px;">关闭店铺：</span>
            <label class="single_selection"><input type="radio" name="name"/>否</label>
            <label class="single_selection"><input type="radio" name="name"/>是</label>
        </li> -->
        <li>
            <span class="item_name" style="width:120px;"></span>
            <input type="submit" class="link_btn" value="保存" onclick="shop()"/>&nbsp;&nbsp;&nbsp;&nbsp;
            <input style="width:90px; height: 30px;" class="link_btn" onclick="shop()" value="进店看看" />
        </li>
    </ul>
    </form>
</section>
</body>



<script type="text/javascript">
	function jiaoyan(){
		var txt = document.getElementById("storeName").value;
		if (null == txt) {
			alert("店铺名为空");
		}
	}
</script>
<!-- <script type="text/javascript">
	function cop(){
		alert(123);
		var str = document.getElementById("editor").innerText;
		alert(str);
		document.getElementById("oldDescript").value = str;
		alert(678);
	}
</script> -->
<script type="text/javascript">
	function shop(){
		window.parent.location.href = "/tanbao/StoreServlet?m=selectStore&sellerId=<%=loginUser.getMyInfo().getUserId() %>"
	}
</script>
<script src="${pageContext.request.contextPath}/admin/js/ueditor.config.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/ueditor.all.min.js"> </script>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script> 
</html>
