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
<title>Insert title here</title>
<style>
body {
	
  background-color:	#FFFFFF; } 
 #container{ width:980px; margin:0px auto;} 
 .keyword{color:red;text-decoration:underline;} 
.fieldset { 
	width: 100px; 
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


</style>

<script language="javascript"> 
    function delcfm() { 
        if (!confirm("確認要修改")) { 
            window.event.returnValue = false; 
            alert("已經取消了修改操作");
        } else
        	alert("修改完成");
    } 
    
  
</script>
</head>
<body>
	<div class="row justify-content-center"
		style="width: 81vw; margin: 0 auto;">
		<div class="col-8" style="margin-top: 10vh;">
			<div class="card block1" margin: 0px auto>
				<div class="card-header text1" style="font-size: 2rem">修改</div>
				<div class="card-body">
					<form:form class="form" action="${contextRoot}/querySubmit"
						modelAttribute="query" method="POST" style="position: relative;">
						<form:input path="id" type="hidden"/>
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
						<form:input path="createdTime" type="hidden" />
						<select name="ratingsBean" style="display: none">
							<option value="3">會員</option>
						</select>
						<p></p>

						<!-- 				<input class= "btn btn-info" type="submit" name="submit" style="font-weight: 900;" /> -->
						<button class="btn btn-info" a onclick="delcfm()" href="${contextRoot}/query">送出</button>
					</form:form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>