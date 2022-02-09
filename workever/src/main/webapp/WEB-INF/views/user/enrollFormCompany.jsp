<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />

<style>
	body{margin: 0;}
    div{box-sizing: border-box;}
    .enrollform-company-area{
        
		margin: 50px 550px 50px 550px; 
    }

	#enroll-company-title{
		text-align: center;
		margin-bottom: 50px;
	}

	#company-code{
		width: 77%;
		display: inline-block;
	}
	.form-group button{
		width: 150px; height: 35px;
		border: none;
		background-color: lightgray;
		border-radius: 3%;
		margin-left: 20px;
	}

	.enroll-check{
		margin-top: 60px; margin-bottom: 40px;
		padding-left: 190px;
		padding-right: 170px;
	}
	.form-check-label{
		font-size: 13px;
	}

	.btn-sub{
		text-align: center;
		margin-bottom: 50px;
	}
	.btn-sub button{
		width: 150px; height: 35px;
		border: none;
		background-color: rgb(78, 115, 223);
		color: white; font-weight: bold;
		border-radius: 3%;
	}
</style>
</head>
<body>
	
	<jsp:include page="startHeader.jsp"></jsp:include>

	<div class="enrollform-company-area">

		<div id="enroll-company-title">
			<h3 style="font-weight: 600;">Workever 비즈니스 계정 생성</h3>
		</div>

		<div class="card card-light">

			<!-- form start -->
			<form>
				<div class="card-body">
					<div class="form-group">
						<label for="exampleInputEmail1">이메일</label>
						<input type="email" class="form-control" id="company-email" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">이름</label>
						<input type="text" class="form-control" id="company-adminname" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호</label>
						<input type="password" class="form-control" id="company-pwd" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호 확인</label>
						<input type="password" class="form-control" id="company-pwdcheck" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">회사명</label>
						<input type="text" class="form-control" id="company-name" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">회사 코드</label><br>
						<input type="text" class="form-control" id="company-code" placeholder="Password">
						<button>회사코드확인</button>
					</div>
					<div class="form-group">
                        <label>회사 업종</label>
                        <select class="form-control">
                          <option>제조</option>
                          <option>서비스</option>
                          <option>IT</option>
                          <option>유통</option>
                          <option>마케팅</option>
                        </select>
                      </div>
					
					
					<div class="enroll-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">
							서비스 이용약관, 개인정보 취급방침을 확인하였고, 이에 동의합니다.
						</label>
					</div>
				</div>
				
				<div class="btn-sub">
					<button type="submit">회원가입</button>
				</div>
				
			</form>
		</div>
		  
	</div>	

	<jsp:include page="startFooter.jsp"></jsp:include>
	<jsp:include page="../common/scripts.jsp" />
</body>
</html>