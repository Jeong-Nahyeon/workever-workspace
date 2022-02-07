<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style>
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

p {
	margin:0px;
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
	.wrapper{
		top: 40px;
		left: 30px;
		position: relative;
	}
	
	form{
		top: 15px;
		left: 30px;
		position: relative;
	}
	.dept{
		margin-left: 30px;
	}

	.projectEnrollBtn{
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
		height:80%;
	}
	.employee{
		margin-left:200px;
	}

</style>
</head>


<body>
	<jsp:include page="../common/head.jsp" />
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/sidebar.jsp" />
		
	
	<div class="content-wrapper">
	
		<div class="wrapper">

		<h2>프로젝트 생성</h2>

		<div class="content" style="background-color: white;">
			<hr>
			
			<form>
				<span class="title">프로젝트명</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="projectName" name="projectName" placeholder="프로젝트명 입력" required>
				<br><br><br>
				
				<span class="title">담당자 승인 후 참여 여부</span>&nbsp;&nbsp;
				<label class="switch">
				  <input type="checkbox">
				  <span class="slider round"></span>
				</label>
		
					
				<br><br><br>

				<span class="title">부서 선택</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox" class="dept" name="dept" value="2"> 경영지원팀
				<input type="checkbox" class="dept" name="dept" value="3"> 인사팀
				<input type="checkbox" class="dept" name="dept" value="4"> 영업팀<br><br>
				<input style="margin-left: 132.5px;" class="dept" type="checkbox" name="dept" value="5"> 개발팀 
				<input style="margin-left:60px;"type="checkbox" name="dept" value="6"> 재무팀 
				
				<br><br><br>

				<span class="title">참여인원</span><br><br>
				
				<div style="width:380px;  height:350px; box-shadow:0px 0px 10px grey;">
					
					<div style="text-align: center; height:20%; top:25px; position: relative;">
						<i class="fas fa-search"></i>&nbsp;&nbsp;
						<input type="text" class="chat-search-input" placeholder="이름 검색">
					</div>

					<div class="ParticipationPerson">
						<c:choose>
							<!-- for문 돌려서 해당하는 사원들 만들기 -->
							<c:when test="">
								<c:forEach var="p" items="">
									<i class="fas fa-portrait"></i>
									<b>홍길동</b><input type="checkbox" class="employee" name="employee" value="zz"><br><br>
								</c:forEach>
							<br>
							</c:when>
							<c:otherwise>
	               	 			검색 결과가 없습니다.
							</c:otherwise>
						</c:choose>
               	 		
					</div>
				</div>
						
				<button class="projectEnrollBtn">프로젝트 생성하기</button>
				
				<br>
			 	
			</form>
	

		</div>
	
	
	
	</div>
	
	
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
	
	
	
	
	
</body>
</html>