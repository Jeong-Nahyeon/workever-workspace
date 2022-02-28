<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<jsp:include page="../common/links.jsp" />

<style>
	div{box-sizing: border-box;}
	.content-wrapper{overflow: hidden; position: relative;}
	.content-left{
		overflow: hidden;
		margin-left: 30px; 
		padding-top: 40px;
		height: 400px; width: 1200px;
		float: left;
		border-bottom: 2px solid gray;
	}
	.content-right{
		width: 350px; height: auto;
		float: right;
		margin-right: 50px;
	}

	#todo-area{
		height: 100%; width: 580px;
		float: left;
	}
	#noti-area{
		height: 100%; width: 580px;
		float: right;
	}

	#commute-area, #approval-area{
		border-radius: 1%;
		background-color: white;
	}
	#commute-area{
		border: 1px solid lightgray;
		height: 340px;
		margin-top: 40px; 
	}
	#approval-area{
		border: 1px solid lightgray;
		height: 400px;
		margin-top: 20px; 
	}

	#project-area{
		position: absolute;
		top: 410px;
		width: 1200px;
		margin-left: 30px; padding-left: 10px;
	}

	/* 카드 스타일*/
	.card-default{
		width: 580px;
	}
	.card-header{
		height: 35px; 
		padding: 0px; padding-left: 10px; padding-right: 10px;
	}
	.card-header *{line-height: 35px;}
	.card-title{font-size: 15px; font-weight: bold; }

	/* todo 스타일 */
	.card-body{padding: 0 0 10px 0; height: 300px;}
	.todo-list{padding: 10px 20px 10px 20px;}
	.todo-line{height: 0; width: 580px; border-bottom: 1px solid lightgray;}
	.todo-etc{margin-top: 5px;}
	.todo-title span{font-size: 13px;}
	.todo-badge{
		display: inline-block;
		width: 60px;
		color: white; font-size: 11px;
	}
	.todo-link{
		text-decoration: none;
		color: lightgray;
		float: right;
	}

	/* 공지사항 스타일 */
	.table{text-align: center;}
	.table tr{padding-left: 50px;}
	.table th, .table td{font-size: 13px;}

	/* 근태관리 스타일 */
	#commute-area div{width: 280px;}
	#commute-area span{
		display: inline-block;
		text-align: center;
	}
	#commute-title{
		margin: 15px 35px 0 70px;
	}
	#commute-button, #commute-content, #commute-line{
		margin: 40px 35px 20px 35px;
		text-align: center;
	}
	#commute-button button{
		border: none;
		border-radius: 2%;
		background-color: lightgray;
		width: 100px; height: 30px;
		font-size: 13px;
	}
	#commute-content span{width: 35%;}
	#commute-status{margin: 20px 35px 20px 35px; text-align: center;}

	/* 전자결재 스타일 */
	#approval-title, .approval-content{
		width: 280px;
		margin: 15px 35px 0 35px;
	}
	#approval-title>span{font-size: 18px; font-weight: 600; margin-right: 155px;}
	#approval-title a{
		text-decoration: none;
		color: gray;
	}
	.approval-send, .approval-receive{
		width: 250px;
		margin: 10px 30px 10px 10px;
		border-bottom: 1px solid lightgray;
	}
	.approval-send-status{width: 200px; margin-left: 15px;}
	.approval-send-status span{font-size: 9px;}
	.approval-status-title a{font-size: 14px; text-decoration:none;color:black;}
	

	/* 프로젝트 스타일 */
	.project-subarea{
		float: left;
		width: 210px; height: 200px;
		border-radius: 2%;
		background-color: lightgray;
		margin: 20px 10px 10px 15px;
	}
	.project-title{padding: 10px 20px 10px 20px;}
	.project-team{padding: 10px 20px 10px 23px; height: 110px;}
	.project-etc{padding: 10px 20px 10px 23px;}
	.project-title span{
		font-size: 18px;
		font-weight: bold;
	}
	.project-team span, .project-etc span{
		display: block;
		font-size: 13px;
	}
	.project-etc span{float: left;}
	.project-etc i{float: right;}
	
	
	
	/* 공지사항 영역 */
	#notice-list{
		height:290px;
		border-bottom:2px solid #DEE2E6;
	}
	
	/* 제목 영역 : 설정한 영역 범위 넘어가면 ...으로 표시  */
	#notice-list .notice-title{
		width:400px;
		height:24px;
	 overflow: hidden;
	 text-overflow: ellipsis;
	 white-space: nowrap;
	 
	 cursor:pointer;
	}
	
