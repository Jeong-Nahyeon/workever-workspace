<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    
	<jsp:include page="../common/links.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
		height:860px;
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
					<form>
						<!--제목 결정-->
						<br>
						<div>
							<input type="text" class="workTitle" name="workTitle" id="workTitle" placeholder="업무명을 입력하세요.(50자 이내)">
						</div>
						<hr>
						<!--진행 완료 보류 결정공간-->
						<div>
				
							<i class="fab fa-firefox fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" id="progress"  name="type" value="">
							<label  for="progress">진행</label>
							
							<input type="radio" id="complete"  name="type" value="">			
							<label for="complete">완료</label>
							
							<input type="radio" id="hold"  name="type" value="">			
							<label for="hold">보류</label>
						
						</div>
				
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
							<input style="cursor: pointer;" type="date" class="datepicker" name="startDate" placeholder="시작일시">
							<script>
						
							</script>
						</div>
						<br>
						<!--마감날짜 공간-->
						<div>
							<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input style="cursor: pointer;" type="text" class="datepicker" name="endDate" placeholder="마감일시">
						</div>
						
						<hr>
				
						<!--업무 진행도-->
						<div>
							<div id="slider-range-min"></div>
				
						</div>
				
						<hr>
				
						<!--업무 순위-->
						<div>
							<i class="fas fa-list-ol fa-lg"></i>&nbsp;&nbsp;&nbsp;
							<select name="workrank" class="workrank" style="width: 120px; height: 30px;"> 
								<option value="high">높음</option>
								<option value="middle" selected>중간</option>
								<option value="low">낮음</option>
							</select>
						</div>
						
						<hr>
						
						<!--업무 내용-->
						<div>
						</div>
					</form>
				</div>
				
				
				
				<!-- 여기부터 밑이 게시글 목록 -->
					<div style="background-color: white;">
						<br>
						<div style="margin-right:30px">
							<i class="fas fa-user-circle fa-lg"></i>
							<b>홍길동</b><br>&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-size:12px;">2022/02/12</span>
						</div>
						<br>
						
						<div>
							<input type="text" class="workTitle" name="workTitle" id="workTitle" placeholder="업무명을 입력하세요.(50자 이내)">
						</div>
						<hr>
						<!--진행 완료 보류 결정공간-->
						<div>
				
							<i class="fab fa-firefox fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" id="progress"  name="type" value="">
							<label  for="progress">진행</label>
							
							<input type="radio" id="complete"  name="type" value="">			
							<label for="complete">완료</label>
							
							<input type="radio" id="hold"  name="type" value="">			
							<label for="hold">보류</label>
						
						</div>
				
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
							<input style="cursor: pointer;" type="date" class="datepicker" name="startDate" placeholder="시작일시">
							<script>
						
							</script>
						</div>
						<br>
						<!--마감날짜 공간-->
						<div>
							<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input style="cursor: pointer;" type="text" class="datepicker" name="endDate" placeholder="마감일시">
						</div>
						
						<hr>
				
						<!--업무 진행도-->
						<div>
					

						
						</div>
				
						<hr>
				
						<!--업무 순위-->
						<div>
							<i class="fas fa-list-ol fa-lg"></i>&nbsp;&nbsp;&nbsp;
							<select name="workrank" class="workrank" style="width: 120px; height: 30px;"> 
								<option value="high">높음</option>
								<option value="middle" selected>중간</option>
								<option value="low">낮음</option>
							</select>
						</div>
						
						<hr>
						
						<!--업무 내용-->
						<div>
						
						</div>
					</div>
			</div><!--전체감싸는 div 끝-->
		
			<div class="sidemenu">
				<div class="backpage"><!-- 이전페이지 -->
					<p><i class="fas fa-chevron-left"></i>&nbsp;&nbsp;이전페이지</p>
				</div>
			
				<br>
				<div class="workLookup"><!-- 업무조회 -->
					<p>업무조회</p>
				</div>
				
				<br>
				<div class="invite"><!-- 전체 참여자-->
					<div style=""><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>전체참여자 25명</b>
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