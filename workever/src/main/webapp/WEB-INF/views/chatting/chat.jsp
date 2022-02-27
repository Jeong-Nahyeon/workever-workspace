<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<style>
	#messageArea {
		width: 400px;
		height: 600px;
		border: 1px solid lightgray;
		margin: 10px;
		overflow-y:auto;
		display:flex !important;
		flex-direction:column_reverse !important;
		
	}
	
	#message {
		margin: 10px;
		width: 330px;
		display: table-cell;
	}
	
	#sendBtn {
		margin-bottom: 5px;
		background-color: #4e73df;
		border-color: #4e73df;
	}
	
	
</style>
<body>
	<div id="messageArea"></div>
	<input type="text" id="message" class="form-control" autocomplete="off" />
	<input type="button" id="sendBtn" value="submit" class="btn btn-primary" />	
</body>

<script>
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('');
	});

	let sock = new SockJS("http://" + location.host + "/wk/echo-handle/");
	var userName = '${loginUser.userName}';
	
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 메시지 전송
	function sendMessage() {
		msg = document.getElementById("message").value;
		sock.send(userName + ": " + msg);
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
		
		//<div class="timeline-item">
		//<span class="time"> 5 mins ago</span>
		//<h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request</h3>
		//</div>
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		// $("#messageArea").append("연결 끊김");
		console.log("onClose");

	}
</script>



</html>