<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="membersPage/layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="533537045577-jdn4qt2elj0o2g51ufi47igj254rpm7v.apps.googleusercontent.com">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<style>
body {
	background-color: #dedede;
}

.block {
	width: 500px;
	margin: 0 auto;
}

.backtype {
	width: 35vw;
	height: 40vh;
	border-radius: 1rem;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	margin: 0 auto;
	margin-top: 20vh;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="backtype">
		<div class="cotainer block"
			style="padding-top: 4vh; position: absolute;">
			<form class="px-4 py-3" action="${contextRoot}/login" method="POST">
				<div class="mb-3">
					<label for="exampleDropdownFormEmail1" class="form-label">輸入Email</label>
					<input type="text" class="form-control"
						id="exampleDropdownFormEmail1" placeholder="email" name="email" autocomplete="off">
				</div>
				<div class="mb-3">
					<label for="exampleDropdownFormPassword1" class="form-label">密碼</label>
					<input type="password" class="form-control"
						id="exampleDropdownFormPassword1" placeholder="Password"
						name="pwd">

					<div class="mb-3"></div>
					<button type="submit" class="btn btn-primary">登入</button>
					<a href="${contextRoot}/addCustomer">
						<input type="button" class="btn btn-info" value="加入會員">
					</a>
						<div id="googleInSite" class="g-signin2" data-onsuccess="onSignIn"
					style="display: inline-block; left: 180px; position: relative; top: 12px;">
				</div>
				</div>	
			</form>
		</div>
	</div>




	<script>
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			email = profile.getEmail()
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
		$("#googleInSite").click(function() {
			emailObject = {
				"loginEmail" : email
			};
			emailJsonStr = JSON.stringify(emailObject);
			console.log(email)
			$.ajax({
				url : "http://localhost:8080/homepage/ajax/googlelogin",
				data : emailJsonStr,
				method : "POST",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(result) {setTimeout(function(){
						window.location.href = "/homepage/"
					},1500)
					
				},
			})
		})
	</script>

	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>