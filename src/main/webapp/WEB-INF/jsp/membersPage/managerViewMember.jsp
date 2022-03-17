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
<title>Manage View Member</title>
<style>
.body{ background-color:#f5f5f5; }
 #container{ width:980px; margin:0px auto;}
 .keyword{color:red;text-decoration:underline;}
.fieldset {
	width: 100px;
}
</style>
</head>
<body>
	<h1>All Member</h1>
	<p />
	<div class="container">
		<div class="row justify-content-center">

				<table class="table">		
				<thead class="thead-dark">
					<tr>
						<th scope="col">id</th>
						<th scope="col">員工姓名</th>
						<th scope="col">Email</th>
						<th scope="col">連絡電話</th>
						<th scope="col">地址</th>
						<th scope="col">生日</th>
						<th scope="col">入職時間</th>
						<th scope="col">等級</th>
						<th scope="col" style="text-align: center">改動</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${members.content}" var="member">
							<tr>
								<td><c:out value="${member.id}"/></td>
								<td><c:out value="${member.cusName}"/></td>
								<td><c:out value="${member.email}"/></td>
								<td><c:out value="${member.phone}"/></td>
								<td><c:out value="${member.address}"/></td>
								<td><c:out value="${member.birthday}"/></td>
								<td><c:out value="${member.createdTime}"/></td>
								<td><c:out value="${member.ratingsBean.rateName}"/></td>
							<td style="text-align: center">
								
								<button a href="${contextRoot}/query" type="button" class="btn btn-primary">編輯</button>
							
								<a href="${contextRoot}/admin/deleteMember/${member.id}">
									<button type="button" class="btn btn-danger" onclick="return confirm('是否刪除?')">刪除</button>
								</a>
							</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div style="text-align: right">
				<c:forEach var="pageNumber" begin="1" end="${members.totalPages}">
					<c:choose>
						<c:when test="${members.number != pageNumber -1}">
							<a href="${contextRoot}/viewMembers/${pageNumber}"><c:out value="${pageNumber}" /> </a>
						</c:when>
						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>
					<c:if test="${pageNumber != members.totalPages}">
						|
					</c:if>
				</c:forEach>
			</div>
		</div>
			
</body>
</html>