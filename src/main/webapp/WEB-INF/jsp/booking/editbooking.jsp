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
<meta charset="UTF-8"">
<title>Insert title here</title>

<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="http://tony1966.xyz/test/jquery/jquery.ui.datepicker-zh-TW.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy/mm/dd',
			minDate : 0,
			maxDate : "14D"
		});

	});
</script>
</head>
<body>
	<div align="center">
		<h1>修改訂位</h1>
		<table>
			<form action="${contextRoot}/editbooking"
				modelAttribute="editbooking" method="post">

				<tr>
					<td>ID :<input type="text" name="orderId"
						value="${booking.orderId}"  readonly="readonly">
				<tr>
					<td>人數 :<select name="several">
							<option>${booking.several}</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
					</select>
				<tr>
				<tr>
					<td>訂位日期：<input type="text" id="datepicker"
						name="reservation_date" value="${booking.reservation_date}" /></td>
				</tr>
				<%-- 					<fmt:formatDate  id="datepicker" path="reservation_date"   pattern="yyyy/MM/dd EEEE" value="${booking.reservation_date}"/></td></tr> --%>
				<tr>
					<td>時間：<select name="period" />
						<option>${booking.period}</option>
						<option>上午</option>
						<option>下午</option>
						<option>晚上</option> </select></td>
				</tr>
				<tr>
					<td>桌號：<select name="number">
							<option>${booking.number}</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
					</select></td>
				</tr>
				<tr>
					<td>備註：<input type="text" name="remark"
						value="${booking.remark}" /></td>
				</tr>

				<tr style="display:none">
					<td>會員：<input type="text" name="user"
						value="${booking.user.id}" readonly="readonly"/></td>
				</tr>
				<input type="text" hidden="true" name="added" value="${booking.added}">
		</table>
		<input type="submit" name="submit" />
		</form>
	</div>
</body>
</html>