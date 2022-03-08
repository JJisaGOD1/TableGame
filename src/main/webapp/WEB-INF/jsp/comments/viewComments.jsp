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
<div class="container">
		<h1>View Messages for 後台</h1>
		<p></p>
		<div class="row justify-content-end">			
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
					<div class="card">
						<div class="card-header">
							留言時間:
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
								value="${page.createdTime}" />
						</div>
						<div class="card-body">
							<div>
								留言:<c:out value="${page.comment}" />
							</div>
							<div>
								回覆:<c:out value="${page.response}" />
<!-- 								<div class="deit-Link"> -->
<%-- 								 <a href="${contextRoot}/editmessage?id=${page.id}">編輯</a> --%>
<%-- 								 <a href="${contextRoot}/deletemessage?id=${page.id}">刪除</a> onclick="return check()">刪除</a> --%>
<!-- 								</div> -->
							</div>
							<div>
							狀態:<c:out value="${page.conditionsBean.conName}" />
							</div>
							<div>
							會員姓名:<c:out value="${page.membersBean.cusName}" />
							</div>
							<div>
							<a href="${contextRoot}/editComment?id=${page.id}">編輯</a>
							<a href="${contextRoot}/deleteComment?id=${page.id}" onclick="return confirm('是否刪除?')">刪除</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</c:forEach>
		
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