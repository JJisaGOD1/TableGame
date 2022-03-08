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
<title>Insert Manage</title>
</head>
<body>
<h1>Insert Manager</h1>
<div class="container">
    <p/>
    <div class="row justify-content-center">
       <div class="col-6">
		<div class="card">
			<div class="card-header">請輸入員工</div>
			<div class="card-body">
				<form:form class="form"  action="${contextRoot}/addManager"  modelAttribute="addManager" method="POST"> 
				
				<form:label path="" class="card-header" style="display:block;">姓名</form:label>
				<form:input type="text" path="cusName" class="form-control" placeholder="Name"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">Email</form:label>
				<form:input type="email" path="email" class="form-control" placeholder="email" autocomplete="true"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">密碼</form:label>
				<form:input type="password" path="pwd" class="form-control" placeholder="Password"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">電話</form:label>
				<form:input path="phone" class="form-control" placeholder="Phone"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">地址</form:label>
				<form:input path="address" class="form-control" placeholder="Address"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">生日</form:label>
				<form:input type="date" path="birthday" class="form-control"/>
				<p></p>
				
				<form:label path="" class="card-header" style="display:block;">員工等級</form:label>
				<form:select path="RatingsBean" class="form-control" >
						<form:options items="${ratingMap}" />
				</form:select>
				<p></p>			
				
				<input type="submit" name="submit"/>
				</form:form>
			</div>
		</div>
     </div>
	</div>
	</div>
</body>
</html>