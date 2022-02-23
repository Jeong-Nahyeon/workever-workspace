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
		width:1150px;
		padding-top:50px;
		padding-bottom:100px;
		}
		
		.modal-body div{
			margin:20px;
		}
		
		#reserveCheck th{
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
	
	<!-- 예약하기 모달 -->

      <div class="modal fade" id="reservation">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
	          <!-- 모달 헤더 -->
	            <div class="modal-header">
	              <h4 class="modal-title" style="margin:auto;">회의실 예약</h4>
	            </div>
	            
	            <!-- 모달 바디 -->
           	<form action="insert.mr" method="post">
	            <div class="modal-body">
            		<div id="mrDate">
            			<h5>예약 날짜</h5>
            			<input type="text" id="reservationDate" name="mrReservationDate" required>
            		</div>
            		<div id="mrName">
            			<h5>회의실 명</h5>
            			<c:forEach var="mr" items="${ mrList }">
            				<input type="radio" name="mrCode" id="${ mr.mrCode }" class="btn" value="${ mr.mrCode }" required><label for="${ mr.mrCode }">${ mr.mrName }</label>&nbsp;&nbsp;&nbsp;
            			</c:forEach>
            		</div>
            		<div id="mrTime">
            			<h5>예약 시간</h5>
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
            		<div id="mrUse">
            			<h5>사용 용도</h5>
            			<textarea name="mrUse" style="resize:none;width:500px;" rows="6" required></textarea>
            		</div>
	            </div>
	            
	            <!-- 모달 푸터 -->
	            <div class="modal-footer">
	              <button type="reset" class="btn btn-default" data-dismiss="modal" >취소</button>
	              <button type="submit" class="btn btn-primary">예약하기</button>
	            </div>
           	</form>
	      </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      <!-- 예약확인 모달 -->

      <div class="modal fade" id="reserveCheck">
        <div class="modal-dialog modal-default">
          <div class="modal-content">
	          <!-- 모달 헤더 -->
	            <div class="modal-header">
	              <h4 class="modal-title" style="margin:auto;">예약 상세 내역</h4>
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
		            			<th>예약 날짜</th>
		            			<td id="reserveDate"></td>
		            		</tr>
		            		<tr>
		            			<th>예약 시간</th>
		            			<td id="reserveTime"></td>
		            		</tr>
		            		<tr>
		            			<th>사용 용도</th>
		            			<td id="reserveUse"></td>
		            		</tr>
		            	</table>
		            </div>
		            
		            <!-- 모달 푸터 -->
		            <div class="modal-footer" id="reserveCheckBtn">
		              
		            </div>
	            </form>
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
					myCustomButton: {
					text: '예약하기',
					click: function() {
						$("#reservation").modal("show");
						
					}
					}
				},
				headerToolbar: {
					left  : 'prev,next today',
					center: 'title',
					right : 'myCustomButton'
				},
				themeSystem: 'bootstrap',
				displayEventTime          : true,
			    displayEventEnd           : true,
			    eventClick:function(arg){
					
			    	$("#reserveCheck").modal("show");
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
			    			if(result.mrReservationStatus == 'R'){
			    				deleteBtn += "<button type='submit' class='btn btn-default' id='reserveCancel'>예약 취소</button>" + 
			  	              				 "<button class='btn btn-primary' data-dismiss='modal' id='userSelectBtn'>확인</button>"
			    			}else {
			    				deleteBtn += "<button type='button' class='btn btn-default' data-dismiss='modal' disabled>사용 완료</button>" +
			    							"<button class='btn btn-primary' data-dismiss='modal' id='checkBtn'>확인</button>"
			    			}
			    			
			    			$("#reserveCheckBtn").html(deleteBtn);
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
		    		
		    		$('#reservation').on('hidden.bs.modal', function (e) {
		    			$("#mrTime").hide();
		    			$("#mrUse").hide();
		    			$(this).find('form')[0].reset();
		    		});
		   })

		   
     </script>
</body>
</html>