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
    .content-wrapper{overflow: hidden; position: relative;}
    .changepwd-title{
        overflow: hidden;
        margin: 50px 100px;
        border-bottom: 1px solid lightgray;
    }

    /* 마이페이지 제목, 저장버튼*/
    .changepwd-title span{
        font-size: 25px;
        font-weight: 600;
    }

    .changepwd-area{
        margin: 50px 150px;
    }
    .form-group input[type="submit"]{
        background-color: rgb(78, 115, 223);
        border: none;
    }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
	<jsp:include page="mypageSidebar.jsp" />

    <div class="content-wrapper">
        <div class="changepwd-title">
            <span>비밀번호 설정</span>
        </div>

        <div class="changepwd-area">
            <form action="changepwd.us" id="changepwdForm">
                <div class="card">
                    <div class="card-body row">
                        <div class="col-6 text-center d-flex align-items-center justify-content-center">
                            <div class="changepwd-sub">
                                <span>
                                    비밀번호를 <strong>재설정</strong> 할 수 있습니다.
                                </span><br>
                                <span>
                                    비밀번호는 영어, 숫자, 특수문자 포함 8자리 이상이어야 합니다.
                                </span>
                            </div>
                        </div>
                        
                        <div class="col-5">
                            <div class="form-group">
                                <label for="inputName">현재 비밀번호</label>
                                <input type="password" id="pwd-before" class="form-control" />
                                <div id="checkPwd-b">

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">새 비밀번호</label>
                                <input type="password" id="pwd-after" class="form-control" name="userPwd"/>
                                <div id="checkPwd-a">

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSubject">새 비밀번호 확인</label>
                                <input type="password" id="pwd-checkAfter" class="form-control" />
                                <div id="doubleCheckPwd-a">

                                </div>
                            </div>
                            <input type="hidden" id="check-before" value="beforeY">
                            <input type="hidden" id="check-after" value="afterN">
                            <input type="hidden" name="userNo" value="${ loginUser.userNo }">
                            <div class="form-group" style="float: right;">
                                <input type="button" class="btn btn-primary" id="pwdFormSubmit" value="변경하기">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="../common/scripts.jsp" />

    <script>
        // 비밀번호 정규식
		let pwdExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}$/i;

        // 새로운 비밀번호 정규표현식 확인
        $('#pwd-after').blur(function(){
            if (!pwdExp.test($(this).val())) {
				$('#checkPwd-a').text('비밀번호는 영문, 숫자, 특수문자 포함 8~16자리 입니다.');
				$('#checkPwd-a').css('color', 'red');
				$('#pwd-after').css('border', '2px solid red');
				$('#pwd-after').focus();
			} else {
				$('#checkPwd-a').text('');
				$('#pwd-after').css('border', '1px solid #ced4da');
			}
        });
        // 새로운 비밀번호 확인
        $('#pwd-checkAfter').blur(function () {
			if ($('#pwd-checkAfter').val() != $('#pwd-after').val()) {
				$('#doubleCheckPwd-a').text('비밀번호가 일치하지 않습니다.');
				$('#doubleCheckPwd-a').css('color', 'red');
				$('#wd-checkAfter').css('border', '2px solid red');
				$('#wd-checkAfter').focus();
			} else {
				$('#doubleCheckPwd-a').text('');
				$('#pwd-checkAfter').css('border', '1px solid #ced4da');
                $('#check-after').attr('value', 'afterY');
			}
		});

        

        $('#pwdFormSubmit').click(function(){
            if($('#check-before').val() == 'beforeY' && $('#check-after').val() == 'afterY'){
                $('#changepwdForm').submit();
            }else{
                if($('#pwd-before').val() == ''){
                    alert('현재 비밀번호를 입력하세요');
                    $('#pwd-before').focus();
                }
                if($('#pwd-after').val() == ''){
                    alert('새로운 비밀번호를 입력하세요.')
                    $(this).focus();
                }
                if($('#pwd-checkAfter').val() == ''){
                    alert('새로운 비밀번호를 입력하세요.');
                    $(this).focus();
                }
            }
        })
    </script>
</body>
</html>