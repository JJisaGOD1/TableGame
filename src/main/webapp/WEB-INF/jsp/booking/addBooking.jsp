<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="layout/navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-image:url(BookingPhoto/body.jpg);
background-repeat: no-repeat;
background-size: 100%;
}

.button{
border-radius: 12px;
background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
}

.button:hover {background-color: #e7e7e7;}

</style>
</head>
<body>
<div class="container">
<h2>店家資訊</h2>
<div class="google-maps" style="float:left; margin-right:10px">
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.0045591582784!2d121.54122331400265!3d25.033919344450858!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd379a5ec97%3A0xedc006d25a9e35df!2z6LOH5bGV5ZyL6Zqb6IKh5Lu95pyJ6ZmQ5YWs5Y-4!5e0!3m2!1szh-TW!2stw!4v1647221432570!5m2!1szh-TW!2stw" width="500" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</div>
<div>
<p>位置</p>
<p>台北市內湖區金湖路57號</p>
<p>聯絡電話</p>
<p>02-27949094</p>
<p>營業時間</p>
<p>營業至 18:00</p>
</div>

</p>
<div class="row justify-content-center">
<a href="addNew"><input type="button" class="button" name="booking" value="訂位" style="width:300px;height:150px"/></a>

</div>
</p>

</div>



                  
</body>
</html>