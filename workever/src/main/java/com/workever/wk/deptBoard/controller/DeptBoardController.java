package com.workever.wk.deptBoard.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.model.vo.CommunityReply;
import com.workever.wk.community.template.SaveCommunityFiles;
import com.workever.wk.deptBoard.model.service.DeptBoardService;
import com.workever.wk.deptBoard.model.vo.DeptBoard;
import com.workever.wk.user.model.vo.User;

@Controller
public class DeptBoardController {
	
	@Autowired
	private DeptBoardService dService;
	
	/** 로그인한 사원의 해당 부서명, 부서별 게시글 목록 조회 (최신순||오래된순 / 페이징 처리) 후 부서별 게시글 목록 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param orderList : 사용자가 요청한 게시글 목록 정렬용 키워드 asc(오래된순)
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.dbo")
	public ModelAndView selectDeptBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String orderList, HttpSession session, ModelAndView mv) {
				
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 로그인한 사원의 부서명
		String deptName = dService.selectDeptName(loginUser.getDeptNo());
		
		// 해당 부서별 게시판 게시글 총 개수
		int listCount = dService.selectListCount(loginUser.getDeptNo());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		
		if(orderList != null) { // 오래된순 조회
			
			ArrayList<DeptBoard> list = dService.selectAscList(pi, loginUser.getDeptNo());
			
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("orderList", orderList)
			.addObject("deptName", deptName)
			.setViewName("deptBoard/deptBoardListView");
			
			return mv;
			
		} else { // 최신순(기본) 조회
			
			ArrayList<DeptBoard> list = dService.selectDeptBoardList(pi, loginUser.getDeptNo());
		
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("deptName", deptName)
			.setViewName("deptBoard/deptBoardListView");
			
			return mv;
			
		}
		
	}

	/** 부서별 게시글 상세 조회
	 * @param dbno : 사용자가 요청한 게시글 번호
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("detail.dbo")
	public ModelAndView selectdeptBoard(int dbno, HttpSession session, ModelAndView mv) {
		
		// 로그인한 사원의 부서명
		String deptName = dService.selectDeptName(((User)session.getAttribute("loginUser")).getDeptNo());

		// 조회수 증가
		int result = dService.increaseCount(dbno);
		
		if(result > 0) { // 유효한 게시글 조회
			
			// 게시글 상세 조회
			DeptBoard db = dService.selectDeptBoard(dbno);
			
			// 첨부파일 조회
			ArrayList<CommunityFiles> list = dService.selectCommunityFileList(dbno);
			
			mv.addObject("db", db)
			  .addObject("list", list)
			  .addObject("deptName", deptName)
			  .setViewName("deptBoard/deptBoardDetailView");
			
			return mv;
		
		} else { // 유효하지 않은 게시글 조회
			
			mv.addObject("errorMsg", "유효하지 않은 게시글 입니다")
			  .setViewName("common/errorPage");
			
			return mv;
			
		}
					
	}
	
	/** 부서별 게시글 작성 페이지 포워딩
	 * @return
	 */
	@RequestMapping("enrollForm.dbo")
	public String deptBoardEnrollForm(HttpSession session, Model m) {
		
		// 로그인한 사원의 부서명
		String deptName = dService.selectDeptName(((User)session.getAttribute("loginUser")).getDeptNo());		
		
		m.addAttribute("deptName", deptName);
		
		return "deptBoard/deptBoardEnrollForm";
		
	}
	
