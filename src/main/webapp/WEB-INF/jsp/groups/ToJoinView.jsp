<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet">

<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div  align="center" >
	<h1>hi ${member.cusName}</h1>
	<h2>揪團日:${date}</h2>
	
	<div class="card text-left border-dark mb-3" style="width: 22rem;" >
	<div class="card-header text-center">團編號：${group.groupId}</div>
		<ul class="list-group list-group-flush"
			style="display: inline-block;">
			<li class="list-group-item">發起人：${member.cusName}</li>
			<li class="list-group-item">遊戲：${group.product.product_name}</li>
			<li class="list-group-item">此遊戲最大人數：${group.product.maxplayer}</li>
			<li class="list-group-item">目前人數：${playersNumNow}</li>
			<li class="list-group-item">簡介：${group.introduction}</li>
		</ul>
	</div>
			
	
		
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
			<input type="submit" value="報團!" class="btn btn-primary">
		</form>
</div>
</body>
</html>

<!-- <table> -->
<%-- 	<tr><td>團編號：</td><td>${group.groupId}</td></tr> --%>
<%-- 	<tr><td>發起人：</td><td>${group.launcher.cusName}</td></tr> --%>
<%-- 	<tr><td>遊戲：</td><td>${group.product.product_name}</td></tr> --%>
<%-- 	<tr><td>此遊戲最大人數：</td><td>${group.product.maxplayer}</td></tr> --%>
<%-- 	<tr><td>目前人數：</td><td>${playersNumNow}</td></tr> --%>
<!-- </table> -->

<%--
<c:forEach begin="0" end="21" varStatus="loop">
<c:out value="${loop.count}"/>
</c:forEach> 
--%>