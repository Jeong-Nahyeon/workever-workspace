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
		/*border: 1px solid red;*/
	}
	.myPro{
		/*border: 1px solid blue;*/

	}
	.project{
		width:280px;
		height:225px;
		border-radius:20px;
		background-color: rgb(214, 214, 214);
		/*border: 1px solid yellow;*/
		
	}
	.project>*{
	margin-left:25px;
	}
	
	.myProEl{
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


	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			<div class="allProWrap">
				<br>
				<div class="myPro">
					<b><p style="font-size:30px">My Project</p></b>
	                    <c:choose>
	                    	<c:when test="${not empty list}">
								<c:forEach var="p" items="${list}">
									<div class="myProEl"> 
										<div class="project"><br>
											<p style="font-size:20px; font-weight:bold;" onclick="detailPro(${p.proNo})">${p.proTitle}</p>
											
											
											<div><span style="font-size:13px">${p.proDept}</span></div>
										
											<br><br>
											<c:if test="${not empty p.proGrantWhether}">
												<i class="fas fa-lock fa-lg" style="float:right;margin-right:37px;"></i>
				                        	</c:if>
				                        	<br>
				                        	
											<div style="margin-left:180px"><b><span> ${p.proNumberPeople}명 참여중 </span></b></div>
				                        	
											<c:if test="${loginUser.userName.equals(p.proManager)}">
												<a style="font-size:13px; color: red;" onclick="deleteconfirm(${p.proNo});">삭제하기</a>
												<a style="font-size:13px; color: blue;" onclick="updateconfirm(${p.proNo});">수정하기</a> 
											</c:if>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											
										</div>
									</div> 
								</c:forEach>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<b><h4>참여하고 있는 프로젝트가 없습니다.</h4></b>
	                    	</c:otherwise>
	                    </c:choose>                    
					
					
					<form id="postForm" action="" method="post">
						<input type="hidden" id="proNo" name="proNo" value="">
					</form> 
					
					 <script>
					 function updateconfirm(no){
		   				  
		            	  document.getElementById("proNo").value = no;
		            	  
		            	  $("#postForm").attr("action","updateForm.pro").submit();
		            	  
		            }
					 
			            function deleteconfirm(no){
			            	
			   				  console.log(no);
			   				  
			            	  document.getElementById("proNo").value = no;
			            	  const result = confirm('정말로 삭제하시겠습니까?\n삭제하시면 복구할 수 없습니다.');
			            	  
			            	  console.log($("#postForm").val());
			            	  
		            		  if(result){
			            		$("#postForm").attr("action", "delete.pro").submit();
			            	  }else{
			            		  return false;
			            	  }
							  
			            }
		            </script>
					<script>
			            function detailPro(no){
  
			            	  document.getElementById("proNo").value = no;
			            	  
			            	  $("#postForm").attr("action", "detail.pro").submit();
		
			            }
		            </script>
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