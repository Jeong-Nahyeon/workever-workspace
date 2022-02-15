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
	/* 헤더스타일 */
	#start-header{
        background-color: rgb(78, 115, 223);
        height: 100px;
        overflow: hidden;
        margin: auto;
    }
    #start-header a{
        color: white;
        text-decoration: none;
        font-size: 40px; font-weight: 600;
    }
    
    #header-font{
        width: 48%;
        padding-left: 80px;
        display: inline-block;
        height: 80px;
        margin-top: 15px;
        /*margin-left: 80px;*/
        /*line-height: 100px;*/
    }
    #header-button{
        width: 48%;
        text-align: right;
        display: inline-block;
    }
    #header-button button{
        width: 100px; height: 30px;
        border: 1px solid white;
        background-color: rgb(78, 115, 223);
        color: white;
    }

	/* 본문스타일 */
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
	#btn-checkCode{
		width: 170px; height: 38px;
		border: none;
		background-color: lightgray;
		border-radius: 2px;
	}
</style>
</head>
<body>
	
	<div id="start-header">
        <div id="header-font">
            <a href="${pageContext.request.contextPath}">
                <span>Workever</span>
            </a>
        </div>
        
        <div id="header-button">
            <button onclick="location.href='login.do'">로그인</button>
        </div>
    </div>

	<div class="enrollform-user-area">

		<div id="enroll-user-title">
			<h3 style="font-weight: 600;">Workever 일반사원 계정 생성</h3>
		</div>

		<div class="card card-light">

			<!-- form start -->
			<form action="insert.us" method="post" id="enrollFormUser">
				<div class="card-body">
					<div class="form-group">
						<label for="user-email">이메일</label>
						<input type="email" class="form-control" id="user-email" name="userEmail" placeholder="이메일을 입력하세요.">
						<input type="hidden" id="email-status" value="emailN">
						<div id="checkEmail">
							
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">이름</label>
						<input type="text" class="form-control" id="user-name" name="userName" placeholder="이름을 입력하세요.">
						<div id="checkName">
							
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호</label>
						<input type="password" class="form-control" id="user-pwd" name="userPwd" placeholder="영문, 숫자, 특수문자 포함 8~16자리 입니다.">
						<div id="checkPwd">
							
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호 확인</label>
						<input type="password" class="form-control" id="user-pwdcheck" placeholder="영문, 숫자, 특수문자 포함 8~16자리 입니다.">
						<div id="checkPwd-check">

						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전화번호</label>
						<input type="number" class="form-control" id="user-phone" name="userPhone" placeholder="핸드폰번호를 입력하세요.">
						<div id="checkPhone">
							
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">회사 코드</label><br>
						<input type="text" class="form-control" id="company-code" name="companyCode" placeholder="회사코드를 입력하세요.">
						<input type="button" value="회사코드중복확인" id="btn-checkCode" onclick="checkCompanyCode();">
						<input type="hidden" id="companyCode-status" value="codeN">
						<input type="hidden" id="comEncode" name="comEncode" >
					</div>

					<div class="enroll-check">
						<input type="checkbox" class="form-check-input" id="form-check">
						<label class="form-check-label" for="form-check" id="form-agree">
							서비스 이용약관, 개인정보 취급방침을 확인하였고, 이에 동의합니다.
						</label>
					</div>
				</div>
				
				<div class="btn-sub">
					<!--<button type="submit" id="btn-formsubmit">회원가입</button>-->
					<input type="button" id="btn-formsubmit" value="회원가입" onclick="enrollForm();">
				</div>
				
			</form>
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
							<span
								style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
								사용 가능한 이메일 입니다.
							</span><br>
						</div>
						<div style="text-align: center; margin-top: 60px;">
							<button type="button" class="btn" data-dismiss="modal" id="btn-emailDoubleCheck"
							style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
								닫기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 회사코드인증(사원)-->
		<div class="modal fade" id="company-check">
			<div class="modal-dialog">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header">
						<div style="margin-left:180px;">
							<span style="text-align: center; font-size: 17px; font-weight: 700;">
								회사 코드 중복 체크
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
								사용 가능한 회사 코드입니다.
							</span><br>
							<span style="font-size: 13px; display: inline-block; margin: 10px 0 60px 0;">
								계속 진행하시려면 확인을 클릭해주세요.
							</span>
						</div>
						<div style="text-align: center;">
							<button type="button" class="btn" id="btn-checkCodeE" data-dismiss="modal"
							style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
								확인
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 회사코드 인증 실패 -->
		<div class="modal fade" id="after-checkCodeD">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<div style="margin-left:170px;">
							<span style="text-align: center; font-size: 17px; font-weight: 700;">
								회사 코드 체크
							</span>
						</div>
						<button type="button" class="close" data-dismiss="modal">
							&times;
						</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div style="text-align: center;">
							<span
								style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
								회사 인증코드가 일치하지 않습니다.
							</span><br>
						</div>
						<div style="text-align: center; margin-top: 60px;">
							<button type="button" class="btn" id="btn-checkCodeD" data-dismiss="modal"
							style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
								닫기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 이메일 인증 모달 -->
		<div class="modal" id="emailcheck">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header">
						<div style="margin-left:180px;">
							<span style="text-align: center; font-size: 17px; font-weight: 700;">
								인증번호 입력
							</span>
						</div>
						<button type="button" class="close" data-dismiss="modal">
							&times;
						</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
						<div style="text-align: center;">
							<span id="validemail"
							style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
								
							</span><br>
							<span style="font-size: 13px; display: inline-block; margin: 10px 0 60px 0;">
								위 메일로 인증번호가 전송되었습니다.
							</span>
						</div>
						<div style="text-align: center; margin-bottom: 60px;">
							<input type="text" name="" id="inputCode" style="border: none; border-bottom: 1px solid gray;"><br>
							<span id="codeResult" style="text-align: center;">
								
							</span>
						</div>
						<div style="text-align: center;">
							<button type="button" class="btn btn-secondary" id="modal-send" style="width: 90px;" disabled="disabled">
								인증
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
		$('#user-pwdcheck').blur(function () {
			if ($('#user-pwdcheck').val() != $('#user-pwd').val()) {
				$('#checkPwd-check').text('비밀번호가 일치하지 않습니다.');
				$('#checkPwd-check').css('color', 'red');
				$('#user-pwdcheck').css('border', '2px solid red');
				$('#user-pwdcheck').focus();
			} else {
				$('#checkPwd-check').text('');
				$('#user-pwdcheck').css('border', '1px solid #ced4da');
			}
		});

		// 핸드폰번호 중복확인
		$('#user-phone').blur(function(){
			if(!phoneExp.test($(this).val())){
				$('#checkPhone').text('전화번호를 확인해주세요.');
				$('#checkPhone').css('color', 'red');
				$('#user-phone').css('border', '2px solid red');
				$('#user-phone').focus();
			}else{
				$('#checkPhone').text('');
				$('#user-phone').css('border', '1px solid #ced4da');
			}
		})

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
						emailInput.attr("readonly", true);
						$('#email-status').attr('value', 'emailY');
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

		// 회사코드 확인
		function checkCompanyCode(){
			const companyCode = $('#company-code');

			if(companyCode.val() == ''){
				alert("회사코드를 입력하세요.");
				companyCode.focus();
			}else{
				$.ajax({
					url:'companyCodeCheck.us',
					data:{companyCode : companyCode.val()},
					type: "post",
					success:function(result){
						if(result == 'NNNNY'){
							$('#company-check').modal();
							companyCode.attr("readonly", true);
							$('#companyCode-status').attr('value', 'codeY');
							$('#comEncode').attr('value', $('#company-code').val())
						}else{
							$('#after-checkCodeD').modal();
						}
					},error:function(){
						console.log("회사코드인증 ajax 통신 실패");
					}
				})
			}
		}

		// 모달 닫기 버튼 클릭 시 포커스 이동
		$('#btn-checkCodeD').click(function(){
			$('#company-code').focus();
		});
		$('#btn-emailDoubleCheck').click(function(){
			$('#user-name').focus();
			$('#user-email').css('background-color', 'white');
		});

		function enrollForm(){
			if($('#email-status').val()=='emailY' && $('#companyCode-status').val() == 'codeY' && $('#user-name').val() !='' &&
			   $('#form-check').is(":checked") && $('#user-phone') != ''){

				//$('#btn-formsubmit').disabled = false;
				//$("#enrollForm").submit();
				//console.log('폼 실행 되는겨?')
				//return true;
				emailSend();
			}else{
				if($('#user-name').val() ==''){
					alert('이름을 입력하세요.');
					$('#company-adminname').focus();
				}
				if($('#user-phone').val() ==''){
					alert('전화번호를 입력하세요.');
					$('#company-phone').focus();
				}
				if($('#companyCode-status').val() == 'codeN'){
					alert("회사코드 중복체크를 해주세요.");
					$("#company-code").focus();
				}
				if($('#form-check').is(":checked")==false){
					alert('이용약관에 동의해주세요.');
				}
			}
		}

		// 이메일 인증 메일 전송
		var emailcode = '';
		function emailSend(){
			var email = $('#user-email').val();
			//console.log('폼 실행 되는겨? 이거 함수 실행됨!')
			$('#emailcheck').modal();
			
			$.ajax({
				url:"sendEmail.do",
				data:{email:email},
				type:'post',
				success:function(result){
					console.log(result);
					emailcode = result;
				},error:function(){
					console.log("이메일전송 ajax 통신 실패");
				}
			})
		}

		// 인증번호 비교
		$('#inputCode').blur(function(){
			console.log("인증번호 비교 실행됨");
			var inputCode = $('#inputCode').val();		// 입력코드
			var checkResult = $('#codeResult');			// 비교결과입력창
			var modalCheckBtn = $('#modal-send');		// 확인버튼

			if(inputCode == emailcode){
				console.log("인증번호 일치함");
				checkResult.html("인증번호가 일치합니다.")
				checkResult.css("color", "rgb(78, 115, 223)");
				checkResult.css("font-weight", "500");
				modalCheckBtn.attr("disabled", false);
				modalCheckBtn.css("background-color", "rgb(78, 115, 223)");
				modalCheckBtn.css("border", "none");
			}else{
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.css("color", "red");
				checkResult.css("font-weight", "500");
				modalCheckBtn.attr("disabled", true);
			}
		})

		$('#modal-send').click(function(){
			$('#enrollFormUser').submit();
			//alert("회원가입이 완료되었습니다.");
		})
	</script>
</body>
</html>