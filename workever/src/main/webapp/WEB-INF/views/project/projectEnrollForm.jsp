<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workever</title>
    
	<jsp:include page="../common/links.jsp" />
	
	<jsp:include page="../common/scripts.jsp" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button)
	</script>
	
	<style>
		.content-wrapper{
			overflow:scroll;
			height:740px;
			/*border: 1px solid black;*/
		}
		
		.content-wrapper::-webkit-scrollbar { display: none; }
	
			.switch {
		  position: relative;
		  display: inline-block;
		  width: 60px;
		  height: 34px;
		  vertical-align:middle;
		}
		
		/* Hide default HTML checkbox */
		.switch input {display:none;}
		
		/* The slider */
		.slider {
		  position: absolute;
		  cursor: pointer;
		  top: 0;
		  left: 0;
		  right: 0;
		  bottom: 0;
		  background-color: #ccc;
		  -webkit-transition: .4s;
		  transition: .4s;
		}
		
		.slider:before {
		  position: absolute;
		  content: "";
		  height: 26px;
		  width: 26px;
		  left: 4px;
		  bottom: 4px;
		  background-color: white;
		  -webkit-transition: .4s;
		  transition: .4s;
		}
		
		input:checked + .slider {
		  background-color: #2196F3;
		}
		
		input:focus + .slider {
		  box-shadow: 0 0 1px #2196F3;
		}
		
		input:checked + .slider:before {
		  -webkit-transform: translateX(26px);
		  -ms-transform: translateX(26px);
		  transform: translateX(26px);
		}
		
		/* Rounded sliders */
		.slider.round {
		  border-radius: 34px;
		}
		
		.slider.round:before {
		  border-radius: 50%;
		}
	-------------------------------------------------------
	
		p {
			display:inline-block;
			font-size:15px;
			font-weight:bold;
		}
	
		.projectName{
			height:40px;
			width: 300px;
			
			
		}
		#enrollBtn{
			float:right;
		}
		.title{
			font-size: 20px;
			font-weight: bolder;
		}
		.wrapper1{
			top: 40px;
			left: 30px;
			position: relative;
		}
		
		form{
			top: 15px;
			left: 30px;
			position: relative;
		}
		.dept2, .dept3, .dept4, .dept5, .dept6{
			margin-left: 30px;
		}
		
		.EnrollBtn{
			background-color: rgb(78, 115, 223);
			color: white;
			border: none;
			border-radius: 5px;
			height:40px;
			width: 160px;
			font-weight: bolder;
			font-size: 16px;
			float:right;
			right:80px;
			bottom:55px;		
			position: relative;
		}
		
		.ParticipationPerson{
			overflow:auto; 
			text-align: center;
			height:310px;
			top:30px;
			position: relative;
		}
		.employee{
			margin-left:200px;
		}

	</style>
    
</head>

