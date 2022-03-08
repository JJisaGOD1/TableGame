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
<title>Insert title here</title>
</head>
<body>
<h1>addComment</h1>
<div class="container">
    <p/>
    <div class="row justify-content-center">
       <div class="col-6">
		<div class="card">
			<div class="card-header" >請輸入留言</div>
			<div class="card-body">
				<form:form class="form"  action="${contextRoot}/addComment" modelAttribute="Comments" method="POST"> 
				<form:textarea path="comment" class="form-control" style="display: block;"/>
				
				
				<form:select path="categorysBean" class="form-control" id="category" >
				<form:options items="${categoryMap}" />
				</form:select>
				
				<form:select  path="conditionsBean" class="form-control" style="display:none"> <%--隱藏欄位 --%>
				<form:options items="${firstCondition}"  />
				</form:select>

				<input type="submit" name="submit"/>
				</form:form>
			</div>
		</div>
     </div>
	</div>
	</div>
<script>
	$()
	$("#category").change(function(){
		let res = $(this).val();
		console.log(res);
		if(res==6) {
			var str = "<select class='form-control' id='product' name='product'>" 
			$.ajax({
				url:"http://localhost:8080/homepage/ajax/product",
				dataType: "JSON",
				method: "GET",
				success: function(result){
					console.log(result)
					$.each(result,function(index, value){
						str += "<option value="+"'"+index+"'"+">"+value+"</option>"
						console.log(index);
						console.log(value);
						//console.log(str);

					})
					str +="</select>"
								console.log(str)
					$("#category").after(str)
				},
				error: function(err){
             			console.log(err)
             			alert('發生錯誤')
				}
			})
		}
		else{
			$("#product").remove();
		}
	})
	
</script>
</body>
</html>