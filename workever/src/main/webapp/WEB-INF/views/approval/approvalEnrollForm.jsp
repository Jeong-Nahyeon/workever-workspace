<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workever</title>
    
	<jsp:include page="../common/links.jsp" />
	<!-- Daterange picker -->
  	<link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <style>
	div, input, textarea{ box-sizing:border-box;}

	#enrollForm-area{
		/* border:1px solid black; */
		margin:auto;
		width:1300px;
		padding-top:50px;
		padding-bottom:100px;
	}

	#form-inner{
		width:1100px;
		margin:auto;
		padding-top:20px;
	}

	#enroll-tb{
		border-top:1px solid gray;
		border-bottom:1px solid gray;
	}

	th{
		background:rgb(224, 224, 224);
		height:40px;
		text-align:center;
	}

	#apvlLine-btn, #submit-btn, #formBtn{
		background: #4E73DF;
		color:white;
	}

	#reset-btn, #del-btn{
		background: rgb(133, 135, 150);
		color:white;
	}

	#form>table{
		margin:auto;
		margin-top:30px;
		margin-bottom:30px;
	}
	
	.modal-body>div{
		float:left;
		margin:8px;
	}

	#deptArea, #userResult{
		border-radius:5px;
		border:1px solid rgb(190, 179, 179);
	}
	
	#deptArea li:hover{
		font-weight:800;
		cursor: pointer;
	}

	#userTb{
		width:100%
	}
	
	.box {
		width: 40px;
		height:40px; 
		border-radius: 70%;
		overflow: hidden;
	}
	.profile {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}

</style>
</head>


