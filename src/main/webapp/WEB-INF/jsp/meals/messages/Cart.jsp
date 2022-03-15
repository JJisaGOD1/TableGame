<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="../../layout/homaPageNavbar.jsp"></jsp:include>
<jsp:include page="../messages/layout/mealsNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="${contextRoot}/js/jquery-3.6.0.min.js" rel="stylesheet" />

<style type="text/css">

* {
/*   box-sizing: border-box; */
}
 
html,
body {
  width: 100%;
  height: 100%;
  margin: 0;
/*   background-color: #7EC855; */
  background-color: #DDDDDD;
  font-family: 'Roboto', sans-serif;
  transform:none;
}
.shopping-cart {
  width: 80vw;
  margin: 3rem auto;
  background: #FFFFFF;
  box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
  border-radius: 6px;
  display: flex;
  flex-direction: column;
}
.title {
  height: 60px;
  border-bottom: 1px solid #E1E8EE;
  padding: 20px 30px;
  color: #5E6977;
  font-size: 18px;
  font-weight: 400;
  display: flex;
  justify-content: space-between;
}

.table td {
  vertical-align: middle;
}

.item {
  padding: 20px 30px;
  height: 120px;
  display: flex;
}
 
.item:nth-child(3) {
  border-top:  1px solid #E1E8EE;
  border-bottom:  1px solid #E1E8EE;
}

.buttons {
  position: relative;
  padding-top: 30px;
  margin-right: 60px;
}
.delete-btn,
.like-btn {
  display: inline-block;
  Cursor: pointer;
}
.delete-btn {
  width: 18px;
  height: 17px;
  background: url(&amp;quot;delete-icn.svg&amp;quot;) no-repeat center;
}
 
.like-btn {
  position: absolute;
  top: 9px;
  left: 15px;
  background: url('twitter-heart.png');
  width: 60px;
  height: 60px;
  background-size: 2900%;
  background-repeat: no-repeat;
}
.is-active {
  animation-name: animate;
  animation-duration: .8s;
  animation-iteration-count: 1;
  animation-timing-function: steps(28);
  animation-fill-mode: forwards;
}
 
@keyframes animate {
  0%   { background-position: left;  }
  50%  { background-position: right; }
  100% { background-position: right; }
}

.image {
  margin-right: 0px;
  padding-right:1px;
  width:150px;
/*   background-color: red; */
}
 
Let’s add some basic style to  product name and description.
.description {
  padding-top: 10px;
  margin-right: 160px;
  width: 115px;
  background-color: red;
  
}
 
.description span {
  display: block;
  font-size: 1.5rem;
  color: #43484D;
  font-weight: 400;
}
 
.description span:first-child {
  margin-bottom: 5px;
}
.description span:last-child {
  font-weight: 300;
  margin-top: 8px;
  color: #86939E;
}
.quantity {
  padding-top: 20px;
  margin-right: 60px;
}
.quantity input {
  -webkit-appearance: none;
  border: none;
  text-align: center;
  width: 32px;
  font-size: 16px;
  color: #43484D;
  font-weight: 300;
}
 
button[class*=btn] {
  width: 30px;
  height: 30px;
  background-color: #E1E8EE;
  border-radius: 6px;
  border: none;
  cursor: pointer;
}
.minus-btn img {
  margin-bottom: 3px;
}
.plus-btn img {
  margin-top: 2px;
}
 
button:focus,
input:focus {
  outline:0;
}

.total-price {
  width: 83px;
  padding-top: 27px;
  text-align: center;
  font-size: 16px;
  color: #43484D;
  font-weight: 300;
}

@media (max-width: 800px) {
  .shopping-cart {
    width: 100%;
    height: auto;
    overflow: hidden;
  }
  .item {
    height: auto;
    flex-wrap: wrap;
    justify-content: center;
  }
  .image img {
    width: 50%;
  }
  .image,
  .quantity,
  .description {
    width: 100%;
    text-align: center;
    margin: 6px 0;
  }
  .buttons {
    margin-right: 20px;
  }
  
}
.finished_order_icon{
  	position: fixed; 
  	right: 31px; 
  	bottom: 31px;
  	width:9rem;
  }

