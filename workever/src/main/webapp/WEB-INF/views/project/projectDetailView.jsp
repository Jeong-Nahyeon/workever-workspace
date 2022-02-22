<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    
	<jsp:include page="../common/links.jsp" />
	<!-- 그래프 공간 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>

	
	<!-- datepicker 공간 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	
    <style>
    	input[type="radio"]{
		display: none;
	}
    	label{
		position: relative;
		font-size: 15px;
		border: 2px ;
		border-radius: 3px;
		padding: 5px 32px ;
		align-items: center;
		cursor: pointer;
		background-color: rgb(216, 216, 216);
	}
	.workTitle{
		border:none;
		height:50px;
		width: 600px;
	}
	
		label:before{
		content: "";
		height: 30px;
		width: 30px;

	}
		input[type="radio"]:checked + label{
		background-color: rgb(78, 115, 223);
		color: white;
	}


	.all div{
		margin-left: 40px;
	}

	.backpage p, .workLookup p{
		margin-top:5%;
	}
	
	.backpage, .workLookup{
		background-color: white;
		width: 350px;
		height: 55px;
		cursor: pointer;
		text-align: center;
		border: 1px solid rgb(255, 255, 255);
		font-size: 15px;
		font-weight: bold;
		left: 58%;
 
	}

	.invite{
			width:350px; height:500px;
			background-color: white;
			left: 58%; 
			top: -730px;

	}
	
	.memwrap{
			overflow:auto; 
			height:400px;
			margin-left:30px;
	}
	
	.container{
			position: relative; 
			left:25px;
	}


	.sidemenu{
		width:25%;
	}
	
	.all, .sidemenu{
		float:left;
		margin:30px;
		
	}
	
	.all{
		width: 50%;
		margin-left: 5%;
		/*border:1px solid black;*/
		overflow:scroll;
		height:850px;
	}
	
	.all::-webkit-scrollbar { display: none; }

	.contentWrap{
		/*border:1px solid red;*/
		width: 90%;
		background-color:white;
		margin-left:50px;
	}
	
	   .modal-content{
	   	   margin-top:35%;
	       height:500px;
	       width: 700px;
	   }
		.modal-title{
			margin-left:159px;
		}
		.memList{
			border:1px solid gray;
			overflow:auto;
			height:225px;
		}
		.form-control{
			width: 250px !important;
		}
		.input-group{
			margin-left:75px !important;
		}
		.workContent{
			resize:none;
			width: 430px;
			height:130px;
		}
		
		.EnrollBtn{
			background-color: rgb(78, 115, 223);
			color: white;
			border: none;
			border-radius: 5px;
			height:35px;
			width: 100px;
			font-weight: bolder;
			font-size: 14px;
			margin-left:80%;
		}
		
		.slidecontainer {
			left:40px;
			position: relative; 
            width:30%;

        }

        .slider {
            -webkit-appearance: none;
            width: 100%;
            height: 5px;
            border-radius: 5px;
            background: #d3d3d3;
            outline: none;
            opacity: 0.7;
            -webkit-transition: .2s;
            transition: opacity .2s;
        }

        .slider:hover {
            opacity: 1;
        }

        .slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: #ff3b3b;
            cursor: pointer;
        }

        .slider::-moz-range-thumb {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: #ff3b3b;
            cursor: pointer;
        }
	
    </style>
    
    
</head>

