<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<link href="${contextRoot}/css/aside.css" rel="stylesheet" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>側邊選單</title>

</head>
<body>
	<div class="side-menu">
		<form>
			<input type="search" placeholder="請輸入關鍵字">
			<button>
				<i class="fas fa-search"></i>
			</button>
		</form>
		<nav>
			<a href="#"><i class="tou fab fa-affiliatetheme"></i>鐵人賽</a> <a
				href="#"><i class="tou fab fa-alipay"></i>暴力班</a> <a href="#"><i
				class="tou fas fa-ambulance"></i>RWD醬子</a> <a href="#"><i
				class="tou fas fa-american-sign-language-interpreting"></i>金魚網頁</a> <a
				href="#"><i class="tou fab fa-angellist"></i>金魚切版</a>
		</nav>
	</div>
</body>
</html>