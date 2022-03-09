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
<style>
	span{
		font-size: larger;
    	font-weight: 600;
	}
	body{
        background-repeat: none;
        background-size: 100%;
    }
	.sty1{
		border: 2px solid;
    	border-radius: 10px;
	}
</style>
</head>
<body>
	<br><br>
<div class="container">
	<h2 style="font-weight: 600;">留言總覽</h2>
		
	
	<div>
		<div class="row justify-content-end" style="width: 65vw;">			
			<div class="col-2" >
			<select name="category" class="form-control" id="category" onchange="javascript:location.href = this.value;">
				<option value="-1">請選擇</option>
				<option value="http://localhost:8080/homepage/conditions/viewComments/1" >待回覆</option>
				<option value="http://localhost:8080/homepage/conditions/viewComments/2" >回覆中</option>
				<option value="http://localhost:8080/homepage/conditions/viewComments/3" >已回覆</option>
			</select>
			</div>
		</div>
			
		<c:forEach items="${pages.content}" var="page">
			<div class="row justify-content-center">
				<div class="col-9">
					<div class="card sty1">
						<div class="card-header">
							<span>留言時間:&nbsp;&nbsp;</span>
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
								value="${page.createdTime}" />
						</div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><span>會員姓名&nbsp;:&nbsp;</span><c:out value="${page.membersBean.cusName}" /></li>
								<li class="list-group-item"><span>回覆狀態&nbsp;:&nbsp;</span><c:out value="${page.conditionsBean.conName}" /></li>
								<li class="list-group-item"><span>留言&nbsp;:&nbsp;</span><c:out value="${page.comment}"/></li>
								<li class="list-group-item"><span>回覆&nbsp;:&nbsp;</span><c:out value="${page.response}" /></li>
								<li class="list-group-item"><span>問題類別&nbsp;:&nbsp;</span><c:out value="${page.categorysBean.cateName}" /></li>
								<c:if test="${page.categorysBean.id==6}">
									<li class="list-group-item"><span>產品名&nbsp;:&nbsp;</span><c:out value="${page.productsBean.product_name}" /></li>
								</c:if>
									
							</ul>
							<div style="text-align: end;">
							<c:if test="${page.categorysBean.id==6}">
								<a class="btn btn-info" href="#">產品問題圖</a>
							</c:if>
							<a class="btn btn-primary"  href="${contextRoot}/editComment?id=${page.id}">編輯</a>
							<a class="btn btn-danger"  href="${contextRoot}/deleteComment?id=${page.id}" onclick="return confirm('是否刪除?')">刪除</a>
							</div>
						</div>
					</div>
				</div>

			</div>
			<br>
		</c:forEach>
	</div>
		<div class="row justify-content-center" style="text-align: right">
			<div class="col-9">
				<c:forEach var="pageNumber" begin="1" end="${pages.totalPages}">
					<c:choose>
						<c:when test="${pages.number != pageNumber -1}">
							<a href="${contextRoot}/viewComments?p=${pageNumber}"><c:out value="${pageNumber}" /> </a>
						</c:when>
						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>
					<c:if test="${pageNumber != pages.totalPages}">
						|
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- <script>
		$("#category").change(function(){
			console.log($(this).val());
			conditionNum = $(this).val();
			$.ajax({
				url : "http://localhost:8080/homepage/ajax/condition/"+conditionNum,
				method:"GET",
				contentType: "application/json; charset=UTF-8",
				error : function(err) {
						console.log(err)
						lert('發生錯誤')
				}
			})
		})

	</script> -->
</body>
</html>