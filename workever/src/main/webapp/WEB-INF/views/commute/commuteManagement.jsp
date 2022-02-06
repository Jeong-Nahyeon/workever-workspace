<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.cm_title {
		margin: 20px 0 0 20px;
	}

	.cm_underLine {
		border: 0px; /* 기본 hr의 border 제거 */
		height: 2px; /* 두께 지정 */
		background-color: lightgray;
		margin-bottom: 50px;
	}

	.cmBtn {
		margin: 20px 5px;
		width: 130px;
		height: 35px;
		line-height: 35px;
		border: 0px;
		font-weight: bold;
		color: white;
		border-radius: 5px;
	}

	.cmBtn:hover {
		cursor: pointer;
		filter: brightness(85%);
	}

	#startBtn {
		background-color: #4E73DF;
	}

	#endBtn {
		background-color: #858796;
	}

	#display_date {
		font-size: 40px;
		color: #858796;
	}

	#display_clock {
		font-size: 70px;
	}

	.sm_title {
		font-size: 15px;
		font-weight: bold;
		margin: 50px;
	}


</style>
</head>
<body onload="showClock()">

	<jsp:include page="../common/head.jsp" />
	
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
				<button class="cmBtn" id="endBtn">퇴 근</button>
			</div>
		</div>
		<!-- /.content-wrapper -->





		<h4 class="cm_title">출퇴근 조회</h4>
		<hr class="cm_underLine">

		<div>
			<span class="sm_title">기간 조회</span>
			<input type="date">

			<br>
			
			<span class="sm_title">근무 상태</span>
		</div>
				
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>