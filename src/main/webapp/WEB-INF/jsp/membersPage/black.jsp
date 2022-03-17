<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/forBlackPage.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.background{
        background-image: url("${contextRoot}/uploaded/chatwallpaper.jpg");
        background-repeat: none;
        background-size: 100%;
		width: 100vw;
		height: 100vh;
		position: fixed;
		z-index: -90;
        opacity: 0.7;
		top: 0;

    }
.textblock{
	margin-top: 10vh;
    text-align: center;
    font-size: xx-large;
}
</style>
</head>
<body>
<div class="background"></div>
<div style="margin-top: 35vh;">
<h1 style="font-weight: 600; text-align: center;">您輸入密碼錯誤三次，此帳號有登入風險。請洽線上客服</h1>
<h2 style="font-weight: 600; text-align: center;margin-top: 5vh;">憶起玩桌遊關心您</h2>
	<div class="textblock">
		<a href="#" 
		onclick="window.open('http://localhost:8080/homepage/accountProblem', 'accountService', config='height=800,width=800');">線上客服
		</a>
	</div>
</div>
<script type="text/javascript">


</script>
</body>
</html>