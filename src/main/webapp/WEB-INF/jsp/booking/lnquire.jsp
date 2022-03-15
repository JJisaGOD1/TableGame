<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>
<<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script> 


<style>
body{
background-image:url(BookingPhoto/body.jpg);

background-size: 100%;
}


</style>


<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>訂位查詢</title>
</head>
<body>

<!-- 各自的navbar -->
<div class="navbar-wrap">
<nav class="navbar-meals">
<img alt="" src="${contextRoot}/uploaded/food-menu-solid-24.png">

<a href="addNew" class="navbarlogo"><button style="background-color: white;"><i class='bx bxs-food-menu bx-lg' style="display: flex; justify-content: center; color: black;"></i>立即訂位</button></a>


<a href="lnquire" class="navbarlogo"><button style="background-color: white;"><i class='bx bx-list-ul bx-lg' style="display: flex; justify-content: center; color: black;"></i>訂位查詢</button></a>


</nav>
</div>
<!-- 各自的navbar(end) -->

 <div id="allpage" align="center">
<h2>訂位/更改/刪除-查詢</h2>

<a href="<c:url value='addBooking' />">回前頁</a>

<tr style="background-color:a8fefa">

<hr style="height:1px ;border: none;color:#333;background-color:#333">

<section class="container">
        <div class="row">

<c:forEach items="${lnquire}" var="lnquires" >
<div class="col-sm-6 col-md-4" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 280px; height: 280px; background-color:#B3D9D9;">

<div class="caption">

<p>訂位資料</p>

<p>人數:${lnquires.several} </p>
<p>訂位日期:<fmt:formatDate pattern="yyyy-MM-dd EEEE" value="${lnquires.reservation_date}"/></p>
 <p>時段:${lnquires.period}</p>
 <p>桌號:${lnquires.number} </p>
<p>備註:${lnquires.remark}</p>

<p><a href="${contextRoot}/lnquires?id=${lnquires.orderId}"><input type="button" ><i class='bx bxs-edit-alt bx-tada bx-rotate-90 bx-lg' ></i> </a>	|  
				 
			<a onclick="return confirm('確認刪除')" href="${contextRoot}/deletbookings?id=${lnquires.orderId}"><input type="button" ><i class='bx bx-trash bx-lg'></i></a>
			
			
</p>

  </div>
                </div>
            </div>
   </c:forEach>
   </div>
   </section>
 
 


</div>
<script>






</script>
</body>
</html>