</style>



</head>
<body>

	<a href="${contextRoot}/meals/menu"> <img src="<c:url value="/uploaded/pngwing.com.png"/>" class="finished_order_icon" /> </a>


<div class="shopping-cart">

  <div class="title">
    <div style="font-size: 2.5rem; height: 20px; position: relative; top: -1rem;">訂單明細</div>
    <div style="display: flex;">
      <p>合計: NT$<c:out value="${C.totalPrices}"/></p>
      <span class="orderId">訂單編號<c:out value="${newOrders.orderId}" /></span> |
      <span class="tableNum">第<c:out value="${newOrders.tableNum}" /></span> |
      <span class="peopleNum"> <img src="<c:url value="/uploaded/people.png"/>" style="width: 14px"/> <c:out value="${newOrders.peopleNum}" />人</span>

    </div>
  </div>

 
 
 <table class="table" style="font-size: 1.5rem;">
  <!-- Product #1 -->
 
 <c:forEach items="${C.foodMap}" var="cart">
 <tr scope="row">
<!--  <td> -->
<!--   <div class="item"> -->
<!--     <div class="buttons"> -->
<!--       <span class="delete-btn"></span> -->
<!--       <span class="like-btn"></span> -->
<!--     </div> -->
<!--  </td> -->
 <td>
<!--     <div class="buttons"> -->

      <a href="${contextRoot}/deleteOneFoodItem?foodId=${cart.value.food.foodId}">
      <img src="<c:url value="/uploaded/delete2.png"/>" style="width: 30px; opacity: 80%;margin: 10px 10px;position: relative;left: 2rem;"/>

      </a>

<!--     </div> -->
 </td>

 <td>
    <div class="image">
      <img src="<c:url value="/uploaded/${cart.value.food.foodImage}"/>" style="width: 150px"/>
      
    </div>
 </td>
 
 <td>
    <div class="description">
      <span><c:out value="${cart.value.food.foodName}" /></span>
      <span>單價:NT$<c:out value="${cart.value.food.foodPrice}" /></span>
      <span><c:out value="${cart.value.food.foodType}" /></span>
    </div>
 </td>
 
 <td>
    <div class="quantity">
      <button class="plus-btn" type="button" name="button">
        <img src="<c:url value="/uploaded/plus.svg"/>" alt="" />
      </button>
      <input type="text" name="name" value="<c:out value='${cart.value.quantity}' />">
      <button class="minus-btn" type="button" name="button">
        <img src="<c:url value="/uploaded/minus.svg"/>" alt="" />
      </button>
    </div>
 </td>
  <td>
    <div style="font-size: 2rem; color: #6394F8"> 小計 NT$: <c:out value="${cart.value.price}" /></div>
  </td>
    </tr>
    </c:forEach>
  </div>
  
</table>
 <hr>
 <div style="display: flex; flex-direction: row; justify-content: flex-end;">
      <div style="margin-right: 2rem;"><div style="display: flex; flex-direction: row-reverse;font-size: 2rem">合計: </div><p style="font-size: 30px; display: flex; flex-direction: row-reverse;">NT$<c:out value="${C.totalPrices}"/></p>
      <a href="${contextRoot}/checkOrder"><button style="background-color: #EBBF75;border: none;width: 15.5rem;height: 3.2rem;border-top-left-radius: 10rem;border-top-right-radius: 3rem;font-size: 1.5rem;">送出訂單</button></a></div>
<%--       <a href="${contextRoot}/menu"><input type="button" value="新增" class="myButton"></a> --%>
    </div>
 
 
</div>
<!-- <div align="center"> -->
<%-- 合計: NT$<c:out value="${C.totalPrices}" /> --%>
<%-- 		<span class="orderId">訂單編號<c:out value="${newOrders.orderId}" /></span> | --%>
<%-- 		<span class="tableNum">第<c:out value="${newOrders.tableNum}" /></span> | --%>
<%-- 		<span class="peopleNum"> <img src="<c:url value="/uploaded/people.png"/>" style="width: 14px"/> <c:out value="${newOrders.peopleNum}" />人</span> --%>
<%-- 		<a href="${contextRoot}/finishedOrder"><input type="button" value="送出訂單"></a> --%>
<%-- <a href="${contextRoot}/menu"><input type="button" value="新增" class="myButton"></a> --%>
<!-- </div> -->