<body class="hold-transition sidebar-mini">
	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<br><br>
			<h3>&nbsp;&nbsp;&nbsp;결재 작성</h3>
			<hr>
			<!-- 등록 폼 전체 영역 -->
			<div id="enrollForm-area">
				
				<div id="form-inner">
					<form action="insert.ap" id="approval-form">
						<input type="hidden" value="${ loginUser.userNo }" name="apvlWriter">
						<table id="enroll-tb">
							<tr style="border-bottom:1px solid gray;">
								<th width="150">결재 양식</th>
								<td width="10"></td>
								<td width="920">
									<select name="apvlFormNo" id="formNo" required>
										<option value="">-----선택-----</option>
										<option value="1">휴가 신청서</option>
										<option value="2">연장 근무 신청서</option>
										<option value="3">지출 품의서</option>
										<option value="4">출장 신청서</option>
										<option value="5">업무 보고서</option>
									</select>
									<button type="button" class="btn btn-sm" id="formBtn" onclick="formSelect();">선택</button>
								</td>
							</tr>
							<tr>
								<th>결재선 지정</th>
								<td></td>
								<td style="line-height:3;padding:10px;">
										<table id="lineTb">
											<tbody>
											</tbody>											
										</table>
									<button id="apvlLine-btn" type="button" class="btn btn-sm" data-target="#modal-lg">결재자 추가</button>
									<button type="button" class="btn btn-sm" id="del-btn">삭제</button>
									<input type="hidden" val="" name="lineArr">
								</td>
							</tr>
						</table>
						<br><br><br>
						<h4>상세 입력</h4>
						<div id="form" style="border-bottom:1px solid gray;border-top:1px solid gray;">
							<div align="center" style="padding:100px;">
								양식을 선택해주세요.
							</div>
						</div>
						<br>
						<div id="btn-area" align="right" style="width:1060px;">
							<button type="reset" id="reset-btn" class="btn">다시 작성</button>
							<button type="submit" id="submit-btn" class="btn">기안 등록</button>
						</div>
					</form>
				</div>

			</div>
			
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="../common/footer.jsp" />
	</div>    
	
	<!-- 결재자 선택 모달 -->

      <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
	          <!-- 모달 헤더 -->
	            <div class="modal-header">
	              <h4 class="modal-title" style="margin:auto;">결재자 추가</h4>
	            </div>
	            
	            <!-- 모달 바디 -->
	            <div class="modal-body">
	            	<div id="deptArea" style="width:37%;height:400px;">
						<div style="background:rgb(224, 224, 224); height: 35px;line-height:35px;margin-bottom:20px;" align="center">전체 부서</div>
	            		<ul>
		            		<c:forEach var="d" items="${dept}">
		            			<li value="${ d.deptNo }">${ d.deptName }</li>
		            		</c:forEach>
	            		</ul>
	            	</div>
	            	<div id="userArea" style="width:58%;height:400px;">
	            		<div id="userSearch" style="height:10%;">
	            			<span><i class="fas fa-search fa-2x"></i></span><input type="text" name="searchInput" placeholder="이름, 부서 검색" style="margin-left:5px;height:100%;width:90%;">
	            		</div>
	            	
	            		<div id="userResult" style="height:85%;margin-top:19px;overflow:auto;">
	            			<table id="userTb">
								<thead>
									<tr>
										<th width="5%"></th>
										<th width="20%"></th>
										<th width="25%">이름</th>
										<th width="25%">부서</th>
										<th width="25%">직급</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
	            		</div>
	            	</div>
	            </div>
	            
	            <!-- 모달 푸터 -->
	            <div class="modal-footer">
	              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	              <button type="button" class="btn btn-primary" data-dismiss="modal" id="userSelectBtn">선택 완료</button>
	            </div>
	      </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
	
	<jsp:include page="../common/scripts.jsp" />
	<!-- daterangepicker -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button)
	</script>
	<script>
		function formSelect(){
			const formNo = $("option:selected").val();
			console.log(formNo);
			
			if(formNo == 1) {				
				$("#form").load("dayOffForm.ap");
			}else if(formNo == 2){
				$("#form").load("overTimeForm.ap");
			}else if(formNo == 3){
				$("#form").load("expenseReportForm.ap");
			}else if(formNo == 4){
				$("#form").load("buisnessTripForm.ap");
			}else if(formNo == 5){
				$("#form").load("workReportForm.ap");
			}else {
				$("#form").html('<div align="center" style="padding:100px;">양식을 선택해주세요.</div>');
			}

		}
		let maxLine = 0;
		let lineArr = [];
		
		$("#del-btn").click(function(){
			if(maxLine == 0){
				alert("삭제할 데이터가 없습니다.");
			}else {
				
				$("#lineTb>tbody>tr").last().remove();
				/*lineArr.pop();*/
				maxLine--;
			}
		})

		$("#apvlLine-btn").click(function(){
			if(maxLine < 3){
				$(this).attr("data-toggle", "modal");
			}else {
				alert("결재자는 3명까지 선택 가능합니다.");
				$(this).attr("data-toggle", "");
			}
		})

		$(function(){
			
			$("#deptArea li").click(function(){
				$.ajax({
					url:"deptUserSelect.ap",
					data:{deptNo:$(this).val()},
					success:function(result){
						let userList = "";
						console.log(result);
						
						if(result == "") {
							userList += "<tr align='center' height='50px'>"
									 +  	"<td colspan='5'>결과가 없습니다.</td>"
									 +	"</tr>";
						}else{
							
							for(let i in result){
								userList += "<tr align='center' height='50px'>"
										 +		"<td><input type='radio' name='userNo' value='" + result[i].userNo + "' required></td>"
										 +		"<td><div class='box' style='background: #BDBDBD;'><img class='profile' src='" + result[i].userFilePath + "'></div></td>"
										 +		"<td>" + result[i].userName + "</td>"
										 +		"<td>" + result[i].deptName + "</td>"
										 +		"<td>" + result[i].userRank + "</td>"
										 +	"</tr>";
							}
						}
						$("#userTb tbody").html(userList);
						
					},error:function(){
						console.log("ajax통신 실패");
					}
				})
			})
			
			let $searchInput = $("#userSearch Input[name=searchInput]");
			
			$searchInput.keyup(function(){
				$.ajax({
					url:"userSearch.ap",
					data:{keyword:$searchInput.val()},
					success:function(result){
						let userList = "";
						if($searchInput.val().length > 0){
							
							for(let i in result){
								userList += "<tr align='center' height='50px'>"
									 +		"<td><input type='radio' name='userNo' value='" + result[i].userNo + "' required></td>"
									 +		"<td><div class='box' style='background: #BDBDBD;'><img class='profile' src='" + result[i].userFilePath + "'></div></td>"
									 +		"<td>" + result[i].userName + "</td>"
									 +		"<td>" + result[i].deptName + "</td>"
									 +		"<td>" + result[i].userRank + "</td>"
									 +	"</tr>";
							}
						}
						$("#userTb tbody").html(userList);
					},error:function(){
						console.log("ajax통신 실패");
					}
				})
			})

			
			
			$("#userSelectBtn").click(function(){
				
				if($("input[name='userNo']:checked").val() == null){
					alert("결재자를 선택해주세요.");				
				}else {
					
					$.ajax({
						url:"userSelect.ap",
						data:{selectUserNo:$("input[name='userNo']:checked").val()},
						success:function(result){
							maxLine++;
							let	user = "<tr align='center' height='50px'>"
									 +		"<td width='20px' style='font-weight:800;'>" + maxLine + "</td>"
									 +		"<td width='50px'><div class='box' style='background: #BDBDBD;'><img class='profile' src='" + result.userFilePath + "'></div></td>"
									 +		"<td width='50px'>" + result.userName + "</td>"
									 +		"<td width='50px'>" + result.userRank + "</td>"
									 +		"<td width='100px'>" + result.deptName + "</td>"
									 +		"<input type='hidden' name='lineUser' value='" + result.userNo + "'>"
									 +	"</tr>";
							
							$("#lineTb tbody").append(user);
							$("#userTb tbody").html("");
							/*lineArr.push(result.userNo);*/
							
						},error:function(){
							console.log("ajax통신 실패");
						}
					})
				}
				
			})
			
			
			
			
		})
		
	</script>
</body>
</html>