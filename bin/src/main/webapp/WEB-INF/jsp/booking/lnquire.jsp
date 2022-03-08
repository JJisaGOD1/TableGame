<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>訂位查詢</title>
</head>
<body>
 <div align="center">
<h2>訂位/更改/刪除-查詢</h2>

<tr style="background-color:a8fefa">
<section class="container">
        <div class="row">

<c:forEach items="${lnquire}" var="lnquires" >
<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">

<div class="caption">
<p>訂位資料</p>

<p>人數:${lnquires.several} </p>
<p>訂位日期:<fmt:formatDate pattern="yyyy-MM-dd EEEE" value="${lnquires.reservation_date}"/></p>
 <p>時段:${lnquires.period}</p>
 <p>桌號:${lnquires.number} </p>
<p>備註:${lnquires.remark}</p>
 
<p><a href="${contextRoot}/lnquires?id=${lnquires.orderId}"><input type="button" value="修改"> </a>	|  
				 
			<a onclick="return confirm('確認刪除')" href="${contextRoot}/deletbooking?id=${lnquires.orderId}"><input type="button" value="刪除"></a>
	
</p>

  </div>
                </div>
            </div>
   </c:forEach>
   </div>
   </section>
 
 


</div>
</body>
</html>