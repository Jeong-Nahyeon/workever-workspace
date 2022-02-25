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

<h4>전체 업무 (${ list.size() })</h4>
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
              
                	<c:if test="${ not empty list }">
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
						</c:if>
             </tbody>
         </table>

</body>
</html>