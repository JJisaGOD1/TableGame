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
	<div  align="center" >
	<h1>hi ${userBean.username},I'm ToJoin.jsp</h1>
	<h2>ur choosed date:${date}</h2>
	
		<table>
			
			<tr><td>團編號：</td><td>${group.groupId}</td></tr>
			<tr><td>發起人：</td><td>${group.launcher.username}</td></tr>
			<tr><td>遊戲：</td><td>${group.product.productName}</td></tr>
			<tr><td>此遊戲最大人數：</td><td>${group.product.maxPlayers}</td></tr>
			<tr><td>目前人數：</td><td>${playersNumNow}</td></tr>
		</table>
		<form action="${contextRoot }/groups/Join" method="post">
			<table>
			<tr><td><input type="text" style="display: none" value="${group.groupId}" name="groupId"></td></tr>
			<tr>
				<td>愈加入人數(含自己)：</td>
				<td>
					<select id="selectPlayerNum" name="joinPlayersNum">
					<c:forEach begin="1" end="${remainingNum}" varStatus="loop">
						<option>${loop.count}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			</table>
			<input type="submit" value="報團!">
		</form>
</div>
</body>
</html>

<%--
<c:forEach begin="0" end="21" varStatus="loop">
<c:out value="${loop.count}"/>
</c:forEach> 
--%>