<body class="hold-transition sidebar-mini">

	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<div class="wrapper1">
			
				<h2>프로젝트 생성</h2>
	
				<div class="content" style="background-color: white;">
				<hr>
				
				<form id="enrollForm1" method="post" action="insert.pro">
					<span class="title">프로젝트명</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="projectName" name="proTitle" placeholder="프로젝트명 입력" required>
					<br><br><br>
					
					<span class="title">담당자 승인 후 참여 여부</span>&nbsp;&nbsp;
					<label class="switch">
					  <input type="checkbox" name="proGrantWhether">
					  <span class="slider round"></span>
					</label>
			
					<input type="hidden" class="proManager" name="proManager" value="${loginUser.userName}">
						
					<br><br><br>
	
					<span class="title">부서 선택</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" class="dept2" name="proDept" value="2"/> 경영지원팀
					<input type="checkbox" class="dept3" name="proDept" value="3"/> 인사팀
					<input type="checkbox" class="dept4" name="proDept" value="4"/> 영업팀<br><br>
					<input style="margin-left: 132.5px;" class="dept5" type="checkbox" name="proDept" value="5"/> 개발팀 
					<input style="margin-left:60px;" type="checkbox" class="dept6" name="proDept" value="6"/> 재무팀 
				
					<br><br><br>
				
				
				
				<span class="title" style="margin-left:30px;">참여인원</span><br><br>
				
				
				<div style="width:380px;  height:350px; box-shadow:0px 0px 10px grey;">

					<div class="ParticipationPerson">

					</div>
					
				<input type="hidden" id="proNumberPeople" name="proNumberPeople">
				<script>
				function count(){
					var count = $("input[name='deptUserNo']:checked").length;
					document.getElementById('proNumberPeople').value = count;
				}
				</script>
				
				<script> 
				
				$(document).ready(function(){
					$(".dept2").change(function(){
						if($(".dept2").is(":checked")){
							$.ajax({
								url  :'ajax1.do?num=2',
								success : function(list){
									
									let value="";
									
									for(let i in list){
										value += "<div>"
											   + "<i id='icon' class='fas fa-portrait'></i>"
											   + "<b id='deptUserName'>" + list[i].deptUserName + "</b>"
											   + "<input type='checkbox' class='employee' name='deptUserNo' value='" + list[i].deptUserNo + "'><br><br>"
											   + "</div>";
											   
									}
									$(".ParticipationPerson").html($(".ParticipationPerson").html() + value);
								}
							})
						}else{
							$.ajax({
								url  :'ajax1.do?num=2',
								success : function(list){
									
									for(let i in list){
					
										 $(".ParticipationPerson input[value=" + list[i].deptUserNo + "]").parent().remove();
										
									}
									
								}
							})
							
							
							
						}
					});
				});
				
				$(document).ready(function(){
					$(".dept3").change(function(){
						if($(".dept3").is(":checked")){
							$.ajax({
								url  :'ajax1.do?num=3',
								success : function(list){
									
									let value="";
									
									for(let i in list){
										value += "<div>"
											   + "<i id='icon' class='fas fa-portrait'></i>"
											   + "<b id='deptUserName'>" + list[i].deptUserName + "</b>"
											   + "<input type='checkbox' class='employee' name='deptUserNo' value='" + list[i].deptUserNo + "'><br><br>"
											   + "</div>";
											   
									}
									$(".ParticipationPerson").html($(".ParticipationPerson").html() + value);
								}
							})
						}else{
							$.ajax({
								url  :'ajax1.do?num=3',
								success : function(list){
									
									for(let i in list){
					
										 $(".ParticipationPerson input[value=" + list[i].deptUserNo + "]").parent().remove();
									}
									
								}
							})
							
							
							
						}
					});
				});
				
				$(document).ready(function(){
					$(".dept4").change(function(){
						if($(".dept4").is(":checked")){
							$.ajax({
								url  :'ajax1.do?num=4',
								success : function(list){
									
									let value="";
									
									for(let i in list){
										value += "<div>"
											   + "<i id='icon' class='fas fa-portrait'></i>"
											   + "<b id='deptUserName'>" + list[i].deptUserName + "</b>"
											   + "<input type='checkbox' class='employee' name='deptUserNo' value='" + list[i].deptUserNo + "'><br><br>"
											   + "</div>";
											   
									}
									$(".ParticipationPerson").html($(".ParticipationPerson").html() + value);
								}
							})
						}else{
							$.ajax({
								url  :'ajax1.do?num=4',
								success : function(list){
									
									for(let i in list){
					
										 $(".ParticipationPerson input[value=" + list[i].deptUserNo + "]").parent().remove();
									}
									
								}
							})
							
							
							
						}
					});
				});
				
				$(document).ready(function(){
					$(".dept5").change(function(){
						if($(".dept5").is(":checked")){
							$.ajax({
								url  :'ajax1.do?num=5',
								success : function(list){
									
									let value="";
									
									for(let i in list){
										value += "<div>"
											   + "<i id='icon' class='fas fa-portrait'></i>"
											   + "<b id='deptUserName'>" + list[i].deptUserName + "</b>"
											   + "<input type='checkbox' class='employee' name='deptUserNo' value='" + list[i].deptUserNo + "'><br><br>"
											   + "</div>";
											   
									}
									$(".ParticipationPerson").html($(".ParticipationPerson").html() + value);
								}
							})
						}else{
							$.ajax({
								url  :'ajax1.do?num=5',
								success : function(list){
									
									for(let i in list){
										 $(".ParticipationPerson input[value=" + list[i].deptUserNo + "]").parent().remove();
									}
									
								}
							})
							
							
							
						}
					});
				});
				
				$(document).ready(function(){
					$(".dept6").change(function(){
						if($(".dept6").is(":checked")){
							$.ajax({
								url  :'ajax1.do?num=6',
								success : function(list){
									
									let value="";
									
									for(let i in list){
										value += "<div>"
											   + "<i id='icon' class='fas fa-portrait'></i>"
											   + "<b id='deptUserName'>" + list[i].deptUserName + "</b>"
											   + "<input type='checkbox' class='employee' name='deptUserNo' value='" + list[i].deptUserNo + "'><br><br>"
											   + "</div>";
											   
									}
									$(".ParticipationPerson").html($(".ParticipationPerson").html() + value);
								}
							})
						}else{
							$.ajax({
								url  :'ajax1.do?num=6',
								success : function(list){
									
									for(let i in list){
					
										 $(".ParticipationPerson input[value=" + list[i].deptUserNo + "]").parent().remove();
									}
									
								}
							})
							
							
							
						}
					});
				});
				
				
				
				
		
				</script>


				</div>
						
				
				<button class="EnrollBtn" onclick="count()">프로젝트 생성하기</button>
				<br>
			</form>
			
			</div>
		</div>
		<!-- /.content-wrapper -->
		
		
	</div>    
		<jsp:include page="../common/footer.jsp" />
	
	
</body>
</html>