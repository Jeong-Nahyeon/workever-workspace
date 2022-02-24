<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
<style>
  .ch-check, .chProfile-img-area, .chProfile-name, .chProfile-dept {
    margin: 10px;
    display: inline-block;
    vertical-align: middle;
  }

  .ch-check {
    transform: scale(1.5);
  }

  .chProfile-img-area {
    width: 40px;
    height: 40px; 
    border-radius: 70%;
    overflow: hidden; /* 가로 세로 넘치는 이미지는 hidden */
  }
  
  .chProfile-img {
  	width: 40px;
    height: 40px;
  }

  #invitationBtn-area {
    position: absolute !important;
    bottom: 0;
  }

  #invitationBtn {
    width: 450px;
    height: 40px;
    border-radius: 5px;
    border: none;
    background-color: lightgray;
    font-size: 15px;
    font-weight: bold;
    position: fixed;
    margin: 10px;
  }

  #invitationBtn:hover {
    cursor: pointer;
    filter: brightness(85%);
  }

</style>
</head>
<body>
  
	<!-- Direct Chat -->
        <div class="row">
          <div class="col-md-3">

            <!-- DIRECT CHAT PRIMARY -->
            <div class="card card-primary card-outline direct-chat direct-chat-primary" style="width: 400; margin: 10px;">
              <div class="card-header">
                <h3 class="card-title" style="position: relative;">대화 상대 초대(선택한 명 수 / ${ listCount }명)</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" onclick="window.close();">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->


              <div class="card-body">
                <!-- Conversations are loaded here -->
                <div>
                  <div style="height: 480px !important; overflow-y: auto;">
                    <!-- Message. Default to the left -->
                    <div >
                    
                      <c:forEach var="u" items="${ list }" >
	                      <div>
	                          <div class="ch-check"><input type="checkbox"></div>
	                          	<c:choose>
									<c:when test="${ u.userFilePath != null}">
										<div class="chProfile-img-area"><img class="chProfile-img" src="${ u.userFilePath }"></div>
									</c:when>
									<c:otherwise>
										<div class="chProfile-img-area"><img class="chProfile-img" src="resources/images/user-circle-solid.svg"></div>
									</c:otherwise>
							  	</c:choose>
	                          <div class="chProfile-name">${ u.userName }</div> /
	                          <div class="chProfile-dept">${ u.deptName }</div> 
	                      </div>
                   	  </c:forEach>
                    </div>
  
                  </div>

                  <div id="invitationBtn-area">
                    <button id="invitationBtn">채팅 생성</button>
                  </div>
                </div>
              </div>
              <!-- /.card-body -->

            </div>
            <!--/.direct-chat -->
          </div>
          <!-- /.col -->
          </div>
       </div>
          
          <script>
          	console.log(list);
          	console.log(listCount);
          </script>
</body>
</html>