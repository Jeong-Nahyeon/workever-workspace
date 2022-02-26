package com.workever.wk.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.workever.wk.alert.model.service.AlertService;
import com.workever.wk.alert.model.vo.Alert;
import com.workever.wk.user.model.vo.User;

public class EchoHandler extends TextWebSocketHandler{

	List<WebSocketSession> sockets = new ArrayList<>();
	Map<String, WebSocketSession> userSessionsMap = new HashMap<>();
	
	@Autowired
	private AlertService alService;
	
	// 클라이언트가 서버에 접속했을 때 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished : " + session );
		sockets.add(session);
		String senderId = getUser(session);
		userSessionsMap.put(senderId, session);
	}
	
	// socket에 메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage: " + session + " : " + message );
		String senderId = getUser(session);
		// protocol :  (알림 구분, 글 제목, 글 번호, 수신자 사번, 발신자 이름)
		String msg = message.getPayload();
		if (StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 5) {
				
				String boardTitle = "";
				String alertContent ="";
				
				if(strs[1].length() > 5) {
					boardTitle = strs[1].substring(0, 5) + "..";
				}else {
					boardTitle = strs[1];
				}
				
				String cmd = strs[0];
				
				String boardNo = strs[2];
				String receiveUser = strs[3];
				String sendUser = strs[4];
				
				
				
				Alert alert = new Alert();
				alert.setAlertType(cmd);
				alert.setAlertBoardNo(Integer.parseInt(boardNo));
				alert.setAlertReceiveUser(Integer.parseInt(receiveUser));
				
				WebSocketSession boardWriterSession = userSessionsMap.get(receiveUser);
				if(!senderId.equals(receiveUser)) {
					
					switch(cmd) {
					case "abo" : alertContent = "[" + boardTitle + "] 글에 댓글을 달렸습니다.";break;
					case "dbo" : alertContent = sendUser + "님이  [" + boardTitle + "] 글에 댓글을 달았습니다.";break;
					case "pbo" : alertContent = sendUser + "님이  [" + boardTitle + "] 글에 댓글을 달았습니다.";break;
					case "pnew" : alertContent = sendUser + "님이  [" + boardTitle + "] 글을 등록했습니다.";break;
					case "apvl" : alertContent = "[" + boardTitle + "] 결재가 완료되었습니다.";break;
					}
					
					/*
					if("abo".equals(cmd) && boardWriterSession != null) { // 익명 글에 댓글을 달았을 때
						alertContent = "[" + boardTitle + "] 글에 댓글을 달렸습니다.";
					}else if("dbo".equals(cmd) && boardWriterSession != null) { // 부서 글에 댓글을 달았을 때
						alertContent = sendUser + "님이  [" + boardTitle + "] 글에 댓글을 달았습니다.";
					}else if("pbo".equals(cmd) && boardWriterSession != null) {
						alertContent = sendUser + "님이  [" + boardTitle + "] 글에 댓글을 달았습니다.";
					}else if(("pnew").equals(cmd) && boardWriterSession != null) {
						alertContent = sendUser + "님이  [" + boardTitle + "] 글을 등록했습니다.";
					}else if(("apvl").equals(cmd) && boardWriterSession != null) {
						alertContent = "[" + boardTitle + "] 결재가 완료되었습니다.";
					}else {
						alertContent = "에러";
					}*/
					
					alert.setAlertContent(alertContent);
					
					int result = alService.insertAlert(alert);
					
					if(boardWriterSession != null) {
						TextMessage tmpMsg = new TextMessage(alertContent);
						boardWriterSession.sendMessage(tmpMsg);
					}
				}
			}
		}
	}
	
	private String getUser(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User)httpSession.get("loginUser");
		if(loginUser == null) {
			return session.getId();
		}else {
			return loginUser.getUserNo();
		}
	}

	// 클라이언트와 서버 접속이 끊겼을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		userSessionsMap.remove(getUser(session));
		System.out.println("afterConnectionClosed : " + session );
		sockets.remove(session);
	}
}
