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
            <td colspan="2" height="200" align="center"><h4>연장 근무 신청서</h4></td>
            <td colspan="4"  width="700"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="5">
                <input type="text" id="title" name="apvlTitle" required>
            </td>
        </tr>
        <tr>
            <th width="130">소속 부서</th>
            <td width="170">&nbsp;&nbsp;&nbsp;${ userDeptName }</td>
            <th width="130">기안자</th>
            <td width="170">&nbsp;&nbsp;&nbsp;${ loginUser.userName }</td> 
            <th width="130">기안일</th>
            <td width="230">&nbsp;&nbsp;&nbsp;<c:set var="current" value="<%= new java.util.Date() %>"/><fmt:formatDate value="${current }" type="both" pattern="yyyy-MM-dd(E)"/></td>
        </tr>
        <tr>
            <th>업무명</th>
            <td><input type="text" name="otTitle" required></td>
            <th>연장 근무 일자</th>
            <td><input type="date" name="otDate" required></td>
            <th>연장 시간</th>
            <td><input type="number" name="otWorkingHours" required>시간</td> 
        </tr>
        <tr>
            <th colspan="6" >사유</th>
        </tr>
        <tr>
            <td colspan="6">
                <textarea name="otContent" id="content" rows="20" style="resize:none;" required></textarea>
            </td>
        </tr>
    </table>
</body>
</html>