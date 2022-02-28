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

<!-- moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>
    div{box-sizing: border-box;}
    a{color: rgb(66, 66, 66);}
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
    #btn-insertCompanyCal{
        border: none;
        background-color: rgb(78, 115, 223);
        width: 150px; height: 35px;
        border-radius: 3%;
        float: right;
        color: white;
    }

    /*캘린더영역*/
    #calendar{
        width: 100%;
        margin: auto;
    }
    .fc-daygrid-day-number, .fc-col-header-cell-cushion {color:black}

    /* 일정상세보기 모달 */
    .cal-color, .cal-title, .cal-date, .cal-button{
        display: table-cell;
        height: 50px;
        text-align: center;
        vertical-align: middle;
    }
    .cal-color{
        width: 56px;
        margin-right: 5px;
    }
    .cal-color div{
        width: 30px; height: 30px;
        margin: auto;
    }
    .cal-title{
        width: 150px;
    }
    .cal-date{
        width: 230px;
    }
    .cal-button{ width: 80px;}
    .update{
        display: inline-block;
        margin-right: 15px;
    }
    .cal-button a{
        color: rgb(88, 88, 88);
    }
    .cal-memo{
        width: 350px;
        margin-left: 15px; margin-bottom: 10px;
        font-size: 13px;
    }

    /* 일정 등록 모달 */
    .calendar-color li{
        margin-right: 20px;
    }
    #color-etc{
        border-radius: 4%;
        width: 50px; height: 28px;
        margin-left: 20px;
    }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />

    <div class="content-wrapper">
        <div class="content-title">
            <span>내 캘린더</span>
                <button id="btn-insertCompanyCal">일정등록하기</button>
        </div>
        

        <div class="containder-fluid">
            <div class="col-md-9" style="margin: auto;">
                <div class="card">
                    <div class="card-body p-0">
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 일정 상세보기 모달 -->
    <div class="modal" id="cal-modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span id="cal-selectDay"
                        style="text-align: center; font-size: 20px; font-weight: 700; ">
                            
                        </span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <input type="hidden" class="cal-id" >
                    <input type="hidden" class="startDate-val" value="1">
                    <input type="hidden" class="endDate-val" value="2">
                    <div class="cal-color">
                        <div></div>
                        <input type="hidden" class="colorCode">
                    </div>
                    <div class="cal-title">
                        
                    </div>
                    <div class="cal-date">
                        
                    </div>
                    
                    <div class="cal-button">
                        <div>
                            <a href="#" id="btn-updateCal"><i class="fas fa-align-justify update"></i></a>
                            <a href="#" id="btn-deleteCal"><i class="far fa-trash-alt delete"></i></a>
                        </div>
                    </div>
                    
                    <div style="border-bottom: 1px solid lightgray;">
                        <div class="cal-memo">
                            <span>메모 : </span>
                            <span class="cal-memoContent"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 일정 등록 모달 -->
    <div class="modal" id="modal-inserCal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span id="modal-title"
                        style="text-align: center; font-size: 17px; font-weight: 700;">
                            Calendar 일정 등록
                        </span>
                    </div>
                    <button type="button" class="close dismiss">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <form method="post" class="CalendarForm">
                    <div class="modal-body">
                        <input type="hidden" id="userNo" name="userNo" value="${loginUser.userNo}">
                        <input type="hidden" name="calCategory" value="개인">
                        <input type="hidden" name="calNo" id="calNo">
                        <input type="hidden" id="submitCheck" value="">
                        <div class="form-group">
                            <label for="exampleInputEmail1">일정 제목</label>
                            <input type="text" class="form-control" id="calTitle" name="calTitle">
                        </div>

                        <div class="form-group" style="margin-top: 30px;">
                            <label for="exampleInputEmail1">색상</label><br>
                            <div class="btn-group calendar-color" style="text-align: center;">
                                <input type="hidden" name="calColor" id="calColor">
                                <ul class="fc-color-picker"> 
                                    <li>
                                        <a href="#" style="color: #FE2E2E;">
                                            <i class="fas fa-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" style="color: #FE9A2E;">
                                            <i class="fas fa-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" style="color: #E4DD14;">
                                            <i class="fas fa-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" style="color: #11C013;">
                                            <i class="fas fa-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" style="color: #00BFFF;">
                                            <i class="fas fa-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" style="color: #3A01DF;">
                                            <i class="fas fa-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" style="color: #CC2EFA;">
                                            <i class="fas fa-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" style="color: #A4A4A4;">
                                            <i class="fas fa-square"></i>
                                        </a>
                                    </li>
                                </ul>
                                <div style="width: 1px; height: 28px; border-left: 1px solid lightgray;"></div>
                                <div id="color-etc"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">시작 일자</label>
                            <div class="input-group date" id="startDate" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#startDate" name="calStartDate"/>
                                <div class="input-group-append" data-target="#startDate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">종료 일자</label>
                            <div class="input-group date" id="endDate" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#endDate" name="calEndDate"/>
                                <div class="input-group-append" data-target="#endDate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="checkDate" value="">
                        <div class="form-group" style="margin-top: 30px;">
                            <label for="todoMemo">내용</label><br>
                            <textarea name="calMemo" id="calMemo" cols="55" rows="3"
                            style="border: 1px solid lightgray; border-radius: 2px;"></textarea>
                        </div>

                        <div style="text-align: center;">
                            <button type="button" class="btn" id="btn-submit"
                            style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
                                등록
                            </button>
                            <button type="button" class="btn btn-secondary dismiss" 
                            style="width: 90px; margin-left: 60px;">
                                취소
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 일정 삭제 모달 -->
    <div class="modal fade" id="modal-deleteCal">
        <div class="modal-dialog ">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span style="text-align: center; font-size: 17px; font-weight: 700;">
                            Calendar 일정 삭제
                        </span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="deleteCalendar.cal">
                        <input type="hidden" name="calNo" id="calNo-delete">
                        <div style="text-align: center;">
                            <span style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
                                등록하신 일정을 삭제하시겠습니까?
                            </span><br>
                            <span style="font-size: 13px; display: inline-block; margin: 10px 0 40px 0;">
                                삭제한 일정은 복구할 수 없습니다.
                            </span><br>
                        </div>
                        <div style="text-align: center;">
                            <button type="submit" class="btn btn-danger" style="width: 90px; color: white;">
                                삭제
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" 
                            style="width: 90px; margin-left: 60px;">
                                취소
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 알림 모달 -->
    <div class="modal fade" id="alertMsg">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span style="font-size: 17px; font-weight: 700;">
                            알림
                        </span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div style="text-align: center;">
                        <span id="alertMsg-text"
                        style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
                            
                        </span><br>
                    </div>
                    <div style="text-align: center; margin-top: 60px;">
                        <button type="button" class="btn" data-dismiss="modal" 
                        style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
                            닫기
                        </button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    <!-- 스크립트 영역 -->
    <jsp:include page="../common/scripts.jsp" />
    <!-- 캘린더 -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/locales-all.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- datetimepicker -->
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

    <c:if test="${not empty alertMvMsg}">
        <script>
            $(function(){
                $('#alertMsg-text').text('${alertMvMsg}');
                $('#alertMsg').modal('show');
            })
        </script>
        <c:remove var="alertMvMsg" scope="session" />
    </c:if>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar:{
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                
                initialView:'dayGridMonth',
                navLinks: true,
                editable: false,
                selectable: true,
                dayMaxEvents: true,
                
                displayEventTime:false,

                events: [
                    $.ajax({
                        contentType: 'application/json',
                        url: 'calendarlist.cal',
                        data: {
                            user: '${loginUser}',
                            category : '개인'
                        },
                        dataType: 'json',
                        success: function (result) {
                            console.log(result);
                            
                            for(var cal in result){
                                var id = result[cal].calNo;
                                var title = result[cal].calTitle;
                                var memo = result[cal].calMemo;
                                var color = result[cal].calColor;
                                var sstart = result[cal].calStartDate;
                                var send = result[cal].calEndDate;

                                var startDate = moment(sstart).format('YYYY-MM-DD HH:mm');
                                var endDate = moment(send).format('YYYY-MM-DD HH:mm');

                                calendar.addEvent({
                                    id:id,
                                    title:title,
                                    start:startDate,
                                    end:endDate,
                                    color:color,
                                    description:memo,
                                    textColor:'#FFFFFF'
                                })
                            }
                        }, error: function () {

                        }
                    }) // ajax 끝

                    
                ], // events 끝
                
                eventClick:function(info){
                    console.log(info)

                    // 날짜 형식 설정
                    var titleDate = moment(info.event._instance.range.start).utc().format('YYYY년 MM월 DD일');
                    var startDate = moment(info.event._instance.range.start).utc().format('YYYY-MM-DD');
                    var endDate = moment(info.event._instance.range.end).utc().format('YYYY-MM-DD');
                    var allDate = startDate + ' ~ ' + endDate;
                    var memo = info.event._def.extendedProps.description;
                    var id = info.event._def.publicId;

                    $('#cal-selectDay').text(titleDate);
                    $(".cal-title").text(info.event._def.title);
                    $('.cal-date').text(allDate);
                    $('.cal-color div').css("background-color", info.event._def.ui.backgroundColor);
                    $('.colorCode').val(info.event._def.ui.backgroundColor);
                    $('.startDate-val').val(moment(info.event._instance.range.start).utc().format('YYYY-MM-DD HH:mm'))
                    $('.endDate-val').val(moment(info.event._instance.range.end).utc().format('YYYY-MM-DD HH:mm'))
                    $('.cal-id').val(id);
                    if(id.indexOf('dayoff') == -1){
                        $('.cal-button>div').show();
                    }else{
                        $('.cal-button>div').hide();
                    }
                    if(memo != null){
                        $('.cal-memoContent').text(info.event._def.extendedProps.description);
                    }else{
                        $('.cal-memoContent').text("");
                    }
                    $('#cal-modal').modal('show');
                }
            });

            



            calendar.render();
        });

        $(function(){
            // 모달 닫기 이벤트
            $('.dismiss').on("click", function(){
                $('#calId').val('');
                $('#modal-title').text('Calendar 일정 등록');
                $('#calTitle').val('');
                $('#color-etc').css("background-color", '');
                $('#calColor').val('');
                $('#startDate>input').val('');
                $('#endDate>input').val('');
                $('#calMemo').val('');

                $('#modal-inserCal').modal('hide');
            });

            $('#btn-insertCompanyCal').click(function(){
                $('#modal-inserCal').modal({backdrop: 'static', keyboard: false});
                $('#submitCheck').val('insert');
            })

            //Date and time picker
            $('#startDate').datetimepicker({ icons: { time: 'far fa-clock' } });
            $('#endDate').datetimepicker({ icons: { time: 'far fa-clock' } });  

            // 일정등록모달 색상선택
            $('.calendar-color li > a').click(function(){
                var color = $(this).css('color');
                $('#color-etc').css('background-color', color);
                $('#calColor').val(color);
            })

            // 일정등록 날짜 검사
            $('#endDate>input').blur(function(){
                var startDate = new Date($('#startDate>input').val());
                var endDate = new Date($(this).val());
                
                if(startDate.getTime() < endDate.getTime()){
                    $('#checkDate').val('true');
                }else if(startDate.getTime() == endDate.getTime()){
                    $('#checkDate').val('true');
                    //console.log("같다 : " + $('#endDate>input').val(moment($('#endDate>input')).format('YYYY-MM-DD 12:00 PM')))
                }else{
                    $(this).css('border','2px solid red');
                    $('#checkDate').val('false');
                }
            });

            // 일정등록, 수정 Submit
            $('#btn-submit').on('click', function(){
                if($('#calTitle').val() == ''){
                    $('#alertMsg-text').text('일정 제목을 입력하세요.');
                    $('#alertMsg').modal('show');
                    $('#calTitle').css('border', '2px solid red');
                }else if($('#calColor').val() == ''){
                    $('#alertMsg-text').text('색상을 선택하세요.');
                    $('#alertMsg').modal('show');
                }else if($('#startDate>input').val() == ''){
                    $('#alertMsg-text').text('시작일자를 선택하세요.');
                    $('#alertMsg').modal('show');
                    $('#startDate>input').css('border', '2px solid red');
                }else if($('#endDate>input').val() == ''){
                    $('#alertMsg-text').text('종료일자를 선택하세요.');
                    $('#alertMsg').modal('show');
                    $('#endDate>input').css('border', '2px solid red');
                }else if($('#checkDate').val() == 'true'){
                    if($('#submitCheck').val() == 'insert'){
                        $('.CalendarForm').attr('action', "insertCalendar.cal").submit();
                    }else{
                        $('.CalendarForm').attr('action', "updateCalendar.cal").submit();
                    }
                }
            });

            $('#calTitle').blur(function(){
                if($(this).val() != ''){
                    $('#calTitle').css('border', '1px solid #ced4da');
                }
            });

            $('#startDate>input').blur(function(){
                if($(this).val() != ''){
                    $('#startDate>input').css('border', '1px solid #ced4da');
                    var startDate = moment($(this).val()).format('YYYY-MM-DD HH:mm');
                    //console.log("형식변환 : " + startDate);
                    $(this).val(startDate);
                }
            });

            $('#endDate>input').blur(function(){
                if($(this).val() != ''){
                    $('#endDate>input').css('border', '1px solid #ced4da');
                    var endDate = moment($(this).val()).format('YYYY-MM-DD HH:mm');
                    $(this).val(endDate);
                }
            })

            // 일정 수정 모달 띄우기
            $('#btn-updateCal').click(function(){
                $('#cal-modal').modal('hide');

                var root = $(this).parent().parent();
                $('#calNo').val(root.siblings('.cal-id').val());
                $('#modal-title').text('Calendar 수정');
                $('#calTitle').val(root.siblings('.cal-title').text());
                $('#color-etc').css("background-color", root.siblings('.cal-color').children('.colorCode').val());
                $('#calColor').val(root.siblings('.cal-color').children('.colorCode').val());
                $('#startDate>input').val(root.siblings('.startDate-val').val());
                $('#endDate>input').val(root.siblings('.endDate-val').val());
                $('#calMemo').val(root.siblings().children('.cal-memo').children('.cal-memoContent').text());
                $('#checkDate').val('true');
                
                $('#submitCheck').val('update');

                $('#modal-inserCal').modal({backdrop: 'static', keyboard: false});
            });

            // 일정 삭제
            $('#btn-deleteCal').click(function(){
                $('#cal-modal').modal('hide');
                $('#calNo-delete').val($(this).parent().parent().siblings('.cal-id').val());

                $('#modal-deleteCal').modal();
            })
            
            

            
            
        })
    </script>
</body>
</html>