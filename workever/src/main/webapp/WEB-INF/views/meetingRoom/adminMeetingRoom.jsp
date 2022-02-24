<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workever</title>
    
	<jsp:include page="../common/links.jsp" />
	<!-- fullCalendar -->
  	<link rel="stylesheet" href="plugins/fullcalendar/main.css">
  	<!-- Daterange picker -->
  	<link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<style>
		#meetingRoom-area{
		/* border:1px solid black; */
		margin:auto;
		width:1050px;
		padding-top:50px;
		padding-bottom:100px;
		}
		
		.modal-body div{
			margin:20px;
		}
		
		#disabledCheck th{
			font-size:20px;
			height:50px;
			width:130px;
		}
		
		.modal{
			margin-top:150px;
		}
		
		#mrTime, #mrUse{
			display:none;
		}
		
		.mrDelete, .updateCheck, #addMr{
		background: #4E73DF;
		color:white;
		}
		
		.mrUpdate{
		background: rgb(133, 135, 150);
		color:white;
		}
		
		#mrSet th{
		background:rgb(224, 224, 224);
		height:40px;
		
		}
		
		#mrSet input{
		 width:100%;
		}
		
		#addModal, #deleteModal{
		margin-top:200px;
		}
	</style>
</head>
<body>
    <div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<br><br>
			<h3>&nbsp;&nbsp;&nbsp;회의실 예약</h3>
			<hr>
			<div id="meetingRoom-area">
                
                
          
					<div class="card card-primary">
					<div class="card-body p-0">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.card-body -->
					</div>
					<!-- /.card -->
			
                
           
                
                

			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
	
	<!-- 비활성화 모달 -->

      <div class="modal fade" id="disabled">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
	          <!-- 모달 헤더 -->
            <div class="modal-header">
              <h4 class="modal-title" style="margin:auto;">회의실 비활성화</h4>
            </div>
	            
            <!-- 모달 바디 -->
           	<form action="disable.mr" method="post">
	            <div class="modal-body">
            		<div id="mrDate">
            			<h5>비활성 날짜</h5>
            			<input type="text" id="reservationDate" name="mrReservationDate" required>
            		</div>
            		<div id="mrName">
            			<h5>회의실 명</h5>
            			<c:forEach var="mr" items="${ mrList }">
            				<input type="radio" name="mrCode" id="${ mr.mrCode }" class="btn" value="${ mr.mrCode }" required><label for="${ mr.mrCode }">${ mr.mrName }</label>&nbsp;&nbsp;&nbsp;
            			</c:forEach>
            		</div>
            		<div id="mrTime">
            			<h5>비활성 시간</h5>
            			<select name="mrStartTime" id="mrStartTime">
            				<option>--선택--</option>
            				<option value='08'>08:00</option>
   							<option value='09'>09:00</option>
   							<option value='10'>10:00</option>
   							<option value='11'>11:00</option>
   							<option value='12'>12:00</option>
   							<option value='13'>13:00</option>
   							<option value='14'>14:00</option>
   							<option value='15'>15:00</option>
   							<option value='16'>16:00</option>
   							<option value='17'>17:00</option>
   							<option value='18'>18:00</option>
   							<option value='19'>19:00</option>
            			</select>
            			~
            			<select name="mrEndTime" id="mrEndTime">
            				<option>--선택--</option>
            				<option value='09'>09:00</option>
   							<option value='10'>10:00</option>
   							<option value='11'>11:00</option>
   							<option value='12'>12:00</option>
   							<option value='13'>13:00</option>
   							<option value='14'>14:00</option>
   							<option value='15'>15:00</option>
   							<option value='16'>16:00</option>
   							<option value='17'>17:00</option>
   							<option value='18'>18:00</option>
   							<option value='19'>19:00</option>
   							<option value='20'>20:00</option>
            			</select>
            		</div>
            		
	            </div>
	            
	            <!-- 모달 푸터 -->
	            <div class="modal-footer">
	              <button type="reset" class="btn btn-default" data-dismiss="modal" >취소</button>
	              <button type="submit" class="btn btn-primary">비활성화</button>
	            </div>
           	</form>
	      </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      <!-- 비활성 확인 모달 -->

      <div class="modal fade" id="disabledCheck">
        <div class="modal-dialog modal-default">
          <div class="modal-content">
	          <!-- 모달 헤더 -->
	            <div class="modal-header">
	              <h4 class="modal-title" style="margin:auto;">비활성 내역</h4>
	            </div>
	            <form action="cancel.mr" method="post">
		            <!-- 모달 바디 -->
		            <div class="modal-body">
		            	<table>
		            		<tr>
		            			<th>회의실 명</th>
		            			<td id="reserveName"></td>
		            		</tr>
		            		<tr>
		            			<th>위치</th>
		            			<td id="reservePlace"></td>
		            		</tr>
		            		<tr>
		            			<th>비활성 날짜</th>
		            			<td id="reserveDate"></td>
		            		</tr>
		            		<tr>
		            			<th>비활성 시간</th>
		            			<td id="reserveTime"></td>
		            		</tr>
		            	</table>
		            </div>
		            
		            <!-- 모달 푸터 -->
		            <div class="modal-footer" id="disabledCheckBtn">
		              
		            </div>
	            </form>
	      </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      
      <!-- 회의실 관리 모달 -->

      <div class="modal fade" id="mrSet">
        <div class="modal-dialog modal-default">
          <div class="modal-content">
	          <!-- 모달 헤더 -->
	            <div class="modal-header">
	              <h4 class="modal-title" style="margin:auto;">회의실 관리</h4>
	            </div>
	            
		            <div class="modal-body">
		           		<h5>회의실 목록</h5>
		           		<br>
		           		<table style="width:100%;" id="mrListTb">
		           			<thead>
			           			<tr align="center">
				           			<th width="172.31px">회의실 명</th>
				           			<th width="172.31px">위치</th>
				           			<th>수정/삭제</th>
			           			</tr>
		           			</thead>
		           			<tbody>
			           			<c:forEach var="mr" items="${ mrList }">
			           				<tr align="center" height="40px">
			           					<td>${ mr.mrName }</td>
			           					<td>${ mr.mrPlace }</td>
			           					<td>
			           						<button class="btn btn-sm mrUpdate" value="${ mr.mrCode }">수정</button>
			           						<button class="btn btn-sm mrDelete" data-toggle="modal" value="${ mr.mrCode }" data-target="#deleteModal">삭제</button>
			           					</td>
			           				</tr>
			           			</c:forEach>
		           			</tbody>
		           		</table>
		           		<div align="center">
			           		<button id="addMr" class="btn btn-sm" data-toggle="modal" data-target="#addModal"><i class="fas fa-plus"></i>회의실 추가</button>
		           		</div>
		            </div>
		            
		            <!-- 모달 푸터 -->
		            <div class="modal-footer" id="mrSetBtn">
	              		<button type="submit" data-dismiss="modal" onclick="location.href='admin.mr'" class="btn btn-primary">확인</button>
		            </div>
	      </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      <!-- 회의실 삭제 모달 -->
      <div class="modal fade" id="deleteModal">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" align="center">
              <p>회의실을 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" id="deleteCheck">확인</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      
      <!-- 회의실 추가 모달 -->
      <div class="modal fade" id="addModal">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" style="margin:auto;">회의실 추가</h5>
            </div>
            <div class="modal-body" align="center">
              <table>
              	<tr>
              		<th width="100px" height="40px">회의실 명</th>
              		<td width="180px"><input type="text" name="mrName" required></td>
              	</tr>
              	<tr>
              		<th height="40px">위치</th>
              		<td><input type="text" name="mrPlace" required></td>
              	</tr>
              </table>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal" id="addCalcel">취소</button>
              <button type="submit" class="btn btn-primary" id="addCheck">확인</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      
	<jsp:include page="../common/scripts.jsp" />
	<!-- fullCalendar 2.2.5 -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/fullcalendar/main.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script>
	     document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
			    customButtons: {
					myCustomButton1: {
						text: '비활성화',
						click: function() {
							$("#disabled").modal("show");
							
						}
					},
					myCustomButton2: {
						text: '회의실 관리',
						click: function() {
							$("#mrSet").modal("show");
							
						}
					}
	        
				},
				headerToolbar: {
					left  : 'prev,next today',
					center: 'title',
					right : 'myCustomButton1 myCustomButton2'
				},
				themeSystem: 'bootstrap',
				displayEventTime          : true,
			    displayEventEnd           : true,
			    eventClick:function(arg){
					
			    	$("#disabledCheck").modal("show");
			    		let deleteBtn = "";
			    	$.ajax({
			    		url:"selectEvent.mr",
			    		data:{reserveNo : arg.event.id 
			    		},success:function(result){
			    			
			    			$("#reserveName").html(result.mrName);
			    			$("#reservePlace").text(result.mrPlace);
			    			$("#reserveDate").text(result.mrReservationDate);
			    			$("#reserveTime").text(result.mrStartTime +"-" + result.mrEndTime);
			    			$("#reserveUse").text(result.mrUse);
			    			
			    			deleteBtn += "<input type='hidden' name='mrReservationNo' value='" + result.mrReservationNo + "'>"
			    			if(result.mrReservationStatus == 'D'){
			    				deleteBtn += "<button type='submit' class='btn btn-default' id='reserveCancel'>비활성 취소</button>" + 
			  	              				 "<button class='btn btn-primary' data-dismiss='modal' id='userSelectBtn'>확인</button>"
			    			}else {
			    				deleteBtn += "<button class='btn btn-primary' data-dismiss='modal' id='checkBtn'>확인</button>"
			    			}
			    			
			    			$("#disabledCheckBtn").html(deleteBtn);
			    		},error:function(){
			    			console.log("ajax통신 실패");
			    		}
			    		
			    	})
			    	
				},
				//Random default events
				events: [
					$.ajax({
						url:"reservationList.mr",
						success:function(result){
							for(let i in result){
								calendar.addEvent({
									id:result[i].mrReservationNo,
									title:result[i].mrName,
									start:result[i].mrReservationDate+"T"+result[i].mrStartTime,
									end:result[i].mrReservationDate+"T"+result[i].mrEndTime,
									allDay: false
								})
							}
						},error:function(){
							console.log("ajax통신 실패");
						}
					})
				],
				
				eventTimeFormat: { // like '14:30:00'
				    hour: '2-digit',
				    meridiem: 'short'
				},
				editable  : false,
				});
	         calendar.render();
	       });

	     
		   $(function(){
		    		
	    		$.datepicker.setDefaults({
	                dateFormat: 'yy-mm-dd' //Input Display Format 변경
	                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	                ,changeYear: true //콤보박스에서 년 선택 가능
	                ,changeMonth: true //콤보박스에서 월 선택 가능                
	                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	                ,minDate: 0                
	            })
		            
	           $("#reservationDate").datepicker();
				
	    		$("input[name=mrCode]").click(function(){
	    			if($("#reservationDate").val().trim()==""){
	    				alert("날짜를 지정해주세요.")
	    			}else{
		    			$("#mrTime").show();
		    			$("#mrUse").show();
	    			}
	    		})
		    		
	    		$("input[name=mrCode]").change(function(){
	    			$("#mrStartTime").children().attr("disabled",false);
	    			$("#mrEndTime").children().attr("disabled",false);
	    			$("#mrStartTime option:eq(0)").prop("selected", true);
	    			$("#mrEndTime option:eq(0)").prop("selected", true);
	    			$.ajax({
	    				url:"selectTime.mr",
	    				data:{reserveDate:$("#reservationDate").val(),
	    					  mrCode:$("input[name=mrCode]:checked").val()},
	    				success:function(result){
	    					for( let i in result){
	    						
		    					$("#mrStartTime").children().each(function(){
		    						if($(this).val() >= result[i].mrStartTime && $(this).val() < result[i].mrEndTime){
		    							$(this).attr("disabled", true);
		    						}
		    					})
		    					$("#mrEndTime").children().each(function(){
		    						if($(this).val() > result[i].mrStartTime && $(this).val() <= result[i].mrEndTime){
		    							$(this).attr("disabled", true);
		    						}
		    					})
	    					}
	    				},error:function(){
	    					
	    				}
	    			})
	    		})
	    		
		    	
		    		
	    		$("select[name=mrEndTime]").change(function(){
	    			if($("select[name=mrStartTime] option:selected").val() >= $(this).val()){
	    				$("#mrEndTime option:eq(0)").prop("selected", true);
	    				alert("시작 시간 이후로 선택해 주세요.");
	    				
	    			}
	    		})
	    		
	    		$('#disabled').on('hidden.bs.modal', function (e) {
	    			$("#mrTime").hide();
	    			$("#mrUse").hide();
	    			$(this).find('form')[0].reset();
	    		});
	    		
		    		
		    		
	    		$(document).on("click", ".mrDelete", function(){
	    			$("#deleteCheck").val($(this).val());
	    			$("#deleteCheck").modal("show");
	    		})
	    		
	    		$("#deleteCheck").click(function(){
	    			$.ajax({
	    				url:"mrDelete.mr",
	    				data:{mrCode:$(this).val()},
	    				success:function(result){
	    					$("#deleteModal").modal("hide");
	    					$("#mrSet tr button").each(function(){
	    						if($(this).val()==result){
		    						$(this).parents("tr").remove();
	    						}
	    					})
	    				},error:function(){
	    					console.log("ajax통신 실패");
	    				}
	    			})
	    		})
		    		
	    		$(document).on("click", ".mrUpdate", function(){
	    			$(this).parents('tr').children().first().html("<input type='text' value='"+ $(this).parents('tr').children().first().text() + "' required>");
	    			$(this).parents('tr').children().first().next().html("<input type='text' value='"+ $(this).parents('tr').children().first().next().text() + "' required>");
	    			$(this).parents('td').html("<button class='btn btn-sm updateCheck' value='" + $(this).val() + "'>저장</button>");
	    		})
	    		
		    		
	           $(document).on("click", ".updateCheck", function() {
	        	   let mrName = $(this).parents('tr').children().first().children().val();
	    		   let mrPlace = $(this).parents('tr').children().first().next().children().val();
	    			$.ajax({
	    				url:"mrUpdate.mr",
	    				context: this, 
	    				data:{mrCode:$(this).val(),
	    					  mrName:mrName,
	    					  mrPlace:mrPlace},
	    				success:function(result){
	    					$(this).parents('tr').children().first().html(result.mrName);
	    					$(this).parents('tr').children().first().next().html(result.mrPlace);
	    					$(this).parents('td').html("<button class='btn btn-sm mrUpdate' value='" + result.mrCode + "'>수정</button>" +
          												   "<button class='btn btn-sm mrDelete' data-toggle='modal' value='" + result.mrCode + "' data-target='#deleteModal'>삭제</button>");
	    				},error:function(){
	    					console.log("ajax통신 실패");
	    				}
	    			})
	           });
		    		
		    		
	    		$("#addCheck").click(function(){
	    			
	    			if($("input[name=mrName]").val().trim() == "" || $("input[name=mrPlace]").val().trim() == ""){
	    				alert("내용을 입력해주세요.");
	    			}else {
	    				let mrList = "";
		    			$.ajax({
		    				url:"mrAdd.mr",
		    				data:{comNo:${loginUser.comNo},
		    					  mrName:$("input[name=mrName]").val(),
		    					  mrPlace:$("input[name=mrPlace]").val()},
		    				success:function(result){
		    					$("#addModal").modal("hide");
		    						
		    					for( let i in result){
			    					mrList += "<tr align='center' height='40px'>"
					           				+	"<td>" + result[i].mrName + "</td>"
					           				+	"<td>" + result[i].mrPlace + "</td>"
					           				+	"<td>"
					           				+		"<button class='btn btn-sm mrUpdate' value='" + result[i].mrCode + "'>수정</button>"
					           				+		"<button class='btn btn-sm mrDelete' data-toggle='modal' value='" + result[i].mrCode + "' data-target='#deleteModal'>삭제</button>"
					           				+	"</td>"
					           				+ "</tr>";
		    					}
		    					
		    					$("#mrListTb tbody").html(mrList);
		    					$("input[name=mrName]").val("");
		    		    		$("input[name=mrPlace]").val("");
		    				},error:function(){
		    					console.log("ajax통신 실패");
		    				}
		    			})
	    			}
	    		})
		    		
		    	$("#addCalcel").click(function(){
		    		$("input[name=mrName]").val("");
		    		$("input[name=mrPlace]").val("");
		    	})
		    		
		    		
		    		
		   })

		   
     </script>
</body>
</html>