</style>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<jsp:include page="../common/header.jsp" />

		<jsp:include page="../common/sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<div class="content-left">
				<!-- todo -->
				<div id="todo-area">
					<div class="card card-default">
						<!-- /.card-header -->
						<div class="card-header">
							<h3 class="card-title">오늘의 일정</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-tool" data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-body">
							<div class="todo-list">
								<div class="todo-title">
									<span>오늘의 할 일2</span>
								</div>
								<div class="todo-etc">
									<span class="badge badge-pill badge-warning todo-badge">높음</span>
									<a href="" class="todo-link">
										<i class="fas fa-angle-double-right"></i>
									</a>
								</div>
							</div>
							<div class="todo-line"></div>

							<div class="todo-list">
								<div class="todo-title">
									<span>오늘의 할 일2</span>
								</div>
								<div class="todo-etc">
									<span class="badge badge-pill badge-warning todo-badge">높음</span>
									<a href="" class="todo-link">
										<i class="fas fa-angle-double-right"></i>
									</a>
								</div>
							</div>
							<div class="todo-line"></div>
						</div>
					</div>
				</div>

				<!-- 공지사항 -->
				<div id="noti-area">
					<div class="card card-default">
						<!-- /.card-header -->
						<div class="card-header">
							<h3 class="card-title">공지사항</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool" data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>

						<!-- /.card-body -->
						<div class="card-body">
							<table id="notice-list" class="table table-sm">
								<thead>
									<tr>
										<th style="width: 15%;">#</th>
										<th style="width: 70%;">제목</th>
										<th style="width: 15%;">작성일</th>
									</tr>
								</thead>
								<tbody>
									<!-- 공지사항 목록 조회 -->
								</tbody>
							</table>
						</div>
						
					</div>
				</div>

				
			</div>

			<!-- 프로젝트 -->
			<div id="project-area">
				<h4>Project</h4>

				<div class="project-subarea">
					
					<div class="project-title">
						<span>프로젝트1</span>
					</div>
					<div class="project-team">
						<span>마케팅팀</span>
						<span>개발팀</span>
					</div>
					<div class="project-etc">
						<span>4명 참가중</span>
						<i class="fas fa-lock"></i>
					</div>
				</div>

				<div class="project-subarea">
					<div class="project-title">
						<span>프로젝트1</span>
					</div>
					<div class="project-team">
						<span>마케팅팀</span>
						<span>개발팀</span>
					</div>
					<div class="project-etc">
						<span>4명 참가중</span>
						<i class="fas fa-unlock"></i>
					</div>
				</div>

				<div class="project-subarea">
					<div class="project-title">
						<span>프로젝트1</span>
					</div>
					<div class="project-team">
						<span>마케팅팀</span>
						<span>개발팀</span>
					</div>
					<div class="project-etc">
						<span>4명 참가중</span>
						<i class="fas fa-unlock"></i>
					</div>
				</div>

				<div class="project-subarea">
					
				</div>

				<div class="project-subarea">
					
				</div>
			</div>

			<div class="content-right">
				<div id="commute-area">
					<div id="commute-title">
						<h4>TODAY</h4>
						<span>2022.01.20 목요일</span>
					</div>
					<div id="commute-button">
						<button>출근</button>
						<button>퇴근</button>
					</div>
					<div id="commute-content">
						<span>출근시간</span>
						<span>09:30</span><br>
						<span>퇴근시간</span>
						<span>18:30</span>
					</div>
					<div id="commute-line"></div>
					<div id="commute-status">
						<span class="badge badge-pill badge-warning commute-badge">외근중</span>
					</div>
				</div>

				<div id="approval-area">
					<div id="approval-title">
						<span>전자결재</span>
						<a href="writeList.ap">
							<i class="fas fa-angle-right"></i>
							<span style="font-size: 10px;">더보기</span>
						</a>
					</div>

					<div class="approval-content">
						<div id="apvlSendArea">
							<span style="font-size: 15px;">보낸결재</span>
							
						</div>
						
						<div style="height: 10px;"></div>
						
						<div id="apvlReceiveArea">
							<span style="font-size: 15px;">받은결재</span>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.content-wrapper -->

		

		<jsp:include page="../common/footer.jsp" />

	</div>
	
	<jsp:include page="../common/scripts.jsp" />

	<script>
		$(function(){

			// todo 조회
			todoList();
			
			
			
			// 공지사항 조회
			noticeList();
			
			// 공지사항 상세조회
			detailNotice();
			
			approvalWriteList();
			
			approvalReceiveList()
		})

		function todoList(){
			$.ajax({
				url:"mainTodoList.do",
				success:function(result){
					console.log(result);
				},error:function(){
					console.log("MainTodoList ajax 통신 실패");
				}
			})
		}
		
		
		
		// 공지사항 조회용
		function noticeList(){
			
			$.ajax({
				url:"main.nbo",
				success:function(list){
									
					let result = "";
					
					if(list.length > 0){
						
						for(let i in list){
							
							result += "<tr>"
									+ "<td>" + list[i].nbNo + "</td>"
									+ "<td>";
							if(list[i].correct == "Y"){
								
								result += "<div class='notice-title'><span class='badge bg-primary'>new</span>&nbsp;&nbsp;&nbsp;" + list[i].nbTitle + "</div></td>";
							
							}else{
								
								result += "<div class='notice-title'>" + list[i].nbTitle + "</div></td>";
								
							}		
							
							result += "<td>" + list[i].nbDate + "</td></tr>";
						
						}
						
					}else{
						
						result += "<td colspan='3'>공지사항 게시글이 없습니다.</td>";
						
					}
					
					
					$("#notice-list tbody").html(result);
					
				}, error:function(){
					
					console.log("메인용 공지사항 목록 조회 ajax 통신 실패");
					
				}
				
			});
			
		}
		
		// 공지시항 상세 조회용
		function detailNotice(){
			
			$("#notice-list").on("click", ".notice-title", function(){
				
				location.href = "detail.nbo?nbno=" + $(this).parent().prev().text();
				
			});
		}
		
		// 작성한 결재 조회용
		function approvalWriteList(){
			
			$.ajax({
				url:"mainWriteApvl.ap",
				success:function(result){
					let value="";
					
					for(let i in result){
						value += "<div class='approval-send'>"
							  +  	"<i class='fas fa-caret-right'>&nbsp;</i>"
							  +	 	"<span class='approval-status-title'><a href='detail.ap?apvlNo=" + result[i].apvlNo + "'>" + result[i].apvlFormNo + "</a></span><br>"
							  +  	"<div class='approval-send-status'>"
							  +			"<span>결재상태</span>"
							  +			"<span>&nbsp;|&nbsp;</span>"
							  +			"<span>" + result[i].apvlStatus + "</span>"
							  +		 "</div>"
							  +  "</div>";
					}
					
					$("#apvlSendArea").append(value);
				},error:function(){
					console.log("ajax통신 실패");
				}
			})
			
		}
		
		function approvalReceiveList(){
			
			$.ajax({
				url:"mainReceiveApvl.ap",
				success:function(result){
					let value="";
					
					for(let i in result){
						value += "<div class='approval-receive'>"
							  +		"<i class='fas fa-caret-right'>&nbsp;</i>"
							  +		"<span class='approval-status-title'><a href='detail.ap?apvlNo=" + result[i].apvlNo + "'>" + result[i].apvlFormNo + "</a></span><br>"
							  +		"<div class='approval-send-status'>"
							  +			"<span>결재상태</span>"
							  +			"<span>&nbsp;|&nbsp;</span>"
							  +			"<span>" + result[i].apvlStatus + "</span>"
							  +			"<span>&nbsp;|&nbsp;</span>"
							  +			"<span>" + result[i].apvlWriterName + "</span>"
							  +		"</div>"
							  +	"</div>";
					}
					$("#apvlReceiveArea").append(value);
				},error:function(){
					console.log("ajax통신 실패");
				}
			})
		}

		
	</script>
</body>

</html>