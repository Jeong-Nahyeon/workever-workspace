package com.workever.wk.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workever.wk.mail.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	
	
	
	// 테스트용 삭제 예정
	
	/** 메일 작성 페이지 응답하는 메소드
	 * @return : composeMailForm.jsp
	 */
	@RequestMapping("compose.mail")
	public String composeMailForm() {
		
		return "mail/composeMailForm";
		
	}
	
	/** 받은메일함 페이지 응답하는 메소드
	 * @return : inboxView.jsp
	 */
	@RequestMapping("inbox.mail")
	public String inboxView() {
		
		return "mail/inboxView";
		
	}
	
	/** 보낸메일함 페이지 응답하는 메소드
	 * @return : outboxView.jsp
	 */
	@RequestMapping("outbox.mail")
	public String outboxView() {
		
		return "mail/outboxView";
		
	}
	
	/** 삭제메일함 페이지 응답하는 메소드
	 * @return : trashboxView.jsp
	 */
	@RequestMapping("trashbox.mail")
	public String trashboxView() {
		
		return "mail/trashboxView";
		
	}
	
	/**	받은메일 상세 페이지 응답하는 메소드
	 * @return : incomingMailDetailView.jsp
	 */
	@RequestMapping("incoming.mail")
	public String incomingMailDetailView() {
		
		return "mail/incomingMailView";
		
	}
	
	/** 보낸메일 상세 페이지 응답하는 메소드
	 * @return : outgoingMailDetailView.jsp
	 */
	@RequestMapping("outgoing.mail")
	public String outgoingMailDetailView() {
		
		return "mail/outgoingMailView";
		
	}
	

	
}
