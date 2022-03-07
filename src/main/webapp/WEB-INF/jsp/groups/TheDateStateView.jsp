<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheDateStateView</title>
</head>
<body>

<a href="${contextRoot}">回登入頁</a>

<div align="center">
<h1>hi ${member.cusName}, I'm TheDateState.jsp</h1><br>
<h2>ur choosed date:${date}</h2><br>
<c:choose>
<c:when test="${groups[0]==null}">
	<h3>目前這天還沒有人揪團~~</h3>
</c:when>
<c:otherwise>
	<c:forEach items="${groups}" var="group">
		<table style="border: 3px solid green; margin-bottom:10px;">
			<tr><td>團編號：</td><td>${group.groupId}</td></tr>
			<tr><td>發起者：</td><td>${group.launcher.username}</td></tr>
			<tr><td>遊戲：</td><td>${group.product.productName}</td></tr>
			<tr><td>現有人數：</td><td>${perGroupNumMap[group.groupId]}</td></tr>
			<tr><td>簡介：</td><td>${group.introduction}</td></tr>
			<tr><td>建團時間：</td><td>${group.createdTime}</td></tr>
			<c:choose>
			<c:when test="${member.id==group.launcher.id}">
			<%--<a href="servlet?變數1=111&變數2=222"><input type="button" value="修改"></a> --%>
				<tr>
					<td style="color: purple;">您是創團者</td>
					<td style="color: blue;">您的人數：${oneJoinedNumMap[group.groupId]}</td>
				</tr>
				<tr>
					<td>
						<a href="${contextRoot }/groups/ToUpdateGroupData/${group.groupId}">
							<input type="button" value="修改">
						</a>
						<a href="${contextRoot }/groups/DeleteGroup/${group.groupId}" onclick="return del()">
							<input type="button" value="解散!" >
						</a>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:choose>
				<c:when test="${oneJoinedGroups[group.groupId]!=null}">
					<tr>
						<td style="color: orange;">您已加入此團</td>
						<td style="color: blue;">您的人數：${oneJoinedNumMap[group.groupId]}</td></tr>
					<tr>
						<td>
							<a href="${contextRoot }/groups/ToUpdateParticipantData/${group.groupId}">
								<input type="button" value="修改">
							</a>
						</td>
						<td>
							<a href="${contextRoot }/groups/Quit/${group.groupId}" onclick="return quit()">
								<input type="button" value="退出">
							</a>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${perGroupNumMap[group.groupId]<group.product.maxplayer}">
						<tr>
							<td>
								<a href=
								"${contextRoot}/groups/ToJoin/${group.groupId}">
									<input type="button" value="我要加入">
								</a>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr><td style="color: red;">此團目前滿人</td></tr>
					</c:otherwise>
					</c:choose>
				</c:otherwise>
				</c:choose>
			</c:otherwise>
			</c:choose>
		</table>
	</c:forEach>
</c:otherwise>
</c:choose>
<%-- <a href="${contextRoot}/groups/FillNewGroupData">開新團!</a> --%>
<form action="${contextRoot}/groups/FillNewGroupData" method="post">
	<input type="text" value="${date}" name="date" style='display:none'>
	<input type="submit" value="開新團!">
</form>
</div>

<script >
	function del() { 
		var msg = "是否解散此團?";
			if (confirm(msg) == true) {
				return true;
			} else {
				return false;
			}
		}
	
	function quit() { 
		var msg = "是否退出此團?";
			if (confirm(msg) == true) {
				return true;
			} else {
				return false;
			}
		}
</script>
</body>
</html>