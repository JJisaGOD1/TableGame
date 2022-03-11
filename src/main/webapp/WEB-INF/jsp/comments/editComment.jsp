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
<title>editComment</title>
</head>
<body>
	<div class="container">
		<p />

		<div class="row justify-content-center">
			<div class="col-6">
				<div class="card">
					<div class="card-header" style="text-align: center">編輯</div>
					<div class="card-body">
						<form:form class="form" action="${contextRoot}/editComment" modelAttribute="editComment" method="POST">

							<form:hidden path="id" />

							<label for="name" class="card-header" style="display:block;">會員姓名</label>
							<input type="text" class="form-control" name="name" value="${editComment.membersBean.cusName}" readonly />
							<p></p>
							
							<form:label path="comment" class="card-header" style="display:block;">會員意見</form:label>
							<form:textarea path="comment" class="form-control"  readonly="true"/>
							<p></p>

							<form:label path="response" class="card-header" style="display:block;">回覆</form:label>
							<form:textarea path="response" class="form-control" />
							<p></p>

							<form:hidden path="createdTime" />

							<form:label path="" class="card-header" style="display:block;">意見類別</form:label>
							<form:select path="categorysBean.id" class="form-control" id="category">
								<form:options items="${categoryMap}" />
							</form:select>
							<p></p>
							
							<form:hidden path="productsBean"/>
							
							<form:label path="" class="card-header" style="display:block;">回復狀態</form:label>
							<form:select path="conditionsBean.id" class="form-control" >
								<form:options items="${conditionMap}" />
							</form:select>
							<p></p>
							<input type="submit" name="submit" />
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#category").change(function() {
				let res = $(this).val();
				console.log(res);
				if (res == 6) {
					var str = "<select class='form-control' id='product' name='product'>"
					$.ajax({
						url : "http://localhost:8080/homepage/ajax/product",
						dataType : "JSON",
						method : "GET",
						success : function(result) {
							console.log(result)
								$.each(result,function(index,value) {
									str += "<option value="+ "'" + index +"'" + ">"+ value + "</option>"
									console.log(index);
									console.log(value);
									//console.log(str);

								})
								str += "</select>"
								console.log(str)
								$("#category").after(str)
						},
						error : function(err) {
									console.log(err)
									alert('發生錯誤')
								}
					})
				} 
				else {
					$("#product").remove();
							}
		})

	</script>
</body>
</html>