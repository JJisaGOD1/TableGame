<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/homaPageNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script language="javascript"> 
    function delcfm() { 
        if (!confirm("確認要修改")) { 
            window.event.returnValue = false; 
            alert("已經取消了修改操作");
        } else
        	alert("修改完成");
    } 
    
</script>
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
	<div class="container login-container">
	
		<div class="row">
			<div class="col-md-6 login-form-2">
			
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54"
				style="margin-top: 9vw; height: 35vw; min-height: 36vw; width: 30vw;">
				<h3>重設密碼</h3>
				
				<%-- 			<form:form action="pwdSubmit" method="post" --%>
				<%-- 					class="login100-form validate-form" modelAttribute="pwdForm" />  --%>
				<form action="${contextRoot}/pwdSubmit" id="pwdSubmit" method="Post"
					modelAttribute="PwdForm">
					<div id="errorMessge" ></div>
					<div class="form-group">
						<input type="text"  id="email" name="email" class="form-control"
							placeholder="Email" required />
					</div>
					
  					 <div class="form-group"> 
						<input type="password" id="pwd" name="pwd" class="form-control"
							placeholder="新密碼" required /> 
					</div>
<%-- 					<div class="form-group"> -->
<!-- 						<input type="password" name="pwd" class="form-control" -->
<!-- 							placeholder="確認新密碼" required />  -->
<!-- 					</div>  --%>
					<div class="form-group">

						<button class="btn btn-info" a onclick="delcfm()" href="${contextRoot}/pwd">送出</button>
					
					</div>
						
				</form>
				<button id="button33" class="btn btn-danger button33">青該我</button>
			</div>
		</div>
	</div>
	</div>
	</div>
	<script>
		$('.button33').click(function(){
			$('#email').val('nini@gmail.com');
			$('#pwd').val('cccccccc');
		})
		
		
	</script>
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	</body>
</html>