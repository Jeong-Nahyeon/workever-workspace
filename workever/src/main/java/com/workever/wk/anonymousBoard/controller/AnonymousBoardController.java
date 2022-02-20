package com.workever.wk.anonymousBoard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.workever.wk.anonymousBoard.model.service.AnonymousBoardService;
import com.workever.wk.anonymousBoard.model.vo.AnonymousBoard;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.model.vo.CommunityReply;
import com.workever.wk.community.template.SaveCommunityFiles;
import com.workever.wk.report.model.vo.Report;
import com.workever.wk.user.model.vo.User;

@Controller
public class AnonymousBoardController {
	
	@Autowired
	private AnonymousBoardService aService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/** 익명 게시글 목록 조회 후 익명 게시글 목록 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 페이지 수 
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.abo")
	public ModelAndView anonymousBoardListView(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<AnonymousBoard> list = aService.selectAnonymousBoardList(pi);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("anonymousBoard/anonymousBoardListView");
		
		return mv;
		
	}
	
	/** 익명 게시글 상세 조회 후  익명 게시글 상세 페이지 포워딩
	 * @param abno : 사용자가 조회 요청한 익명 게시글 번호
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("detail.abo")
	public ModelAndView anonymousBoardDetailView(String abno, HttpSession session, ModelAndView mv) {
		
		// 조회수 증가
		int result = aService.increaseCount(abno);
		
		if(result > 0) { // 유효한 게시글 조회
				
			// 게시글 상세 조회
			AnonymousBoard ab = aService.selectAnonymousBoard(abno);
			
			User loginUser = (User)session.getAttribute("loginUser");
			
			int correct = 0;
			if(bcryptPasswordEncoder.matches(loginUser.getUserNo(), ab.getAbUserNo())) { // 로그인한 사원과 작성자 회원번호 일치할 경우
				
				correct = 1;
				
			}
			
			// 첨부파일 조회
			ArrayList<CommunityFiles> list = aService.selectCommunityFileList(abno);
			
			// 신고 목록 조회
			ArrayList<Report> totalReportList = aService.selectReportList();
			// 로그인한 사원이 해당 게시글을 이미 신고한 사원인 경우 => reportUser = 1
			
			int reportUser = 0;
			for(Report report : totalReportList) {
				
				if(report.getReportCategory().equals("B")) {
					
					if(report.getReportRefNo().equals(abno) && loginUser.getUserNo().equals(report.getUserNo())) {
						// 로그인한 사원이 해당 게시글을 이미 신고한 사원인 경우
						reportUser = 1;
					}
					
				}
				
			}

			mv.addObject("ab", ab)
			  .addObject("list", list)
			  .addObject("correct", correct)
			  .addObject("reportUser", reportUser)
			  .setViewName("anonymousBoard/anonymousBoardDetailView");
			
			return mv;
		
		} else { // 유효하지 않은 게시글 조회
			
			mv.addObject("errorMsg", "유효하지 않은 게시글 입니다")
			  .setViewName("common/errorPage");
			
			return mv;
			
		}
		
	}
	
	/** 익명 게시글 작성 페이지 포워딩
	 * @return
	 */
	@RequestMapping("enrollForm.abo")
	public String anonymousBoardEnrollForm() {
		
		return "anonymousBoard/anonymousBoardEnrollForm";
		
	}
	
