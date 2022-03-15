<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="messages/layout/navbar.jsp"></jsp:include> --%>
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>
<jsp:include page="messages/layout/mealsNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工資料</title>

<style>
#slide {
	position: absolute;
	left: -100px;
	width: 100px;
	height: 100px;
	background: blue;
	-webkit-animation: slide 0.5s forwards;
	-webkit-animation-delay: 2s;
	animation: slide 0.5s forwards;
	animation-delay: 2s;
}
/* .myButton { */
/* 	box-shadow: 0px 0px 0px 2px #9fb4f2; */
/* 	background: linear-gradient(to bottom, #7892c2 5%, #476e9e 100%); */
/* 	background-color: #7892c2; */
/* 	border-radius: 10px; */
/* 	border: 1px solid #4e6096; */
/* 	display: inline-block; */
/* 	cursor: pointer; */
/* 	color: #ffffff; */
/* 	font-family: Arial; */
/* 	font-size: 19px; */
/* 	padding: 12px 37px; */
/* 	text-decoration: none; */
/* 	text-shadow: 0px 1px 0px #283966; */
/* } */

/* .myButton:hover { */
/* 	background: linear-gradient(to bottom, #476e9e 5%, #7892c2 100%); */
/* 	background-color: #476e9e; */
/* } */

/* .myButton:active { */
/* 	position: relative; */
/* 	top: 1px; */
/* } */

/* .Img1 { */
/* 	color: blure; */
/* 	opacity: 0.5; */
/* 	filter: alpha(opacity = 50); */
/* 	width: 50px; */
/* } */
/* *{ */
/*   margin: 0; */
/*   padding: 0; */
/*   outline: none; */
/*   box-sizing: border-box; */
/*   font-family: 'Poppins', sans-serif; */
/* } */
/* body{ */
/*   display: flex; */
/*   align-items: center; */
/*   justify-content: center; */
/*   min-height: 100vh; */
/*   background: linear-gradient(-135deg, #c850c0, #4158d0); */
/* } */
.wrapper {
	background: #fff;
	padding: 30px;
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
	width: 42rem;
	border-radius: 12px;
	display: inline-block;
	position: relative;
    top: 23rem;
    left: -4rem;

}

.wrapper .input-data {
	height: 40px;
	width: 100%;
	position: relative;
}

.wrapper .input-data input {
	height: 100%;
	width: 100%;
	border: none;
	font-size: 17px;
	border-bottom: 2px solid silver;
}

.input-data input:focus ~ label, .input-data input:valid ~ label {
	transform: translateY(-20px);
	font-size: 15px;
	color: #4158d0;
}

.wrapper .input-data label {
	position: absolute;
	bottom: 10px;
	left: 0;
	color: grey;
	pointer-events: none;
	transition: all 0.3s ease;
}

.input-data .underline {
	position: absolute;
	height: 2px;
	width: 100%;
	bottom: 0;
}

.input-data .underline:before {
	position: absolute;
	content: "";
	height: 100%;
	width: 100%;
	background: #4158d0;
	transform: scaleX(0);
	transform-origin: center;
	transition: transform 0.3s ease;
}

.input-data input:focus ~ .underline:before, .input-data input:valid ~
	.underline:before {
	transform: scaleX(1);
}

.Img1:hover {
	opacity: 1.0;
	filter: alpha(opacity = 100);
	width: 50px;
}

body {
	background-image: url(uploaded/Breakfast-Template.jpg);
	background-repeat: no-repeat;
	background-size: 100%;
}

.card {
	width: 750px;
	box-shadow: 3.1px 6.2px 6.2px hsl(0deg 0% 0%/ 0.46);
}

#a {
	text-decoration: none;
	/*   background: #eee; */
	padding: .5em;
	margin-bottom: 1em;
	display: inline-block;
}

.box {
	display: block;
	background: lightblue;
	margin-bottom: 1em;
}

#fade-in {
	opacity: 0;
	transition: all .75s ease;
}

#fade-in.show {
	opacity: 1;
}

