<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>Au Register Forms by Colorlib</title>

<!-- Icons font CSS-->
<link href="vendor1/mdi-font/css1/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="vendor1/font-awesome-4.7/css1/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css1?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="vendor1/select2/select2.min.css" rel="stylesheet"
	media="all">
<link href="vendor1/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">

<!-- Main CSS-->
<link href="css1/main.css" rel="stylesheet" media="all">
</head>

<body>

	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">會員資料/修改</h2>
					<form:form action="${contextRoot}/querySubmit" method="post"
						modelAttribute="queryForm" id="form">
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">姓名</label>
									<form:input path="customerName" class="input--style-4"
										type="text" />
								</div>
							</div>
							<div class="col-2">

								<div class="input-group">
									<label class="label">密碼</label>
									<form:input path="pwd" class="input--style-4" type="password" />
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">生日</label>
									<div class="input-group-icon">
										<form:input path="birthday"
											class="input--style-4 js-datepicker" type="text"
											autocomplete="off" />
										<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Email</label>
									<form:input path="email"  type="email"  readonly="true"/>
								
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">電話</label>
									<form:input path="phone" class="input--style-4" type="text" />
								</div>
							</div>
						</div>
        				 
						<div style="margin">地址&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp鄉鎮市區&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp郵遞區號
						</div>
						
						<label class="label"></label>

						<div id="twzipcode" class="row col-12">


							
								<!-- 地址  -->
							
								<div class="input-group">
								<div data-role="county" data-style="form-control" class="input--style-4"></div>
								<input type="hidden" id="city" name="street" value="">
								</div>
								
								<!-- 鄉鎮 -->
								<div class="input-group">
									<div data-role="district" data-style="form-control" class="input--style-4"></div>
									<input type="hidden" id="township" name="street" value="">
								</div>
								
								<!-- 郵遞區號 -->
								<div class="input-group">
									<div data-role="zipcode" data-style="form-control" class="input--style-4"></div>
									<input type="hidden" id="postalCode" name="street" value="">
								</div>
						</div>
					
							<div class="input-group">
								<label class="label"></label>
								<form:input path="street" class="input--style-4" type="text" 
								placeholder="請輸入詳細地址"   value=""/>
								<form:hidden path="CustomerId" />	
							</div>
						
						<div class="p-t-15">
							<button class="btn btn--radius-2 btn--blue" type="submit">送出</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="vendor1/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="vendor1/select2/select2.min.js"></script>
	<script src="vendor1/datepicker/moment.min.js"></script>
	<script src="vendor1/datepicker/daterangepicker.js"></script>
	<!-- 密碼--------------------------------------------- -->

	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<!-- Main JS-->

	<!-- add--------------------------------------------- -->

	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

	<script src="js1/global.js"></script>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->