<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../common/links.jsp" />

<style>
	.do_title {
		padding: 20px 0 0 20px;
	}

	.do_underLine {
		border: 0px; /* 기본 hr의 border 제거 */
		height: 2px; /* 두께 지정 */
		width: 98%;
		background-color: lightgray;
		margin-bottom: 50px;
	}

	#do_table>tbody>tr>td {
		text-align: center;
		padding: 5px 60px;
		border: 1px solid gray;
		border-collapse : collapse; /* border 두 줄에서 한 줄로 */
		border-top: none;
		border-bottom: none;
		border-left: none;
	}

	.td_none {
		border-right: none !important;
	}

	.sm_title {
		font-size: 20px;
		font-weight: bold;
		margin: 50px 50px 50px 60px;
	}

	.dateInput, #offdayKinds, #offdayReason {
		font-size: 20px;
		margin: 0 20px 0 0;
		border: 2px solid lightgray;
		border-radius: 5px;
		padding-left: 10px;
	}

	#doSelBtn {
		margin: 20px 0px 0px 25px;
		width: 150px;
		height: 35px;
		line-height: 35px;
		border: 1px solid lightgray;
		font-weight: bold;
		border-radius: 5px;
	}

	#doSelBtn:hover {
		cursor: pointer;
		filter: brightness(85%);
	}

	.text-overflow {
		width: 350px; /* 말줄임 처리 위해 width 설정 */
		display: block; /* 너비를 가질 수 있도록 설정 */
		white-space: nowrap; /* 내용이 넘치면 자동줄바꿈되는 것을 해제 */
		overflow: hidden; /* 넘치는 부분을 hidden */
		text-overflow: ellipsis; /* 텍스트의 말줄임표(...) 처리 */
	}

	.table>tbody>tr>td>a {
		color: black;
		text-decoration: none;
		font-weight: bold;
		cursor: pointer;
	}

</style>
</head>

<body class="hold-transition sidebar-mini">

	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		
			<h3 class="do_title">휴가 관리</h3>
			<hr class="do_underLine">


			<h4 class="do_title">사용 내역 조회</h4>
			<hr class="do_underLine"> <br>

			<div style="width: 800px; margin: auto;">
				<div>
					<span class="sm_title">날짜</span>
					<input type="date" class="dateInput"> <b>~</b>&emsp; <input type="date" class="dateInput"> 
				</div>

                <br>

				<div>
					<span class="sm_title">종류</span>
					<select id="offdayKinds" name="offday" style="width: 150px; height: 35px;">
						<option value="annualLeave">연차</option>
						<option value="sickLeave">병가</option>
						<option value="officialLeave">공가</option>
						<option value="regularLeave">정기휴가</option>
						<option value="maternityLeave">출산휴가</option>
					</select>
                    

					<span class="sm_title">내용</span>
					<input type="text" class="dateInput" style="height: 35px;" placeholder="키워드 검색">

                    <br>

                    <span class="sm_title">이름</span>
					<input type="text" class="dateInput" style="height: 35px;" placeholder="이름">
					<button id="doSelBtn">조 회</button>
				</div>

			</div>

			<br><br><br>

			<div class="select-area" style="width: 80%; margin: auto;">
				<h6 style="float: left;">조회 결과 <b>xx</b>건</h6>
			
				<table class="table" style="text-align: center;">
				  	<thead>
						<tr>
						<th width="25%">날짜</th>
						<th width="25%">이름</th>
						<th width="25%">종류</th>
						<th width="25%">상태</th>
						</tr>
				  	</thead>
				  	<tbody>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
                            <td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
						<tr>
							<td>2022-01-19 ~ 2022-01-21</td>
							<td>이훈이</td>
							<td>연차</td>
							<td>승인</td>
						</tr>
				  	</tbody>
				</table>
			</div>

			<br>

			<div class="paging-area" align="center"; style="padding: 20px 0px 100px 0px;">
				페이징
			</div>

		</div>
		<!-- /.content-wrapper -->
		
		<jsp:include page="../common/footer.jsp" />
	</div>
	
	<jsp:include page="../common/scripts.jsp" />    
	
</body>
</html>