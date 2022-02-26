<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<script src="plugins/toastr/toastr.min.js"></script>
<script>
		var socket = null;
		
		$(document).ready(function(){
			connectWs();
			//readAlarms();
		})
			
		
		function connectWs(){
			
			var ws = new WebSocket("ws://localhost:8007/wk/echo");
			socket = ws;
			
			// 커넥션 연결됐을 때 실행 (클라이언트 접속 시)
			ws.onopen = function(){ 
				console.log('info: connection opened.');
				
			};
		
			// 메세지가 왔을 때 실행
			ws.onmessage = function(event) {
				console.log(event.data+'\n');
				toastr.options.positionClass = "toast-bottom-right";
				toastr.success(event.data)	
			};
			
			// 커넥션 끊겼을 때
			ws.onclose = function(event) {
				console.log('info: connection closed.');
				//setTimeout(function(){ connect(); }, 1000);
			};
			
			// 에러났을 때
			ws.error = function(error) {
				console.log('error: '+ error);
			};
		}
	</script>