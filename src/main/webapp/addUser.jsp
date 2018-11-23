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
<script type="text/javascript">
		function i1(){
			  var na=$("#na").val();
			  var nat=$("#nat").html();
			  if(na.length>5){
				 
				  $("#nat").html("");
				  return true;
			  }else{
				  $("#na").html("");
				  $("#nat").html("用户名要求不低于6个字符");
				  return false;
			  }
		}
		
		function i2(){
			  var pa=$("#pa").val();
			  var pat=$("#pat").html();
			  if(pa.length>5){
				 
				  $("#pat").html("");
				  return true;
			  }else{
				  $("#pa").html("");
				  $("#pat").html("密码要求不低于6个字符");
				  return false;
			  }
		}
		
		function i3(){
			  var hao=$("#hao").val();
			  var haot=$("#haot").html();
			  if(hao.length!=0){
				 
				  $("#haot").html("");
				  return true;
			  }else{
				  $("#hao").html("");
				  $("#haot").html("身份证号必填");
				  return false;
			  }
		}
		
		function i4(){
			  var tel=$("#tel").val();
			  var telt=$("#telt").html();
			  if(tel.length!=0){
				 
				  $("#telt").html("");
				  return true;
			  }else{
				  $("#tel").html("");
				  $("#telt").html("电话号码必填");
				  return false;
			  }
		}
		
		function i5(){
			  var add=$("#add").val();
			  var addt=$("#addt").html();
			  if(add.length!=0){
				 
				  $("#addt").html("");
				  return true;
			  }else{
				  $("#add").html("");
				  $("#addt").html("住址必填");
				  return false;
			  }
		}
		
		function i6(){
			  var eq=$("#eq").val();
			  var eqt=$("#eqt").html();
			  if(eq.length!=0){
				 
				  $("#eqt").html("");
				  return true;
			  }else{
				  $("#eq").html("");
				  $("#eqt").html("邮箱必填");
				  return false;
			  }
		}
		
		function i7(){
			  var yzm=$("#yzm").val();
			  var eqyzm=$("#eqyzm").html();
			  if(yzm.length!=0){
				 
				  $("#eqyzm").html("");
				  return true;
			  }else{
				  $("#yzm").html("");
				  $("#eqyzm").html("验证码必填");
				  return false;
			  }
		}
		

		  var ccform=function(){
			  if(i1()){
			      if(i2()){
                      if(i3()){
                          if(i4()){
                              if(i5()){
                                  if(i6()){
                                      if(i7()){
                                          return true;
                                      }
                                  }
                              }
                          }
                      }
                  }

			  }else{
				  alert("请仔细填写所有信息");
				  return false;
			  }
		  }


		function test(){
			  $("#imgVcode").prop("src","${pageContext.request.contextPath }/getKaptcha.action?a="+Math.random());
		}
</script>
</head>

<body>
<div class="wrap">
  <!-- main begin-->
      <div class="zclf login logns">
        <h1  class="blue">用户注册</h1>
        <form name="ctl00" method="post" action="${pageContext.request.contextPath }/insertUser.action" onsubmit="return ccform()">
          <dl>
            <dd>
              <label> <small>*</small>用户名</label>
              <input type="text" id="na" class="inputh lf" name="user_name" onblur="i1()"/>
              <input type="hidden" id="n" class="inputh lf" name="user_id" value="1" onblur="i1()"/>
             <div class="lf red laba"><p id="nat" style="color: red"></p></div>
            </dd>
            <dd>
              <label> <small>*</small>密码</label>
              <input type="text" class="inputh lf" id="pa" name="user_password" onblur="i2()"/>
              <div class="lf red laba"><p id="pat" style="color: red"></p></div>
            </dd>
            <dd>
              <label> <small>*</small>身份证号</label>
              <input type="text" class="inputh lf"  id="hao" name="user_card_no" onblur="i3()"/>
              <div class="lf red laba"><p id="haot" style="color: red"></p></div>
            </dd>
            <dd>
              <label> <small>*</small>电话</label>
              <input type="text" class="inputh lf" id="tel" name="user_tel" onblur="i4()"/>
              <div class="lf red laba"><p id="telt" style="color: red"></p></div>
            </dd>
            <dd>
              <label> <small>*</small>住址</label>
              <input type="text" class="inputh lf" id="add" name="user_address" onblur="i5()"/>
              <div class="lf red laba"><p id="addt" style="color: red"></p></div>
            </dd>
            <dd>
              <label> <small>*</small>邮政编码</label>
              <input type="number" class="inputh lf" id="eq" name="user_post_number" onblur="i6()"/>
              <div class="lf red laba"><p id="eqt" style="color: red"></p></div>
            </dd>
            <dd class="hegas">
              <label> <small>*</small>验证码</label>
              <input type="text" class="inputh inputs lf" id="yzm"  name="yzm" onblur="i7()"/>
               <span class="wordp lf"><img  id="imgVcode" src="getKaptcha.action" width="96" height="27" alt="" /></span>
               <span class="blues lf"><a href="javascript:void(0)" onclick="test()">看不清</a></span>
               <div class="lf red laba"><p id="eqyzm" style="color: red"></p></div>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
               <input name=""  type="checkbox" id="rem_u"   />
              <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
              <input name="" type="submit" value="立即注册" class="spbg buttombg buttombgs f14 lf" />
            </dd>
          </dl>
          </form>
    </div>
<!-- main end-->
<!-- footer begin-->

</div>
 <!--footer end-->
 
</div>
</body>
</html>