	/** 부서별 게시글 등록 후 부서별 게시글 목록 페이지 url 재요청
	 * @param db : 사용자가 입력한 부서별 게시글 정보
	 * @param upfile : 사용자가 등록한 첨부파일
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("insert.dbo")
	public String insertDeptBoard(DeptBoard db, MultipartFile[] upfile, HttpSession session, Model m) {
		
		if(db.getDbCategory().equals("N")) { // 공지글인 경우
			
			db.setDbPin(1); // 상단 고정을 위한 pin 등록
			
		} else { // 일반글인 경우

			db.setDbCategory(null);
			
		}
		
		ArrayList<CommunityFiles> list = new ArrayList<>();
		
		if(upfile != null) { // 첨부파일이 존재할 경우
		
		String savePath = "resources/community_upfiles/deptBoard_upfiles/";
			
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
			
		int result = dService.insertDeptBoard(db, list);
		
		if(result > 0) { // 등록 성공
			
			session.setAttribute("successMsg", "성공적으로 등록되었습니다");
			return "redirect:list.dbo";
			
		} else { // 등록 실패
		
		if(!list.isEmpty()) { // 첨부파일 있는 경우
			
			for(CommunityFiles file : list) {
				
				new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
				// 삭제 시키고자하는 파일을 찾아서 File 객체에 담아서 삭제		
			
			}
			
		}
		
		m.addAttribute("errorMsg", "부서별 게시글 등록 실패");
		return "common/errorPage";
		
		}
		
	}
	
	/** 부서별 게시글 수정  페이지 포워딩
	 * @param dbno : 사용자가 요청한 게시글 번호
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("updateForm.dbo")
	public ModelAndView deptBoardUpdateForm(int dbno, HttpSession session, ModelAndView mv) {
		
		// 로그인한 사원의 부서명
		String deptName = dService.selectDeptName(((User)session.getAttribute("loginUser")).getDeptNo());		
		
		DeptBoard db = dService.selectDeptBoard(dbno);
		
		ArrayList<CommunityFiles> list = dService.selectCommunityFileList(dbno);
		
		mv.addObject("db", db)
		  .addObject("list", list)
		  .addObject("deptName", deptName)
		  .setViewName("deptBoard/deptBoardUpdateForm");
		
		return mv;
		
	}
	
	/** 새로운 게시글 내용 업데이트, 기존의 첨부파일 삭제, 새로운 첨부파일 등록 후 부서별 게시글 목록 페이지 url 재요청 
	 * @param deleteNo : 사용자가 요청한 삭제할 첨부파일 번호
	 * @param db : 사용자가 수정한 게시글 정보
	 * @param upfile : 사용자가 새로 등록한 첨부파일
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("update.dbo")
	public String updateDeptBoard(String[] deleteNo, DeptBoard db, MultipartFile[] upfile, HttpSession session, Model m) {
		
		if(db.getDbCategory().equals("N")) { // 공지글인 경우
			
			db.setDbPin(1); // 상단 고정을 위한 pin 등록
			
		} else { // 일반글인 경우

			db.setDbCategory(null);
			
		}
								
		if(deleteNo != null) { // 삭제할 첨부파일이 있을 경우 
			
			for(String deleteFileNo : deleteNo) {
				
				int cfNo = Integer.parseInt(deleteFileNo);
				
				// 내부 저장경로에서 삭제
				CommunityFiles cf = dService.selectCommunityFile(cfNo);
				new File(session.getServletContext().getRealPath(cf.getCfPath() + cf.getCfChangeName())).delete();
								
				// DB에서 삭제
				dService.deleteCommunityFile(cfNo);
				
			}
			
		}
		
		ArrayList<CommunityFiles> list = new ArrayList<>();
		
		if(upfile != null) { // 첨부파일이 존재할 경우
			
			String savePath = "resources/community_upfiles/deptBoard_upfiles/";
			
			for(int i=0; i<upfile.length; i++) {
				
				if(!upfile[i].getOriginalFilename().equals("")) {
					
					String changeName = SaveCommunityFiles.saveFile(upfile[i], session, savePath);
					
					CommunityFiles cf = new CommunityFiles();
					cf.setCfRefNo(db.getDbNo());
					cf.setCfOriginName(upfile[i].getOriginalFilename());
					cf.setCfChangeName(changeName);
					cf.setCfPath(savePath);
					
					list.add(cf);
					
				}
				
			}
			
		}
		
		int result = dService.updateDeptBoard(db, list);
		
		if(result > 0) { // 수정 성공
			
			session.setAttribute("successMsg", "성공적으로 수정되었습니다");
			return "redirect:detail.dbo?dbno=" + db.getDbNo();
			
		} else { // 수정 실패
			
			if(!list.isEmpty()) { // 첨부파일 있는 경우
				
				for(CommunityFiles file : list) {
					
					new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
				
				}
				
			}
			
			m.addAttribute("errorMsg", "부서별 게시글 수정 실패");
			return "common/errorPage";
			
		}
		
	}
	
	/** 게시글 삭제 후 부서별 게시글 목록 페이지 url 재요청
	 * @param dbno : 사용자가 요청한 삭제할 게시글번호
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("delete.dbo")
	public String deleteDeptBoard(int dbno, HttpSession session, Model m) {
		
		int result1 = dService.deleteDeptBoard(dbno); // 게시글 삭제
		
		ArrayList<CommunityReply> rlist = new ArrayList<>();
		rlist = dService.selectReplyList(dbno);
		
		int result2 = 1;
		if(!rlist.isEmpty()) { // 삭제할 게시글에 댓글 있을 경우
			
			result2 = dService.deleteCommunityReplyList(dbno);
			
		}
		
		ArrayList<CommunityFiles> flist = new ArrayList<>();
		flist = dService.selectCommunityFileList(dbno);
		
		int result3 = 1;
		if(!flist.isEmpty()) { // 삭제할 게시글에  첨부파일 있을 경우
			
			result3 = dService.deleteCommunityFileList(dbno);
			
			for(CommunityFiles file : flist) {
				
				new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
			
			}
			
		} 
		
		if(result1 * result2 * result3 > 0) { // 삭제 성공
			
			session.setAttribute("successMsg", "성공적으로 삭제되었습니다.");
			return "redirect:list.dbo";
			
		} else { // 삭제 실패
			
			m.addAttribute("errorMsg", "부서별 게시글 삭제 실패");
			return "common/errorPage";
			
		}
		
	}	
	
	/** [Ajax] 부서별 게시글에 달린 댓글 목록 조회 후 해당 댓글 리스트 응답 데이터로 전달
	 * @param dbno : 참조할 게시글 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="rlist.dbo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int dbno) {

		ArrayList<CommunityReply> list = dService.selectReplyList(dbno);
		
		return new Gson().toJson(list);
		
	}
	
	/** [Ajax] 부서별 게시글에 새로운 댓글 등록 후 처리 상태 응답 데이터로 전달
	 * @param cr : 사용자가 입력한 댓글 정보
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rinsert.dbo")
	public String ajaxInsertReply(CommunityReply cr, HttpSession session) {

		cr.setCrUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		
		int result = dService.insertReply(cr);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/** [Ajax] 부서별 게시글에 달린 기존 댓글 수정 후 처리 상태 응답 데이터로 전달
	 * @param cr : 사용자가 수정한 댓글 정보
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rupdate.dbo")
	public String ajaxUpdateReply(CommunityReply cr) {

		int result = dService.updateReply(cr);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/** [Ajax] 부서별 게시글에 달린 기존 댓글 삭제 후 처리 상태 응답 데이터로 전달
	 * @param cr : 사용자가 삭제 요청한 댓글 정보
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rdelete.dbo")
	public String ajaxDeleteReply(CommunityReply cr) {
		
		int result = dService.deleteReply(cr);
		
		return result > 0 ? "success" : "fail";
		
	}	
	
	/** 나의 부서글 목록 조회 후 나의 부서글 페이지 포워딩
	 * @param currentPage
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.mdbo")
	public ModelAndView myDeptBoardListView(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 나의 부서 게시글 총 개수
		int listCount = dService.selectMyDeptBoardListCount(loginUser.getUserNo());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
	
		ArrayList<DeptBoard> list = dService.selectMyDeptBoardList(pi, loginUser.getUserNo());
		
		mv.addObject("list", list)
		.addObject("pi", pi)
		.setViewName("myBoard/myDeptBoardListView");
		
		return mv;
		
	}

	/** [Ajax] 나의 부서글 목록 페이지에서 게시글 삭제 요청 처리 후 처리 상태 응답 데이터로 전달
	 * @param deleteNo : 사용자가 삭제 요청한 다수의 부서글
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delete.mdbo")
	public String ajaxDeleteMyDeptBoardList(@RequestParam(value="deleteList[]") List<Integer> deleteList, HttpSession session) {
		
		int result1 = 0; // 게시글 삭제
		int result2 = 1; // 첨부파일 삭제
		int result3 = 1; // 댓글 삭제
		
		for(int dbNo : deleteList) {
			
			result1 = dService.deleteDeptBoard(dbNo); // 게시글 삭제
			
			ArrayList<CommunityReply> rlist = new ArrayList<>();
			rlist = dService.selectReplyList(dbNo);
			
			if(!rlist.isEmpty()) { // 삭제할 게시글에 댓글 있을 경우
				
				result2 = dService.deleteCommunityReplyList(dbNo);
				
			}
			
			ArrayList<CommunityFiles> flist = new ArrayList<>();
			flist = dService.selectCommunityFileList(dbNo);
			
			if(!flist.isEmpty()) { // 삭제할 게시글에  첨부파일 있을 경우
				
				result3 = dService.deleteCommunityFileList(dbNo);
				
				for(CommunityFiles file : flist) {
					
					new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
				
				}
				
			}  
			
		}
		
		return result1 * result2 * result3 > 0 ? new Gson().toJson("success") : new Gson().toJson("success");
		
	}
	
}
