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
		<p />
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header">請新增訊息</div>
					<div class="card-body">
						<form:form class="form" action="${contextRoot}/deleteMessage"
							modelAttribute="workMessages" method="post">

							<form:input path="id" readonly="true" class="form-control" />
							<form:input path="added" readonly="true" class="form-control" />
							<form:errors path="text" />
							<form:input path="text" readonly="true" class="form-control" />
							<p>確認要刪除這筆資料嗎?</p>
							<input type="submit" name="submit"></input>
							<a 	 href="${contextRoot}/viewMessage?p=1"><input
								type="button" value="No" style="left:0px"></a>
						</form:form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>