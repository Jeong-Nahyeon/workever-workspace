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
			msgCount();
			//readAlarms();
			
			$("#alertBtn").click(function(){
				let alertList = "";
			
				$.ajax({
					url:"alertSelect.al",
					data:{loginUserNo:${loginUser.userNo}},
					success:function(result){
						for(let i in result){
							alertList += "<div class='dropdown-divider'></div>"
									  +     "<a href='#' class='dropdown-item' val='" +  result[i].alertUrl + "' onclick='alertCheck(this);')>"
									  +			"<input type='hidden' name='alertUrl' value='" + result[i].alertUrl + "'>"
									  +			"<input type='hidden' name='alertNo' value='" + result[i].alertNo + "'>"
									  +    		"<div class='alertArea' style='width:100%'>"
									  +     		"<div class='alertTitle'>"
									  +     			"<span style='font-size:15px;font-weight:700;margin-right:30px;'>" + result[i].alertType + "</span>"
									  +     			"<span style='font-size:12px;'>" + result[i].alertDate + "</span>"
									  +     		"</div>"
									  +    			"<div class='alertContent'><p style='word-break:break-all;font-size:12px;'>" + result[i].alertContent + "</p></div>"
									  +    		"</div>"
									  +     "</a>";
						}
						
						$("#alertDropdown").html(alertList);
					},error:function(){
						console.log("ajax통신 실패");
					}
				})
			})
			
			/*
			$("#alertDropdown  a").click(function(){
				console.log("클릭");
				$.ajax({
					url:"alertCheck.al",
					data:{alertNo:$(this).val()},
					success:function(result){
						console.log("ajax통신 성공");
					},error:function(){
						console.log("ajax통신 실패");
					}
				})
				
			})*/
			
			
		})
			
		function alertCheck(e){
			$.ajax({
				url:"alertCheck.al",
				data:{alertNo:$(e).children("input[name=alertNo]").val()},
				success:function(result){
					console.log("ajax통신 성공");
				},error:function(){
					console.log("ajax통신 실패");
				}
			})
			location.href = $(e).children("input[name=alertUrl]").val();
		}
		
		function connectWs(){
			
			var ws = new WebSocket("ws://" + location.host + "/wk/echo");
			socket = ws;
			
			// 커넥션 연결됐을 때 실행 (클라이언트 접속 시)
			ws.onopen = function(){ 
				console.log('info: connection opened.');
				
			};
		
			// 메세지가 왔을 때 실행
			ws.onmessage = function(event) {
				console.log(event.data+'\n');
				toastr.options.positionClass = "toast-bottom-right";
				toastr.success(event.data);
				msgCount();
				
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
		
		function msgCount(){
			$.ajax({
				url:"alertCount.al",
				data:{loginUserNo:${loginUser.userNo}},
				success:function(result){
						if(result > 0){
							$("#alertCount").text(result);
						}else{
							$("#alertCount").text(0);
						}
				},error:function(){
					console.log("ajax통신 실패");
				}
			})
		}
		
		
	</script>