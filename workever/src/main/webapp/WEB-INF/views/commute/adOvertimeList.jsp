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
    .ot_title {
		padding: 20px 0 0 20px;
	}
	
	.ot_title > a {
		text-decoration-line: none;
		color: black;
	}

	.ot_underLine {
		border: 0px; /* 기본 hr의 border 제거 */
		height: 2px; /* 두께 지정 */
		width: 98%;
		background-color: lightgray;
		margin-bottom: 50px;
	}

    .sm_title {
		font-size: 20px;
		font-weight: bold;
		margin: 50px 50px 50px 60px;
	}

	.dateInput, #overtimeReason {
		font-size: 20px;
		margin: 0 20px 0 0;
		border: 2px solid lightgray;
		border-radius: 5px;
		padding-left: 10px;
	}

	#otSelBtn {
		margin: 20px 0px 0px 25px;
		width: 150px;
		height: 35px;
		line-height: 35px;
		border: 1px solid lightgray;
		font-weight: bold;
		border-radius: 5px;
	}

    #otSelBtn:hover {
		cursor: pointer;
		filter: brightness(85%);
	}

    .text-overflow {
		width: 350px; /* 말줄임 처리 위해 width 설정 */
		display: block; /* 너비를 가질 수 있도록 설정 */
		white-space: nowrap; /* 내용이 넘치면 자동줄바꿈되는 것을 해제 */
		overflow: hidden; /* 넘치는 부분을 hidden */
		text-overflow: ellipsis; /* 텍스트의 말줄임표(...) 처리 */
	}

	.table>tbody>tr>td>a {
		color: black;
		text-decoration: none;
		font-weight: bold;
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
            <h3 class="ot_title"><a href="adCommute.ot">연장근무 관리</a></h3>
			<hr class="ot_underLine">


			<h4 class="ot_title">연장근무 조회</h4>
			<hr class="ot_underLine"> <br>

            <div style="width: 700px; margin: auto;">
				<div>
					<span class="sm_title">날짜</span>
					<input type="date" class="dateInput" name="startday"> <b>~</b>&emsp; <input type="date" class="dateInput" name="endday"> 
				</div>

                <div>
                    <span class="sm_title">이름</span>
					<input type="text" class="dateInput" name="userName" style="height: 35px;" placeholder="이름">
					<button id="otSelBtn" onclick="ajaxAdSelectOvertimeSearch(1)">조 회</button>
                </div>

			</div>

            <br><br><br>

			<div class="select-area" style="width: 80%; margin: auto;">
				<h6 style="float: left;">조회 결과 <b id="selectCount">xx</b>건</h6>
			
				<table class="table" style="text-align: center;">
				  	<thead>
						<tr>
						<th width="25%">날짜</th>
                        <th width="25%">이름</th>
						<th width="25%">연장 근무시간</th>
						<th width="25%">상태</th>
						</tr>
				  	</thead>
				  	<tbody>

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
			
			<script>
				$(function(){
					ajaxAdSelectOvertimeList(1)
				})
				
				function ajaxAdSelectOvertimeList(cpageNo) {
					
					$.ajax({
						url: "adList.ot",
						type: "POST",
						data: {
							currentPage: cpageNo
						}, success:function(result) {
							
							let value="";
		    				for(let i in result.list) {
		    					value += "<tr>"
		    						   +	"<input type='hidden' name='apvlNo' value='" + result.list[i].apvlNo + "'>"
		    						   +	"<td>" + result.list[i].otDate + "</td>"
		    					       + 	"<td>" + result.list[i].apvlWriterName + "</td>"
									   +	"<td>" + result.list[i].otWorkingHours + "</td>"	   
		    					 
										   if(result.list[i].apvlStatus == 'S') {
											   value += "<td>대기</td>";
										   } else if(result.list[i].apvlStatus == 'I') {
											   value += "<td>진행중</td>";
										   } else if(result.list[i].apvlStatus == 'C') {
											   value += "<td>완료</td>";
										   } else if(result.list[i].apvlStatus == 'R') {
											   value += "<td class='do_return'>반려</td>";
										   } else {
											   value += "<td>회수</td>";
										   }
										   
		    					value += "</tr>";
		    				}
		
		    					    				
		    				$(".select-area tbody").html(value);
		    				$("#selectCount").text(result.listCount);
		    			
		    				let paging="";
		    				if(result.pi.currentPage == 1) {
		    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
		    				} else {
		    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxAdSelectOvertimeList(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
		    				}
							
		    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
		    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxAdSelectOvertimeList(" + p + ")'>" + p + "</a></li>";
		    				}
							
		    				if(result.pi.currentPage == result.pi.maxPage) {
		    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
		    				} else {
		    					
		    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxAdSelectOvertimeList(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
		    				}
		    										
		    				$(".pagination").html(paging);
							
						}, error:function() {
							console.log("연장근무리스트 조회용 ajax 통신실패");
						}
					})
				}
				
				
				function ajaxAdSelectOvertimeSearch(cpageNo) {
					
					$.ajax({
						url: "adSearch.ot",
						type: "POST",
						data: {
							startday: $('input[name=startday]').val(),
							endday: $('input[name=endday]').val(),
							userName : $('input[name=userName]').val(),
							currentPage: cpageNo
						}, success:function(result) {
							
							console.log(result);
							
							let value="";
		    				for(let i in result.searchList) {
		    					value += "<tr>"
		    						   +	"<input type='hidden' name='apvlNo' value='" + result.searchList[i].apvlNo + "'>"
		    						   +	"<td>" + result.searchList[i].otDate + "</td>"
		    					       + 	"<td>" + result.searchList[i].apvlWriterName + "</td>"
									   +	"<td>" + result.searchList[i].otWorkingHours + "</td>"	   
		    					 
										   if(result.searchList[i].apvlStatus == 'S') {
											   value += "<td>대기</td>";
										   } else if(result.searchList[i].apvlStatus == 'I') {
											   value += "<td>진행중</td>";
										   } else if(result.searchList[i].apvlStatus == 'C') {
											   value += "<td>완료</td>";
										   } else if(result.searchList[i].apvlStatus == 'R') {
											   value += "<td class='do_return'>반려</td>";
										   } else {
											   value += "<td>회수</td>";
										   }
										   
		    					value += "</tr>";
		    				}
		    					    				
		    				$(".select-area tbody").html(value);
		    				$("#selectCount").text(result.searchCount);
		    				
		    				let paging="";
		    				if(result.pi.currentPage == 1) {
		    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
		    				} else {
		    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectDayoffSearch(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
		    				}
							
		    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
		    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxSelectDayoffSearch(" + p + ")'>" + p + "</a></li>";
		    				}
							
		    				if(result.pi.currentPage == result.pi.maxPage) {
		    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
		    				} else {
		    					
		    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxSelectDayoffSearch(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
		    				}
		    										
		    				$(".pagination").html(paging);
							
						}, error:function() {
							console.log("연장근무 검색용 ajax 통신실패");
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