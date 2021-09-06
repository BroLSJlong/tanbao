window.onload=function(){
				var Span=document.getElementsByTagName("span");
				 user=document.getElementById("yhm");
				 mima=document.getElementById("mm");
				 yxa=document.getElementById("yx");
				 sj=document.getElementById("sjh");
				 zj=document.getElementById("zjh");
				 dqxb=document.getElementById("dqsex");
				 zc=document.getElementsByClassName("div3");
				 sex=document.getElementsByName("xb");
				
				 u()
				function u(){
					Span[0].innerHTML="<img src='/tanbao/user/img/duigou.png' />"
						for(var i = 0; i < sex.length; i++){
							if(sex[i].value == dqxb.value){
								sex[i].checked = true;
								b = sex[i];
							}
						}
				}
				 user.onblur=function(){
						var zheng=/^[a-zA-Z_]\w{4,}$/;
						if(user.value==null||user.value==""){
							Span[0].innerHTML="<a style='font-size: 14px; color: red;'>用户名不能为空</a>"
						}else if(!zheng.test(user.value)){
							Span[0].innerHTML="<a style='font-size: 14px; color: red;'>用户名格式错误！</a>"
						}else{
							Span[0].innerHTML="<img src='/tanbao/user/img/duigou.png' />"
						}
					}
				 
				y()
				function y(){
					Span[1].innerHTML="<img src='/tanbao/user/img/duigou.png' />"
				}
				yxa.onblur=function(){
					var zheng=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/;
					if(yxa.value==null || yxa.value==""){
						Span[1].innerHTML="<a style='font-size: 14px; color: red;'>邮箱不能为空</a>"
					}else if(!zheng.test(yxa.value)){
						Span[1].innerHTML="<a style='font-size: 14px; color: red;'>邮箱格式错误！</a>"
					}else{
						Span[1].innerHTML="<img src='/tanbao/user/img/duigou.png' />"
					}
				}
				
				s()
				function s(){
					Span[2].innerHTML="<img src='/tanbao/user/img/duigou.png' />"
				}
				sj.onblur=function(){
					var zheng=/^1[0-9]{10}$/;
					if(sj.value==null||sj.value==""){
						Span[2].innerHTML="<a style='font-size: 14px; color: red;'>手机号码不能为空</a>"
					}else if(!zheng.test(sj.value)){
						Span[2].innerHTML="<a style='font-size: 14px; color: red;'>号码格式错误！</a>"
					}else{
						Span[2].innerHTML="<img src='/tanbao/user/img/duigou.png' />"
					}
				}
				
				z()
				function z(){
					Span[3].innerHTML="<img src='/tanbao/user/img/duigou.png' />"
					//获取生日
					birth = zj.value.substring(6, 10) + "-" + zj.value.substring(10, 12) + "-" + zj.value.substring(12, 14);
					//获取并显示出生年份
					select_nian=document.getElementById("nian")
					for(var i=0; i<select_nian.options.length; i++){
						if(select_nian.options[i].value == zj.value.substring(6, 10)){
								select_nian.options[i].selected = true;
						}
					}
					//获取并显示出生月份
					select_yue=document.getElementById("yue")
					for(var u=0; u<select_yue.options.length; u++){
						if(select_yue.options[u].value == zj.value.substring(10, 12)){
							select_yue.options[u].selected = true;
						}
					}
					//获取并显示出生日
					select_ri=document.getElementById("ri")
					for(var y=0; y<select_ri.options.length; y++){
						if(select_ri.options[y].value == zj.value.substring(12, 14)){
							select_ri.options[y].selected = true;
						}
					}
				}
				zj.onblur=function(){
					//验证身份证号码的正则
					var zheng=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[X])$/;
					if(zj.value==null||zj.value==""){
						Span[3].innerHTML="<a style='font-size: 14px; color: red;'>身份证不能为空</a>"
					}else if(!zheng.test(zj.value)){
						Span[3].innerHTML="<a style='font-size: 14px; color: red;'>身份证格式错误！</a>"
					}else{
						Span[3].innerHTML="<img src='/tanbao/user/img/duigou.png' />"
						//获取生日
						birth = zj.value.substring(6, 10) + "-" + zj.value.substring(10, 12) + "-" + zj.value.substring(12, 14);
						//获取并显示出生年份
						select_nian=document.getElementById("nian")
						for(var i=0; i<select_nian.options.length; i++){
							if(select_nian.options[i].value == zj.value.substring(6, 10)){
								select_nian.options[i].selected = true;
							}
						}
						//获取并显示出生月份
						select_yue=document.getElementById("yue")
						for(var u=0; u<select_yue.options.length; u++){
							if(select_yue.options[u].value == zj.value.substring(10, 12)){
								select_yue.options[u].selected = true;
							}
						}
						//获取并显示出生日
						select_ri=document.getElementById("ri")
						for(var y=0; y<select_ri.options.length; y++){
							if(select_ri.options[y].value == zj.value.substring(12, 14)){
								select_ri.options[y].selected = true;
							}
						}
					}
				}
				
				nan=document.getElementById("nan");
				nv=document.getElementById("nv");
				nan.onblur=function(){
					for(var i = 0; i < sex.length; i++){
						if(sex[i].checked == true){
						b = sex[i];
					 }
					}
				}
				nv.onblur=function(){
					for(var i = 0; i < sex.length; i++){
						if(sex[i].checked == true){
							b = sex[i];
						}
					}
				}
				
				zc[0].onclick=function(){
					var tup=document.getElementById("tupian");
					var aa=document.getElementsByTagName("span");
					for(var i=0;i<4;i++){
						if(tup.innerHTML!=aa[i].innerHTML){
							alert("请完善需要修改的信息")
							return
						}else{
							if(i>=3){
							alert("修改成功")
					
				window.location.href='/tanbao/UserServlet?m=userUpdate'.concat("&userName=",user.value,"&userPhone=",sj.value,"&userPwd=",mima.value,"&idCard=",zj.value,"&email=",yxa.value,"&userBorn=",birth,"&userClass=1","&userSex=",b.value);
							}
						}
					}
				}
			}