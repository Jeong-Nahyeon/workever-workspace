<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>

	<!-- Direct Chat -->
	<div class="row">
		<div class="col-md-3">

			<!-- DIRECT CHAT PRIMARY -->
			<div
				class="card card-primary card-outline direct-chat direct-chat-primary"
				style="width: 400; margin: 10px;">
				<div class="card-header">
					<h3 class="card-title">대화 상대 이름</h3>

					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							onclick="window.close();">
							<i class="fas fa-times"></i>
						</button>
					</div>
				</div>
				
				<!-- /.card-header -->
				<div class="card-body">
					<!-- Conversations are loaded here -->
					<div class="direct-chat-messages" style="height: 75vh; !important">
						<!-- Message. Default to the left -->
						<div class="direct-chat-msg">
							<div class="direct-chat-infos clearfix">
								<span class="direct-chat-name float-left">Alexander
									Pierce</span> <span class="direct-chat-timestamp float-right">23
									Jan 2:00 pm</span>
							</div>
							<!-- /.direct-chat-infos -->
							<img class="direct-chat-img" src=""
								alt="Message User Image">
							<!-- /.direct-chat-img -->
							
							<div class="direct-chat-text chatLeft">Is this template really for
								free? That's unbelievable!</div>
							<!-- /.direct-chat-text -->
						</div>
						<!-- /.direct-chat-msg -->

						<!-- Message to the right -->
						<div class="direct-chat-msg right">
							<div class="direct-chat-infos clearfix">
								<span class="direct-chat-name float-right">Sarah Bullock</span>
								<span class="direct-chat-timestamp float-left">23 Jan
									2:05 pm</span>
							</div>
							<!-- /.direct-chat-infos -->
							<img class="direct-chat-img" src=""
								alt="Message User Image">
							<!-- /.direct-chat-img -->
							
							<div class="direct-chat-text chatRight">You better believe it!</div>
							<!-- /.direct-chat-text -->
						</div>
						<!-- /.direct-chat-msg -->
					</div>
					<!--/.direct-chat-messages-->

				</div>
				<!-- /.card-body -->

				<div class="card-footer">
					<!-- <form action="#" method="post"> -->
						<div class="input-group">
							<input type="text" id="message" name="message" placeholder="Type Message ..."
								class="form-control"> <span class="input-group-append">
								<button type="button" id="sendBtn" class="btn btn-primary">Send</button>
							</span>
						</div>
					<!-- </form> -->
				</div>
				<!-- /.card-footer-->
			</div>
			<!--/.direct-chat -->
		</div>
		<!-- /.col -->
	</div>
	
	<script>
	
		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('')
		});
	
		let sock = new SockJS("http://" + location.host + "/wk/echo/");
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		
		// 메시지 전송
		function sendMessage() {
			sock.send($("#message").val());
		}
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			var data = msg.data;
			$(".chatLeft").append(data);
		}
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			console.log("연결 끊김");
			// $("#messageArea").append("연결 끊김");
	
		}
		
	</script>
	

	<script>
	
		// 웹소켓
	    var websocket;
	
	    // 채팅 입장 호출 함수
	    function connect() {
	        // 웹소켓 주소
	        var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket";
	        // 소켓 객체 생성
	        websocket = new WebSocket(wsUri);
	        //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
	        websocket.onopen = onOpen;
	        websocket.onmessage = onMessage;
	    	
	    }
	        console.log(websocket);
	    
	    //웹 소켓에 연결되었을 때 호출될 함수
	    function onOpen() {
	    }
	    
	   	// * 1 메시지 전송
	   	function sendMessage(message){
	   	}
	   
	    // * 2 메세지 수신
	    function onMessage(evt) {
	   	}

	</script>>
</body>
</html>