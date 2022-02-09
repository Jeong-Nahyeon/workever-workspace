<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workever</title>
    
	<jsp:include page="../common/links.jsp" />
	<!-- fullCalendar -->
  	<link rel="stylesheet" href="plugins/fullcalendar/main.css">
	<style>
		#meetingRoom-area{
		/* border:1px solid black; */
		margin:auto;
		width:1300px;
		padding-top:50px;
		padding-bottom:100px;
		}
		
	</style>
</head>
<body>
    <div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<br><br>
			<h3>&nbsp;&nbsp;&nbsp;회의실 예약</h3>
			<hr>
			<div id="meetingRoom-area">
                
                
                
                <!-- /.col -->
				<div class="col-md-9">
					<div class="card card-primary">
					<div class="card-body p-0">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
                
           
                
                

			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
	<jsp:include page="../common/scripts.jsp" />
	<!-- fullCalendar 2.2.5 -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/fullcalendar/main.js"></script>
     <script>
	     document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
			    customButtons: {
					myCustomButton: {
					text: '예약하기',
					click: function() {
						alert('clicked the custom button!');
					}
					}
				},
				headerToolbar: {
					left  : 'prev,next today',
					center: 'title',
					right : 'myCustomButton'
				},
				themeSystem: 'bootstrap',
				//Random default events
				events: [
					{
					title          : 'All Day Event',
					start          : '2022-02-05',
					backgroundColor: '#f56954', //red
					borderColor    : '#f56954', //red
					allDay         : true
					},
					{
					title          : 'Long Event',
					start          : '2022-02-06',
					end            : '2022-02-07',
					backgroundColor: '#f39c12', //yellow
					borderColor    : '#f39c12' //yellow
					},
					{
					title: "회의실",
					description: "Lorem ipsum dolor sit incid idunt ut Lorem ipsum sit.",
					start: "2022-02-01T12:30",
					end: "2022-02-01T15:30",
					type: "카테고리1",
					username: 길동,
					backgroundColor: "#9775fa",
					textColor: "#ffffff",
					allDay: false
					},
					{
					title          : 'Lunch',
					start          : '2022-02-12',
					end            : '2022-02-14',
					allDay         : false,
					backgroundColor: '#00c0ef', //Info (aqua)
					borderColor    : '#00c0ef' //Info (aqua)
					},
					{
					title          : 'Birthday Party',
					start          : '2022-02-16',
					end            : '2022-02-16',
					allDay         : false,
					backgroundColor: '#00a65a', //Success (green)
					borderColor    : '#00a65a' //Success (green)
					},
					{
					title          : 'Click for Google',
					start          : '2022-02-20',
					end            : '2022-02-22',
					url            : 'https://www.google.com/',
					backgroundColor: '#3c8dbc', //Primary (light-blue)
					borderColor    : '#3c8dbc' //Primary (light-blue)
					}
				],
				editable  : false,
				});
	         calendar.render();
	       });

		   

		   
     </script>
</body>
</html>