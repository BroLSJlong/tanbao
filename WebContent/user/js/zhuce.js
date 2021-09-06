window.onload=function(){
				var Span=document.getElementsByTagName("span");
				var user=document.getElementById("yhm");
				mima=document.getElementById("mm");
				qrmm=document.getElementById("qr");
				yxa=document.getElementById("yx");
				sj=document.getElementById("sjh");
				zj=document.getElementById("zjh");
				xb=document.querySelectorAll("input[type='radio']");
				zc=document.getElementsByClassName("div3");
				
				user.onblur=function(){
					var zheng=/^[a-zA-Z_]\w{4,}$/;
					if(user.value==null||user.value==""){
						Span[0].innerHTML="<a style='font-size: 14px; color: red;'>用户名不能为空</a>"
					}else if(!zheng.test(user.value)){
						Span[0].innerHTML="<a style='font-size: 14px; color: red;'>用户名格式错误！</a>"
					}else{
						Span[0].innerHTML="<img src='img/duigou.png' />"
					}
				}
				
				mima.onblur=function(){
					var lab=document.getElementsByTagName("label");
					var ze1=/^\d{6,}$/;
					var ze2=/^\w{1,}\d{1,}$/;
					var ze3=/^\w{1,}\d{1,}\w{1,}$/;
					if(mima.value==null||mima.value==""){
						Span[1].innerHTML="<a style='font-size: 14px; color: red;'>密码不能为空</a>"
					}else if(!ze1.test(mima.value)&&!ze2.test(mima.value)&&!ze3.test(mima.value)){
						Span[1].innerHTML="<a style='font-size: 14px; color: red;'>密码格式错误！</a>"
					}else if(ze1.test(mima.value)){
						lab[0].style.backgroundColor="red"
						lab[1].style.backgroundColor="transparent"
						lab[2].style.backgroundColor="transparent"
						Span[1].innerHTML="<img src='img/duigou.png' />"
					}else if(ze2.test(mima.value)){
						lab[1].style.backgroundColor="orange"
						lab[0].style.backgroundColor="transparent"
						lab[2].style.backgroundColor="transparent"
						Span[1].innerHTML="<img src='img/duigou.png' />"
					}else if(ze3.test(mima.value)){
						lab[2].style.backgroundColor="green"
						lab[1].style.backgroundColor="transparent"
						lab[0].style.backgroundColor="transparent"
						Span[1].innerHTML="<img src='img/duigou.png' />"
					}
				}
				
				qrmm.onblur=function(){
					mm=document.getElementById("mm");
					if(qrmm.value=="" || qrmm.value==null){
						Span[2].innerHTML="<a style='font-size: 14px; color: red;'>请确认密码</a>"
					}else if(mm.value!=qrmm.value){
						Span[2].innerHTML="<a style='font-size: 14px; color: red;'>密码不一致！</a>"
					}else{
						Span[2].innerHTML="<img src='img/duigou.png' />"
					}
				}
				
				yxa.onblur=function(){
					var zheng=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/;
					if(yxa.value==null || yxa.value==""){
						Span[3].innerHTML="<a style='font-size: 14px; color: red;'>邮箱不能为空</a>"
					}else if(!zheng.test(yxa.value)){
						Span[3].innerHTML="<a style='font-size: 14px; color: red;'>邮箱格式错误！</a>"
					}else{
						Span[3].innerHTML="<img src='img/duigou.png' />"
					}
				}
				
				sj.onblur=function(){
					var zheng=/^1[0-9]{10}$/;
					if(sj.value==null||sj.value==""){
						Span[4].innerHTML="<a style='font-size: 14px; color: red;'>手机号码不能为空</a>"
					}else if(!zheng.test(sj.value)){
						Span[4].innerHTML="<a style='font-size: 14px; color: red;'>号码格式错误！</a>"
					}else{
						Span[4].innerHTML="<img src='img/duigou.png' />"
					}
				}
				
				zj.onblur=function(){
					var zheng=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[Xx])$/;
					if(zj.value==null||zj.value==""){
						Span[5].innerHTML="<a style='font-size: 14px; color: red;'>身份证不能为空</a>"
					}else if(!zheng.test(zj.value)){
						Span[5].innerHTML="<a style='font-size: 14px; color: red;'>身份证格式错误！</a>"
					}else{
						Span[5].innerHTML="<img src='img/duigou.png' />"
					}
				}
				
				zc[0].onclick=function(){
					var tup=document.getElementById("tupian");
					var aa=document.getElementsByTagName("span");
					for(var i=0;i<6;i++){
						if(tup.innerHTML!=aa[i].innerHTML){
							alert("请完善你的信息")
							return
						}else{
							if(i>=5){
							alert("注册成功")
				document.cookie="username="+user.value;
				document.cookie="password="+mima.value;
				
				document.location="denglu.html";
							}
						}
					}
				}
				
				
				
			}