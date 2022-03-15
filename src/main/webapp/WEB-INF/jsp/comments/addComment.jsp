<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
</head>
<style>
	.p1{
		padding-left: 20px;
		font-size: 1.5rem;
	}
	.background{
        background-image: url("${contextRoot}/uploaded/chatwallpaper.jpg");
        background-repeat: none;
        background-size: 100%;
		width: 100vw;
		height: 100vh;
		position: fixed;
		z-index: -90;
		top: 0;

    }
	.row1{
		display: block;
		border-radius: 10px 10px 0 0;
		font-size: x-large;
		font-weight: bolder;
	}
	.coulmn{
		font-size: x-large;
	}
	.text1{
		text-align: center;
		font-size: xx-large;
		font-weight: bolder;
	}
	.block1{
		top: 10vh;
		border: 1px solid;
		border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	}
	.block2{
		position: fixed;
		top: 25vh;
		left: 47vw;
		width: 45vw;
		z-index: 5;
		border-radius: 15px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
		background-color: white;
	}
	.block3{
		position: fixed;
		width: 45vw;
		right: 8vw;
		bottom: 10vh;
		border-radius: 15px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
		background-color: white;
	}
	.button1{
	    font-size: x-large;
    }

	.swal2-popup {
		font-size: 1.6rem !important;
	}
</style>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
<!-- 各自的navbar -->
<div class="navbar-wrap">
    <nav class="navbar-meals">
    <img alt="" src="${contextRoot}/uploaded/food-menu-solid-24.png">
    
    <a href="${contextRoot}/addComment" class="navbarlogo"><button style="background-color: white;"><i class='bx bxs-comment-detail bx-lg' style="display: flex; justify-content: center; color: black;"></i>意見回復</button></a>
    
    
    <a href="${contextRoot}/nameComments/1" class="navbarlogo"><button style="background-color: white;"><i class='bx bx-book-content bx-lg' style="display: flex; justify-content: center; color: black;"></i>查詢留言</button></a>
    <a href="${contextRoot}/customerService" class="navbarlogo"><button style="background-color: white;"><i class='bx bxs-chat bx-lg' style="display: flex; justify-content: center; color: black;"></i>線上交流</button></a>
    </nav>
</div>
<!-- 各自的navbar(end) -->
<div class="background"></div>
	<br>
	<div style="padding-left: 20px;" >
		<h1 style="font-weight: 600; text-align: left ; font-size: 5rem;">意見回覆</h1>
    <br>
	<iframe id="id_iframe" name="nm_iframe" style="display: none;"></iframe>
       <div class="col-5">
		<div class="card" >
			<div class="card-header text1" >回報內容</div>
			<div class="card-body">
				<form:form class="form"  action="${contextRoot}/addComment" modelAttribute="Comments" method="POST" target="nm_iframe"> 
				
				<form:label path="comment" class="card-header row1" style="display:block;">留言信息</form:label>
				<form:textarea path="comment" class="form-control coulmn" style="display: block;"/>
				<br>
				<form:label path="categorysBean" class="card-header row1" style="display:block;">問題類別</form:label>
				<form:select path="categorysBean" class="form-control coulmn" id="category" >
				<form:options items="${categoryMap}" />
				</form:select>
			
				<form:select  path="conditionsBean" class="form-control" style="display:none"> <%--隱藏欄位 --%>
				<form:options items="${firstCondition}"  />
				</form:select>
				<br>
				<input class="btn btn-info button1" type="submit" name="submit" id="Btn" value="提交"/>
				
				</form:form>
				
			</div>
		</div>
     </div>
	 
</div>
<div class="block2">
<h2 style="font-weight: 600; color: red; padding-left: 20px ;padding-top: 10px; font-size: 3rem;">注意事項</h2>
<p class="p1">1.請隨時留意回報單之狀態與內容，處理時間因回報單內容而有所不同，還請您耐心等候！</p>
<p class="p1">2.請勿重複填單，避免減緩客服處理問題速度。</p>
<p class="p1">3.若資料填答不實或不全，客服將無法處理，為避免延誤處理時效，請詳細填寫。</p>
<p class="p1">4.目前僅接受符合檢舉條件之內容的填單。</p>
<p class="p1">5.若需店家或相關人員查詢可能需要一段工作天處理且不含例假日。</p>
<p class="p1">6.已解決、結案的回報單無法再做回應，若有任何疑問請重新填單，感謝您的配合。</p>
<p class="p1">7.填單回報時，若是有故意造假或刻意陷害他人，將不予受理。</p>
</div>
<div class="block3"> 
<h2 style="font-weight: 600; color: red; padding-left: 20px ;padding-top: 10px; font-size: 3rem;">遊戲瑕疵退換貨</h2>
<h3 style="padding-left: 20px; font-weight: 600;" >一、請在您購買的門市進行退換貨
退換貨原則如下：</h3>
<p class="p1">1. 須憑購買發票(免開發票門市除外)</p>
<p class="p1">2.遊戲購買後一經拆封，除非內容物有短少，瑕疵，否則一律不予退還或是更換其他商品。</p>
<p class="p1">3.遊戲請在購買後七天內拆封，若有短少，瑕疵請與購買日起算七天內拿回店家更換相同產品，超過期限恕不進行更換。</p>

<h3 style="padding-left: 20px ; font-weight: 600;">
二、如您在活動展覽中所購買的遊戲</h3>
<p class="p1">請與購買日起算七天內來電到您所購買的主辦門市電話，如不清楚電話可透過客服中心解決您的問題。</p>

</div>
<script>
	$("#category").change(function(){
		let res = $(this).val();
		console.log(res);
		if(res==6) {
			var str = "<br><label id='product1' class='card-header row1 ' style='display:block;'>產品</label><select class='form-control coulmn' id='product' name='product'>" 
			$.ajax({
				url:"http://localhost:8080/homepage/ajax/product",
				dataType: "JSON",
				method: "GET",
				success: function(result){
					console.log(result)
					$.each(result,function(index, value){
						str += "<option value="+"'"+index+"'"+">"+value+"</option>"
						console.log(index);
						console.log(value);
						//console.log(str);

					})
					str +="</select>"
								console.log(str)
					$("#category").after(str)
				},
				error: function(err){
             			console.log(err)
             			alert('發生錯誤')
				}
			})
		}
		else{
			$("#product").remove();
			$("#product1").remove()
		}
	})
	$("#Btn").click(function(){
		Swal.fire({
			title: "已成功提交留言",
			icon: "success",
			buttons: true,
			
		});
	})
	
</script>
</body>
</html>