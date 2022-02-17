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

	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			<h3 class="cm_title">출퇴근 관리</h3>
			<hr class="cm_underLine">
			

			<h4 class="cm_title">전 사원 근태 현황</h4>
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
				</div>


                <div>
                    <span class="sm_title">이름</span>
                    <input type="text" class="dateInput" placeholder="이름" name="userName">
                    <button id="cmSelBtn" onclick="ajaxAdCmSelectSearch(1);">조 회</button>
                </div>
                
                <br>
                
                <div style="margin-left: 160px">
                	<a href="#" data-toggle="modal" data-target="#absenceModal">오늘 날짜에 출근하지 않은 사원 '결근' 처리</a>
           		</div>
           		
           		<!-- Modal -->
				<div class="modal fade" id="absenceModal" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							
								<div class="modal-body" align="center">
									<br>
									오늘 날짜에 출근하지 않은 사원들을 <br>
									결근처리 하시겠습니까? <br>
									<button class="cmBtn" data-dismiss="modal" onclick="location.href='adAbsenceHandle.cm'">확인</button>
									<button class="cmBtn" id="endBtn" data-dismiss="modal">취소</button>
								</div>
							</form> 
							
						</div>
					</div>
				</div>
				
			</div>

			<br><br><br><br>

			
			<div class="select-area" style="width: 80%; margin: auto;">
				<h6 style="float: left;">조회 결과 <b id="selectCount">xx</b>건</h6>
			
				<table class="table" style="text-align: center;">
				  	<thead>
						<tr>
							<th width="16.6%">날짜</th>
                            <th width="16.6%">이름</th>
							<th width="16.6%">근무 상태</th>
							<th width="16.6%">출근 시간</th>
							<th width="16.6%">퇴근 시간</th>
							<th width="16.6%">근무 시간</th>
						</tr>
				  	</thead>
				  	<tbody>
						<tr>
							<td>2022-01-19</td>
                            <td>김철수</td>
							<td>정상</td>
							<td>09:00:53</td>
							<td>18:00:10</td>
							<td>8:00</td>
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
				ajaxAdSelectCommuteList(1);
			})
			
			function ajaxAdSelectCommuteList(cpageNo) {
				
				$.ajax({
					url: "adList.cm",
					type: "POST",
					data: {
						currentPage: cpageNo
					}, success:function(result) {
						let value="";
	    				for(let i in result.list) {
	    					value += "<tr>"
	    						   +	"<td>" + result.list[i].cmDate + "</td>"
	    						   +	"<td>" + result.list[i].userName + "</td>"
   						   
	    						   if(result.list[i].cmState == 1) { value += "<td>" + "정상" + "</td>" }
	    						   else if(result.list[i].cmState == 2) { value += "<td>" + "지각" + "</td>" }
	    						   else if(result.list[i].cmState == 3) { value += "<td>" + "결근" + "</td>" }
	    						   else if(result.list[i].cmState == 4) { value += "<td>" + "조퇴" + "</td>" }
	    						   else { value += "<td>" + "휴가" + "</td>" }
	    						   
	    						   if(result.list[i].cmStartTime == 'undefined' || result.list[i].cmStartTime == undefined) { value += "<td>0</td>" }
	    						   else { value += "<td>" + result.list[i].cmStartTime + "</td>" }
	    						   
	    						   if(result.list[i].cmEndTime == 'undefined' || result.list[i].cmEndTime == undefined) { value += "<td>0</td>" }
	    						   else { value += "<td>" + result.list[i].cmEndTime + "</td>" }
	    						   
	    						   if(result.list[i].cmWorkingHours == 'undefined' || result.list[i].cmWorkingHours == undefined) { value += "<td>0</td>" }
	    						   else { value += "<td>" + result.list[i].cmWorkingHours + "</td>" }
	    					
	    					value  += "</tr>";
	    				}
	    				
	    				console.log(result);
	    				
	    				$(".select-area tbody").html(value);
	    				$("#selectCount").text(result.listCount);
	    				

	    				let paging="";
	    				if(result.pi.currentPage == 1) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
	    				} else {
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxAdSelectCommuteList(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
	    				}
						
	    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
	    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxAdSelectCommuteList(" + p + ")'>" + p + "</a></li>";
	    				}
						
	    				if(result.pi.currentPage == result.pi.maxPage) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
	    				} else {
	    					
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxAdSelectCommuteList(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
	    				}
						
	    				$(".pagination").html(paging);
	    				
					}, error:function() {
						console.log("근태리스트 조회용 ajax 통신실패");
					}
				})
			}
			
			
			function ajaxAdCmSelectSearch(cpageNo) {
				
				$.ajax({
					url: "adSearch.cm",
					data: {
						startday: $('input[name=startday]').val(),
						endday: $('input[name=endday]').val(),
						userName: $('input[name=userName]').val(),
						cmStatus: $('input[name=cm_status]:checked').val(),
						currentPage: cpageNo
					}, success:function(result) {
						
						console.log(result)
						
						let value="";
	    				for(let i in result.searchList) {
	    					value += "<tr>"
	    						   +	"<td>" + result.searchList[i].cmDate + "</td>"
	    						   +	"<td>" + result.searchList[i].userName + "</td>"
   						   
	    						   if(result.searchList[i].cmState == 1) { value += "<td>" + "정상" + "</td>" }
	    						   else if(result.searchList[i].cmState == 2) { value += "<td>" + "지각" + "</td>" }
	    						   else if(result.searchList[i].cmState == 3) { value += "<td>" + "결근" + "</td>" }
	    						   else if(result.searchList[i].cmState == 4) { value += "<td>" + "조퇴" + "</td>" }
	    						   else { value += "<td>" + "휴가" + "</td>" }
	    						   
	    						   if(result.searchList[i].cmStartTime == 'undefined' || result.searchList[i].cmStartTime == undefined) { value += "<td>0</td>" }
	    						   else { value += "<td>" + result.searchList[i].cmStartTime + "</td>" }
	    						   
	    						   if(result.searchList[i].cmEndTime == 'undefined' || result.searchList[i].cmEndTime == undefined) { value += "<td>0</td>" }
	    						   else { value += "<td>" + result.searchList[i].cmEndTime + "</td>" }
	    						   
	    						   if(result.searchList[i].cmWorkingHours == 'undefined' || result.searchList[i].cmWorkingHours == undefined) { value += "<td>0</td>" }
	    						   else { value += "<td>" + result.searchList[i].cmWorkingHours + "</td>" }
	    						   
	    					value += "</tr>";
	    				}
	    					    				
	    				$(".select-area tbody").html(value);
	    				$("#selectCount").text(result.searchCount);
	    				
	    				let paging="";
	    				if(result.pi.currentPage == 1) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
	    				} else {
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxAdCmSelectSearch(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
	    				}
						
	    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
	    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxAdCmSelectSearch(" + p + ")'>" + p + "</a></li>";
	    				}
						
	    				if(result.pi.currentPage == result.pi.maxPage) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
	    				} else {
	    					
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxAdCmSelectSearch(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
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