<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello WS</title>

</head>
<body>
<h1>Customer服務</h1>
    <div class="container" style="margin-left: 25vw; width:70vw;">
        <div class="row " style="width: 50vw;" >
            <div class="col-md-8" >
                <form class="form-inline">
                    <div class="form-group">
                    	<div class="form-group">
                    	<input type="hidden" id="name" class="form-control" value="${member.cusName}">
                    	</div>
                        <label for="message">Message 輸入</label>
                        <input type="text" id="message" class="form-control" placeholder="訊息輸入">
                    </div>
                    <button id="send" class="btn btn-secondary" type="button">送出</button>
                </form>
            </div>
        </div>
        <!-- <div class="row" style="margin-top: 10px">
            <div class="col-md-12">
                <form class="form-inline">
                    <div class="form-group">
                        <label for="private-message">Private Message</label>
                        <input type="text" id="private-message" class="form-control" placeholder="Enter your message here...">
                    </div>
                    <button id="send-private" class="btn btn-default" type="button">Send Private Message</button>
                </form>
            </div>
        </div> -->
        <div class="row">
            <div class="col-md-8" >
                <table id="message-history" class="table table-striped">
                    <thead>
                    <tr>
                        <th>訊息欄位</th>
                    </tr>
                    </thead>
                    <tbody id="messages">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <script src="<c:url value='/webjars/sockjs-client/sockjs.min.js'/>"></script>

    <script src="<c:url value='/webjars/stomp-websocket/stomp.min.js'/>"></script> 
    
<script>
var stompClient = null;
var notificationCount = 0;
var contextRoot = "${contextRoot}"
console.log(contextRoot)
$(document).ready(function() {
    console.log("Index page is ready");
    connect();

    $("#send").click(function() {   //傳送訊息
        sendMessage();
    });

    $("#send-private").click(function() {
        sendPrivateMessage();
    });
});
function connect() {
    var socket = new SockJS(contextRoot + '/our-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/messages', function (message) {  //訂閱接收訊息
            showMessage(JSON.parse(message.body).content);     
        });

        stompClient.subscribe('/user/topic/private-messages', function (message) {
            showMessage(JSON.parse(message.body).content);
        });
    });
}

function showMessage(message) {                                     //接收訊息
    $("#messages").append("<tr><td>" + message + "</td></tr>");
}

function sendMessage() {                                            //傳送訊息
    console.log("sending message");
    stompClient.send("/ws/customerMessage", {}, JSON.stringify({'messageContent': $("#message").val(), 'userId':$("#name").val()}));
}

function sendPrivateMessage() {
    console.log("sending private message");
    stompClient.send("/ws/private/message", {}, JSON.stringify({'messageContent': $("#private-message").val()}));
}

</script>

</body>
</html>