<!-- ================================================= -->


	<script>
			function del() {
				if (confirm("確實要刪除嗎？")) {
					alert("已經刪除！");
				} else {
					alert("已經取消了刪除操作");
				}

			}
</script>



	<script type="text/javascript">

$('.like-btn').on('click', function() {
	   $(this).toggleClass('is-active');
	});
	
$('.minus-btn').on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    var $input = $this.closest('div').find('input');
    var value = parseInt($input.val());
 
    if (value &amp;amp;gt; 1) {
        value = value - 1;
    } else {
        value = 0;
    }
 
  $input.val(value);
 
});
 
$('.plus-btn').on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    var $input = $this.closest('div').find('input');
    var value = parseInt($input.val());
 
    if (value &amp;amp;lt; 100) {
        value = value + 1;
    } else {
        value =100;
    }
 
    $input.val(value);
});
</script>



<script type="text/javascript">

$('.like-btn').on('click', function() {
	   $(this).toggleClass('is-active');
	});
	
$('.minus-btn').on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    var $input = $this.closest('div').find('input');
    var value = parseInt($input.val());
 
    if (value &amp;amp;gt; 1) {
        value = value - 1;
    } else {
        value = 0;
    }
 
  $input.val(value);
 
});
 
$('.plus-btn').on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    var $input = $this.closest('div').find('input');
    var value = parseInt($input.val());
 
    if (value &amp;amp;lt; 100) {
        value = value + 1;
    } else {
        value =100;
    }
 
    $input.val(value);
});
</script>


<!-- <!-- ================= --> 

<!-- <table class="table"> -->
<!-- 		<thead class="thead-dark"> -->
<!-- 			<tr> -->
<!-- 				<th scope="col">食物編號</th> -->
<!-- 				<th scope="col">食物名稱</th> -->
<!-- 				<th scope="col">價格</th> -->
<!-- 				<th scope="col">分類</th> -->
<!-- 				<th scope="col">圖片</th> -->
<!-- 				<th scope="col">數量</th> -->
<!-- 				<th scope="col">小計</th> -->
<!-- 				<th scope="col"> </th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<%-- 					<c:forEach items="${C.foodMap}" var="cart"> --%>
<!-- 						<tr scope="row"> -->
<%-- 							<td><c:out value="${cart.value.food.foodId}" /></td> --%>
<%-- 							<td><c:out value="${cart.value.food.foodName}" /></td> --%>
<%-- 							<td><c:out value="${cart.value.food.foodPrice}" /></td> --%>
<%-- 							<td><c:out value="${cart.value.food.foodType}" /></td> --%>
<%-- 							<td><img src="<c:url value="/uploaded/${cart.value.food.foodImage}"/>" style="width: 300px"/></td> --%>
<%-- 							<td><c:out value="${cart.value.quantity}" /></td> --%>
<%-- 							<td><c:out value="${cart.value.price}" /></td> --%>
<%-- <%-- 							<td><c:out value="${food.foodName}" /></td> --%> 
<%-- <%-- 							<td><c:out value="${food.foodPrice}" /></td> --%>
<%-- <%-- 							<td><c:out value="${food.foodType}" /></td> --%>
<%-- <%-- 							<td><img src="<c:url value="/uploaded/${food.foodImage}"/>" style="width: 300px"/></td> --%> 
<%-- <%-- 							<td><c:out value="${food.foodState}" /></td> --%> 
<!-- 							<td> -->
<%-- 							<a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteOneFoodItem?foodId=${cart.value.food.foodId}"><input type="button" value="刪除"></a> --%>
<!-- <!-- 							<input type="button" value="刪除"> -->
							
<!-- 						</tr> -->
						
<%-- 					</c:forEach> --%>
					
					
<!-- 		</table> -->
</body>
</html>