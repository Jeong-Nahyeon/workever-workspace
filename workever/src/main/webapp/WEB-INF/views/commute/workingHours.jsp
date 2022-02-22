<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
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
					<input type="date" class="dateInput" name="startday"> <b>~</b>&emsp; <input type="date" class="dateInput" name="endday">
					<button id="whSelBtn" onclick="ajaxSelectWorkingHoursSearch(1)">조 회</button>
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
					
					
					
				</script>

			</div>

			<br><br><br>

			<div class="select-area" style="width: 80%; margin: auto;">
				<h6 style="float: left;">조회 결과 <b id="selectCount">xx</b>건</h6>
			
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
				  	</tbody>
				</table>
			</div>

			<br>

			<div class="card-footer" style="background-color: #f4f6f9;">
				<nav aria-label="Contacts Page Navigation">
					<ul class="pagination justify-content-center m-0">

					</ul>
				</nav>
			</div>
		</div>
		<!-- /.content-wrapper -->
		
		
		<script>
				$(function(){
					ajaxSelectWorkingHoursList(1)
				})
				
				function ajaxSelectWorkingHoursList(cpageNo) {
					
					$.ajax({
						url: "list.wh",
						type: "POST",
						data: {
							userNo: '${loginUser.userNo}',
							currentPage: cpageNo
						}, success:function(result) {
							
							console.log(result);
							
							let value="";
		    				for(let i in result.list) {
		    					value += "<tr>"
		    						   +	"<td>" + result.list[i].cmDate + "</td>"
									   +	"<td>" + result.list[i].cmWorkingHours + "</td>"	   
		    					       + 	"<td>" + result.list[i].otWorkingHours + "</td>"
		    					       +	"<td>" + result.list[i].totalWorkingHours + "</td>"
		    					value  + "</tr>";
		    				}
		
		    					    				
		    				$(".select-area tbody").html(value);
		    				$("#selectCount").text(result.listCount);
		    			
		    				let paging="";
		    				if(result.pi.currentPage == 1) {
		    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
		    				} else {
		    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectWorkingHoursList(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
		    				}
							
		    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
		    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxSelectWorkingHoursList(" + p + ")'>" + p + "</a></li>";
		    				}
							
		    				if(result.pi.currentPage == result.pi.maxPage) {
		    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
		    				} else {
		    					
		    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectWorkingHoursList(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
		    				}
		    										
		    				$(".pagination").html(paging);
		    				
		    				
		    				// chart
		    				
		    				chartDate=[];
	           				chartTime=[];
		    				
	           				for(let i in result.list) {
	           					chartDate.push(result.list[i].cmDate);
	           					chartTime.push(result.list[i].totalWorkingHours);
	           				}
		    				
		    				
	        				let doChart = document.getElementById('doChart').getContext('2d');

	        				let lineChart = new Chart(doChart, {
	        					type: 'line',
	        					data: {
	        						labels: chartDate, // x축
	        						datasets: [{
	        							label: '일별 근무시간',
	        							data: chartTime, // y축
	        							fill: false,
	        							borderColor: '#4E73DF'
	        						}]
	        					}
	        				})
		    				
							
						}, error:function() {
							console.log("연장근무리스트 조회용 ajax 통신실패");
						}
					})
				}
				
				
				function ajaxSelectWorkingHoursSearch(cpageNo) {
					
					$.ajax({
						url: "search.wh",
						type: "POST",
						data: {
							userNo: '${loginUser.userNo}',
							startday: $('input[name=startday]').val(),
							endday: $('input[name=endday]').val(),
							currentPage: cpageNo
						}, success:function(result) {
							
							console.log(result);
							
							let value="";
							for(let i in result.searchList) {
								value += "<tr>"
		    						   +	"<td>" + result.searchList[i].cmDate + "</td>"
									   +	"<td>" + result.searchList[i].cmWorkingHours + "</td>"	   
		    					       + 	"<td>" + result.searchList[i].otWorkingHours + "</td>"
		    					       +	"<td>" + result.searchList[i].totalWorkingHours + "</td>"
		    					value  + "</tr>";
		    				}
		    					    				
		    				$(".select-area tbody").html(value);
		    				$("#selectCount").text(result.searchCount);
		    				
		    				let paging="";
		    				if(result.pi.currentPage == 1) {
		    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
		    				} else {
		    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectWorkingHoursSearch(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
		    				}
							
		    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
		    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxSelectWorkingHoursSearch(" + p + ")'>" + p + "</a></li>";
		    				}
							
		    				if(result.pi.currentPage == result.pi.maxPage) {
		    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
		    				} else {
		    					
		    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectWorkingHoursSearch(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
		    				}
		    										
		    				$(".pagination").html(paging);
		    				
		    				
		    				// chart
		    				
		    				chartDate=[];
	           				chartTime=[];
		    				
	           				for(let i in result.searchList) {
	           					chartDate.push(result.searchList[i].cmDate);
	           					chartTime.push(result.searchList[i].totalWorkingHours);
	           				}
		    				
		    				
	        				let doChart = document.getElementById('doChart').getContext('2d');

	        				let lineChart = new Chart(doChart, {
	        					type: 'line',
	        					data: {
	        						labels: chartDate, // x축
	        						datasets: [{
	        							label: '일별 근무시간',
	        							data: chartTime, // y축
	        							fill: false,
	        							borderColor: '#4E73DF'
	        						}]
	        					}
	        				})
		    				
		    				
						}, error:function() {
							console.log("근무내역 검색용 ajax 통신실패");
						}
					})
				}
			</script>
			
		
		<jsp:include page="../common/footer.jsp" />
	</div>

	
</body>
</html>