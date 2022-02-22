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
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
	div, input, textarea{ box-sizing:border-box;}

	#setForm-area{
		/* border:1px solid black; */
		margin:auto;
		width:1300px;
		padding-top:50px;
		padding-bottom:100px;
	}

	#setform-inner{
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

	#formBtn, #addBtn{
		background: #4E73DF;
		color:white;
	}

	#removeBtn{
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

	#notUseFormArea, #useFormArea{
		border-radius:5px;
		border:1px solid rgb(190, 179, 179);
	}
	
	#addRemoveBtn{
		padding-top:100px;
	}
	
	input[type=checkbox]{
		margin:10px;
		width:18px;
		height:18px;
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
			<h3>&nbsp;&nbsp;&nbsp;결재 양식 관리</h3>
			<hr>
			<!-- 양식 관리 전체 영역 -->
			<div id="setForm-area">
				
				<div id="setform-inner">
						<input type="hidden" value="${ loginUser.userNo }" name="apvlWriter">
						<table id="enroll-tb">
							<tr style="border-bottom:1px solid gray;">
								<th width="150">결재 양식</th>
								<td width="10"></td>
								<td width="920" height="70" id="formArea">
									<c:forEach var="f" items="${ formList }">
										<c:if test="${ f.apvlFormStatus eq 'Y' }">
											<input type="radio" id="${ f.apvlFormNo }" name="form" value="${ f.apvlFormNo }"><label for="${ f.apvlFormNo }">${ f.apvlFormName }</label>&nbsp;&nbsp;&nbsp;
										</c:if>
									</c:forEach>
								</td>
							</tr>						
						</table>
						<div align="right" style="width:1060px;padding-top:20px">
							<button type="button" class="btn" id="formBtn" data-toggle="modal" data-target="#modal-lg">양식 설정</button>
						</div>
						<br><br><br>
						<h4>양식 미리 보기</h4>
						<div id="form" style="border-bottom:1px solid gray;border-top:1px solid gray;">
							<div align="center" style="padding:100px;">
								양식을 선택해주세요.
							</div>
						</div>
						<br>

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
	              <h4 class="modal-title" style="margin:auto;">결재 양식 관리</h4>
	            </div>
	            
	            <!-- 모달 바디 -->
	            <div class="modal-body">
	            	<div id="notUseFormArea" style="width:40%;height:400px;">
						<div style="background:rgb(224, 224, 224); height: 35px;line-height:35px;margin-bottom:20px;" align="center">비활성 양식</div>
	            		
	            		<c:forEach var="f" items="${ formList }">
							<c:if test="${ f.apvlFormStatus eq 'N' }">
								&nbsp;&nbsp;&nbsp;<input type="checkbox" name="addForm" value="${ f.apvlFormNo }">${ f.apvlFormName }<br>
							</c:if>
						</c:forEach>
	            		
	            	</div>
	            	<div id="addRemoveBtn" style="width:13%;height:400px;" align="center">
						<button class="btn" id="addBtn">add</button>
						<br>
						<i class="fas fa-lg fa-solid fa-arrow-right"></i>
						<br><br>
						<i class="fas fa-lg fa-solid fa-arrow-left"></i>
						<br>
	            		<button class="btn" id="removeBtn">remove</button>
	            	</div>
	            	<div id="useFormArea" style="width:40%;height:400px;">
	            		
	            	
	            		<div style="background:rgb(224, 224, 224); height: 35px;line-height:35px;margin-bottom:20px;" align="center">사용 중인 양식</div>
	            		
	            		<c:forEach var="f" items="${ formList }">
							<c:if test="${ f.apvlFormStatus eq 'Y' }">
								&nbsp;&nbsp;&nbsp;<input type="checkbox" name="removeForm" value="${ f.apvlFormNo }">${ f.apvlFormName }<br>
							</c:if>
						</c:forEach>
	            	</div>
	            </div>
	            
	            <!-- 모달 푸터 -->
	            <div class="modal-footer">
	              <button type="button" class="btn btn-default" data-dismiss="modal" id="formSetCancelBtn">취소</button>
	              <button class="btn btn-primary" data-dismiss="modal" id="formSavetBtn">저장</button>
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
	
		
	

		$(function(){
			
			$("#addBtn").click(function(){
				let formNoArr = [];
				let use = "<div style='background:rgb(224, 224, 224); height: 35px;line-height:35px;margin-bottom:20px;' align='center'>사용 중인 양식</div>";
				let notUse = "<div style='background:rgb(224, 224, 224); height: 35px;line-height:35px;margin-bottom:20px;' align='center'>비활성 양식</div>";
				$("input[name=addForm]:checked").each(function(){
					formNoArr.push($(this).val());
				})
				
				if(formNoArr.length == 0){
					alert("비활성 양식에서 양식을 선택해주세요.");
				}else {
					$.ajax({
						url:"setAddForm.ap",
						data:{apvlFormNo:formNoArr,
							  comNo:${loginUser.comNo}},
						success:function(result){
							for(let i in result){
								
								if(result[i].apvlFormStatus == 'Y'){
									use += "&nbsp;&nbsp;&nbsp;<input type='checkbox' name='removeForm' value='" + result[i].apvlFormNo + "'>" + result[i].apvlFormName + "<br>"
								}else {
									notUse += "&nbsp;&nbsp;&nbsp;<input type='checkbox' name='addForm' value='" + result[i].apvlFormNo + "'>" + result[i].apvlFormName + "<br>"
								}
							}
							
							$("#notUseFormArea").html(notUse);
							$("#useFormArea").html(use);
						},error:function(){
							console.log("ajax통신 실패");
						}
					})
				}
			})
			
			
			$("#removeBtn").click(function(){
				let formNoArr = [];
				let use = "<div style='background:rgb(224, 224, 224); height: 35px;line-height:35px;margin-bottom:20px;' align='center'>사용 중인 양식</div>";
				let notUse = "<div style='background:rgb(224, 224, 224); height: 35px;line-height:35px;margin-bottom:20px;' align='center'>비활성 양식</div>";
				$("input[name=removeForm]:checked").each(function(){
					formNoArr.push($(this).val());
				})

				if(formNoArr.length == 0){
					alert("사용중 양식에서 양식을 선택해주세요.");
				}else {
					$.ajax({
						url:"setRemoveForm.ap",
						data:{apvlFormNo:formNoArr,
							  comNo:${loginUser.comNo}},
						success:function(result){
							for(let i in result){
								
								if(result[i].apvlFormStatus == 'Y'){
									use += "&nbsp;&nbsp;&nbsp;<input type='checkbox' name='removeForm' value='" + result[i].apvlFormNo + "'>" + result[i].apvlFormName + "<br>"
								}else {
									notUse += "&nbsp;&nbsp;&nbsp;<input type='checkbox' name='addForm' value='" + result[i].apvlFormNo + "'>" + result[i].apvlFormName + "<br>"
								}
							}
							
							$("#notUseFormArea").html(notUse);
							$("#useFormArea").html(use);
						},error:function(){
							console.log("ajax통신 실패");
						}
					})
				}
			})
			
			$("#formSetCancelBtn").click(function(){
				$("input:checkbox").prop("checked",false);
			})
			
			$("#formSavetBtn").click(function(){
				$("input:checkbox").prop("checked",false);
				let value = "";
				$.ajax({
					url:"formList.ap",
					data:{comNo:${loginUser.comNo}},
					success:function(result){
						for(let i in result){
							if(result[i].apvlFormStatus == 'Y'){
								value += "<input type='radio' id='" + result[i].apvlFormNo + "' name='form' value='" + result[i].apvlFormNo + "'><label for='" + result[i].apvlFormNo + "'>" + result[i].apvlFormName + "</label>&nbsp;&nbsp;&nbsp;"
							}
							
							$("#formArea").html(value);
							
							$("input[name=form]").change(function(){
								const formNo = $("input[name=form]:checked").val();
								
								if(formNo == 1) {				
									$("#form").load("dayOffForm.ap");
								}else if(formNo == 2){
									$("#form").load("overTimeForm.ap");
								}else if(formNo == 3){
									$("#form").load("workReportForm.ap");
								}else if(formNo == 4){
									$("#form").load("expenseReportForm.ap");
								}else if(formNo == 5){
									$("#form").load("buisnessTripForm.ap");
								}else {
									$("#form").html('<div align="center" style="padding:100px;">양식을 선택해주세요.</div>');
								}			
							})
						}
					},error:function(){
						console.log("ajax통신 실패");
					}
				})
			})
			
			
			$("input[name=form]").change(function(){
				const formNo = $("input[name=form]:checked").val();
				
				if(formNo == 1) {				
					$("#form").load("dayOffForm.ap");
				}else if(formNo == 2){
					$("#form").load("overTimeForm.ap");
				}else if(formNo == 3){
					$("#form").load("workReportForm.ap");
				}else if(formNo == 4){
					$("#form").load("expenseReportForm.ap");
				}else if(formNo == 5){
					$("#form").load("buisnessTripForm.ap");
				}else {
					$("#form").html('<div align="center" style="padding:100px;">양식을 선택해주세요.</div>');
				}			
			})
		})
		
	</script>
</body>
</html>