.startOrder-btn {
	/* width: 30rem; */
    /* height: 5rem; */
    width: 17rem;
    height: 4rem;
    border-radius: 50px;
    background-color: #EBA800;
    border: none;
    font-weight: bold;
    /* box-shadow: 1.2px 2.4px 2.4px hsl(0deg 0% 0% / 46%); */
    position: relative;
    top: 25rem;
    left: 17rem;
    z-index: 2;
    font-size: 1.5rem;
}

.addOrder-btn {
	width: 17rem;
    height: 4rem;
    /* width: 30rem; */
    /* height: 5rem; */
    border-radius: 50px;
    background-color: #EBA800;
    border: none;
    font-weight: bold;
    /* box-shadow: 1.2px 2.4px 2.4px hsl(0deg 0% 0% / 46%); */
    position: relative;
    top: 1.92rem;
    left: 19.5rem;
    z-index: 2;
    font-size: 1.5rem;
}

.add-order-list {
	width: 42rem;
	/* height: 16vw; */
	/* margin-left: 19vw; */
	/* margin-top: 30vh; */
	border-radius: 12px;
	display: inline-block;
	position: relative;
	top: 38rem;
	left: -18rem;
}
</style>


	
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- style="background-color: #fdf5e6" -->
</head>
<body>



<!-- 	<div class="container" id="container"> -->
<!-- 		<p /> -->
<!-- 		<div class="row justify-content-center"> -->
<!-- 			<div class="col-9"> -->
<!-- 				<div class="card" id="card"> -->
<!-- 					<div class="card-header">歡迎光臨點餐系統</div> -->
<!-- 					<div class="card-body"> -->

						
						
						
						
									
						
						
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->


<!-- 		</div> -->
<!-- 	</div> -->

	<a class="slide2" href="#" id="a">
	<button class="startOrder-btn">開始點餐</button></a>
	<div class="wrapper" id="fade-in" style="    font-size: 2rem;">
	<h1 style="font-size: 3rem; font-weight: 600;">歡迎光臨點餐系統</h1>
	<form:form class="form" action="${contextRoot}/meals/addOrders"
							modelAttribute="orders" method="post">
							<form:errors ></form:errors>

							<p>
								輸入桌號 :
								<form:select path="tableNum" class="form-select" aria-label="Default select example" style="font-size: 1.5rem;">
									<option selected="selected">請選擇桌號</option>
									<option>1桌</option>
									<option>2桌</option>
									<option>3桌</option>
									<option>4桌</option>
									<option>5桌</option>
									<option>6桌</option>
									<option>7桌</option>
									<option>8桌</option>
									<option>9桌</option>
									<option>10桌</option>
								</form:select>
								
							<p>
								輸入用餐人數 :
								<form:input type="number" path="peopleNum" class="form-control" min="1" max="12" style="font-size: 1.5rem;"/>
								
								<form:errors path="peopleNum" />
								
								<form:input type="hidden" path="orderId" class="form-control" />
								
								
								<form:input type="hidden" path="processState" class="form-control" value="待處理" />
								
								<form:input type="hidden" path="paymentState" class="form-control" value="未付款"/>
								
								<form:input type="hidden" path="totalprice" class="form-control" value="0.0" />
							<p>
								<input type="submit" name="submit" id="btnSubmit" class="addOrder-btn" />
								
<!-- 								<a class="slide2" href="#" id="a"><button class="startOrder-btn">開始點餐</button></a> -->
								
						</form:form>
	</div>

<script>
$('.slide2').on('click', function(){
    $('#fade-in').toggleClass('show');
});

$('.spin').on('click', function(){
    $('#spin-in').toggleClass('show2');
});

$('h1.spacing').on('mouseenter', function(){
  $(this).toggleClass('spaced');
});
</script>
<!-- input 參考設計樣式 -->
<!-- <div class="wrapper"> -->
<!--          <div class="input-data"> -->
<!--             <input type="text" required> -->
<!--             <div class="underline"></div> -->
<!--             <label>輸入桌號</label> -->
<!--          </div> -->
<!--       </div> -->
      

</body>
</html>