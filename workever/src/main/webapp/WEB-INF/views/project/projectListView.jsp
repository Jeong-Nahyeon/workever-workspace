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
	
	.content-wrapper{
			overflow:auto;
			height:740px;
			/*border: 1px solid black;*/
	}
	.allProWrap{
		/*border: 1px solid black;*/
		margin-left:30px;

	}
	.teamPro{
		border: 1px solid red;
	}
	.myPro{
		/*border: 1px solid blue;*/

	}
	.project{
		width:225px;
		height:260px;
		border-radius:20px;
		background-color: rgb(214, 214, 214);
		
	}
	.project>*{
	margin-left:25px;
	}
	
	.myProEl{
		width:230px;
		height:270px;
		float:left;
		margin-right:30px;
		margin-bottom:30px;
		cursor: pointer;
		/*border: 1px solid green;*/
	}
	.teamProEl{
		cursor: pointer;
		/*border: 1px solid green;*/
		width:230px;
	}
	
	</style>
    
</head>

<body class="hold-transition sidebar-mini">

		<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			<div class="allProWrap">
				<div class="teamPro">
					<b><p style="font-size:30px">Team</p></b>
					<div class="teamProEl"> 
						<div class="project"><br>
							<p style="font-size:20px; font-weight:bold;">프로젝트 제목</p>
							<p>인사팀</p>
							<br><br>
							<i class="fas fa-lock fa-2x" style="float:right;margin-right:37px"></i><br><br>
							<a style="font-size:12px" href="">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<b><span> *명 참여중 </span></b>
						</div>
					</div>
				</div>

				<hr>

				<div class="myPro">
					<b><p style="font-size:30px">Project</p></b>
					
					<c:forEach var="p" items="${list}">
						<div class="myProEl"> 
							<div class="project"><br>
								<p style="font-size:20px; font-weight:bold;">${p.proTitle}</p>
								<p>${p.proDept}</p>
								<br><br>
								<c:if test="${proGrantWhether}=='Y'">
									<i class="fas fa-lock fa-2x" style="float:right;margin-right:37px"></i>
	                        	</c:if>
	                        	<br><br>
								<a style="font-size:12px" href="">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<b><span> ${p.proNumberPeople}명 참여중 </span></b>
							</div>
						</div> 
					</c:forEach>
					
				</div><!-- 여기까지가 myPro-->
				
			</div>
			
			<br>
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
</body>
</html>