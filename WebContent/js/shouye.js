			window.onload=function(){
				var  diana=document.getElementById("er_dian");
				var diandian=diana.getElementsByTagName("p");
				var  ban=document.getElementById("banner");
				var imag=ban.getElementsByTagName("img");
				var spana=document.getElementById("span1");
				var spanb=document.getElementById("span2");
				var num=0;
				var s=4;
				function shan(n){
					diandian[n].className="";
					imag[n].style.display="none";
				}
				function jia(n){
					diandian[n].className="dian";
					imag[n].style.display="block"
				}
				
				timer=setInterval(function(){
					shan(num);
					num=num+1;
					if(num>4){
						num=0
					}
					jia(num);
				},1500)
				
				
				for (var i=0;i<diandian.length;i++){
					diandian[i].index=i;
					
					
					spana.onmouseover=function(){//===========左边尖角=============
						clearInterval(timer);
						for(var j=0;j<diandian.length;j++){
							shan(j);
						}
						jia(4);
					}
					spana.onmouseout=function(){
						for(var j=0;j<diandian.length;j++){
							shan(j);
						}
						jia(num);
						timer=setInterval(function(){
							shan(num);
							num=num+1;
							if(num>4){
								num=0
							}
							jia(num);
						},1500)
					}
					spana.onclick=function(){
						for(var j=0;j<diandian.length;j++){
							shan(j);
						}
						jia(s);
						shan(s);
						s-=1;
						if(s<0){
							s=4;
						}
						jia(s);
					}

					
					spanb.onmouseover=function(){//===========右边尖角=============
						clearInterval(timer);
						for(var j=0;j<diandian.length;j++){
							shan(j);
						}
						jia(num);
					}
					spanb.onmouseout=function(){
						for(var j=0;j<diandian.length;j++){
							shan(j);
						}
						jia(num)
						timer=setInterval(function(){
							shan(num);
							num=num+1;
							if(num>4){
								num=0
							}
							jia(num);
						},1500)
					}
					
					spanb.onclick=function(){
						for(var j=0;j<diandian.length;j++){
							shan(j);
						}
						jia(num);
						shan(num);
						num+=1;
						if(num>4){
							num=0;
						}
						jia(num);
					}
					
					
					diandian[i].onmouseover=function(){//===========下边原点=============
						clearInterval(timer);
						for(var j=0;j<diandian.length;j++){
							shan(j)
						}
						jia(this.index);
					}
					diandian[i].onmouseout=function(){
						for(var j=0;j<diandian.length;j++){
							shan(j);
						}
						jia(num);
						timer=setInterval(function(){
							shan(num);
							num=num+1;
							if(num>4){
								num=0
							}
							jia(num);
						},1500)
					}
				}
//  -----------轮播图 ok-------

//-----------------二级导航----------------------
			dh=document.getElementById("er_daohang")
			lis=dh.getElementsByTagName("li");
			for (var i=0;i<lis.length;i++){
				lis[i].onmouseover=function(){
						this.children[2].style.display="block";
				}
				lis[i].onmouseout=function(){
						this.children[2].style.display="none";
				}
			}

//-----------------二级导航    ok!!----------------------			
			
			
//---------------------------小米明星单品轮播------------------------------			
			var tua=document.getElementById("er_si_yi");
			var tub=document.getElementById("er_si_er");
			/*var tualeft=tua.offsetLeft;
			var tubleft=tub.offsetLeft;*/
			timerb=setInterval(wufeng,10,tua,tub)
			tua.onmouseover=function(){
				clearInterval(timerb)
			}
			tua.onmouseout=function(){
				timerb=setInterval(wufeng,10,tua,tub)
			}
			tub.onmouseover=function(){
				clearInterval(timerb)
			}
			tub.onmouseout=function(){
				timerb=setInterval(wufeng,10,tua,tub)
			}
			
			
			function wufeng(objj1,objj2){
				tualeft=objj1.offsetLeft;
				tubleft=objj2.offsetLeft;
				if(tualeft>=1278){
					tualeft=-1200;
				}
				objj1.style.left=tualeft+2+"px";
				if(tubleft>=1278){
					tubleft=-1200;
				}
				objj2.style.left=tubleft+2+"px";
			}
//---------------------------小米明星单品 ok------------------------------------------			
			
			
			
			




	/// ----------------------回到顶部----------------------------------		
			var Top=document.getElementById("hui");
					timerk=setInterval(function(){
						var scrol=document.body.scrollTop||document.documentElement.scrollTop;
						console.log(scrol)
						if(scrol<=100){
							Top.style.display="none";
						}else{
							Top.style.display="block";
						}
					},1)
					
						
				Top.onclick=function(){
					var timerd=setInterval(function(){
						var scrol=document.body.scrollTop||document.documentElement.scrollTop;
						scrol-=50;
						
						if(document.body.scrollTop){
							document.body.scrollTop=scrol;
						}else{
							document.documentElement.scrollTop=scrol;
						}
						if(scrol<0){
							clearInterval(timerd);
							return;
						}
					},1)
				}
			
			
///--------------------------------监听-----------------------------------			
			var t=document.getElementById("jianti");
			pp=t.getElementsByTagName("p");
			console.log(pp)
			p11=document.getElementById("p1");
			p22=document.getElementById("p2")
			p33=document.getElementById("p3")
			p11.onclick=function(){
				jiant(0)
				for(var j=0;j<3;j++){
				qu(j)
				}
				jia1(p11)
			}
				
			p22.onclick=function(){
				jiant(805)
					for(var j=0;j<3;j++){
					qu(j)
					}
					jia1(p22)
			}
			p33.onclick=function(){
				jiant(1328)
				
					for(var j=0;j<3;j++){
					qu(j)
					}
					jia1(p33)
					
			}
			
			function qu(n){
				pp[n].style.color="#FF6700";
				pp[n].style.backgroundColor="transparent";
			}
			function jia1(n){
				n.style.color="#fff";
				n.style.backgroundColor="#FF6700";
			}
			function jiant(a){
					var timere=setInterval(function(){
						var scrol=document.body.scrollTop||document.documentElement.scrollTop;
						if(scrol>a){
							scrol-=10;
						}
						if(scrol<a){
							scrol+=10;
						}
						
						if(document.body.scrollTop){
							document.body.scrollTop=scrol;
						}else{
							document.documentElement.scrollTop=scrol;
						}
						if(scrol<=a+10&&scrol>=a-10){
							clearInterval(timere);
							return;
						}
					},1)
				}
			timerf=setInterval(function(){
				var scrol=document.body.scrollTop||document.documentElement.scrollTop;
				if(scrol<=500&&scrol>=0){
					for(var j=0;j<3;j++){
					qu(j)
					}
					jia1(p11)
				}
				if(scrol<=1100&&scrol>=500){
					for(var j=0;j<3;j++){
					qu(j)
					}
					jia1(p22)
				}
				if(scrol<=2000&&scrol>=1180){
					for(var j=0;j<3;j++){
					qu(j)
					}
					jia1(p33)
				}
				if(scrol<=100){
					t.style.display="none"
				}else{
					t.style.display="block"
				}
			},1)
			
			
			
	//=----------------------------监听ok-------------------------------		
				
				
				
				
		// -------------------------------------开始的导航-----------------------------------------		
				var taba=document.getElementsByClassName("er_yi")[0];
				var lis=taba.getElementsByTagName("li")
				console.log(lis)
				var kuaik=document.getElementsByClassName("kuai");
				var er=document.getElementById("er_er2")
				var timer1;
				var dd;
				console.log(kuaik)
				for(var i=0;i<kuaik.length;i++){
					lis[i].index=i
					lis[i].onmouseover=function(){
						la(er,140)
						kuaik[this.index].style.display="block"
						dd=this.index
					}
					lis[i].onmouseout=function(){
						la(er,-66)
						kuaik[this.index].style.display="none"
					}
					er.onmouseover=function(){
						la(er,140)
						kuaik[dd].style.display="block"
					}
					er.onmouseout=function(){
						la(er,-66)
						kuaik[dd].style.display="none"
					}
					
					
				}
				
				function la(obj,target){
					clearInterval(obj.timer);
					obj.timer=setInterval(function(){
					var cur=parseInt(getStyle(obj,"top"));
					var speed=(target-cur)/8;
					speed=speed>0?Math.ceil(speed):Math.floor(speed);
						if(cur==target){
							clearInterval(obj.timer)
						}else{
							obj.style.top=cur+speed+"px";
						}
					},10)
				}
				
			
			
			
			
			//lunbo
			var lun=document.getElementsByClassName("lun");
			for(var i=0;i<lun.length;i++){
				console.log(i)
				lun[i].onmouseover=function(){
					touming(this,"opacity",50,10)
				}
				lun[i].onmouseout=function(){
					touming(this,"opacity",100,10)
				}
			}
			
			function touming(obj,attr,target,speed){
					//清除定时器
					clearInterval(obj.timer);
					//定时器
					obj.timer=setInterval(function(){
						var cur;
						//判断传入的属性是透明度还是其他的   因为透明度没单位
						if(attr=="opacity"){
							cur=getStyle(obj,"opacity")*100; 
						}else{
							cur=parseInt(getStyle(obj,attr)); // 其他的   如width 、height/left
						}
						
						//得到并设置速度
						
						var speed=(target-cur)/10;
						speed=speed>0?Math.ceil(speed):Math.floor(speed);
						
						
						//达到目标值清除定时器
						if(cur==target){
							clearInterval(obj.timer);
						}else{
							//如果透明度   分火狐和ie
							if(attr=="opacity"){
								obj.style.opacity=(cur+speed)/100;
								obj.style.filter="alpha(opacity="+(cur+speed)+")"
							}else{// 如果是其他   如width、height
								obj.style.height=cur+speed+"px";
							}
						}
					},10)
				}
			
			

				



var gouwu=document.getElementsByClassName("g")[0];
var gou=document.getElementsByClassName("gou")[0];
	gou.onmouseover=function(){
		la(gouwu,0)
	}
	gou.onmouseout=function(){
		la(gouwu,-140)
	}





var div=document.getElementsByClassName("div");
var a=div[0].getElementsByClassName("td1")[0];
var b=div[0].getElementsByClassName("td2")[0];
var spa=div[0].getElementsByTagName("span");
console.log(spa)
var ssk=document.getElementById("sskx");
	a.onfocus=function(){
		a.style.borderColor="#FF6700"
		b.style.borderColor="#FF6700"
		ssk.style.display="block"
		spa[0].style.display="none"
		spa[1].style.display="none"
	}
	a.onblur=function(){
		a.style.borderColor="#bbb"
		b.style.borderColor="#bbb"
		ssk.style.display="none"
		spa[0].style.display=""
		spa[1].style.display=""
	}

























}

		function getStyle(obj,attr){
			if(obj.currentStyle){
				return obj.currentStyle[attr];
			}else{
				return getComputedStyle(obj,false)[attr];
			}
		}
