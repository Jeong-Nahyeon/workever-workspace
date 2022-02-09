<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
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
    width: 50px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden; /* 가로 세로 넘치는 이미지는 hidden */
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
                <h3 class="card-title" style="position: relative;">대화 상대 초대(선택한 명 수/총 명 수)</h3>

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
                      <div>
                          <div class="ch-check"><input type="checkbox"></div>
                          <div class="chProfile-img-area">프로필 이미지<img class="chProfile-img" src=""></div>
                          <div class="chProfile-dept">부서</div> /
                          <div class="chProfile-name">이름</div>
                      </div>
  
                      <div>
                          <div class="ch-check"><input type="checkbox"></div>
                          <div class="chProfile-img-area">프로필 이미지<img class="chProfile-img" src=""></div>
                          <div class="chProfile-dept">부서</div> /
                          <div class="chProfile-name">이름</div>
                      </div>
                      
                      <div>
                          <div class="ch-check"><input type="checkbox"></div>
                          <div class="chProfile-img-area">프로필 이미지<img class="chProfile-img" src=""></div>
                          <div class="chProfile-dept">부서</div> /
                          <div class="chProfile-name">이름</div>
                      </div>
  
                      <div>
                          <div class="ch-check"><input type="checkbox"></div>
                          <div class="chProfile-img-area">프로필 이미지<img class="chProfile-img" src=""></div>
                          <div class="chProfile-dept">부서</div> /
                          <div class="chProfile-name">이름</div>
                      </div>
  
                      <div>
                          <div class="ch-check"><input type="checkbox"></div>
                          <div class="chProfile-img-area">프로필 이미지<img class="chProfile-img" src=""></div>
                          <div class="chProfile-dept">부서</div> /
                          <div class="chProfile-name">이름</div>
                      </div>
  
                      <div>
                          <div class="ch-check"><input type="checkbox"></div>
                          <div class="chProfile-img-area">프로필 이미지<img class="chProfile-img" src=""></div>
                          <div class="chProfile-dept">부서</div> /
                          <div class="chProfile-name">이름</div>
                      </div>
  
                      <div>
                          <div class="ch-check"><input type="checkbox"></div>
                          <div class="chProfile-img-area">프로필 이미지<img class="chProfile-img" src=""></div>
                          <div class="chProfile-dept">부서</div> /
                          <div class="chProfile-name">이름</div>
                      </div>
  
                      <div>
                          <div class="ch-check"><input type="checkbox"></div>
                          <div class="chProfile-img-area">프로필 이미지<img class="chProfile-img" src=""></div>
                          <div class="chProfile-dept">부서</div> /
                          <div class="chProfile-name">이름</div>
                      </div>
                      
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
        

          <jsp:include page="../common/scripts.jsp" />
</body>
</html>