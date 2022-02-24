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
		.seletor{
		top:100px;
		left:120px;
		position: relative;
		/*border:1px solid green;*/

		}
	
		.workList{ 
		top: -230px;
		left: 20%;
		position: relative;
		border:1px solid red;
		width:1100px;
		
		}
		
		#workList{
		/*border:1px solid black;*/
		background-color: white;
		}
		
		input{
    	margin-bottom: 20px !important; 
		}
		
		#back{
		float:right;
		margin-right: 300px;
		margin-top: 50px
		}
		
	
	
	</style>
    
</head>

<body class="hold-transition sidebar-mini">

	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		
			<button type="button" id="back" class="btn btn-primary" onclick="javascript:history.go(-1);">닫기</button>
		
		
		
			<div class="seletor" >
				<b style="font-size:17px">업무 구분</b><br>
				<div style="height: 10px"></div>
		        <input type="radio" name="workDivision" value="1" checked>&nbsp;&nbsp;&nbsp;전체업무<br>
				<input type="radio" name="workDivision" value="2">&nbsp;&nbsp;&nbsp;내 업무<br>
	
				<br><br>
				
				<b style="font-size:17px">상태</b><br>
				<div style="height: 10px"></div>
				<input type="radio" name="status" value="progress">&nbsp;&nbsp;&nbsp;진행<br>
		        <input type="radio" name="status" value="complete">&nbsp;&nbsp;&nbsp;완료<br>
		        <input type="radio" name="status" value="hold">&nbsp;&nbsp;&nbsp;보류<br>
			</div>
			
			<div class="workList">
				<h4>전체 업무(3)</h4>
				<br>
	            <table id="workList" class="table" align="center">
	                <thead align="center">
			                <tr>
			                  	<th>번호</th>
			                  	<th>상태</th>
			                  	<th>우선순위</th>
			                  	<th>제목</th>
			                  	<th>담장자</th>
			                  	<th>수정일</th>
			                </tr>
	                </thead>
	                <tbody align="center">
		                
		                    <tr>
		                        <td> 1 </td>
		                        <td> <span class="badge badge-pill badge-primary">완료</span> </td>
		                        <td> 낮음 </td>
		                        <td> sds</td>
		                        <td>홍길동</td>
		                        <td>2021-12-01</td>
		                    </tr>
		                    
	   	                    <tr>
		                        <td> 1 </td>
		                        <td> <span class="badge badge-pill badge-success">진행</span> </td>
		                        <td> 낮음 </td>
		                        <td> 업무글 작성</td>
		                        <td>홍길동</td>
		                        <td>2021-12-01</td>
		                    </tr>
		                    <tr>
		                        <td> 1 </td>
		                        <td> <span class="badge badge-pill badge-warning">보류</span> </td>
		                        <td> 낮음 </td>
		                        <td> 업무글 작성</td>
		                        <td>홍길동</td>
		                        <td>2021-12-01</td>
		                    </tr>
		                
	                </tbody>
	            </table>
			</div>
		
		
		
		
		

		</div>
		<!-- /.content-wrapper -->
		
		<jsp:include page="../common/footer.jsp" />
		
	</div>    
	
	<jsp:include page="../common/scripts.jsp" />
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button)
	</script>
	
	<script>
		$("input[name=workDivision]").change(function(){
			const formNo = $("input[name=workDivision]:checked").val();
			console.log(formNo);
			
			if(formNo == 1) {				
				$(".workList").load("work.all");
			}else if(formNo == 2){
				$(".workList").load("work.my");
			}		
		})
	</script>
	
</body>
</html>