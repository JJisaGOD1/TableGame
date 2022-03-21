<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/homaPageNavbar.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<title>登入</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<meta name="google-signin-client_id"
	content="533537045577-jdn4qt2elj0o2g51ufi47igj254rpm7v.apps.googleusercontent.com">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54"
				style="height: 50vh; width: 39vw; position: relative;">
				<form class="login100-form validate-form"
					action="${contextRoot}/login" method="POST"
					style="position: relative; height: 26rem;">
					<div class="mb-3">
						<div class="wrap-input100 validate-input m-b-23"
							data-validate="請輸入帳號">
							<span class="label-input100">帳號</span> <input type="text"
								class="form-control" id="exampleDropdownFormEmail1"
								placeholder="email" name="email" autocomplete="off">
						</div>

						<div class="wrap-input100 validate-input" data-validate="請輸入密碼">
							<span class="label-input100">密碼</span> <input type="password"
								class="form-control" id="exampleDropdownFormPassword1"
								placeholder="Password" name="pwd">
						</div>
						<div class="text-right p-t-8 p-b-31">
							<a href="${contextRoot}/pwd"> 忘記密碼? </a>
						</div>
						<div id="googleInSite" class="g-signin2" data-onsuccess="onSignIn"
							style="display: inline-block; position: absolute; top: 13rem;">
						</div>
						<div class="mb-3"></div>
						<div class="container-login100-form-btn">
							<div class="wrap-login100-form-btn">
								<div class="login100-form-bgbtn"></div>
								<button class="login100-form-btn">登入</button>
							</div>
							<div class="flex-col-c p-t-20">

								<a href="${contextRoot}/addCustomer" class="txt2"> 加入會員 </a>
								
								
							</div>
						</div>

					</div>
				</form>
				<button id="button" class="btn btn-danger button00">管理者</button>
					<button id="button" class="btn btn-success button11">會員1</button>
						<button id="button" class="btn btn-primary button22">會員2</button>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<button id="button" class="btn btn-info button55">沉汗典</button>
						<button id="button" class="btn btn-info button66">青該我</button>
			</div>
		</div>
	</div>

	<script>
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			email = profile.getEmail()
			userName = profile.getName()
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

			emailObject = {
				"loginEmail" : email,
				"userName" : userName
			};
			emailJsonStr = JSON.stringify(emailObject);
			console.log(email)
			$.ajax({
				url : "http://localhost:8080/homepage/ajax/googlelogin",
				data : emailJsonStr,
				method : "POST",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					setTimeout(function() {
						window.location.href = "/homepage/"
					})

				},
			})

		}

		// $("#googleInSite").click(function() {
		// 	emailObject = {
		// 		"loginEmail" : email
		// 	};
		// 	emailJsonStr = JSON.stringify(emailObject);
		// 	console.log(email)
		// 	$.ajax({
		// 		url : "http://localhost:8080/homepage/ajax/googlelogin",
		// 		data : emailJsonStr,
		// 		method : "POST",
		// 		dataType : "json",
		// 		contentType : "application/json; charset=UTF-8",
		// 		success : function(result) {
		// 			setTimeout(function() {
		// 				window.location.href = "/homepage/"
		// 			}, 1500)

		// 		},
		// 	})
		// })
	</script>
	
	<script>
		$('.button00').click(function(){
			$('#exampleDropdownFormEmail1').val('rora@gmail.com');
			$('#exampleDropdownFormPassword1').val('cccccccc');
		})
	</script>
	
	<script>
		$('.button11').click(function(){
			$('#exampleDropdownFormEmail1').val('JOJO3456@gmail.com');
			$('#exampleDropdownFormPassword1').val('cccccccc');
		})
	</script>
	
	<script>
		$('.button22').click(function(){
			$('#exampleDropdownFormEmail1').val('JOLIN8888@gmail.com');
			$('#exampleDropdownFormPassword1').val('cccccccc');
		})
	</script>
	
	
	<script>
		$('.button55').click(function(){
			$('#exampleDropdownFormEmail1').val('EEIT138255@gmail.com');
			$('#exampleDropdownFormPassword1').val('cccccccc');
		})
	</script>
	
	<script>
		$('.button66').click(function(){
			$('#exampleDropdownFormEmail1').val('nini@gmail.com');
			$('#exampleDropdownFormPassword1').val('aaaaaaaa');
		})
	</script>

	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>