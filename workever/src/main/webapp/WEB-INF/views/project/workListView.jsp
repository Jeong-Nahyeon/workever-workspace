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
		/*border:1px solid red;*/
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
	
				<br><br><br><br><br><br><br><br>
				
			
			</div>
			
			<div class="workList">
				<c:choose>
				   	<c:when test="${ not empty list }">
				   		<h4>전체 업무 (${ list.size() })</h4>
				   	</c:when>
				   	<c:otherwise>
				   		<h4>전체 업무 (0)</h4>
				   	</c:otherwise>
				</c:choose>
				<br>
	            <table id="workList" class="table" align="center">
	                <thead align="center">
			                <tr>
			                  	<th>번호</th>
			                  	<th>상태</th>
			                  	<th>우선순위</th>
			                  	<th>제목</th>
			                  	<th>담장자</th>
			                  	<th>시작일</th>
			                  	<th>마감일</th>
			                </tr>
	                </thead>
	                <tbody align="center">
	                <c:choose>
	                	<c:when test="${ not empty list }">
							<c:forEach var="w" items="${ list }">
		                    <tr>
		                        <td> ${w.workBoardNo } </td>
		                        <c:choose>
		                        	<c:when test="${ w.workStatus eq '완료' }">
		                        		<td> <span class="badge badge-pill badge-primary">${ w.workStatus }</span> </td>
		                        	</c:when>
		                        	<c:when test="${ w.workStatus eq '진행' }">
		                        		<td> <span class="badge badge-pill badge-success">${ w.workStatus }</span> </td>
		                        	</c:when>
		                        	<c:otherwise>
		                        		 <td> <span class="badge badge-pill badge-warning">${ w.workStatus }</span> </td>
		                        	</c:otherwise>
		                        </c:choose>
		                        
		                        <td> ${w.workPriority } </td>
		                        <td> ${w.workTitle }</td>
		                        <td>${w.workManager }</td>
		                        <td>${w.workStartDate }</td>
		                        <td>${w.workEndDate }</td>
		                    </tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
		                	<td colspan=7 style="text-align: center;"> <span>해당 업무가 없습니다.</span> </td>
		                </c:otherwise>
					</c:choose>  
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
		$("input[name=workDivision]").change(function(){
			const formNo = $("input[name=workDivision]:checked").val();
			console.log(formNo);
			
			if(formNo == 1) {				
				$(".workList").load("work.all?proNo=" + ${proNo});
			}else if(formNo == 2){
				$(".workList").load("work.my?proNo=" + ${proNo}+"&workManager="+"${loginUser.userName}");
			}		
		})
	</script>
	

</body>
</html>