<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../../layout/dashboard.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工資料</title>

<style>
.myButton {
	box-shadow: 0px 0px 0px 2px #9fb4f2;
	background: linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color: #7892c2;
	border-radius: 10px;
	border: 1px solid #4e6096;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 19px;
	padding: 12px 37px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #283966;
}

.myButton:hover {
	background: linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color: #476e9e;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.Img1 {
	color: blure;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	width: 50px;
}

.Img1:hover {
	opacity: 1.0;
	filter: alpha(opacity = 100);
	width: 50px;
}
</style>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<body  style="background-color: #E3E6E6">
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header">新增餐點</div>
					<div class="card-body">

						<form:form class="form" action="${contextRoot}/addFood"
							modelAttribute="newFood" method="post">

							<p>
								輸入餐點名稱 :
								<form:input type="text" path="foodName" name="food_name" class="form-control" />
							<p>
								輸入價格 :
								<form:input type="text" path="foodPrice" name="food_price" class="form-control" />
							<p>
								輸入餐點類型 : 
<%-- 								<form:input type="text" path="foodType" name="food_type" class="form-control" /> --%>
								<form:select path="foodType" class="form-select" aria-label="Default select example">
									<option>請選擇餐點類型</option>
									<option>吐司類</option>
									<option>麵類</option>
									<option>經典炸物</option>
									<option>鬆餅類</option>
									<option>飲品</option>
									<option>研磨咖啡</option>
								</form:select>
							<p>
								輸入餐點圖片 :
								<form:input type="file" path="foodImage" name="foodImage" class="form-control" />
							<p>
								輸入狀態 : 
								<form:select path="foodState" class="form-select" aria-label="Default select example">
									<option>請選擇餐狀態</option>
									<option>供應中</option>
									<option>未供應</option>
								</form:select>
							<p>
							
								<input type="submit" name="submit" id="btnSubmit" class="btn btn-secondary btn-sm" />
						</form:form>
<%-- 						<form action="upload" method="post" enctype="multipart/form-data"> --%>
<!-- 								選擇圖片:<input type="file" path="foodImage" name="foodImage" accept="image/*" class="form-control" /> <br>  -->
<!-- 								<input type="submit" name="submit" id="btnSubmit" class="btn btn-secondary btn-sm" /> -->
<%-- 							</form> --%>
						
						
									
						
						
					</div>
				</div>
			</div>


		</div>
	</div>
	



</body>
</html>