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
	<c:choose>
		<c:when test="${ empty param }">
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
		            <td width="170"><input type="text" size="15" id="btStartDate" name="btStartDate" required></td>
		            <th width="150">출장 종료일</th>
		            <td width="170"><input type="text" size="15" id="btEndDate" name="btEndDate" required></td> 
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
		</c:when>
		<c:otherwise>
		    <table border>
		        <tr>
		            <td colspan="2" height="200" align="center"><h4>출장 신청서</h4></td>
		            <td colspan="4"  width="700"></td>
		        </tr>
		        <tr>
		            <th>제목</th>
		            <td colspan="5">
		                <input type="text" id="title" name="apvlTitle" value="${ param.apvlTitle }" required>
		            </td>
		        </tr>
		        <tr>
		            <th width="150">소속 부서</th>
		            <td width="170">&nbsp;&nbsp;&nbsp;${ param.apvlWriterDeptName }</td>
		            <th width="150">기안자</th>
		            <td width="170">&nbsp;&nbsp;&nbsp;${ param.apvlWriterName }</td> 
		            <th width="150">기안일</th>
		            <td width="170">&nbsp;&nbsp;&nbsp;${ param.apvlCreateDate }</td>
		        </tr>
		        <tr>
		            <th width="150">출장지</th>
		            <td width="170"><input type="text" name="btPlace" value="${ param.btPlace }" required></td>
		            <th width="150">출장 시작일</th>
		            <td width="170"><input type="text" size="15" id="btStartDate" name="btStartDate" value="${ param.btStartDate }" required></td>
		            <th width="150">출장 종료일</th>
		            <td width="170"><input type="text" size="15" id="btEndDate" name="btEndDate" value="${ param.btEndDate }" required></td> 
		        </tr>
		        <tr>
		            <th>출장 여비</th>
		            <td colspan="5"><input type="number" name="btExpense" value="${ param.btExpense }" required>원</td>
		        </tr>
		        <tr>
		            <th colspan="6" >출장 목적</th>
		        </tr>
		        <tr>
		            <td colspan="6">
		                <textarea name="btPurpose" id="content" rows="20" style="resize:none;" required>${ param.btPurpose }</textarea>
		            </td>
		        </tr>
		    </table>
		    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
		  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		</c:otherwise>
	</c:choose>
	<script>
    	$(function(){
    		
    		
    		
    		$.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                //,minDate: 0                
            })
            
           $("#btEndDate").datepicker();
            
			$("#btStartDate").datepicker({
				minDate:0,
				onClose:function(selectedDate){
					$("#btEndDate").val("");
					$("#btEndDate").datepicker("option", "minDate", selectedDate);

				}
			})
			
			
    		
    	})
    </script>
</body>
</html>