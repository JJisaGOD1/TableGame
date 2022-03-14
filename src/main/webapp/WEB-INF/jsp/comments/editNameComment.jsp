<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<title>Insert title here</title>
<style>
	body{
        background-image: url("${contextRoot}/uploaded/talkBackground.jpg");
        background-repeat: none;
        background-size: 100%;
    }
	.block1{
		border: 1px solid;
		border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.8);
	}
	.text1{
		text-align: center;
		font-size: xx-large;
		font-weight: bolder;
	}
	.text2{
		text-align: justify;
		font-weight: 600;
		font-size: x-large;
	}
	.row1{
		font-size: 2rem;
	}
	.button1{
		font-size: 2rem;
	}

</style>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- 各自的navbar -->
<div class="navbar-wrap">
    <nav class="navbar-meals">
    <img alt="" src="${contextRoot}/uploaded/food-menu-solid-24.png">
    
    <a href="${contextRoot}/addComment" class="navbarlogo"><button style="background-color: white;"><i class='bx bxs-comment-detail bx-lg' style="display: flex; justify-content: center; color: black;"></i>意見回復</button></a>
    
    
    <a href="${contextRoot}/nameComments/1" class="navbarlogo"><button style="background-color: white;"><i class='bx bx-book-content bx-lg' style="display: flex; justify-content: center; color: black;"></i>查詢留言</button></a>
    <a href="${contextRoot}/customerService" class="navbarlogo"><button style="background-color: white;"><i class='bx bxs-chat bx-lg' style="display: flex; justify-content: center; color: black;"></i>線上交流</button></a>
    </nav>
</div>
<!-- 各自的navbar(end) -->
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<div class="col-6" style="margin-top: 3vh;">
				<div class="card block1">
					<div class="card-header text1" style="text-align: center">意見編輯</div>
					<div class="card-body">
						<form:form class="form" action="${contextRoot}/editNameComment" modelAttribute="editComment" method="POST">

							<form:hidden path="id" />

							<form:label path="" class="card-header text2" style="display:block;">姓名</form:label>
							<input type="text" class="form-control row1" name="name" value="${editComment.membersBean.cusName}" readonly />
							<p></p>

							<form:label path="comment" class="card-header text2" style="display:block;">會員意見</form:label>
							<form:textarea path="comment" class="form-control row1"  />
							<p></p>

							<form:hidden path="response"/>

							<form:hidden path="createdTime" />

							<form:label path="categorysBean" class="card-header text2" style="display:block;">意見類別</form:label>
							<form:select path="categorysBean.id" class="form-control row1" id="category">
								<form:options items="${categoryMap}" />
							</form:select>
							<p></p>
							
							<form:hidden path="productsBean"/>
							
							<form:hidden path="conditionsBean"/>
							<p></p>
							
							<input class="btn btn-primary button1" type="submit" name="submit" />
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
					var str = "<br><label id='product1' class='card-header text2' style='display:block;'>產品</label>"
					+"<select class='form-control row1' id='product' name='product'>"
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