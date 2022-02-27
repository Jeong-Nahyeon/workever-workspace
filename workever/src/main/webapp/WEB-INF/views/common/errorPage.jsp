<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />

<style>
	.error-area{
		margin: 50px 100px 50px 400px;
	}
	#content-area{
        display: table;
        margin: auto;
        height: 765px;
    }
    #content-area div{
        display: table-cell;
    }
    #login-icon{
		
        text-align: right;
        width: 400px;
        padding-top: 150px;
        padding-right: 100px;
    }
    #login-text{
        
        width: 2000px; 
        vertical-align: top;
		padding-top: 130px;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/sidebar.jsp" />
	
	<div class="error-area">

		<div id="content-area">
			<div id="login-icon">
				<i class="fas fa-exclamation-triangle fa-10x"></i>
			</div>
			<div id="login-text">
				<span style="font-size: 40px; font-weight: bold;">
					올바르지 않은 요청입니다. 
				</span><br><br><br>
				<span style="font-size: 25px; ">
					요청을 다시 확인하거나 관리자에게 문의하세요
				</span><br>
				<span style="font-size: 18 px;">
					error : ${errorMsg}
					<c:remove var="errorMsg" scope="session" />
				</span>
			</div>
		</div>
		
	</div>
	
</body>
</html>