	/** 익명 게시글 등록 및 첨부파일 목록 등록 후 익명 게시글 목록 페이지 url 재요청
	 * @param ab : 사용자가 입력한 익명 게시글 정보
	 * @param upfile : 사용자가 등록한 첨부파일 목록
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("insert.abo")
	public String insertAnonymousBoard(AnonymousBoard ab, MultipartFile[] upfile, HttpSession session, Model m) {
		
		// 사원번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(ab.getAbUserNo());
		ab.setAbUserNo(encPwd);
		
		ArrayList<CommunityFiles> list = new ArrayList<>();
		
		if(upfile != null) { // 첨부파일이 존재할 경우
		
		String savePath = "resources/community_upfiles/anonymousBoard_upfiles/";
			
			for(int i=0; i<upfile.length; i++) {
				
				if(!upfile[i].getOriginalFilename().equals("")) {
					
					String changeName = SaveCommunityFiles.saveFile(upfile[i], session, savePath);
					
					CommunityFiles cf = new CommunityFiles();
					cf.setCfOriginName(upfile[i].getOriginalFilename());
					cf.setCfChangeName(changeName);
					cf.setCfPath(savePath);
					
					list.add(cf);
					
				}
				
			}
			
		}
			
		int result = aService.insertAnonymousBoard(ab, list); // 게시글 등록
		
		if(result > 0) { // 등록 성공
			
			session.setAttribute("successMsg", "성공적으로 등록되었습니다");
			return "redirect:list.abo";
			
		} else { // 등록 실패
		
		if(!list.isEmpty()) { // 첨부파일 있는 경우
			
			for(CommunityFiles file : list) {
				
				new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
				// 삭제 시키고자하는 파일을 찾아서 File 객체에 담아서 삭제		
			
			}
			
		}
		
		m.addAttribute("errorMsg", "익명 게시글 등록 실패");
		return "common/errorPage";
		
		}
		
	}	
	
	/** 익명 게시글 수정 페이지 포워딩
	 * @param abNo : 사용자가 요청한 게시글 번호
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("updateForm.abo")
	public ModelAndView anonymousBoardUpdateForm(String abNo, HttpSession session, ModelAndView mv) {
		
		AnonymousBoard ab = aService.selectAnonymousBoard(abNo);
		
		ArrayList<CommunityFiles> list = aService.selectCommunityFileList(abNo);
		
		mv.addObject("ab", ab)
		  .addObject("list", list)
		  .setViewName("anonymousBoard/anonymousBoardUpdateForm");
		
		return mv;
		
	}
	
	/**  새로운 게시글 내용 업데이트, 기존의 첨부파일 삭제, 새로운 첨부파일 등록 후 해당 익명 게시글 상세 페이지 url 재요청
	 * @param deleteNo : 사용자가 삭제할 기존 첨부파일 번호
	 * @param ab : 사용자가 수정한 게시글 정보
	 * @param upfile : 사용자가 새로 등록한 첨부파일
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("update.abo")
	public String updateDeptBoard(String[] deleteNo, AnonymousBoard ab, MultipartFile[] upfile, HttpSession session, Model m) {
					
		if(deleteNo != null) { // 삭제할 기존 첨부파일이 있을 경우 
			
			for(String deleteFileNo : deleteNo) {
				
				int cfNo = Integer.parseInt(deleteFileNo);
				
				// 내부 저장경로에서 삭제
				CommunityFiles cf = aService.selectCommunityFile(cfNo);
				new File(session.getServletContext().getRealPath(cf.getCfPath() + cf.getCfChangeName())).delete();
								
				// DB에서 삭제
				aService.deleteCommunityFile(cfNo);
				
			}
			
		}
		
		ArrayList<CommunityFiles> list = new ArrayList<>();
		
		if(upfile != null) { // 첨부파일이 존재할 경우
			
			String savePath = "resources/community_upfiles/anonymousBoard_upfiles/";
			
			for(int i=0; i<upfile.length; i++) {
				
				if(!upfile[i].getOriginalFilename().equals("")) {
					
					String changeName = SaveCommunityFiles.saveFile(upfile[i], session, savePath);
					
					CommunityFiles cf = new CommunityFiles();
					cf.setCfRefNo(Integer.parseInt(ab.getAbNo()));
					cf.setCfOriginName(upfile[i].getOriginalFilename());
					cf.setCfChangeName(changeName);
					cf.setCfPath(savePath);
					
					list.add(cf);
					
				}
				
			}
			
		}
		
		int result = aService.updateAnonymousBoard(ab, list);
		
		if(result > 0) { // 수정 성공
			
			session.setAttribute("successMsg", "성공적으로 수정되었습니다");
			return "redirect:detail.abo?abno=" + ab.getAbNo();
			
		} else { // 수정 실패
			
			if(!list.isEmpty()) { // 첨부파일 있는 경우
				
				for(CommunityFiles file : list) {
					
					new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
				
				}
				
			}
			
			m.addAttribute("errorMsg", "익명 게시글 수정 실패");
			return "common/errorPage";
			
		}
		
	}	
	
	/** 익명 게시글 삭제 후 익명 게시글 목록 페이지 url 재요청
	 * @param abNo : 사용자가 삭제 요청한 익명 게시글 번호
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("delete.abo")
	public String deleteAnonymousBoard(String abNo, HttpSession session, Model m) {
		
		int result1 = aService.deleteAnonymousBoard(abNo); // 게시글 삭제
		
		ArrayList<CommunityReply> rlist = aService.selectReplyList(abNo); // 해당 게시글 댓글 목록 조회
		
		int result2 = 1;
		if(rlist != null) { // 삭제할 게시글에 댓글 있을 경우
			
			result2 = aService.deleteCommunityReplyList(abNo);
			
		}
		
		ArrayList<CommunityFiles> flist = new ArrayList<>();
		flist = aService.selectCommunityFileList(abNo);
		
		int result3 = 1;
		if(!flist.isEmpty()) { // 삭제할 게시글에  첨부파일 있을 경우
			
			result3 = aService.deleteCommunityFileList(abNo);
			
			for(CommunityFiles file : flist) {
				
				new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
			
			}
			
		} 
		
		if(result1 * result2 * result3 > 0) { // 삭제 성공
			
			session.setAttribute("successMsg", "성공적으로 삭제되었습니다.");
			return "redirect:list.abo";
			
		} else { // 삭제 실패
			
			m.addAttribute("errorMsg", "익명 게시글 삭제 실패");
			return "common/errorPage";
			
		}
		
	}
	
	/** [Ajax] 익명 게시글에 달린 댓글 목록 조회 후 해당 댓글 리스트 응답 데이터로 전달
	 * @param abno : 참조할 익명 게시글 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="rlist.abo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(String abno, HttpSession session) {
		
		User loginUser = (User)session.getAttribute("loginUser");

		ArrayList<CommunityReply> list = aService.selectReplyList(abno);
		
		if(list != null) {
			
			for(CommunityReply cr : list) {
				
				if(bcryptPasswordEncoder.matches(loginUser.getUserNo(), cr.getCrUserNo())){ // 로그인한 사원과 댓글 작성 사원이 일치할 경우
					
					cr.setCorrect(1);
					
				}
				
				ArrayList<Report> totalReportList = aService.selectReportList();
				
				int reportUser = 0; // 해당 댓글 신고한 사원 중 로그인한 사원 포함 여부 (불포함 0 / 포함 1)
				for(Report report : totalReportList) {
					
					if(report.getReportCategory().equals("R")) {
						
						if(report.getReportRefNo().equals(cr.getCrNo()) && loginUser.getUserNo().equals(report.getUserNo())) {
							// 로그인한 사원이 해당 댓글을 이미 신고한 사원인 경우
							
							reportUser = 1;
							cr.setReportUser(reportUser);
							
						}
							
					}
					
				}
				
			}
			
		}
		
		return new Gson().toJson(list);
		
	}
	
	/** [Ajax] 익명 댓글 등록 후 처리 상태 응답 데이터로 전달
	 * @param cr : 사용자가 입력한 댓글 정보
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rinsert.abo")
	public String ajaxInsertReply(CommunityReply cr, HttpSession session) {
		
		// 익명 댓글 작성 사원 번호 암호화 후 추가
		String encPwd = bcryptPasswordEncoder.encode(((User)session.getAttribute("loginUser")).getUserNo());
		cr.setCrUserNo(encPwd);
		
		int result = aService.insertReply(cr);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/** [Ajax] 기존 댓글 수정 후 처리 상태 응답 데이터로 전달
	 * @param cr : 사용자가 수정한 댓글 정보
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rupdate.abo")
	public String ajaxUpdateReply(CommunityReply cr) {

		int result = aService.updateReply(cr);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/** [Ajax] 댓글 삭제 후 처리 상태 응답 데이터로 전달
	 * @param cr : 사용자가 삭제 요청한 댓글 정보
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rdelete.abo")
	public String ajaxDeleteReply(CommunityReply cr) {
		
		int result = aService.deleteReply(cr);
		
		return result > 0 ? "success" : "fail";
		
	}	

	/**  나의 익명글 목록 조회 후 나의 익명글 페이지 포워딩
	 * @param currentPage
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.mabo")
	public ModelAndView myAnonymousBoardListView(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String loninUserNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		// 전체 익명 게시글의 게시글 번호 및 사원번호  목록 조회
		ArrayList<AnonymousBoard> totalList = aService.selectTotalAnonymousBoardList();
		
		// 로그인한 사원과 일치하는 익명 게시글의 게시글 번호 목록
		List<String> myAbNoList = new ArrayList<>();
		
		if(totalList != null) {
			for(AnonymousBoard ab : totalList) {
				
				if(bcryptPasswordEncoder.matches(loninUserNo, ab.getAbUserNo())) {
					myAbNoList.add(ab.getAbNo());
				} else {
					myAbNoList.add("0");
				}
				
			}
		}
		
		PageInfo pi = Pagination.getPageInfo(myAbNoList.size(), currentPage, 10, 10);
	
		ArrayList<AnonymousBoard> list = aService.selectMyAnonymousBoardList(pi, myAbNoList);
		
		mv.addObject("list", list)
		.addObject("pi", pi)
		.setViewName("myBoard/myAnonymousBoardListView");
		
		return mv;
		
	}

	/** [Ajax] 나의 익명글 목록 페이지에서 게시글 삭제 요청 처리 후 처리 상태 응답 데이터로 전달
	 * @param deleteNo : 사용자가 삭제 요청한 다수의 익명글
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delete.mabo")
	public String ajaxDeleteAnonymousBoardList(@RequestParam(value="deleteList[]") List<String> deleteList, HttpSession session) {
		
		int result1 = 0; // 게시글 삭제
		int result2 = 1; // 첨부파일 삭제
		int result3 = 1; // 댓글 삭제
		
		for(String abNo : deleteList) {
			
			result1 = aService.deleteAnonymousBoard(abNo); // 게시글 삭제
			
			ArrayList<CommunityReply> rlist = new ArrayList<>();
			rlist = aService.selectReplyList(abNo);
			
			if(!rlist.isEmpty()) { // 삭제할 게시글에 댓글 있을 경우
				
				result2 = aService.deleteCommunityReplyList(abNo);
				
			}
			
			ArrayList<CommunityFiles> flist = new ArrayList<>();
			flist = aService.selectCommunityFileList(abNo);
			
			if(!flist.isEmpty()) { // 삭제할 게시글에  첨부파일 있을 경우
				
				result3 = aService.deleteCommunityFileList(abNo);
				
				for(CommunityFiles file : flist) {
					
					new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
				
				}
				
			}  
			
		}
		
		return result1 * result2 * result3 > 0 ? new Gson().toJson("success") : new Gson().toJson("success");
		
	}	
	
	/** 익명 게시글 및 댓글 신고 등록
	 * @param r : 신고글 정보
	 * @param abNo : 해당 익명 게시글 번호
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("report.abo")
	public ModelAndView insertReport(Report r, String abNo, HttpSession session, ModelAndView mv) {
		
		if(r.getReportCategory().equals("B")) { // 익명 게시글 신고
			
			int result = aService.increaseAnonymousBoardReportCount(r.getReportRefNo());
			
			if(result > 0) { // 유효한 게시글
				
				aService.insertReport(r);
				
				session.setAttribute("successMsg", "성공적으로 신고되었습니다");
				mv.setViewName("redirect:detail.abo?abno=" + abNo); 
				
			} else {
				
				mv.addObject("errorMsg", "익명 게시글 신고 실패")
				  .setViewName("common/errorPage");
				
			}
			
		} else { // 익명 댓글 신고
			
			int result = aService.increaseCommunityReplyReportCount(r.getReportRefNo());
			
			if(result > 0) { // 유효한 게시글
				
				aService.insertReport(r);
				
				session.setAttribute("successMsg", "성공적으로 신고되었습니다");
				mv.setViewName("redirect:detail.abo?abno=" + abNo); 
				
			} else {
				
				mv.addObject("errorMsg", "익명 댓글 신고 실패")
				  .setViewName("common/errorPage");
				
			}
			
		} 
			
		return mv;
		
	}
	
}
