<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/dashboard.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Manage</title>
<style>


 body{ background-color:	#FFFFFF; } 
 #container{ width:980px; margin:0px auto;} 
 .keyword{color:red;text-decoration:underline;} 
.fieldset { 
	width: 100px; 
} 

	

	.block1{
		border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
		height: 95vh;
	}
	.block2{
		padding-left: 5vw;
	}
	.text1{
		text-align: center;
		font-size: xx-large;
		font-weight: bolder;
	}
	.row1{
		display: block;
		border-radius: 10px 10px 0 0;
		font-size: larger;
		font-weight: bolder;
	}
	.button1{
		position: relative;
		font-size: larger;
		font-weight: 600;
		bottom: 4.5vh;
    	left: 5vw;
	}
	.button2{
		font-size: larger;
		font-weight: 600;
	}
</style>
</head>
<body>
<div class="container">
    <p/>
    <div class="row justify-content-center">
       <div class="col-8 block2">
		<div class="card block1">
			<div class="card-header text1">新增員工</div>
			<div class="card-body">
				<form:form class="form"  action="${contextRoot}/addManager"  modelAttribute="addManager" method="POST" > 
				
				<form:label path="cusName" class="card-header row1" style="display:block;">姓名</form:label>
				<form:input type="text" path="cusName" class="form-control" placeholder="Name" autocomplete="off" />
				<p></p>
				
				<form:label path="email" class="card-header row1" style="display:block;">Email</form:label>
				<form:input type="email" path="email" class="form-control" placeholder="email" autocomplete="off" />
				<p></p>
				
				<form:label path="pwd" class="card-header row1" style="display:block;">密碼</form:label>
				<form:input type="password" path="pwd" class="form-control" placeholder="Password" />
				<p></p>
				
				<form:label path="phone" class="card-header row1" style="display:block;">電話</form:label>
				<form:input path="phone" class="form-control" placeholder="Phone" autocomplete="off" />
				<p></p>
				
				<form:label path="address" class="card-header row1" style="display:block;">地址</form:label>
				<form:input path="address" class="form-control" placeholder="Address" autocomplete="off" />
				<p></p>
				
				<form:label path="birthday" class="card-header row1" style="display:block;">生日</form:label>
				<form:input type="date" path="birthday" class="form-control" />
				<p></p>
				
				<form:label path="RatingsBean" class="card-header row1" style="display:block;">員工等級</form:label>
				<form:select path="RatingsBean" class="form-control"  >
						<form:options items="${ratingMap}" />
				</form:select>
				<p></p>			
				
				<input type="submit" name="submit" class="btn btn-info button2" />
				</form:form>
				<button id="button" class="btn btn-danger button1">一鍵輸入</button>
			</div>
		</div>
     </div>
	</div>
	</div>
	<script>
		$('#button').click(function(){
			$('#cusName').val('Nick');
			$('#email').val('jack902221@gmail.com');
			$('#pwd').val('3345678');
			$('#phone').val('0922645879');
			$('#address').val('台北市新生南路一段');
		})
	</script>
</body>
</html>