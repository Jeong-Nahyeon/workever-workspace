<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../common/links.jsp" />
	
<style>

	.cm_title {
		padding: 20px 0 0 20px;
	}

	.cm_underLine {
		border: 0px; /* 기본 hr의 border 제거 */
		height: 2px; /* 두께 지정 */
		width: 98%;
		background-color: lightgray;
		margin-bottom: 50px;
	}

	.cmBtn {
		margin: 20px 5px;
		width: 150px;
		height: 35px;
		line-height: 35px;
		border: 0px;
		font-weight: bold;
		border-radius: 5px;
	}

	.cmBtn:hover {
		cursor: pointer;
		filter: brightness(85%);
	}

	#startBtn {
		background-color: #4E73DF;
		color: white;
	}

	#endBtn {
		background-color: #858796;
		color: white;
	}

	#display_date {
		font-size: 40px;
		color: #858796;
	}

	#display_clock {
		font-size: 70px;
	}

	.sm_title {
		font-size: 20px;
		font-weight: bold;
		margin: 50px;
	}

	.dateInput {
		font-size: 20px;
		margin: 0 20px 0 0;
		border: 2px solid lightgray;
		border-radius: 5px;
		padding-left: 10px;
	}

	input[type="radio"] {
		transform: scale(1.5);
		margin: 0 10px 0 0;
	}

	label {
		font-size: 20px;
		margin: 0 20px 0 0;
	}

	#cmSelBtn {
		margin: 20px 0px 0px 0px;
		width: 150px;
		height: 35px;
		line-height: 35px;
		border: 1px solid lightgray;
		font-weight: bold;
		border-radius: 5px;
	}

	#cmSelBtn:hover {
		cursor: pointer;
		filter: brightness(85%);
	}


</style>
</head>
	
<body class="hold-transition sidebar-mini">
	
	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			<h3 class="cm_title">출퇴근 관리</h3>
			<hr class="cm_underLine">
			 

			<script>

				function displayClock() {

				let today = new Date();
				
				let minutes = today.getMinutes().toString();
				minutes = minutes.length==1 ? 0+minutes : minutes;
				
				let seconds = today.getSeconds().toString();
				seconds = seconds.length==1 ? 0+seconds : seconds;
				
				let month = (today.getMonth() +1).toString();
				month = month.length==1 ? 0+month : month;
				
				let dt = today.getDate().toString();
				dt = dt.length==1 ? 0+dt : dt;

				var week = ['SUN', 'MON', 'THU', 'WED', 'THU', 'FRI', 'SAT'];
				week = week[today.getDay()];

				let ampm = today.getHours( ) >= 12 ? ' PM' : ' AM';
				hours = today.getHours( ) % 12;
				hours = hours ? hours : 12;
				hours = hours.toString().length==1? 0+hours.toString() : hours;
				
				let date = today.getFullYear() + "-" + month + "-" + dt + " " + week; 
				let clock = hours + ":" +  minutes + ":" +  seconds;
				let apm = ampm;

				document.getElementById('display_date').innerHTML = date;
				document.getElementById('display_clock').innerHTML = clock;
				document.getElementById('display_apm').innerHTML = apm;
				}
				
				function currentClock() {
					setInterval('displayClock()', 1000);
				}

				currentClock();

			</script>
			
			
			<div id="time" style="text-align: center;">
				
				<span id="display_date"></span> <br>
				<span id="display_clock" style="font-size: 70px;"></span>
				<span id="display_apm" style="font-size: 30px;"></span>

			</div>
		    
		    

			<div style="text-align: center;">
				<button class="cmBtn" id="startBtn" >출 근</button>
				<button class="cmBtn" id="endBtn" data-toggle="modal" data-target="#endModal">퇴 근</button>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="endModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						
						<div class="modal-body" align="center">
							<br>
							지금 시간은 xx시 xx분입니다.<br>
							정말로 퇴근하시겠습니까? <br>
							<button class="cmBtn">확인</button>
							<button class="cmBtn" id="endBtn" data-dismiss="modal">취소</button>
						</div>
						
					</div>
				</div>
			</div>

			<h4 class="cm_title">출퇴근 조회</h4>
			<hr class="cm_underLine"> <br>
	
			<div id="cm_select" style="width: 800px; margin: auto;">
				<div>
					<span class="sm_title">날짜</span>
					<input type="date" class="dateInput"> <b>~</b>&emsp; <input type="date" class="dateInput"> 
				</div>

				<br>
				
				<div>
					<span class="sm_title" style="margin-bottom: 50px;">근무 상태</span>
					<label><input type="radio" name="cm_status" value="normal" checked="checked">정상</label>
					<label><input type="radio" name="cm_status" value="tardiness">지각</label>
					<label><input type="radio" name="cm_status" value="absence">결근</label>
					<label><input type="radio" name="cm_status" value="earlyLeave">조퇴</label>
					<label><input type="radio" name="cm_status" value="leave">휴가</label>
					<button id="cmSelBtn">조 회</button>
				</div>
				
			</div>

			<br><br><br><br>


			
			
			<div class="select-area" style="width: 80%; margin: auto;">
				<h6 style="float: left;">조회 결과 <b>xx</b>건</h6>
			
				<table class="table" style="text-align: center;">
				  	<thead>
						<tr>
							<th width="20%">날짜</th>
							<th width="20%">근무 상태</th>
							<th width="20%">출근 시간</th>
							<th width="20%">퇴근 시간</th>
							<th width="20%">근무 시간</th>
						</tr>
				  	</thead>
				  	<tbody>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
						</tr>
				  	</tbody>
				</table>
			</div>

			<br>

			<div class="paging-area" align="center"; style="padding: 20px 0px 100px 0px;">
				페이징
			</div>


		</div>
		<!-- /.content-wrapper -->
		
				
		<jsp:include page="../common/footer.jsp" />
	</div>
	
	<jsp:include page="../common/scripts.jsp" />

</body>
</html>