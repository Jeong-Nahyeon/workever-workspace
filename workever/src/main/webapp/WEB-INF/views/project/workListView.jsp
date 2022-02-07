<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


	#workList{text-align: center;}

	.seletor{
		top:100px;
		left:80px;
		position: relative

	}
	
	.workList{ 
		top: -200px;
		left: 20%;
		position: relative;
		
		}
		
	#workList{
		background-color: white;
	}
	
	input{
    	margin-bottom: 20px !important; 
	}

	#workBtn{
		float:right;
		margin-right: 50px;
		margin-top: 100px
	}


</style>
</head>


<body>
	<jsp:include page="../common/head.jsp" />
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/sidebar.jsp" />
		
	
	<div class="content-wrapper">
	
		<button type="button" id="workBtn" class="btn btn-primary">닫기</button>
	
	
	
		<div class="seletor" >
			<b style="font-size:17px">업무 구분</b><br>
			<div style="height: 10px"></div>
			<input type="radio" name="workDivision" value="myWork">내 업무<br>
	        <input type="radio" name="workDivision" value="allWork">전체업무<br>

			<br><br>
			
			<b style="font-size:17px">상태</b><br>
			<div style="height: 10px"></div>
			<input type="radio" name="status" value="progress">진행<br>
	        <input type="radio" name="status" value="complete">완료<br>
	        <input type="radio" name="status" value="hold">보류<br>
		</div>
		
		<div class="workList">
			<h4>내 업무(3)</h4>
			<br>
            <table id="workList" class="table" align="center">
                <thead>
                  <tr>
                    <th>번호</th>
                    <th>상태</th>
                    <th>우선순위</th>
                    <th>제목</th>
                    <th>담장자</th>
                    <th>수정일</th>
                  </tr>
                </thead>
                <tbody>
	                <c:forEach var="b" items="${ list }">
	                    <tr>
	                        <td> 1 </td>
	                        <td> <span class="badge badge-pill badge-primary">완료</span> </td>
	                        <td> 낮음 </td>
	                        <td> 업무글 작성</td>
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
	                </c:forEach>
                </tbody>
            </table>
		</div>
	
	
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
	
	
	
	
	
</body>
</html>