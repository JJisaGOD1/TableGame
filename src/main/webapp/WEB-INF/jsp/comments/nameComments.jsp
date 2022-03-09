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
<style>
	span{
		font-size: larger;
    	font-weight: 600;
	}
	body{
        background-image: url("${contextRoot}/uploaded/talkBackground.jpg");
        background-repeat: none;
        background-size: 100%;
    }
	.sty1{
		border: 2px solid;
    	border-radius: 10px;
	}
</style>
<body>

<div class="container">
	<br>
<h2><span style="font-weight: 600;">${pageComments.content[0].membersBean.cusName}</span> &nbsp;&nbsp;留言查看</h2>
		<c:forEach items="${pageComments.content}" var="comment">
			<div class="row justify-content-center">
				<div class="col-9">
					<div class="card sty1">
						
						<div class="card-header">
							<span>留言時間:&nbsp;&nbsp;</span>
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
								value="${comment.createdTime}" /> 
						</div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><span>回覆狀態&nbsp;:&nbsp;</span><c:out value="${comment.conditionsBean.conName}" /></li>
								<li class="list-group-item"><span>留言&nbsp;:&nbsp;</span><c:out value="${comment.comment}"/></li>
								<li class="list-group-item"><span>回覆&nbsp;:&nbsp;</span><c:out value="${comment.response}" /></li>
								<li class="list-group-item"><span>問題類別&nbsp;:&nbsp;</span><c:out value="${comment.categorysBean.cateName}" /></li>
								<c:if test="${comment.categorysBean.id==6}">
									<li class="list-group-item"><span>產品名&nbsp;:&nbsp;</span><c:out value="${comment.productsBean.product_name}" /></li>
								</c:if>	
							</ul>
							
							<div style="text-align: end;">
								<a class="btn btn-primary" href="${contextRoot}/editComment/${comment.id}">編輯</a>
								<a class="btn btn-danger" href="${contextRoot}/deleteComment/${comment.id}" onclick="return confirm('是否刪除?')">刪除</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
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