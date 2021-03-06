<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/accountProblemBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .background{
        background-image: url("${contextRoot}/uploaded/chatwallpaper.jpg");
        background-repeat: none;
        background-size: 200%;
		width: 100vw;
		height: 100vh;
		position: fixed;
		z-index: -90;
        opacity: 0.7;
		top: 0;

    }
    .accountblock{
        position: fixed;
        top: 50vh;
        z-index: 10;

    }
    .buttonclear{
        position: absolute;
        top: 1vh;
        right: -37vw;
    }

</style>
<script src="<c:url value='/webjars/sockjs-client/sockjs.min.js'/>"></script>
<script src="<c:url value='/webjars/stomp-websocket/stomp.min.js'/>"></script>
</head>
<body>
<div class="background"></div>
<br>
<h1 style="font-weight: 600; margin-left: 5vw;">帳務客服</h1>
<div class="container" style="margin-top: 20px">
        <div class="row">
            <div class="col-md-5 accountblock">
                <form class="form-inline">
                    <div class="form-group">
                        <label for="message"></label>
                        <input type="text" id="message" class="form-control" placeholder="Enter message ">
                    </div>
                    <button id="send" class="btn btn-dark" type="button">送出</button>
                </form>
            </div>
        </div>
   </div>
   
   <div class="container">
    <div class="row">
        <div class="col-md-7" >
            <table id="message-history" class="table table-striped" style="background-color: white; margin-left: 40vw;">
                <thead>
                <tr>
                    <button id="clear" class="btn btn-danger buttonclear" type="button">清除</button>
                    <th style="font-size: larger;">Message</th>
                </tr>
                </thead>
                <tbody id="messages">
                </tbody>
            </table>
        </div>
    </div>
</div>


<script type="text/javascript">
var contextRoot = "${contextRoot}"
console.log(contextRoot);

$(document).ready(function() {
    console.log("Index page is ready");
    connect();

    $("#send").click(function() {   //傳送訊息
        sendMessage();
    });

    $('#clear').click(function(){
        $('#messages').empty();
    });
});

function connect() {
    var socket = new SockJS(contextRoot + '/prob-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/account/messages', function (response) {  //訂閱接收訊息(全域)
            console.log(response)
        	showMessage(JSON.parse(response.body).content);     
        });
    });
}

function showMessage(response) {                                     //接收訊息
    $("#messages").append("<tr><td>" + response + "</td></tr>");
}
function sendMessage() {                                            //傳送訊息
    console.log("sending message");
    stompClient.send("/ws/problemClient", {}, JSON.stringify({'messageContent': $("#message").val()}));
}
</script>
</body>
</html>