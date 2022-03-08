<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<%--
<c:forEach begin="0" end="21" varStatus="loop">
<c:out value="${loop.count}"/>
</c:forEach> 
--%>
	<div  align="center" >
	<h1>hi ${member.cusName},I'm ToUpdateParticipantData.jsp</h1>
	<h2>ur choosed date:${date}</h2>
	<form action="${contextRoot }/groups/UpdateParticipant/${group.groupId}">
		<table> 
			<tr><td>團編號：</td><td>${group.groupId}</td></tr>
			<tr><td>發起人：</td><td>${group.launcher.cusName}</td></tr>
			<tr><td>遊戲：<td>${group.product.product_name}</td></tr>
			<tr>
				<td>更改加入人數(含自己)：</td>
				<td>
					<select id="selectPlayerNum" name="updateNum">
					<c:forEach begin="1" end="${remainingNum}" varStatus="loop">
					<c:choose>
						<c:when test="${loop.count==participantNumNow}">
							<option selected="selected">${loop.count}</option>
						</c:when>
						<c:otherwise>
							<option>${loop.count}</option>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr><td></td></tr>
		</table>
		<input type="submit" value="更改入團資訊!">
	</form>
</div>
</body>
</html>