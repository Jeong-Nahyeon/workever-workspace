package com.workever.wk.mail.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.mail.model.service.MailService;
import com.workever.wk.mail.model.vo.Mail;
import com.workever.wk.mail.model.vo.MailFiles;
import com.workever.wk.user.model.vo.User;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	// 받은메일함
	
	/** 받은 메일 목록 조회 후 받은메일함 페이지로 포워딩
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("inbox.mail")
	public ModelAndView selectIncomingMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			HttpSession session, ModelAndView mv) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		int listCount = mService.selectIncomingMailListCount(loginUser.getUserNo());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Mail> list = mService.selectIncomingMailList(pi, loginUser.getUserNo());
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("mail/inboxView");

		return mv;
		
	}
	
	/** [Ajax] 받은 메일 목록 삭제 (삭제보관함으로 이동) 후 처리 결과 응답 데이터로 전달
	 * @param trashList : 사용자가 삭제보관함으로 이동 요청한 받은 메일 번호 목록
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("trashlist.mail")
	public String ajaxDeleteTrashIncomingMailList(@RequestParam(value="trashList[]") List<String> trashList) {
		
		int result = 0;
		
		for(String mrNo : trashList) {
			
			result = mService.deleteTrashIncomingMail(mrNo); // 받은 메일 삭제 (삭제보관함으로 이동)
			
		}
		
		return result > 0 ? new Gson().toJson("success") : new Gson().toJson("success");
		
	}
	
	/** [Ajax] 다수의 메일 목록 읽음 처리 후 처리 결과 응답 데이터로 전달
	 * @param readList : 사용자가 읽음 처리 요청한 메일 목록
	 * @return
	 */
	@ResponseBody
	@RequestMapping("read.mail")
	public String updateRead(@RequestParam(value="readList[]") List<String> readList) {
		
		int result = 0;
		
		for(String mrNo : readList) {
			
			result = mService.updateRead(mrNo);
			
		}
		
		return result > 0 ? new Gson().toJson("success") : new Gson().toJson("success");
		
	}
	
	/** [Ajax] 다수의 메일 목록 안읽음 처리 후 처리 결과 응답 데이터로 전달
	 * @param noReadList : 사용자가 안읽음 처리 요청한 메일 목록
	 * @return
	 */
	@ResponseBody
	@RequestMapping("noread.mail")
	public String updateNoRead(@RequestParam(value="noReadList[]") List<String> noReadList) {
		
		int result = 0;
		
		for(String mrNo : noReadList) {
			
			result = mService.updateNoRead(mrNo);
			
		}
		
		return result > 0 ? new Gson().toJson("success") : new Gson().toJson("success");
		
	}
	
	
	// 받은메일
	
	/** 받은 메일 상세, 참조자 목록, 첨부파일 목록 조회 후 받은 메일 상세 페이지 포워딩
	 * @param m : 수신메일번호, 발신메일번호, 읽음상태를 담은 메일 객체
	 * @param mv
	 * @return
	 */
	@RequestMapping("incoming.mail")
	public ModelAndView selectIncomingMail(Mail m, String from, ModelAndView mv) {
		
		if(m.getMrRead().equals("N")) {
			
			// 받은 메일 읽음 처리
			mService.updateRead(m.getMrNo());
			
		}
		
		// 받은 메일 상세 조회
		Mail mail = mService.selectIncomingMail(m);
		
		// 참조자 목록 조회
		ArrayList<Mail> ccList = mService.selectCcList(m.getMrMsNo());
		
		// 첨부파일 목록 조회
		ArrayList<MailFiles> mailFileList = mService.selectMailFileList(m.getMrMsNo());
		
		// 삭제메일함에서 상세 조회 시
		if(from != null && from.equals("t")) {
			mv.addObject("from", from);
		}
		
		mv.addObject("mail", mail)
		  .addObject("ccList", ccList)
		  .addObject("mailFileList", mailFileList)
		  .setViewName("mail/incomingMailView");
		
		return mv;
		
	}
	
	/** 받은메일 삭제(삭제메일함으로 이동) 후 받은메일 목록 페이지 
	 * @param mrNo : 사용자가 삭제 요청한 수신메일번호
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("trash.mail")
	public String deleteTrashIncomingMail(String mrNo, Model model, HttpSession session) {
		
		int result = mService.deleteTrashIncomingMail(mrNo);
		
		if(result > 0) {
			
			session.setAttribute("successMsg", "성공적으로 삭제되었습니다(삭제메일함 이동)");
			return "redirect:inbox.mail";
			
		} else {
			
			model.addAttribute("errorMsg", "받은 메일 삭제 실패");
			return "common/errorPage";
			
		}
		
	}
	
	/** 삭제메일함에서 상세 조회 시 받은메일함 이동 요청 실행 후 삭제메일함 페이지 url 재요청
	 * @param mrNo : 사용자가 받은메일함으로 이동 요청한 수신메일번호
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("detailtoinbox.mail")
	public String updateDetailToInbox(String mrNo, HttpSession session, Model model) {
		
		int result = mService.updateToInbox(mrNo); 
		
		if(result > 0) {
			
			session.setAttribute("successMsg", "성공적으로 이동되었습니다");
			return "redirect:trashbox.mail";
			
		} else {
			
			model.addAttribute("errorMsg", "받은메일함으로 이동 실패");
			return "common/errorPage";
			
		}
		
	}
	
	
	
	// 보낸메일함
	
	/** 보낸 메일 조회 후 보낸메일함 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("outbox.mail")
	public ModelAndView selectOutgoingMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			HttpSession session, ModelAndView mv) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		int listCount = mService.selectOutgoingMailListCount(loginUser.getUserNo());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Mail> list = mService.selectOutgoingMailList(pi, loginUser.getUserNo());
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("mail/outboxView");

		return mv;
		
	}
	
	/** [Ajax] 보낸메일 완전 삭제(+ 수신자/참조자의 메일 모두 완전 삭제된 경우 관련 첨부파일 삭제) 후 응답 데이터 전달
	 * @param deleteList : 사용자가 완전 삭제 요청한 메일들의 발신메일번호 목록
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteogl.mail")
	public String ajaxDeleteOutgoingMailList(@RequestParam(value="deleteList[]") List<String> deleteList) {
		
		int result1 = 0; // 받은메일 완전 삭제
		int result2 = 1; // 첨부파일 삭제
		
		for(String msNo : deleteList) {
			
			result1 = mService.deleteOutgoingMailList(msNo); // 받은메일 완전 삭제
			
			ArrayList<MailFiles> list = mService.selectMailFileList(msNo);
			
			if(list != null) { // 첨부파일이 존재할 경우
				
				int receiverMailCount = mService.selectExistingReceiverMailCount(msNo); // 완전 삭제 안된 수신자/참조자 메일 수 (완전 삭제 시 0 | 존재 시 0 이상)
				
				if(receiverMailCount == 0) { // 관련 메일이 모두 완전 삭제된 경우 => 해당 메일 첨부파일 삭제
					
					result2 = mService.deleteMailFileList(msNo);
					
				}
				
			}
			
		}
		
		return result1 * result2 > 0 ? new Gson().toJson("success") : new Gson().toJson("success");
		
	}
	
	/** 보낸메일 상세 조회 후 보낸메일 상세페이지 포워딩
	 * @param msNo : 사용자가 요청한 발신메일번호
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("outgoing.mail")
	public ModelAndView selectOutgoingMail(String msNo, HttpSession session, ModelAndView mv) {
		
		// 보낸메일 상세 조회
		Mail mail = mService.selectOutgoingMail(msNo);
		
		// 수신자 목록 조회
		ArrayList<Mail> receiverList = mService.selectReceiveList(msNo);
		
		// 참조자 목록 조회
		ArrayList<Mail> ccList = mService.selectCcList(msNo);
		
		// 첨부파일 목록 조회
		ArrayList<MailFiles> mailFileList = mService.selectMailFileList(msNo);
		
		mv.addObject("mail", mail)
		.addObject("receiverList", receiverList)
		.addObject("ccList", ccList)
		.addObject("mailFileList", mailFileList)
		.setViewName("mail/outgoingMailView");
		
		return mv;
		
	}
	
	/** 보낸메일 상세 조회 시 메일 완전삭제 요청 실행 후 보낸메일함 페이지 url 재요청
	 * @param msNo : 사용자가 완전 삭제 요청한 메일의 발신메일번호
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("deleteog.mail")
	public String deleteIncomingMail(String msNo, HttpSession session, Model model) {
		
		int result1 = mService.deleteOutgoingMailList(msNo); // 메일 완전삭제
		
		int result2 = 1; // 해당 메일 첨부파일 삭제 
		
		ArrayList<MailFiles> list = mService.selectMailFileList(msNo);
		System.out.println(list);
		if(list != null) { // 첨부파일이 존재할 경우
			
			int receiverMailCount = mService.selectExistingReceiverMailCount(msNo); // 완전 삭제 안된 수신자/참조자 메일 수 (완전 삭제 시 0 | 존재 시 0 이상)
			
			if(receiverMailCount == 0) { // 관련 메일이 모두 완전 삭제된 경우 => 해당 메일 첨부파일 삭제
				
				result2 = mService.deleteMailFileList(msNo);
				
			}
			
		}
		
		if(result1 * result2 > 0) {
			
			session.setAttribute("successMsg", "성공적으로 삭제되었습니다(복구불가)");
			return "redirect:outbox.mail";
			
		} else {
			
			model.addAttribute("errorMsg", "메일 완전삭제 실패");
			return "common/errorPage";
			
		}
		
	}
	
	
	
	// 삭제메일함
	
	/** 삭제 메일 목록 조회 후 삭제메일함 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("trashbox.mail")
	public ModelAndView selectTrashMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		int listCount = mService.selectTrashMailListCount(loginUser.getUserNo());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Mail> list = mService.selectTrashMailList(pi, loginUser.getUserNo());
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("mail/trashboxView");

		return mv;
		
	}
	
	/** [Ajax] 받은메일 완전 삭제(+ 발신자/수신자/참조자의 메일 모두 완전 삭제된 경우 관련 첨부파일 삭제) 후 응답 데이터 전달
	 * @param deleteList : 사용자가 완전 삭제 요청한 메일들의 수신메일번호 목록
	 * @param mrMsNoList : 사용자가 완전 삭제 요청한 메일들의 발신메일번호 목록
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteicl.mail")
	public String ajaxDeleteIncomingMailList(@RequestParam(value="deleteList[]") List<String> deleteList, 
			@RequestParam(value="mrMsNoList[]") List<String> mrMsNoList) {
		
		int result1 = 0; // 받은메일 완전 삭제
		int result2 = 1; // 첨부파일 삭제
		
		for(String mrNo : deleteList) {
			
			result1 = mService.deleteIncomingMailList(mrNo); // 받은메일 완전 삭제
			
		}
		
		for(String mrMsNo : mrMsNoList) {
			
			ArrayList<MailFiles> list = mService.selectMailFileList(mrMsNo);
			
			if(list != null) { // 첨부파일이 존재할 경우
				
				int senderMailCount = mService.selectExistingSenderMailCount(mrMsNo); // 완전 삭제 안된 발신자 메일 수 (완전 삭제 시 0 | 존재 시 1)
				int receiverMailCount = mService.selectExistingReceiverMailCount(mrMsNo); // 완전 삭제 안된 수신자/참조자 메일 수 (완전 삭제 시 0 | 존재 시 0 이상)
				
				if(senderMailCount == 0 && receiverMailCount == 0) { // 관련 메일이 모두 완전 삭제된 경우 => 해당 메일 첨부파일 삭제
					
					result2 = mService.deleteMailFileList(mrMsNo);
					
				}
				
			}
			
		}
		
		return result1 * result2 > 0 ? new Gson().toJson("success") : new Gson().toJson("success");
		
	}
	
	/** [Ajax] 삭제메일함에서 받은메일함으로 이동 후 처리 결과 응답 데이터로 전달
	 * @param deliveryList : 사용자가 요청한 받은메일함으로 이동할 받은 메일 목록
	 * @return
	 */
	@ResponseBody
	@RequestMapping("toinbox.mail")
	public String updateToInbox(@RequestParam(value="deliveryList[]") List<String> deliveryList) {
		
		int result = 0;
		
		for(String mrNo : deliveryList) {
			
			result = mService.updateToInbox(mrNo); 
			
		}
		
		return result > 0 ? new Gson().toJson("success") : new Gson().toJson("success");
		
	}
	
	/** 삭제메일함에서 상세 조회 시 메일 완전삭제 요청 실행 후 삭제메일함 페이지 url 재요청
	 * @param mrNo : 사용자가 완전 삭제 요청한 메일의 수신메일번호
	 * @param mrMsNo : 사용자가 완전 삭제 요청한 메일의 발신메일번호
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("deleteic.mail")
	public String deleteIncomingMail(String mrNo, String mrMsNo, HttpSession session, Model model) {
		
		int result1 = mService.deleteIncomingMailList(mrNo); // 메일 완전삭제
		
		int result2 = 1; // 해당 메일 첨부파일 삭제 
		
		ArrayList<MailFiles> list = mService.selectMailFileList(mrMsNo);
		
		if(list != null) { // 첨부파일이 존재할 경우
			
			int senderMailCount = mService.selectExistingSenderMailCount(mrMsNo); // 완전 삭제 안된 발신자 메일 수 (완전 삭제 시 0 | 존재 시 1)
			int receiverMailCount = mService.selectExistingReceiverMailCount(mrMsNo); // 완전 삭제 안된 수신자/참조자 메일 수 (완전 삭제 시 0 | 존재 시 0 이상)
			
			if(senderMailCount == 0 && receiverMailCount == 0) { // 관련 메일이 모두 완전 삭제된 경우 => 해당 메일 첨부파일 삭제
				
				result2 = mService.deleteMailFileList(mrMsNo);
				
			}
			
		}
		
		if(result1 * result2 > 0) {
			
			session.setAttribute("successMsg", "성공적으로 삭제되었습니다(복구불가)");
			return "redirect:trashbox.mail";
			
		} else {
			
			model.addAttribute("errorMsg", "메일 완전삭제 실패");
			return "common/errorPage";
			
		}
		
	}
	
	
	
	// 테스트용 삭제 예정

	
	
	/** 메일 작성 페이지 응답하는 메소드
	 * @return : composeMailForm.jsp
	 */
	@RequestMapping("compose.mail")
	public String composeMailForm() {
		
		return "mail/composeMailForm";
		
	}
	
}
