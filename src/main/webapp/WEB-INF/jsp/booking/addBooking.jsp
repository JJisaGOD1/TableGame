<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

    <jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>





body {
 	background-image: url(BookingPhoto/body.jpg); 
 	background-repeat: no-repeat; 
	background-size: 100%; 
}

.button {
	border-radius: 12px;
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}

.button:hover {
	background-color:#FF8000;
}
p{
font-size:20px
}

</style>
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


<div class="container" style="margin-top:2vw">

<h1 style="font-weight:bold;text-align:left;padding:10px">店家資訊</h1>

<div class="google-maps" style="float:left; margin-right:10px;margin-top:1vw;">
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.801582001427!2d121.55230431400287!3d25.040806844174732!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abc67380fc9f%3A0xf5c6d17f3e9cb1f5!2zMTA25Y-w5YyX5biC5aSn5a6J5Yy65bu25ZCJ6KGXMTEw6JmfQjE!5e0!3m2!1szh-TW!2stw!4v1647421287279!5m2!1szh-TW!2stw" width="500" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

</div>

</p>
<div style="background-color:white;">
<p><i class='bx bxs-location-plus'></i> 位置</p><hr>
<p>台北市大安區延吉街110號B1</p><hr>
<p><i class='bx bx-phone'></i> 聯絡電話</p><hr>
<p>02-27119570</p><hr>
<p><i class='bx bx-time-five'></i> 營業時間</p><hr>
<p>09:00-21:00</p><hr>

</div>
</p>



<div class="row justify-content-center">
<a href="addNew"><input type="button" class="button ad" name="booking" value="立即訂位" style="width:500px;height:50px"/></a>


</div>
</p>

</div>
<script>





</script>



                  
</body>
</html>