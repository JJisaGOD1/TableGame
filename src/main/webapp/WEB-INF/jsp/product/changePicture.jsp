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
</head>
<body>
	<div class="container">
		<p />
		<div class="p-2 bd-highlight">
			<h3>請上傳新圖片</h3>

			<form:form class="form" action="${contextRoot}/products/changePicture"
				modelAttribute="P" method="post" enctype="multipart/form-data">
				<table class="table">
					<thead class="table table-light	">
						<tr>
							<th>圖片</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><form:input path="photo" type="file" /></td>
							<form:input path="product_id" type="hidden" />
							<form:input path="product_name" type="hidden" />
							<form:input path="price" type="hidden" />
							<form:input path="gametype" type="hidden" />
							<form:input path="minplayer" type="hidden" />
							<form:input path="maxplayer" type="hidden" />
							<form:input path="low_age" type="hidden" />
							<form:input path="sellstatus" type="hidden" />
							<form:input path="stock" type="hidden" />
							<form:input path="productintroduce" type="hidden" />
							<form:input path="problem_count" type="hidden" />
						</tr>
					</tbody>
				</table>
				<input class="btn btn-secondary btn-lg btn-block" type="submit"
					name="submit" />
			</form:form>
		</div>

	</div>
</body>
</html>