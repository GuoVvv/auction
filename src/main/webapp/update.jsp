<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			  if(na.toString()!=""){
				 
				  $("#nat").html("");
				  return true;
			  }else{
				  $("#na").html("");
				  $("#nat").html("");
				  return false;
			  }
		}
		
		function i2(){
			  var pa=$("#pa").val();
			  var pat=$("#pat").html();
			  if(pa.toString()!=""){
				 
				  $("#pat").html("");
				  return true;
			  }else{
				  $("#pa").html("");
				  $("#pat").html("必须为数字");
				  return false;
			  }
		}
		
		function i3(){
			  var hao=$("#hao").val();
			  var haot=$("#haot").html();
			  if(hao.toString()!=""){
				 
				  $("#haot").html("");
				  return true;
			  }else{
				  $("#hao").html("");
				  $("#haot").html("必须为数字");
				  return false;
			  }
		}
		
		function i4(){
			  var tel=$("#tel").val();
			  var telt=$("#telt").html();
			  if(tel.length>4){
				 
				  $("#telt").html("");	
				  return true;
			  }else{
				  $("#tel").html("");
				  $("#telt").html("格式：2011-05-05 12:30:00");
				  return false;
			  }
		}
		
		function i5(){
			  var add=$("#add").val();
			  var addt=$("#addt").html();
			  if(add.length>4){
				 
				  $("#addt").html("");
				  return true;
			  }else{
				  $("#add").html("");
				  $("#addt").html("格式：2011-05-05 12:30:00");
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
				  $("#eqt").html("描述");
				  return false;
			  }
		}
		
		var ccform=function(){
			  if(i1()&amp;&amp;i2()&amp;&amp;i3()&amp;&amp;i4()&amp;&amp;i5()&amp;&amp;i6()){
				  return true;
			  }else{
				  alert("请认真填写");
				  return false;
			  }
		  }


		$(function(){
			// 文件上传(文件域)的改变事件
			$(':file').change(function(event) {
				//  HTML5 js 对象的获取
					var files = event.target.files, file;  
				if(files &amp;&amp; files.length > 0){
					// 获取目前上传的文件
				 		file = files[0];
				 		// 文件的限定类型什么的道理是一样的
				 		if(file.size > 1024 * 1024 * 2) {
		   			 	alert('图片大小不能超过 2MB!');
		    			return false;
						}
						// file对象生成可用的图片
						var URL = window.URL || window.webkitURL;
						// 通过 file 生成目标 url
						var imgURL = URL.createObjectURL(file);
						// 用这个 URL 产生一个 <img> 将其显示出来
						$("img").prop('src', imgURL);
				}
			});
		});
		
</script>

</head>

<body>
<div class="wrap">
  <!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="${pageContext.request.contextPath }/removeUser.action" title="注销">注销</a></div>
  </div>
      <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
         <form name="ctl00" method="post" action="${pageContext.request.contextPath }/updatee.action" onsubmit="return ccform()" enctype="multipart/form-data">
          <dl>
            <dd >
              <label>名称：</label>
              <input id="na" type="text" class="inputh lf" value="${requestScope.auction.auction_name}" name="auction_name" onblur="i1()"/>
              <input type="hidden" class="inputh lf" value="${requestScope.auction.auction_id}" name="auction_id"/>
              <div class="xzkbg spbg lf" id="nat"></div>
            </dd>
            <dd>
              <label>起拍价：</label>
              <input id="pa" type="number" class="inputh lf" value="${requestScope.auction.auction_start_price}" name="auction_start_price" onblur="i2()" />
              <div id="pat" class="lf red laba"></div>
            </dd>
            <dd>
              <label>底价：</label>
              <input id="hao" type="number" class="inputh lf" value="${requestScope.auction.auction_upset}" name="auction_upset" onblur="i3()"/>
              <div id="haot" class="lf red laba"></div>
            </dd>
            <dd>
              <label>开始时间：</label>
              <input id="tel" onblur="i4()" type="text" class="inputh lf" value="<fmt:formatDate value="${requestScope.auction.auction_start_time}" pattern="yyyy-MM-dd hh:mm:ss" />" name="auction_start_time"/>
              <div id="telt" class="lf red laba"></div>
            </dd>
            <dd>
              <label>结束时间：</label>
              <input id="add" type="text" onblur="i5()" class="inputh lf" value="<fmt:formatDate value="${requestScope.auction.auction_end_time}" pattern="yyyy-MM-dd hh:mm:ss" />" name="auction_end_time"/>
              <div id="addt" class="lf red laba"></div>
            </dd>
            <dd class="dds">
              <label>描述：</label>
              <input type="text" name="auction_desc" id="eq" onblur="i6()" class="textarea" value="${requestScope.auction.auction_desc}">
                <div id="eqt" class="lf red laba"></div>
            </dd>
            <dd>
              <label>修改图片：</label>
              <div class="lf salebd"><a href="#"><img src="E:/Photo/${requestScope.auction.auction_pic}" width="100" height="100" /></a></div>
              <input type="hidden" name="auction_pic" value="${requestScope.auction.auction_pic}"/>
               <input name="myphoto" type="file" class="offset10 lf"/>
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf buttomb" />
             
               <form method="post" action="<s:url namespace="/auct" action="auct_selectAll"/>">
                <input name="" type="button" value="取 消" class="spbg buttombg buttombgs f14 lf buttomb"/>
                </form>
                
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
