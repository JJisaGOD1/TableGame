<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/dashboard.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Server WS</title>
    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<style>
    .text1{
        text-align: center;
        font-size: xx-large;
        font-weight: bolder;
    }
    .button1{
	    font-size: large;
    }
</style>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <br><br>
    <div class="container" style="margin-left: 29vw; width:70vw;">
        <div class="row" style="width: 65vw; font-size: x-large;  font-weight: 500;">
            <div class="col-md-9">
                <form class="form-inline">
                    <div class="form-group">
                        <label for="message">訊息輸入:&nbsp;&nbsp;</label>
                        <input type="text" id="message" class="form-control" placeholder="Public message ">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>

                    <button id="send" class="btn btn-primary button1" type="button">Send</button>
                    &nbsp;&nbsp;
                    <button id="clear" class="btn btn-danger button1" type="button">Clear</button>

                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-9">
                <table id="message-history " class="table table-striped">
                    <thead>
                    <tr>
                        <th class="text1">訊息欄</th>
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
var clientId = null;
console.log(contextRoot)

$(document).ready(function() {
    console.log("Index page is ready");
    connect();

    $("#send").click(function() {   //傳送訊息
        message=$("#message").val();
        console.log(message);
        sendMessage();
    });

    $("#clear").click(function() {
        $('#messages').empty();
    })

});
function connect() {
    var socket = new SockJS(contextRoot + '/prob-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/account/messages', function (message) {  //訂閱接收訊息 (全域)
            showMessage(JSON.parse(message.body).content);     
        });
    });
}

function showMessage(message) {                                     //接收訊息
    $("#messages").append("<tr><td>" + message + "</td></tr>");
}

function sendMessage() {                                            //傳送訊息
    console.log("sending message");
    stompClient.send("/ws/problemServer", {}, JSON.stringify({'messageContent': $("#message").val()}));
}


</script>

</body>
</html>