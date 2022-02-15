<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #title, #content{
        width:100%;
    }

</style>
</head>
<body>
    <table border>
        <tr>
            <td colspan="2" height="200" align="center"><h4>출장 신청서</h4></td>
            <td colspan="4"  width="700"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="5">
                <input type="text" id="title" name="apvlTitle" required>
            </td>
        </tr>
        <tr>
            <th width="150">소속 부서</th>
            <td width="170">&nbsp;&nbsp;&nbsp;${ userDeptName }</td>
            <th width="150">기안자</th>
            <td width="170">&nbsp;&nbsp;&nbsp;${ loginUser.userName }</td> 
            <th width="150">기안일</th>
            <td width="170">&nbsp;&nbsp;&nbsp;<c:set var="current" value="<%= new java.util.Date() %>"/><fmt:formatDate value="${current }" type="both" pattern="yyyy-MM-dd(E)"/></td>
        </tr>
        <tr>
            <th width="150">출장지</th>
            <td width="170"><input type="text" name="btPlace" required></td>
            <th width="150">출장 시작일</th>
            <td width="170"><input type="date" name="btStartDate" required></td>
            <th width="150">출장 종료일</th>
            <td width="170"><input type="date" name="btEndDate" required></td> 
        </tr>
        <tr>
            <th>출장 여비</th>
            <td colspan="5"><input type="number" name="btExpense" required>원</td>
        </tr>
        <tr>
            <th colspan="6" >출장 목적</th>
        </tr>
        <tr>
            <td colspan="6">
                <textarea name="btPurpose" id="content" rows="20" style="resize:none;" required></textarea>
            </td>
        </tr>
    </table>
</body>
</html>