<body class="hold-transition sidebar-mini">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		
				<div class="all"><!--전체감싸는 div-->
					<div class="contentWrap">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>
					<script>
						let myChart= document.getElementById('myChart').getContext('2d');
			
						let barChart = new Chart(myChart,{
							type:'pie',
							data:{
								labels:['진행','완료','보류'],
								datasets :[{
									labels: '바울랩매출액',
									data:[50,20,40],
									backgroundColor:[
										'rgb(101, 180, 233)',
										'rgb(95, 201, 95)',
										'rgb(247, 202, 54)'
									]
								}]
							}
						})
					</script>
					<br>
					
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@여기부터 작성란@@@@@@@@@@@@@@@@@@@@@@@ -->
					<form id="enrollForm" method="post" action="insert.work" enctype="multipart/form-data">
						<!--제목 결정-->
						
						<input type="hidden" name="workBoardWriter" value="${loginUser.userName}">
						<input type="hidden" name="userNo" value="${loginUser.userNo}">
						<input type="hidden" name="proNo" value= ${ proNo }>
						<br>
						<div>
							<input type="text" class="workTitle" name="workTitle" id="workTitle" placeholder="업무명을 입력하세요.(50자 이내)" required>
						</div>
						<hr>
						<!--진행 완료 보류 결정공간-->
						<div>
				
							<i class="fab fa-firefox fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" id="progress"  name="workStatus" value="진행">
							<label  for="progress">진행</label>
							
							<input type="radio" id="complete"  name="workStatus" value="완료">			
							<label for="complete">완료</label>
							
							<input type="radio" id="hold"  name="workStatus" value="보류">			
							<label for="hold">보류</label>
						
						</div>
				
						<hr>
				
						<!--담당자 결정공간-->
						<div>
							<i class="fas fa-user fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="workManager" class="manager" style="width: 120px; height: 30px;"> 
								<option value="이희승">이희승</option>
								<option value="김정현">김정현</option>
								<option value="김지우">김지우</option>
							</select>
				
						</div>
						
						<hr>
				
						<!--시작날짜 공간-->
						<div>
							<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" id="datepicker" name="workStartDate" placeholder="시작일시" autocomplete='off'>	
					
						</div>
						<br>
						<!--마감날짜 공간-->
						<div>
							<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" id="datepicker2" name="workEndDate" placeholder="마감일시" autocomplete='off'>
							
					    <script>
					        // 1) datepicker 공통 옵션 설정
					        $.datepicker.setDefaults({
					            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
					            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
					            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
					            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					            yearSuffix: '년',
					            dateFormat: 'yy-mm-dd',
					            showMonthAfterYear:true,
					            constrainInput: true    
					        });
					
					        // 2) datepicker 영역 선언
					        $("#datepicker").datepicker();
					        $("#datepicker2").datepicker();
					
					        // 3) 초기값 설정
					        // (today / -nD: n일전 / +nD: n일후 / -nM: n달전 / +nM: n달후 / -nY: n년전 / +nY: n년후)
					        //$("#datepicker").datepicker('setDate', 'today');
					        //$("#datepicker2").datepicker('setDate', '+1D');
					
					    </script>						
						</div>
						<hr>
				
						<!--업무 진행도-->
						<div class="slidecontainer">
						  <input type="range" name="workProgress" min="1" max="100" value="1" class="slider" id="myRange">
						  <p>진행도: <span id="value"></span></p>
						</div>
						
						<script>
						    var slider = document.getElementById("myRange");
						    var output = document.getElementById("value");
						    output.innerHTML = slider.value;
						
						    slider.oninput = function() {
						        output.innerHTML = this.value;
						    }
						</script>
				
						<hr>
				
						<!--업무 순위-->
						<div>
							<i class="fas fa-list-ol fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="workPriority" class="workrank" style="width: 120px; height: 30px;"> 
								<option value="높음">높음</option>
								<option value="중간" selected>중간</option>
								<option value="낮음">낮음</option>
							</select>
						</div>
						
						<hr>
						
						<!--업무 내용-->
						<div>
							<textarea name="workContent" class="workContent"></textarea>
						</div>
						
						<hr>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="file" id="upfile" name="upfile">
						
						<button class="EnrollBtn" onclick="">등록하기</button>
					</form>
					<br>
				</div>
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@여기까지 작성란@@@@@@@@@@@@@@@@@@@@@@@ -->
				
				<br><br>
				<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%여기부터 밑에 보여지는 게시글 목록%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
				<c:if test="${ not empty list }">
					<c:forEach var="w" items="${ list }">
						<div style="background-color: white;">
							<br>
							<div style="margin-right:30px">
								<i class="fas fa-user-circle fa-lg"></i>
								<b>홍길동</b><br>&nbsp;&nbsp;&nbsp;&nbsp;
								<span style="font-size:12px;">${w.workCreateDate }</span>
							</div>
							<br>
							
							<div>
								<input type="text" class="workTitle" name="workTitle" id="workTitle" value="${w.workTitle }">
							</div>
							<hr>
							<!--진행 완료 보류 결정공간-->
							<div>
								<i class="fab fa-firefox fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" id="progress"  name="type" value="진행">
								<label  for="progress">진행</label>
								
								<input type="radio" id="complete"  name="type" value="완료">			
								<label for="complete">완료</label>
								
								<input type="radio" id="hold"  name="type" value="보류">			
								<label for="hold">보류</label>
							</div>
								
							<script>
	
								$(":radio[name='type']").each(function() {
							        if($(this).val() == '${w.workStatus}') 
							              $(this).attr('checked', true);
							 });
							</script>
					
							<hr>
					
							<!--담당자 결정공간-->
							<div>
								<i class="fas fa-user fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<select name="manager" class="manager" style="width: 120px; height: 30px;"> 
									<option value="">이희승</option>
									<option value="">김정현</option>
									<option value="">김지우</option>
								</select>
					
							</div>
							
							<hr>
					
							<!--시작날짜 공간-->
							<div>
								<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="datepicker" name="workStartDate" value="${ w.workStartDate }">	
							</div>
							<br>
							<!--마감날짜 공간-->
							<div>
								<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="datepicker2" name="workEndDate" value="${ w.workEndDate }">
							</div>
							
							<hr>
					
							<!--업무 진행도-->
	
	
					
							<hr>
					
							<!--업무 순위-->
							<div>
								<i class="fas fa-list-ol fa-lg"></i>&nbsp;&nbsp;&nbsp;
								<select name="workPriority" class="workrank" style="width: 120px; height: 30px;"> 
									<option value="high">높음</option>
									<option value="middle" selected>중간</option>
									<option value="low">낮음</option>
								</select>
							</div>
							
							<hr>
							
							<!--업무 내용-->
							<div>
								<textarea name="workContent" class="workContent" readonly>${w.workContent}</textarea>
							</div>
							<br>
						</div>
						<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%여기부터 밑에 보여지는 게시글 목록%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
					</c:forEach>	
				</c:if>
					
			</div><!--전체감싸는 div 끝-->
		
			<div class="sidemenu">
			
			
				<!-- 이전페이지 -->
				<div class="backpage" onclick="javascript:history.go(-1);">
					<p><i class="fas fa-chevron-left"></i>&nbsp;&nbsp;이전페이지</p>
				</div>
				
			
				<br>
				
				<!-- 업무조회 -->
				<div class="workLookup">
					<p>업무조회</p>
				</div>
				
				<script>
				$(function(){
					$(".workLookup").click(function(){
						location.href='list.work';
					});
				})
				</script>
				<br>
				<div class="invite"><!-- 전체 참여자-->
					<div style=""><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>전체참여자 &nbsp; ${ list2.get(0).proNumberPeople }명</b>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
						    초대하기
						</button>
					</div><hr>
					<div class="memwrap">
						<div class="part-title">관리자&nbsp;(1)</div><hr>
							<div id="pjmemlist">
									<ul>
										<li>
											<span class="pjusername"></span>
										</li>
									</ul>
			
								
								
								<div class="part-title">내부참여자&nbsp;</div><hr>
									<ul>
										<li>
											<span class="pjusername"></span>
											<b>홍길동</b><br><br>
											<b>홍길동</b><br><br>
											<b>홍길동</b><br><br>
											<b>홍길동</b><br><br>
											<b>홍길동</b><br><br>
											<b>홍길동</b><br><br>
											<b>홍길동</b><br><br>
											
											<b>홍길동</b>
										</li>
									</ul>
							</div>
					</div>
				</div>
			</div>
		<!-- /.content-wrapper -->
		
	</div>    
		
			<!-- 모달창 부분 -->
			<div class="modal" id="myModal">
			    <div class="modal-dialog modal-dialog-scrollable">
			      <div class="modal-content">
			      
			        <!-- Modal 헤더 부분-->
			        <div class="modal-header">
			          <h4 class="modal-title">사원 초대하기</h4>
			          <button type="button" class="close" data-dismiss="modal">×</button>
			        </div>
			        
			        <!-- Modal 바디부분 -->
			        <div class="modal-body">
			        	<!-- 사원 검색구역 -->
				        <nav class="navbar navbar-expand-sm">
						  <form class="form-inline">
						    <div class="input-group">
						      <div class="input-group-prepend">
						        <span class="input-group-text">@</span>
						      </div>
						      <input type="text" class="form-control" placeholder="초대할 사원을 입력하세요.">
						    </div>    
						  </form>
						</nav>
						<hr>
						
						<!-- 검색한 사원 띄워지게 -->
						<div class="memList">
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
						
						</div>
			        </div>
			        
			        <!-- Modal 푸터 부분 -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-primary" data-dismiss="modal">초대하기</button>
			        </div>
			        
			      </div>
				</div>
			</div>
		<!-- 모달창 부분끝 -->
	<jsp:include page="../common/scripts.jsp" />
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	
	
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button)
	</script>
</body>
</html>