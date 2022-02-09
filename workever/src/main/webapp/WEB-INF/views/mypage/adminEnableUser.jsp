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
    .content-title{
        overflow: hidden;
        margin: 50px 100px;
        border-bottom: 1px solid lightgray;
    }
    .content-title span{
        font-size: 25px;
        font-weight: 600;
    }

    .card{
        margin-left: 150px; margin-right: 150px;
    }
    .table{
        text-align: center;
    }
    
    .card-sub{
        width: 500px;
        margin: auto;
        text-align: center;
    }
    .card-footer ul{
        margin-bottom: 0;
    }

</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
    <jsp:include page="mypageSidebar.jsp" />

    <div class="content-wrapper">
        <div class="content-title">
            <span>회원 승인</span>
        </div>

        <div class="card">
            <div class="card-body p-0">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 10px">
                                <input type="checkbox" name="" id="">
                            </th>
                            <th>사원명</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th style="width: 100px">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>홍길동</td>
                            <td>hong123@gmail.com</td>
                            <td>010-2222-3333</td>
                            <td>
                                <a href="">미승인</a>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>김미애</td>
                            <td>hong123@gmail.com</td>
                            <td>010-2222-6666</td>
                            <td>
                                <a href="">미승인</a>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>홍길동</td>
                            <td>hong123@gmail.com</td>
                            <td>010-2222-4444</td>
                            <td>
                                <a href="">미승인</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->

            <div class="card-footer clearfix">
                <div class="card-sub">
                    <ul class="pagination pagination-sm justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>