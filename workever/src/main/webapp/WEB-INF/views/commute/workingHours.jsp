<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../common/links.jsp" />
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script> 

<style>


	.wh_title {
		padding: 20px 0 0 20px;
	}

	.wh_underLine {
		border: 0px; /* 기본 hr의 border 제거 */
		height: 2px; /* 두께 지정 */
		width: 98%;
		background-color: lightgray;
		margin-bottom: 50px;
	}

	.sm_title {
		font-size: 20px;
		font-weight: bold;
		margin: 50px 50px 50px 0px;
	}

	.dateInput {
		font-size: 20px;
		margin: 0 20px 0 0;
		border: 2px solid lightgray;
		border-radius: 5px;
		padding-left: 10px;
	}

	#whSelBtn {
		margin: 20px 0px 0px 25px;
		width: 150px;
		height: 35px;
		line-height: 35px;
		border: 1px solid lightgray;
		font-weight: bold;
		border-radius: 5px;
	}

	#whSelBtn:hover {
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
			
			<h3 class="wh_title">월 근무 내역</h3>
			<hr class="wh_underLine">

			<div id="wh_select" style="width: 1000px; margin: auto;">
				<div align="center">
					<span class="sm_title">날짜</span>
					<input type="date" class="dateInput"> <b>~</b>&emsp; <input type="date" class="dateInput">
					<button id="whSelBtn">조 회</button>
				</div>

				<br><br><br>

				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<canvas id="doChart"></canvas>
						</div>
					</div>
				</div>

				<script>
					let doChart = document.getElementById('doChart').getContext('2d');

					let lineChart = new Chart(doChart, {
						type: 'line',
						data: {
							labels: ['2022-02-07', '2022-02-08', '2022-02-09', '2022-02-10', '2022-02-11'],
							datasets: [{
								label: '일별 근무시간',
								data: [
									8.04,
									7.89,
									8.00,
									4.09,
									8.00
								],
								fill: false,
								borderColor: '#4E73DF'
							}]
						}
					})
				</script>

			</div>

			<br><br><br>

			<div class="select-area" style="width: 80%; margin: auto;">
				<h6 style="float: left;">조회 결과 <b>xx</b>건</h6>
			
				<table class="table" style="text-align: center;">
				  	<thead>
						<tr>
						<th width="25%">날짜</th>
						<th width="25%">근무 시간</th>
						<th width="25%">연장 근무시간</th>
						<th width="25%">총 근무시간</th>
						</tr>
				  	</thead>
				  	<tbody>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
							<td>8:00</td>
						</tr>
						<tr>
							<td>2022-01-19</td>
							<td>8:00</td>
							<td>0</td>
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