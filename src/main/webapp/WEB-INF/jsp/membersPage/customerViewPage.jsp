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

<style>
	.card{
		margin: 20rem auto;
	}
</style>

<style>
.background66{
height:100vh;
background-size:100% 100%;
}
</style>


</head>
<body>
<div class="container-login100 background66"
			style="background-image: url('images/bg-01.jpg');">
<h1>OK</h1>
<div class="container">
    <p/>
    <div class="row justify-content-center">
       <div class="col-6">
		<div class="card">
			<div class="card-header">基本資料</div>
			<div class="card-body">
				<form:form class="form" modelAttribute="customer"> 
				
				<form:hidden path="id"/>
				
				<form:label path="" class="card-header" style="display:block;">姓名</form:label>
				<form:input type="text" path="cusName" class="form-control" placeholder="Name" readonly="true" style="background-color: transparent;"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">Email</form:label>
				<form:input type="email" path="email" class="form-control" placeholder="email" autocomplete="true" readonly="true" style="background-color: transparent;"/>
				<p></p>
				
				<form:hidden path="pwd"/>
				
				<form:label path="" class="card-header" style="display:block;">電話</form:label>
				<form:input path="phone" class="form-control" placeholder="Phone" readonly="true" style="background-color: transparent;"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">地址</form:label>
				<form:input path="address" class="form-control" placeholder="Address" readonly="true" style="background-color: transparent;"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">生日</form:label>
				<form:input type="date" path="birthday" class="form-control" readonly="true" style="background-color: transparent;"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">創建時間</form:label>
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${customer.createdTime }"/>
<%-- 				<form:input type="text" path="createdTime" class="form-control" readonly="true"/> --%>
				<p></p>
				
				<form:hidden path="RatingsBean"/>

				</form:form>
			</div>
		</div>
     </div>
	</div>
	</div>
	</div>
</body>
</html>