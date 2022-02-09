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
    .enrollform-user-area{
        
		margin: 50px 550px 50px 550px; 
    }

	#enroll-user-title{
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

	<div class="enrollform-user-area">

		<div id="enroll-user-title">
			<h3 style="font-weight: 600;">Workever 일반사원 계정 생성</h3>
		</div>

		<div class="card card-light">

			<!-- form start -->
			<form>
				<div class="card-body">
					<div class="form-group">
						<label for="exampleInputEmail1">이메일</label>
						<input type="email" class="form-control" id="user-email" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">이름</label>
						<input type="text" class="form-control" id="user-adminname" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호</label>
						<input type="password" class="form-control" id="user-pwd" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호 확인</label>
						<input type="password" class="form-control" id="user-pwdcheck" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전화번호</label>
						<input type="number" class="form-control" id="user-phone" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">회사 코드</label><br>
						<input type="text" class="form-control" id="company-code" placeholder="Password">
						<button id="btn-codecheck">
                            회사코드확인
                        </button>
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

        <script>
            $(function(){
                $('#btn-codecheck').click(function(){
                    $('#modal-codecheck').modal('show');
                })
            })
        </script>
        <div class="modal fade" id="modal-codecheck">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Default Modal</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>One fine body&hellip;</p>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
		  
	</div>	

	<jsp:include page="startFooter.jsp"></jsp:include>
	<jsp:include page="../common/scripts.jsp" />
</body>
</html>