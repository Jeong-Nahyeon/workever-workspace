<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
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
	
	.page-link {
		cursor: pointer;
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
				<button class="cmBtn" id="startBtn" onclick="ajaxInsertEnter();" >출 근</button>
				<button class="cmBtn" id="endBtn" data-toggle="modal" data-target="#endModal">퇴 근</button>		
			</div>
			
			<%-- 
			<form id="commuteForm" action="" method="post">
					<input type="hidden" name="userNo" value="${ loginUser.userNo }">
	       	</form>
			
			<script>
           		function commuteFormSubmit(num) {
           			if(num == 1) {
           				$("#commuteForm").attr("action", "enter.cm").submit();
           			} else {
           				$("#commuteForm").attr("action", "leave.cm").submit();
           			}
           		}
           	</script>
			--%>

			<!-- Modal -->
			<div class="modal fade" id="endModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						
						<div class="modal-body" align="center">
							<br>
							지금 시간은 
							<fmt:formatDate value="${now}" pattern="HH시mm분" var="now" />
							<c:out value="${now}" />
							입니다. <br>
							정말로 퇴근하시겠습니까? <br>
							<button class="cmBtn" data-dismiss="modal" onclick="ajaxUpdateLeave();">확인</button>
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
						<input type="date" class="dateInput" name="startday"> <b>~</b>&emsp; <input type="date" class="dateInput" name="endday"> 
					</div>
	
					<br>
					
					<div>
						<span class="sm_title" style="margin-bottom: 50px;">근무 상태</span>
						<label><input type="radio" name="cm_status" value="1">정상</label>
						<label><input type="radio" name="cm_status" value="2">지각</label>
						<label><input type="radio" name="cm_status" value="3">결근</label>
						<label><input type="radio" name="cm_status" value="4">조퇴</label>
						<label><input type="radio" name="cm_status" value="5">휴가</label>
						<button id="cmSelBtn" onclick="ajaxSelectSearch(1);">조 회</button>
					</div>
				
			</div>

			<br><br><br><br>
			
			
			<div class="select-area" style="width: 80%; margin: auto;">
				<h6 style="float: left;">조회 결과 <b id="selectCount">xx</b>건</h6>
			
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
				  			<td>2022-02-10</td>
				  			<td>정상</td>
				  			<td>08:59:04</td>
				  			<td>18:00:16</td>
				  			<td>8:01</td>
				  		</tr>
				  	</tbody>
				</table>
				
				<br>
					
			</div>
				
			<div class="card-footer" style="background-color: #f4f6f9;">
				<nav aria-label="Contacts Page Navigation">
					<ul class="pagination justify-content-center m-0">

					</ul>
				</nav>
			</div>
		</div>
					

		<script>
			$(function(){
				ajaxSelectCommuteList(1);
			})
			
			
			function ajaxSelectCommuteList(cpageNo) {
				
				$.ajax({
					url: "list.cm",
					type:"POST",
					data: {
							userNo: '${loginUser.userNo}',
							currentPage: cpageNo
					}, success:function(result) {
						
						let value="";
	    				for(let i in result.list) {
	    					value += "<tr>"
	    						   +	"<td>" + result.list[i].cmDate + "</td>"
   						   
	    						   if(result.list[i].cmState == 1) { value += "<td>" + "정상" + "</td>" }
	    						   else if(result.list[i].cmState == 2) { value += "<td>" + "지각" + "</td>" }
	    						   else if(result.list[i].cmState == 3) { value += "<td>" + "결근" + "</td>" }
	    						   else if(result.list[i].cmState == 4) { value += "<td>" + "조퇴" + "</td>" }
	    						   else { value += "<td>" + "휴가" + "</td>" }
	    						   
	    						   
	    					value  +=	"<td>" + result.list[i].cmStartTime + "</td>"
	    						   +	"<td>" + result.list[i].cmEndTime + "</td>"
	    						   +	"<td>" + result.list[i].cmWorkingHours + "</td>"
	    						   + "</tr>";
	    				}
	    				
	    				console.log(result);
	    				
	    				$(".select-area tbody").html(value);
	    				$("#selectCount").text(result.listCount);
	    				

	    				let paging="";
	    				if(result.pi.currentPage == 1) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
	    				} else {
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectCommuteList(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
	    				}
						
	    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
	    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxSelectCommuteList(" + p + ")'>" + p + "</a></li>";
	    				}
						
	    				if(result.pi.currentPage == result.pi.maxPage) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
	    				} else {
	    					
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectCommuteList(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
	    				}
						
	    				$(".pagination").html(paging);
	    				
	    				
	    					
					}, error:function() {
						console.log("근태리스트 조회용 ajax 통신실패");
					}

				})
			}
			
			
			
			function ajaxInsertEnter() {
				
				$.ajax({
					url: "enter.cm",
					type:"POST",
					data: {
						userNo: '${loginUser.userNo}'
					}, success:function(result) {
						
						if(result == "success") {
							ajaxSelectCommuteList(1);
							
							alert("출근 성공 ㅠ");
							
						} else {
							ajaxSelectCommuteList(1);
							
							alert("출근 실패 ㅠ");
						}
						
					}, error:function() {
						console.log("출근 기록용 ajax 통신실패");
					}
				})
			}
			
			
			
			function ajaxUpdateLeave() {
				
				$.ajax({
					url: "leave.cm",
					type: "POST",
					data: {
						userNo: '${loginUser.userNo}'
					}, success:function(result) {
						
						if(result == "success") {
							ajaxSelectCommuteList(1);
							
							alert("퇴근을 축하합니다~");
							
						} else {
							ajaxSelectCommuteList(1);
							
							alert("퇴근 실패ㅠ");
							
						}
						
					}, error:function() {
						console.log("퇴근 기록용 ajax 통신실패");
					}
				})
			}
			
			
			function ajaxSelectSearch(cpageNo) {
				
				$.ajax({
					url: "search.cm",
					data: {
						userNo: '${loginUser.userNo}',
						startday: $('input[name=startday]').val(),
						endday: $('input[name=endday]').val(),
						cmStatus: $('input[name=cm_status]:checked').val(),
						currentPage: cpageNo
					}, success:function(result) {
						
						console.log(result);
						
						let value="";
	    				for(let i in result.searchList) {
	    					value += "<tr>"
	    						   +	"<td>" + result.searchList[i].cmDate + "</td>"
   						   
	    						   if(result.searchList[i].cmState == 1) { value += "<td>" + "정상" + "</td>" }
	    						   else if(result.searchList[i].cmState == 2) { value += "<td>" + "지각" + "</td>" }
	    						   else if(result.searchList[i].cmState == 3) { value += "<td>" + "결근" + "</td>" }
	    						   else if(result.searchList[i].cmState == 4) { value += "<td>" + "조퇴" + "</td>" }
	    						   else { value += "<td>" + "휴가" + "</td>" }
	    						   
	    						   
	    					value  +=	"<td>" + result.searchList[i].cmStartTime + "</td>"
	    						   +	"<td>" + result.searchList[i].cmEndTime + "</td>"
	    						   +	"<td>" + result.searchList[i].cmWorkingHours + "</td>"
	    						   + "</tr>";
	    				}
	    					    				
	    				$(".select-area tbody").html(value);
	    				$("#selectCount").text(result.searchCount);
	    				
	    				let paging="";
	    				if(result.pi.currentPage == 1) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
	    				} else {
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectSearch(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
	    				}
						
	    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
	    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxSelectSearch(" + p + ")'>" + p + "</a></li>";
	    				}
						
	    				if(result.pi.currentPage == result.pi.maxPage) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
	    				} else {
	    					
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectSearch(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
	    				}
	    										
	    				$(".pagination").html(paging);
						
						
					}, error:function() {
						console.log("근태 검색용 ajax 통신실패")
					}
				})
			}
			
		</script>
			
			
		</div>
		<!-- /.content-wrapper -->
		
				
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>