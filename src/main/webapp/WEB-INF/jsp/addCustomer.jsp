<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/homaPageNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: #dedede;
}

.block1 {
	border: 1px solid;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);

}

.text1 {
	text-align: center;
	font-size: xx-large;
	font-weight: bolder;
}

.row1 {
	display: block;
	border-radius: 10px 10px 0 0;
	font-size: larger;
	font-weight: bolder;
}

.button1 {
	position: relative;
	bottom: 5vh;
	left: 8vw;
}
.background66{
height:100vh;
background-size:100% 100%;
}
</style>
</head>
<body>
	<div class="container-login100 background66"
		style="background-image: url('images/bg-01.jpg');">
		<div class="row justify-content-center"
			style="width: 50vw; margin: 0 auto;">
			<div class="col-8" style="margin-top: 20vh;">
				<div class="card block1" >
					<div class="card-header text1" style="font-size: 3rem">加入會員</div>
					<div class="card-body">
						<form:form class="form" action="${contextRoot}/addCustomer"
							modelAttribute="addCustomer" method="POST"
							style="position: relative;">

							<form:label path="cusName" class="card-header row1"
								style="display:block;">姓名</form:label>
							<form:input type="text" path="cusName" class="form-control"
								placeholder="Name" autocomplete="off" style="font-size: revert" />
							<p></p>

							<form:label path="email" class="card-header row1"
								style="display:block;">Email</form:label>
							<form:input type="email" path="email" class="form-control"
								placeholder="email" autocomplete="off" style="font-size: revert" />
							<p></p>

							<form:label path="pwd" class="card-header row1"
								style="display:block;">密碼</form:label>
							<form:input type="password" path="pwd" class="form-control"
								placeholder="Password" style="font-size: revert" />
							<p></p>

							<form:label path="phone" class="card-header row1"
								style="display:block;">電話</form:label>
							<form:input path="phone" class="form-control" placeholder="Phone"
								autocomplete="off" style="font-size: revert" />
							<p></p>

							<form:label path="address" class="card-header row1"
								style="display:block;">地址</form:label>
							<form:input path="address" class="form-control"
								placeholder="Address" autocomplete="off"
								style="font-size: revert" />
							<p></p>

							<form:label path="birthday" class="card-header row1"
								style="display:block;">生日</form:label>
							<form:input type="date" path="birthday" class="form-control"
								autocomplete="off" style="font-size: revert" />
							<p></p>

							<select name="ratingsBean" style="display: none">
								<option value="3">會員</option>
							</select>
							<p></p>

							<!-- 				<input class= "btn btn-info" type="submit" name="submit" style="font-weight: 900;" /> -->
							<button id="subBtn" class="btn btn-info">送出</button>
						</form:form>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					<p></p>
					
						<button id="button" class="btn btn-danger button1">沉汗典</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
		$('#button').click(function() {
			console.log(123)
			$('#cusName').val('沉汗典');
			$('#email').val('EEIT138255@gmail.com');
			$('#pwd').val('cccccccc');
			$('#phone').val('0910234567');
			$('#address').val('台北市中正路200號');
		//	$('#birthday').val(1990/09/02);
		})
		
		$('#subBtn').click(function () {
							Swal.fire({
								title: '請稍後',
								html: '請稍後',
								showConfirmButton: false,
								didOpen: () => {
									Swal.showLoading()
								}
							})
						})
		
	</script>
</body>
</html>