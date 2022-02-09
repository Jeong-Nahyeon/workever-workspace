<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <td colspan="2" height="200" align="center"><h4>휴가 신청서</h4></td>
            <td colspan="4"  width="700"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="5">
                <input type="text" id="title">
            </td>
        </tr>
        <tr>
            <th width="150">소속 부서</th>
            <td width="170">&nbsp;&nbsp;&nbsp;개발팀</td>
            <th width="150">기안자</th>
            <td width="170">&nbsp;&nbsp;&nbsp;홍길동</td> 
            <th width="150">기안일</th>
            <td width="170">&nbsp;&nbsp;&nbsp;2022-01-20</td>
        </tr>
        <tr>
            <th>휴가 종류</th>
            <td colspan="5">
                &nbsp;&nbsp;&nbsp;
                <input type="checkbox">연차
                <input type="checkbox">병가
                <input type="checkbox">공가
                <input type="checkbox">정기 휴가
                <input type="checkbox">출산 휴가
            </td>
        </tr>
        <tr>
            <th>휴가 기간</th>
            <td colspan="5">
                &nbsp;&nbsp;&nbsp;
                <input type="date"> ~ <input type="date">
            </td>
        </tr>
        <tr>
            <th colspan="6" >사유</th>
        </tr>
        <tr>
            <td colspan="6">
                <textarea name="" id="content" rows="20" style="resize:none;"></textarea>
            </td>
        </tr>
    </table>
</body>
</html>