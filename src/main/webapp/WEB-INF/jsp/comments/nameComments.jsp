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
<h1>Name Comments for前端</h1>
<c:forEach items="${pageComments.content}" var="comment">
			<div class="row justify-content-center">
				<div class="col-9">
					<div class="card">
						<div class="card-header">
							留言時間:
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
								value="${comment.createdTime}" /> 
						</div>
						<div class="card-body">
							<div>
								留言:<c:out value="${comment.comment}" />
							</div>
							<div>
								回覆:<c:out value="${comment.response}" />
							</div>
							<div>
							狀態:<c:out value="${comment.conditionsBean.conName}" />
							</div>
							<div>
							會員姓名:<c:out value="${comment.membersBean.cusName}" />
							</div>
							<div>
							<a href="${contextRoot}/editComment/${comment.id}">編輯</a>
							<a href="${contextRoot}/deleteComment/${comment.id}" onclick="return confirm('是否刪除?')">刪除</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</c:forEach>
		<div class="row justify-content-center" style="text-align: right">
			<div class="col-9">
				<c:forEach var="pageNumber" begin="1" end="${pageComments.totalPages}">
					<c:choose>
						<c:when test="${pageComments.number != pageNumber -1}">
							<a href="${contextRoot}/nameComments/${pageNumber}"><c:out value="${pageNumber}" /> </a>
						</c:when>
						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>
					<c:if test="${pageNumber != pageComments.totalPages}">
						|
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>