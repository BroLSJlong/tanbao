window.onload=function(){
	var pao=document.getElementsByClassName("zuoa")[0];
	var zi=document.getElementsByClassName("zi")[0];
				touming(pao,"opacity",100,10,100)
				la(zi,0)
	var deng=document.getElementById("denglu");
	var sao=document.getElementById("saoma");
	var yi=document.getElementById("you1");
	var er=document.getElementById("you2");
	deng.onclick=function(){
		touming(yi,"opacity",100,10,20);
		touming(er,"opacity",0,10,20)
		deng.style.color="#FF6700"
		sao.style.color="#676767"
	}
	sao.onclick=function(){
		touming(yi,"opacity",0,10,20);
		touming(er,"opacity",100,10,20)
		sao.style.color="#FF6700"
		deng.style.color="#676767"
	}
	
	
	//透明度
	function touming(obj,attr,target,speed,shi){
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
					},shi)
				}
	//yidong
	function la(obj,target){
//					clearInterval(obj.timer);
					obj.timer=setInterval(function(){
					var cur=parseInt(getStyle(obj,"top"));
					var speed=(target-cur)/8;
					speed=speed>0?Math.ceil(speed):Math.floor(speed);
						if(cur==target){
							clearInterval(obj.timer)
						}else{
							obj.style.top=cur+speed+"px";
						}
					},80)
					
				}
	
	//通用
	function getStyle(obj,attr){
			if(obj.currentStyle){
				return obj.currentStyle[attr];
			}else{
				return getComputedStyle(obj,false)[attr];
			}
		}
	
	
				//获取登录页的用户名和密码的value值
				var userName=document.getElementById("inp1");
				var passWord=document.getElementById("inp2");
				var denglu=document.getElementById("deng");
				
				var arr=document.cookie.split(";");
				var arr1=arr[0].split("=");  
				var arr2=arr[1].split("=");
				console.log(arr2[1])
				
				
				//用登录页的登录名和密码  与 cookie中的进行比较
				
			
			
			
			
			
			
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
		