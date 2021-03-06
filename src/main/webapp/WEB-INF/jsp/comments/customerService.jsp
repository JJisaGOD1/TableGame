<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer WS</title>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
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
    td{
        font-size: large;
    }
    .imgblock{
        position: fixed;
        right: 12vw;
        top: 20vh;
        width: 30vw;
    }
    .text1{
        text-align: center;
        font-size: xx-large;
        font-weight: bolder;
    }
    .sendbox{
        width: 33vw;
        background-color: white;
        position: fixed;
        right: 12vw;
        top: 75vh;
        border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
    .text2{
        font-size: x-large;
    }
    .button1{
	    font-size: x-large;
        margin-bottom: 2vh;
    }
    .button2{
        position: absolute;
        left: -15vw;
        font-size: x-large;
        margin-bottom: 2vh;
    }    
</style>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</head>
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
<div><img src="${contextRoot}/uploaded/chategg.png" class="imgblock"></div>
    <br>
    <div class="container sendbox" >
        
        <div class="row" style="width: 50vw; font-size: x-large; margin: 0px auto; font-weight: 500;" >
            <div class="col-md-9" >
                <form class="form-inline">
                    <div class="form-group">
                    	<div class="form-group">
                    	<input type="hidden" id="clientName" class="form-control" value="${member.cusName}">
                    	</div>
                        <label for="message ">訊息輸入:&nbsp;&nbsp;</label>
                        <input type="text" id="message" class="form-control text2" placeholder="訊息輸入">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <button id="send" class="btn btn-secondary button1" type="button">送出</button>
                </form>
            </div>
        </div>
         <div class="row" style="width: 50vw; font-size: x-large; margin: 0px auto; font-weight: 500;">
            <div class="col-md-9">
                <form class="form-inline">
                    <div class="form-group">
                        <label for="private-message">Server私訊:&nbsp;&nbsp;</label>
                        <input type="text" id="private-message" class="form-control text2" placeholder="Server 私訊">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <button id="send-private" class="btn btn-dark button1" type="button">私訊送出</button>
                </form>
            </div>
        </div>
    </div>
        <div class="container">
        <div class="row">
            <div class="col-md-9" >
                <table id="message-history" class="table table-striped" style="background-color: white; margin-left: -35vh;">
                    
                    <thead>
                    <tr>
                        <button id="clear" class="btn btn-danger button2" type="button">清除</button>
                        <th class="text1">對話信息</th>
                    </tr>
                    </thead>
                    <tbody id="messages">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
    
    <script src="<c:url value='/webjars/sockjs-client/sockjs.min.js'/>"></script>

    <script src="<c:url value='/webjars/stomp-websocket/stomp.min.js'/>"></script> 
    
<script>
var stompClient = null;
var notificationCount = 0;
var contextRoot = "${contextRoot}"
var clientName = $("#clientName").val();
console.log(contextRoot)
console.log(clientName)
$(document).ready(function() {
    console.log("Index page is ready");
    connect();

    $("#send").click(function() {   //傳送訊息
        sendMessage();
    });

    $("#send-private").click(function() {
        sendPrivateMessage();
    });

    $('#clear').click(function(){
        $('#messages').empty();
    })
});
function connect() {
    var socket = new SockJS(contextRoot + '/our-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/messages', function (message) {  //訂閱接收訊息(全域)
            console.log(message)
        	showMessage(JSON.parse(message.body).content);     
        });

        stompClient.subscribe('/user/topic/private-messages', function (message) { //client端私訊自端
            showMessage(JSON.parse(message.body).content);
        });
    });
}

function showMessage(message) {                                     //接收訊息
    $("#messages").append("<tr><td>" + message + "</td></tr>");
}

function sendMessage() {                                            //傳送訊息
    console.log("sending message");
    stompClient.send("/ws/customerMessage", {}, JSON.stringify({'messageContent': $("#message").val(), 'clientName':clientName}));
}

function sendPrivateMessage() {
    console.log("sending private message");
    stompClient.send("/ws/private/server/message", {}, JSON.stringify({'messageContent': $("#private-message").val(),'clientName':clientName}));
    stompClient.send("/ws/private/customer/message", {}, JSON.stringify({'messageContent': $("#private-message").val(),'clientName':clientName}));
}

</script>

</body>
</html>