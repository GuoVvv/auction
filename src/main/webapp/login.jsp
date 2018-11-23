<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.11.1.js"></script>

<script>
	function i1(){
		var na=$("#name").val();
		var password=$("#password").val();
		 if(na.toString()!=""&amp;&amp;password.toString()!=""){
			  return true;
		  }else{
			alert("密码和账号不能为空");
			  return false;
	}
	}
		 function i2(){
			  var code=$("#passwords").val();
		
			  if(code.toString()!=""){
				  return true;
			  }else{
				  $("#passwords").html("");
				alert("请输入验证码");
				  return false;
			  }
		  }
		 
		 var ccform=function(){
			  if(i1()&amp;&amp;i2()){
				  return true;
			  }else{
				  alert("请仔细填写所有信息");
				  return false;
			  }
		  }
		 
		
		  
		  function test(){
			  $("#kaptchaImage").prop("src","${pageContext.request.contextPath }/getKaptcha.action?a="+Math.random());
		  }
</script>
</head>

<body>
<div class="wrap">
<!-- main begin-->
 <div class="main">
   <div class="sidebar">
     <p><img src="${pageContext.request.contextPath }/images/img1.jpg" width="443" height="314" alt="" /></p>
   </div>
   <div class="sidebarg">
     <form method="post" target='_blank' action="${pageContext.request.contextPath }/loginn.action" onsubmit="return ccform()">
    <div class="login">
      <dl>
        <dt class="blues">用户登陆</dt>
        <dd><label for="name">用户名：</label><input type="text" class="inputh" id="name" name="user_name"/></dd>
        <dd><label for="password">密 码：</label><input type="text" class="inputh"  id="password" name="user_password"/></dd>
        <dd>
           <label class="lf" for="passwords">验证码：</label>
           <input type="text" class="inputh inputs lf" id="passwords" name="yzm" onblur="i2()"/>
           <span class="wordp lf"><img id="kaptchaImage" src="getKaptcha.action" width="96" height="27" alt=""/></span>
           <span class="blues lf"><a href="javascript:void(0)" onclick="test()">看不清</a></span>
        </dd>
        <dd>
           <input name=""  type="checkbox" id="rem_u"  />
           <span for="rem_u">下次自动登录</span>
        </dd>
        <dd class="buttom">
           <input  type="submit" value="登 录" class="spbg buttombg f14 lf" />
           <a href="${pageContext.request.contextPath }/addUser.jsp"><input  type="button" value="注 册" class="spbg buttombg f14 lf" /></a>
           <span class="blues  lf"><a href="javascript:void(0)">忘记密码?</a></span>
           <div class="cl"></div>
        </dd>
       
      </dl>
    </div>
    </form>
   </div>
  <div class="cl"></div>
 </div>
<!-- main end-->
 
<!-- footer begin-->
</div>
 <!--footer end-->
 
</div>
</body>
</html>
