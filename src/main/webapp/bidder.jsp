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
function checkPrice(){
	var price = $("#sale").val();
	
	//获取到最高出价
	var maxPrice=$(".price").html();
	//alert(maxPrice);
	if(parseInt(price)&lt;=parseInt(maxPrice)||price !=null||price !=''){
		$("#errMessage").html("不能低于最高竞拍价");
		return false;					
	}else{
		$("#errMessage").html("价钱可以");
		return true;
	}
}

function sub(){
	/* if(checkPrice()){
		return true;
	}else{
		return false;
	} */
	
	return checkPrice();
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
  <div class="items sg-font lf">
      <ul class="rows">
        <li>名称：</li>
        <li class="borderno">${requestScope.auction.auction_name}</li>
      </ul>
      <ul class="rows">
        <li>描述：</li>
        <li class="borderno">${requestScope.auction.auction_desc}</li>
      </ul>
      <ul class="rows">
        <li>开始时间：</li>
        <li class="borderno"><fmt:formatDate value="${requestScope.auction.auction_start_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
      </ul>
      <ul class="rows">
        <li>结束时间：</li>
        <li class="borderno"><fmt:formatDate value="${requestScope.auction.auction_end_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
      </ul>
      <ul class="rows border-no">
        <li>起拍价：</li>
        <li class="borderno">${requestScope.auction.auction_start_price}</li>
      </ul>
  </div>
  <div class="rg borders"><img src="photo/${requestScope.auction.auction_pic}" width="270" height="185" alt="" /></div>
  <div class="cl"></div>
  <div class="top10 salebd">
       <p>
       <label for="sale">出价：</label>
       <form method="post" action="${pageContext.request.contextPath }/reg.action" method="post" onsubmit="return sub()">
       <input type="number"  class="inputwd" name="auction_price" id="sale" onblur="checkPrice()" value=""/>
       <input type="hidden"  class="inputwd"   name="auction_id" value="${requestScope.auction.auction_id}"/>
      <input name="" type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom" />
       </form>
       </p>
       <p id="errMessage" class="f14 red"></p>
  </div>
  <div class="top10">
     <a href="">
     <input name="${pageContext.request.contextPath }/showw.action?id=${requestScope.auction.auction_id}" type="submit" value="刷 新" class="spbg buttombg f14" /></a>
    <a href="${pageContext.request.contextPath }/selectall.action?auction=null"><input name="" type="submit" value="返回列表" class="spbg buttombg f14" /></a>
  </div>
  <div class="offer">
    <h3>出价记录</h3>
    <div class="items sg-font">
      <ul class="rows even strong">
        <li>竞拍时间</li>
        <li>竞拍价格</li>
        <li class="borderno">竞拍人</li>
      </ul>
      <c:forEach items="${requestScope.list}" var="b">
      <ul class="rows">
        <li><fmt:formatDate value="${b.auction_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
        <li class="price">${b.auction_price}</li>
        <c:forEach items="${b.userList}" var="a">
       	 <li class="borderno">${a.user_name}</li>
        </c:forEach>
      </ul>
     
      </c:forEach>
    
  </div>
  </div>
  
<!-- main end-->
</div>
</body>
</html>
