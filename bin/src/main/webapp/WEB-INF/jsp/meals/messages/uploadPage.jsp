<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>圖片上傳</title>
</head>
<body>
	<form action="upload" method="post" enctype="multipart/form-data">
		選擇圖片:<input type="file" name="file" accept="image/*" /> <br> <input
			type="submit" value="立刻上傳">
	</form>
</body>
</html>