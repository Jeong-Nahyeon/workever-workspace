<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workever</title>
    
	<jsp:include page="../common/links.jsp" />
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

	#apvlLine-btn, #submit-btn{
		background: #4E73DF;
		color:white;
	}

	#reset-btn{
		background: rgb(133, 135, 150);
		color:white;
	}

	#form>table{
		margin:auto;
		margin-top:30px;
		margin-bottom:30px;
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
					<form action="" id="approval-form">
						<table id="enroll-tb">
							<tr style="border-bottom:1px solid gray;">
								<th width="150">결재 양식</th>
								<td width="10"></td>
								<td width="920">
									<select name="" id="formNo" required>
										<option value="">-----선택-----</option>
										<option value="1">휴가 신청서</option>
										<option value="2">연장 근무 신청서</option>
										<option value="3">지출 품의서</option>
										<option value="4">출장 신청서</option>
										<option value="5">업무 보고서</option>
									</select>
									<button type="button" onclick="formSelect();">선택</button>
								</td>
							</tr>
							<tr>
								<th>결재선 지정</th>
								<td></td>
								<td style="line-height:3;">
									1. 개발팀 이말똥 부장 <br>
									<button id="apvlLine-btn" class="btn btn-sm">결재자 추가</button>
								</td>
							</tr>
						</table>
						<br><br><br>
						<h4>상세 입력</h4>
						<div id="form" style="border-bottom:1px solid gray;border-top:1px solid gray;">
					
							<!-- <jsp:include page="approvalDayOffForm.jsp"/> -->
							<!-- <jsp:include page="approvalOverTimeForm.jsp"/> -->
							<!-- <jsp:include page="approvalWorkReportForm.jsp"/> -->
							<!-- <jsp:include page="approvalBuisnessTripForm.jsp"/> -->
							<!-- <jsp:include page="approvalExpenseReportForm.jsp"/> -->
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
	<jsp:include page="../common/scripts.jsp" />
	<script>
		function formSelect(){
			const formNo = $("option:selected").val();
			console.log(formNo);

					$("#form").html('dse').html();
			
		}
	</script>
</body>
</html>