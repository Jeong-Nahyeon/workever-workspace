<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />

<style>
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
    #findpwd-outer{height: 770px;}
    .findpwd-area{
        margin: auto;
        width: 500px;
        position: absolute;
        top: 50%; left: 50%;
        transform: translate(-50%, -50%);
    }

    #findpwd-title{
        margin-bottom: 50px;
        text-align: center;
    }
    #findpwd-title span{
        font-size: 13px;
    }

    .card{
        background-color: rgb(247, 244, 244);
    }

    .btn-findpwd{
        text-align: center;
        margin-top: 70px; margin-bottom: 20px;
    }
    .btn-findpwd button{
        width: 180px; height: 35px;
		border: none;
		background-color: rgb(78, 115, 223);
		color: white; font-weight: bold;
		border-radius: 3%;
        font-size: 14px;
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
            <button onclick="location.href='${pageContext.request.contextPath}'">회원가입</button>
        </div>
    </div>

    <div id="findpwd-outer">
        <div class="findpwd-area">
            <div id="findpwd-title">
                <h4 style="font-weight: 600;">비밀번호를 잊으셨나요?</h4>
                <span>가입시 사용한 이메일을 입력하시면 임시 비밀번호가 발송됩니다.</span>
            </div>
    
            <div class="card card-light">
                <form action="findPwd.us" id="findPwdForm">
    
                    <div class="card-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">전화번호</label>
                            <input type="number" class="form-control" id="user-phone" name="userPhone" placeholder="가입시 작성한 전화번호를 입력하세요">
                            <div id="checkPhone">
							
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">이메일</label>
                            <input type="email" class="form-control" id="user-email" name="userEmail" placeholder="가입시 작성한 이메일 주소를 입력하세요.">
                            <input type="hidden" id="email-status" value="emailN">
                            <div id="checkEmail">
							
                            </div>
                        </div>
                        <div class="btn-findpwd">
                            <button id="btn-enEmail" disabled="disabled">임시비밀번호 받기</button>
                        </div>
                    </div>
        
                </form>
            </div>
        </div>

        <!-- 이메일 확인용 모달 -->
		<div class="modal fade" id="emailCheck-modal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<div style="margin-left:170px;">
							<span style="text-align: center; font-size: 17px; font-weight: 700;">
								이메일 확인
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
								존재하지 않는 이메일 입니다.
							</span><br>
                            <span style="font-size: 15px; font-weight: 600;">
                                전화번호, 이메일을 확인해주세요.
                            </span>
						</div>
						<div style="text-align: center; margin-top: 60px;">
							<button type="button" class="btn" data-dismiss="modal" id="btn-emailCheck"
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
        // 이메일 정규식
		let emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        // 전화번호 정규식
		//let phoneExp = /^01[0179]([0-9]{7,8}$)/;
		let phoneExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

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
				checkEmail();
			}
		});

        // 전화번호 정규식
		$('#user-phone').blur(function(){
			if(!phoneExp.test($(this).val())){
				$('#checkPhone').text('전화번호를 확인해주세요.');
				$('#checkPhone').css('color', 'red');
				$('#user-phone').css('border', '2px solid red');
				$('#user-phone').focus();
			}else{
				$('#checkPhone').text('');
				$('#user-phone').css('border', '1px solid #ced4da');
                $('#user-email').focus();
			}
		})

        // 이메일 확인(ajax)
        function checkEmail(){
            const emailInput = $('#user-email');
            const phoneInput = $('#user-phone');

            if(emailInput.val() != '' && phoneInput.val() != ''){
                $.ajax({
                    url:"pwdEmailCheck.do",
                    data:{
                        userEmail:emailInput.val(),
                        userPhone:phoneInput.val()
                    },
                    type:"post",
                    success:function(result){
                        if(result == 'NNNNN'){
                            console.log(result);
                            $('#emailCheck-modal').modal();
                        }else{
                            // 사용가능
                            emailInput.attr("readonly", true);
                            $('#email-status').attr('value', 'emailY');
                            $('#btn-enEmail').attr("disabled", false);
                        }
                    },error:function(){
                        console.log("임시비밀번호 이메일체크 ajax 통신 실패");
                    }
                })
            }else{
                if($('#user-phone').val() == ''){
                    alert('전화번호를 입력하세요')
                    phoneInput.focus();
                }
                if($('#user-email').val() == ''){
                    alert('이메일을 입력하세요.');
                    emailInput.focus();
                }
            }
            
        }

        // 모달 닫기 버튼 클릭 시 포커스 이동
        $('#btn-emailCheck').click(function(){
            $('#user-phone').focus();
        });

        $('#btn-enEmail').click(function(){
            $('#findPwdForm').submit();
        })


    </script>
</body>
</html>