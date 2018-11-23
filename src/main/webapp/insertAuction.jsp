<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript">


$(function(){
	// 文件上传(文件域)的改变事件
	$(':file').change(function(event) {
		//  HTML5 js 对象的获取
			var files = event.target.files, file;  
		if(files && files.length > 0){
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





		function i1(){
			  var a=$("#a").val();
			  var a1=$("#a1").html();
			  if(a.length>0){
				 
				  $("#a1").html("");
				  return true;
			  }else{
				  $("#a").html("");
				  $("#a1").html("商品名不为空");
				  return false;
			  }
		}
		
		function i2(){
			  var b=$("#b").val();
			  var b1=$("#b1").html();
			  if(b.length>0){
				 
				  $("#b1").html("");
				  return true;
			  }else{
				  $("#b").html("");
				  $("#b1").html("必须为数字");
				  return false;
			  }
		}
		
		
		function i3(){
			  var c=$("#c").val();
			  var c1=$("#c1").html();
			  if(c.length>0){
				 
				  $("#c1").html("");
				  return true;
			  }else{
				  $("#c").html("");
				  $("#c1").html("必须为数字");
				  return false;
			  }
		}
		
		function i4(){
			  var d=$("#d").val();
			  var d1=$("#d1").html();
			  if(d.length>0){
				 
				  $("#d1").html("");
				  return true;
			  }else{
				  $("#d").html("");
				  $("#d1").html("格式：2010-05-05 12:30:00");
				  return false;
			  }
		}
		
		function i5(){
			  var e=$("#e").val();
			  var e1=$("#e1").html();
			  if(e.length>0){
				 
				  $("#e1").html("");
				  return true;
			  }else{
				  $("#e").html("");
				  $("#e1").html("格式：2010-05-05 12:30:00");
				  return false;
			  }
		}
		
		function i6(){
			  var f=$("#f").val();
			  var f1=$("#f1").html();
			  if(f.length>0){
				 
				  $("#f1").html("");
				  return true;
			  }else{
				  $("#f").html("");
				  $("#f1").html("需要添加一个描述");
				  return false;
			  }
		}
		
		 var ccform=function(){
			  if(i1()&&i2()&&i3()&&i4()&&i5()&&i6()){
				  return true;
			  }else{
				  alert("请仔细填写所有信息");
				  return false;
			  }
		  }
		
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
  <form name="ctl00" method="post" action="${pageContext.request.contextPath }/insertt.action" onsubmit="return ccform()"  enctype="multipart/form-data">
          <dl>
            <dd >
              <label>名称：</label>
              <input id="a" type="text" class="inputh lf" name="auction_name" onblur="i1()"/>
              <div id="a1" class="xzkbg spbg lf"></div>
            </dd>
            <dd>
              <label>起拍价：</label>
              <input id="b" type="number" step="0.01" class="inputh lf" name="auction_start_price" onblur="i2()" />
              <div id="b1" class="lf red laba"></div>
            </dd>
            <dd>
              <label>底价：</label>
              <input id="c" type="number" step="0.01" class="inputh lf" name="auction_upset" onblur="i3()"/>
              <div id="c1" class="lf red laba"></div>
            </dd>
            <dd>
              <label>开始时间：</label>
              <input id="d" type="text" class="inputh lf" name="auction_start_time" onblur="i4()"/>
              <div id="d1" class="lf red laba"></div>
            </dd>
            <dd>
              <label>结束时间：</label>
              <input id="e" type="text" class="inputh lf" name="auction_end_time" onblur="i5()"/>
              <div id="e1" class="lf red laba"></div>
            </dd>
            <dd class="dds">
              <label>拍卖品图片：</label>
               <div class="lf salebd"><a href="#"><img src="/AuctionSSMDamo/images/ad20.jpg" width="100" height="100" /></a></div>
              <input name="myphoto" type="file" class="offset10 lf"/>
             
            </dd>
             <dd class="dds">
              <label>描述：</label>
              <input id="f" type="text" name="auction_desc" cols="" rows="" class="textarea" onblur="i6()"/>
              <div id="f1" class="lf red laba"></div>
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs buttomb f14 lf" />
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
