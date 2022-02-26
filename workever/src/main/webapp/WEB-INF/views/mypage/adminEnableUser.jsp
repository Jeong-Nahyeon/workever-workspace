<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style>
    div{box-sizing: border-box;}
    .content-wrapper{overflow: hidden; position: relative;}
    .content-title{
        overflow: hidden;
        margin: 50px 100px;
        border-bottom: 1px solid lightgray;
    }
    .content-title span{
        font-size: 25px;
        font-weight: 600;
    }

    .card{
        margin-left: 150px; margin-right: 150px;
    }
    .table{
        text-align: center;
    }
    
    .card-sub{
        width: 500px;
        margin: auto;
        text-align: center;
    }
    .card-footer ul{
        margin-bottom: 0;
    }

    #userRank, #userJoinDate{
        border: none;
        border-bottom: 1px solid lightgray;
        width: 150px;
        font-size: 13px;
    }
    .enable-modal{
        border: none;
        color: blue;
        background-color: white;
    }

    

    #enableContent{
        text-align: center; 
        margin: auto; margin-bottom: 50px; 
    }
    .td-title{
        font-size: 13px;
        width: 100px; height: 30px;
    }
    .datepick{
        text-decoration: none;
        color: lightgray;
    }

</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
    <jsp:include page="mypageSidebar.jsp" />

    <div class="content-wrapper">
        <div class="content-title">
            <span>회원 승인</span>
        </div>

        <div class="card">
            <div class="card-body p-0">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 10px">
                                <input type="checkbox" name="" id="">
                            </th>
                            <th>사원명</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th style="width: 100px">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="d" items="${disableUser}">
                            <tr>
                                <td><input type="checkbox" name="" id=""></td>
                                <td class="userName">${d.userName}</td>
                                <td class="userEmail">${d.userEmail}</td>
                                <td class="userPhone">${d.userPhone}</td>
                                <td>
                                    <!--<a href="" id="enable-modal">미승인</a>-->
                                    <button class="enable-modal">미승인</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->

            <div class="card-footer clearfix">
                <div class="card-sub">
                    <ul class="pagination pagination-sm justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 가입 승인 모달 -->
    <div class="modal" id="modal-userEnable">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="margin-left:180px;">
                        <span style="text-align: center; font-size: 17px; font-weight: 700;">
                            사원가입 승인
                        </span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div style="text-align: center;">
                        <span id="modal-userName"
                            style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
                            
                        </span><br>
                        <span id="modal-userEmail"
                            style="font-size: 13px; display: inline-block; margin: 10px 0 10px 0;">
                            
                        </span><br>
                        <span style="font-size: 13px; display: inline-block; margin: 10px 0 5px 0;">
                            해당 사원의 가입을 승인하시겠습니까?
                        </span><br>
                        <span style="font-size: 13px; display: inline-block; margin-bottom: 40px;">
                            부서와 직급을 선택하세요.
                        </span> 
                    </div>
                    <table id="enableContent" >
                        <tr>
                            <td class="td-title">부서</td>
                            <td> 
                                <select name="" id="userDept" style="border: 1px solid lightgray; width: 150px; font-size: 13px;">
                                    <c:forEach var="dept" items="${deptList}">
                                        <option value="${dept.deptNo}">${dept.deptName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="td-title">직급</td>
                            <td>
                                <input type="text" name="userRank" id="userRank">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="td-title">입사일</td>
                            <td>
                                <input type="text" name="userJoinDate" id="userJoinDate">
                            </td>
                        </tr>
                    </table>
                    <div style="text-align: center;">
                        <button type="button" class="btn" id="btn-enable"
                        style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
                            승인
                        </button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" 
                        style="width: 90px; margin-left: 60px;">
                            취소
                        </button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/scripts.jsp" />
    <!-- jQuery UI 1.11.4 -->
    <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- datetimepicker -->
    
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

    <script>
        $(function(){
            $('.enable-modal').click(function(){
                //$('#modal-userName').text($('.userName').text());
                //$('#modal-userPhone').text($('.userPhone').text());

                $('#modal-userName').text($(this).parent().siblings(".userName").text());
                $('#modal-userEmail').text($(this).parent().siblings(".userEmail").text());

                $('#modal-userEnable').modal('show');
            });

            $('#btn-enable').click(function(){
                var userDept = $('#userDept option:selected').val();
                var userRank = $('#userRank');
                var userJoinDate = $('#userJoinDate');

                if(userRank.val() == ''){
                    alert('직급을 입력해주세요.');
                    userRank.focus();
                }else if(userJoinDate.val() == ''){
                    alert('입사일을 입력해주세요.');
                    userJoinDate.focus();
                }else{
                    $.ajax({
                        url: "updateEnable.ad",
                        data:{
                            deptNo:userDept,
                            userRank:userRank.val(),
                            userEmail:$('#modal-userEmail').text(),
                            userJoinDate:userJoinDate.val()
                        },
                        success:function(result){
                            console.log(result);
                            if(result == 'NNNNY'){
                                $('#modal-userEnable').modal('hide');
                                alert('회원상태를 변경했습니다.');
                                location.reload();
                            }else{
                                alert('회원상태 변경에 실패했습니다.');
                                $('#modal-userEnable').modal('hide');
                            }
                        },error:function(){
                            console.log("회원상태변경 ajax 통신 실패");
                        }
                    })
                }
            })

            $('#userJoinDate').datepicker({
                dateFormat: 'mm/dd/yy'
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
                ,changeYear: true //option값 년 선택 가능
                ,changeMonth: true //option값  월 선택 가능                
                ,buttonText: "선택" //버튼 호버 텍스트              
                ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
                ,dayNamesMin: ['일','월','화','수','목','금','토'] 
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']

            });
        })
    </script>
</body>
</html>