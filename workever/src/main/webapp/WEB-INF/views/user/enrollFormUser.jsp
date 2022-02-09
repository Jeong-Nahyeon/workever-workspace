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
						<label for="user-email">이메일</label>
						<input type="email" class="form-control" id="user-email" name="userEmail" placeholder="Enter email">
						<div id="checkEmail">
							
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">이름</label>
						<input type="text" class="form-control" id="user-name" name="userName" placeholder="Password">
						<div id="checkName">
							
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호</label>
						<input type="password" class="form-control" id="user-pwd" name="userPwd" placeholder="Password">
						<div id="checkPwd">
							
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호 확인</label>
						<input type="password" class="form-control" id="user-pwdcheck" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전화번호</label>
						<input type="number" class="form-control" id="user-phone" name="userPhone" placeholder="Password">
						<div id="checkPhone">
							
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">회사 코드</label><br>
						<input type="text" class="form-control" id="company-code" name="companyCode" placeholder="Password">
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

		<!-- 이메일 중복체크용 모달 -->
		<div class="modal fade" id="emailDoubleCheck-modal">
			<div class="modal-dialog">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header">
						<div style="margin-left:170px;">
							<span style="text-align: center; font-size: 17px; font-weight: 700;">
								이메일 중복 확인
							</span>
						</div>
						<button type="button" class="close" data-dismiss="modal">
							&times;
						</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
						<div style="text-align: center;">
							<span style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
								사용 가능한 이메일 입니다.
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
		  
	</div>	

	<jsp:include page="startFooter.jsp"></jsp:include>
	<jsp:include page="../common/scripts.jsp" />

	<script>
		// 정규식 
		// 이메일 정규식
		let emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 비밀번호 정규식
		let pwdExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}$/i;
		// 휴대폰번호 정규식
		let phoneExp = /^01[0179]([0-9]{7,8}$)/;

		$("#user-email").blur(function(){
			// 이메일 정규표현식 확인
			if(!emailExp.test($(this).val())){
				console.log(emailExp.test($(this).val()));
				$('#checkEmail').text("이메일을 확인해주세요.");
				$('#checkEmail').css('color', 'red');
				$('#user-email').css('border', '2px solid red');
				$('#user-email').focus();
			}else{
				$('#checkEmail').text('');
				$('#user-email').css('border', '1px solid #ced4da');
				checkEmailDouble();
			}
		});

		// 비밀번호 정규표현식 확인
		$('#user-pwd').blur(function(){
			if(!pwdExp.test($(this).val())){
				console.log(pwdExp.test($(this).val()));
				$('#checkPwd').text("비밀번호는 영문, 숫자, 특수문자 포함 8~16자리 입니다.");
				$('#checkPwd').css('color', 'red');
				$('#user-pwd').css('border', '2px solid red');
				$('#user-pwd').focus();
			}else{
				$('#checkPwd').text('');
				$('#user-pwd').css('border', '1px solid #ced4da');
			}
		})

		// 비밀번호 중복확인
		

		// 이메일 중복체크
		function checkEmailDouble(){
			const emailInput = $('#user-email');

			$.ajax({
				url:"emailDoubleCheck.do",
				data:{checkEmail:emailInput.val()},
				type:"post",
				success:function(result){
					if(result == 'NNNNY'){
						// 사용 가능
						$("#emailDoubleCheck-modal").modal();
						$('#user-name').focus();
						emailInput.attr("readonly", true);
					}else{
						alert("이미 사용중인 이메일입니다.");
						emailInput.val('');
						emailInput.focus();
					}
				},error:function(){
					console.log("ajax 통신 실패")
				}
			})
		}
	</script>
</body>
</html>