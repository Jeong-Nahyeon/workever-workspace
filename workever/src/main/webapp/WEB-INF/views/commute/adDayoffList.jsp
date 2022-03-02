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
	.do_title {
		padding: 20px 0 0 20px;
	}
	
	.do_title > a {
		text-decoration-line: none;
		color: black;
	}

	.do_underLine {
		border: 0px; /* 기본 hr의 border 제거 */
		height: 2px; /* 두께 지정 */
		width: 98%;
		background-color: lightgray;
		margin-bottom: 50px;
	}

	#do_table>tbody>tr>td {
		text-align: center;
		padding: 5px 60px;
		border: 1px solid gray;
		border-collapse : collapse; /* border 두 줄에서 한 줄로 */
		border-top: none;
		border-bottom: none;
		border-left: none;
	}

	.td_none {
		border-right: none !important;
	}

	.sm_title {
		font-size: 20px;
		font-weight: bold;
		margin: 50px 50px 50px 60px;
	}

	.dateInput, #offdayKind, #offdayReason {
		font-size: 20px;
		margin: 0 20px 0 0;
		border: 2px solid lightgray;
		border-radius: 5px;
		padding-left: 10px;
	}

	#doSelBtn {
		margin: 20px 0px 0px 25px;
		width: 150px;
		height: 35px;
		line-height: 35px;
		border: 1px solid lightgray;
		font-weight: bold;
		border-radius: 5px;
	}

	#doSelBtn:hover {
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
		
			<h3 class="do_title"><a href="adCommute.do">휴가 관리</a></h3>
			<hr class="do_underLine">


			<h4 class="do_title">사용 내역 조회</h4>
			<hr class="do_underLine"> <br>

			<div style="width: 800px; margin: auto;">
				<div>
					<span class="sm_title">날짜</span>
					<input type="date" class="dateInput" name="startday"> <b>~</b>&emsp; <input type="date" class="dateInput" name="endday"> 
				</div>

                <br>

				<div>
					<span class="sm_title">종류</span>
					<select id="offdayKind" name="offday" style="width: 150px; height: 35px;">
						<option value="1">연차</option>
						<option value="2">병가</option>
						<option value="3">공가</option>
						<option value="4">정기휴가</option>
						<option value="5">출산휴가</option>
					</select>

                    <br>

                    <span class="sm_title">이름</span>
					<input type="text" class="dateInput" name="userName" style="height: 35px;" placeholder="이름">
					<button id="doSelBtn" onclick="ajaxAdSelectDayoffSearch(1)">조 회</button>
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
							<th width="25%">종류</th>
							<th width="25%">상태</th>
						</tr>
				  	</thead>
				  	<tbody>
						<tr>

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
			
			<script>
				$(function(){
					ajaxAdSelectDayoffList(1);
				})
				
				function ajaxAdSelectDayoffList(cpageNo) {
					
					$.ajax({
						url: "adList.do",
						type: "POST",
						data: {
							currentPage: cpageNo
						}, success:function(result) {
							
							console.log(result);
							
							let value="";
							for(let i in result.list) {
							value += "<tr>"
  						   		   +	"<input type='hidden' name='apvlNo' value='" + result.list[i].apvlNo + "'>"
    						       +	"<td>" + result.list[i].dayoff + "</td>"
    						       +	"<td>" + result.list[i].apvlWriterName + "</td>"
	    						       
    						           if(result.list[i].offKind == 1) { 
	    						    	   value += "<td>연차</td>";
	    						       } else if(result.list[i].offKind == 2) { 
	    						    	   value += "<td>병가</td>";
	    						       } else if(result.list[i].offKind == 3) { 
	    						    	   value += "<td>공가</td>"; 
	    						       } else if(result.list[i].offKind == 4) { 
	    						    	   value += "<td>정기휴가</td>"; 
	    						       } else { 
	    						    	   value += "<td>출산휴가</td>"; 
	    						       }	   	
	  
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
			    					   
	    						   + "</tr>";
	    					}
	    					    				
	    				$(".select-area tbody").html(value);
	    				$("#selectCount").text(result.listCount);
	    			
	    				let paging="";
	    				if(result.pi.currentPage == 1) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Previous</a></li>";
	    				} else {
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxAdSelectDayoffList(" + (result.pi.currentPage-1) +")'>Previous</a></li>";
	    				}
						
	    				for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
	    					paging += "<li class='page-item' id='currentPage'><a class='page-link' onclick='ajaxAdSelectDayoffList(" + p + ")'>" + p + "</a></li>";
	    				}
						
	    				if(result.pi.currentPage == result.pi.maxPage) {
	    					paging += "<li class='page-item disabled'><a class='page-link' onclick='#'>Next</a></li>";
	    				} else {
	    					
	    					paging += "<li class='page-item'><a class='page-link' onclick='ajaxAdSelectDayoffList(" + (result.pi.currentPage+1) + ")'>Next</a></li>";
	    				}
	    										
	    				$(".pagination").html(paging);
							
						}, error:function() {
							console.log("휴가리스트 조회용 ajax 통신실패");
						}
					})
					
				}
				
				
				function ajaxAdSelectDayoffSearch(cpageNo) {
					
					$.ajax({
						url: "adSearch.do",
						type: "POST",
						data: {
							startday: $('input[name=startday]').val(),
							endday: $('input[name=endday]').val(),
							offdayKind: $('#offdayKind option:selected').val(),
							userName : $('input[name=userName]').val(),
							currentPage: cpageNo
						}, success:function(result) {
							
							console.log(result);
							
							let value="";
		    				for(let i in result.searchList) {
		    					value += "<tr>"
	  						   		   +	"<input type='hidden' name='apvlNo' value='" + result.searchList[i].apvlNo + "'>"
	    						       +	"<td>" + result.searchList[i].dayoff + "</td>"
	    						       +	"<td>" + result.searchList[i].apvlWriterName + "</td>"
		    						       
	    						           if(result.searchList[i].offKind == 1) { 
		    						    	   value += "<td>연차</td>";
		    						       } else if(result.searchList[i].offKind == 2) { 
		    						    	   value += "<td>병가</td>";
		    						       } else if(result.searchList[i].offKind == 3) { 
		    						    	   value += "<td>공가</td>"; 
		    						       } else if(result.searchList[i].offKind == 4) { 
		    						    	   value += "<td>정기휴가</td>"; 
		    						       } else { 
		    						    	   value += "<td>출산휴가</td>"; 
		    						       }	   	
		  
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
				    					   
		    						   + "</tr>";
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
							console.log("휴가 검색용 ajax 통신실패");
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