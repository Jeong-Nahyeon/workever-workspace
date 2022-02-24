<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
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
							<div class="direct-chat-text">Is this template really for
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
							<div class="direct-chat-text">You better believe it!</div>
							<!-- /.direct-chat-text -->
						</div>
						<!-- /.direct-chat-msg -->
					</div>
					<!--/.direct-chat-messages-->

				</div>
				<!-- /.card-body -->

				<div class="card-footer">
					<form action="#" method="post">
						<div class="input-group">
							<input type="text" name="message" placeholder="Type Message ..."
								class="form-control"> <span class="input-group-append">
								<button type="submit" class="btn btn-primary">Send</button>
							</span>
						</div>
					</form>
				</div>
				<!-- /.card-footer-->
			</div>
			<!--/.direct-chat -->
		</div>
		<!-- /.col -->
	</div>

	<script>
	
		// 웹소켓
	    let websocket = null;
	
	    //입장 버튼을 눌렀을 때 호출되는 함수
	    function connect() {
	        // 웹소켓 주소
	        let wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/echo.do";
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