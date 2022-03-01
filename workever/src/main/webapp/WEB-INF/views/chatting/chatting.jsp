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
		width: 480px;
		height: 530px;
		margin: 10px;
		overflow-y:auto;
		background-color: #f4f6f9;		
	}
	
	#message {
		margin: 10px;
		width: 375px;
		display: table-cell;
	}
	
	#sendBtn {
		margin-bottom: 5px;
		background-color: #4e73df;
		border-color: #4e73df;
	}
	
	.chat {
		margin: 10px;
	}
	
	.userName-area {
		margin-bottom: 8px;
	}
	
	.userName {
		color: gray;
		font-weight: bold;
	}
	
	.chatMsg {
		background-color: #fff;
		border-radius: 10px;
		padding: 8px;
		text-align: left;
		margin: 5px;
	}
	
	.chatTime {
		font-size: 11px;
		color: #999;
	}

	
</style>
<body>
	<div id="messageArea"></div>
	<input type="text" id="message" class="form-control" autocomplete="off" />
	<input type="button" id="sendBtn" value="submit" class="btn btn-primary" />	


	<script>
		
		$(function(){
			$('#message').keydown(function(key){
				if(key.keyCode == 13){
					sendMessage();
					$('#message').val('');
					$('#message').focus();
				}
			});
			
			$('#sendBtn').click(function(){
				sendMessage();
				$('#message').val('');
				$('#message').focus();
			});
		})
	
		let sock = new SockJS("http://" + location.host + "/wk/echo-handle/");
		
		var userName = '${loginUser.userName}';
		
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		
		// 메시지 전송
		function sendMessage() {
			
			var msg = document.getElementById("message").value;
			// ** textarea 사용 시 **
			// 값에서 엔터를 <br>태그로 변경하기
			// msg = msg.replace(/(?:\r\n|\r|\n)/g, "<br />");
			
			var date = new Date();
			var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
			
			var data = "<div class='chat'>"
						+ "<div class='userName-area'><span class='userName'>" + userName + "<span></div>"
						+ "<div>"
						+ 	"<span class='chatMsg'>" + msg + "</span>"
						+ 	"<span class='chatTime'>" + dateInfo + "</span>"
						+ "</div>"
			     	  +"</div>"
			
			sock.send(data);
		}
		
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			var data = msg.data;
			
			$("#messageArea").append(data);
			$("#messageArea").scrollTop($("#messageArea")[0].scrollHeight); // 스크롤 하단 내리기
		}
		
		
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			// $("#messageArea").append("연결 끊김");
			console.log("onClose");
	
		}
		
	</script>


</body>
</html>