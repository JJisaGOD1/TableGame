<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/homaPageNavbar.jsp" />
<jsp:include page="layout/NewFile.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<table class="table">
				<thead class="table table-dark">
					<tr>
						<th>�s��</th>
						<th>�W��</th>
						<th>����</th>
						<th>����</th>
						<th>�̤p�C���H��</th>
						<th>�̤j�C���H��</th>
						<th>�̾A�~��</th>
						<th>�Ϥ�</th>
						<th>�ʶR��</th>
						<th>����</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="C" items="${orders.orderList}">
						<tr>
							<th scope="row"><c:out value="${C.product.product_id}" />
							<td><c:out value="${C.product.product_name}" />
							<td><c:out value="${C.product.price}" />
							<td><c:out value="${C.product.gametype}" />
							<td><c:out value="${C.product.minplayer}" />
							<td><c:out value="${C.product.maxplayer}" />
							<td><c:out value="${C.product.low_age}" />
							<td><img src="<c:url value='/Photo/${C.product.photourl}'/>"
								style="height: 100px" name="${C.product.photourl}"
								id="${C.product.photourl}"
								onerror="this.src='${contextRoot}/Photo/nophoto.jpg'" />
							<td><c:out value="${C.quantity}" />
							<td><c:out value="${C.price}" />
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h3>�`�p${orders.totalprice}��</h3>
			<a
				href="${contextRoot}/products/myorders"><input type="button" value="�^��ڪ��q��"> </a> 
		</div>
	</div>
</body>
</html>