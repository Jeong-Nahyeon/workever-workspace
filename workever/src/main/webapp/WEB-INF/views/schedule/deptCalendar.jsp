<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<script src="plugins/fullcalendar/main.js"></script>
 <!-- fullCalendar -->
<link rel="stylesheet" href="plugins/fullcalendar/main.css">

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

    /*캘린더영역*/
    #calendar{
        width: 80%;
        margin: auto; margin-bottom: 100px;
    }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />

    <div class="content-wrapper">
        <div class="content-title">
            <span>부서캘린더</span>
        </div>
        <div id="calendar"></div>
    </div>
    

    

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                plugins:['interaction', 'dayGrid', 'resourceTimeline'],
                locale:'ko',
                header:{
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                height: 700,
                editable:true,
                eventLimit: true,
                initialView: 'dayGridMonth',

                events:[
                    {
                        title:'테스트일정',
                        description:'테스트입니다!',
                        start:'2022-02-21',
                        end:'2022-02-25'
                    }
                ]
            });
            calendar.render();
        });
    </script>
</body>
</html>