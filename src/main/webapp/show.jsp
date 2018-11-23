<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatDate value="${b.auction_end_time}" pattern="yyyy-MM-dd hh:mm:ss" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.11.1.js"></script>
 <script>
   function abc(id){
	   
	   if(confirm("你真的确认要删除吗？请确认")){
	    
		   window.location="${pageContext.request.contextPath }/selectonee.action?id="+id;
		 }
			 
	   };
	   function dele(id){
		   if(confirm("你真的确认要修改吗？请确认")){
			   window.location="${pageContext.request.contextPath }/deletee.action?id="+id;
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
  <div class="forms">
  <form action="${pageContext.request.contextPath }/selectall.action" method="post">
    <%--@declare id="name"--%><%--@declare id="price"--%><label for="name">名称</label>
    <input name="auction_name" type="text" class="nwinput" value="${auction.auction_name}"/>
    <label for="names">描述</label>
    <input name="auction_desc" type="text" id="names" class="auction_desc" value="${auction.auction_desc}"/>
    <label for="time">开始时间</label>
    <input name="auction_start_time" type="text" id="time" class="nwinput" value="<fmt:formatDate value="${auction.auction_start_time}" pattern="yyyy-MM-dd hh:mm:ss" />"/>
    <label for="end-time">结束时间</label>
    <input name="auction_end_time" type="text" id="end-time" class="nwinput"  value="<fmt:formatDate value="${auction.auction_end_time}" pattern="yyyy-MM-dd hh:mm:ss" />"/>
    <label for="price">起拍价</label>
    <input name="auction_start_price" type="text"  class="nwinput" value="${auction.auction_start_price}"/>
    <input name="" type="submit"  value="查询" class="spbg buttombg f14  sale-buttom"/>
    </form>
   <c:if test="${sessionScope.user.user_is_admin==1}">
   <a href="${pageContext.request.contextPath }/insertAuction.jsp"> <input type="button"  value="发布" class="spbg buttombg f14  sale-buttom buttomb"/></a>
	</c:if>
  </div>
  <div class="items">
  
      <ul class="rows even strong">
        <li>名称</li>
        <li class="list-wd">描述</li>
        <li>开始时间</li>
        <li>结束时间</li>
        <li>起拍价</li>
        <li class="borderno">操作</li>
      </ul>
      <c:forEach items="${requestScope.list}" var="b">
      <ul class="rows">
        <li><a href="" title="">
        ${b.auction_name}</a></li>
        <li class="list-wd">${b.auction_desc}</li>
        <li><fmt:formatDate value="${b.auction_start_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
        <li><fmt:formatDate value="${b.auction_end_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
        <li>${b.auction_start_price}</li>
        <li class="borderno red">
     
      <c:if test="${sessionScope.user.user_is_admin==0}">
           <a href="${pageContext.request.contextPath }/showw.action?id=${b.auction_id}">竞拍</a>
      </c:if>
      <c:if test="${sessionScope.user.user_is_admin==1}">
		   <a href="javascript:void(0)" title="修改" onclick="abc(${b.auction_id})">修改</a>|
          <a href="javascript:void(0)" title="删除" onclick="dele(${b.auction_id})">删除</a>
        </c:if>	
        </li>
      </ul>
      </c:forEach>
      <div class="page">
        <a href="#" title="">首页</a>
        <a href="${pageContext.request.contextPath }/selectall.action?pa=${requestScope.pa-1}" title="">上一页</a>
        <%--<span class="red">前5页</span>
        <a href="#" title="">1</a>
        <a href="#" title="">2</a>
        <a href="#" title="">3</a>
        <a href="#" title="">4</a>
        <a href="#" title="">5</a> --%>
          <c:if test="${requestScope.page.pages>requestScope.page.pageNum}">
        <a href="${pageContext.request.contextPath }/selectall.action?pa=${requestScope.pa+1}" title="">下一页</a>
          </c:if>

              <a href="#" title="">尾页</a>
      </div>
  </div>
  <script>
   function abc(id){
	   
	   if(confirm("你真的确认要删除吗？请确认")){
	    
		   window.location="${pageContext.request.contextPath }/selectonee.action?id="+id;
		 }
		 else{
			 return false;
			 }
			 
	   };
	   function dele(id){
		   if(confirm("你真的确认要修改吗？请确认")){
			   window.location="${pageContext.request.contextPath }/deletee.action?id="+id;
			   }
			   else{
				   return false;
				   }
		   }
  </script>
<!-- main end-->
</div>
</body>
</html>
