<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
								<c:forEach var="mw" items="${ list }">
		                    <tr>
		                        <td> ${mw.workBoardNo } </td>
		                        <c:choose>
		                        	<c:when test="${ mw.workStatus eq '완료' }">
		                        		<td> <span class="badge badge-pill badge-primary">${ mw.workStatus }</span> </td>
		                        	</c:when>
		                        	<c:when test="${ mw.workStatus eq '진행' }">
		                        		<td> <span class="badge badge-pill badge-success">${ mw.workStatus }</span> </td>
		                        	</c:when>
		                        	<c:when test="${ mw.workStatus eq '보류' }">
		                        		<td> <span class="badge badge-pill badge-warning">${ mw.workStatus }</span> </td>
		                        	</c:when>
		                        </c:choose>
		                        
		                        <td> ${mw.workPriority } </td>
		                        <td> ${mw.workTitle }</td>
		                        <td>${mw.workManager }</td>
		                        <td>${mw.workStartDate }</td>
		                        <td>${mw.workEndDate }</td>
		                    </tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
		                	<td colspan=7 style="text-align: center;"> <span>해당 업무가 없습니다.</span> </td>
		                </c:otherwise>
					</c:choose>
         </table>

</body>
</html>