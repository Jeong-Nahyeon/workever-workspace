package com.workever.wk.noticeBoard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.template.SaveCommunityFiles;
import com.workever.wk.noticeBoard.model.service.NoticeBoardService;
import com.workever.wk.noticeBoard.model.vo.NoticeBoard;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService nService;
	
	/** 공지사항 게시글 목록 조회(최신순||오래된순 / 페이징 처리) 후 공지사항 게시글 목록 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param orderList : 사용자가 요청한 게시글 목록 정렬용 키워드 asc(오래된순)
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.nbo" )
	public ModelAndView selectNoticeBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String orderList, ModelAndView mv) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		if(orderList != null) { // 오래된순 조회
			
			ArrayList<NoticeBoard> list = nService.selectAscList(pi);
			
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("orderList", orderList)
			.setViewName("noticeBoard/noticeBoardListView");
			
			return mv;
			
		} else { // 최신순(기본) 조회
			
			ArrayList<NoticeBoard> list = nService.selectNoticeBoardList(pi);
		
			mv.addObject("list", list)
			.addObject("pi", pi)
			.setViewName("noticeBoard/noticeBoardListView");
			
			return mv;
			
		}
		
	}
	
	
	/** 공지사항 게시글 검색 목록 조회(최신순||오래된순 / 페이징 처리) 후 공지사항 게시글 목록 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 검색 목록 페이지 수
	 * @param orderList : 사용자가 요청한 검색 목록 정렬용 키워드 asc(오래된순)
	 * @param condition : 사용자가 요청한 검색 조건
	 * @param keyword : 사용자가 요청한 검색 키워드
	 * @param mv
	 * @return
	 */
	@RequestMapping("search.nbo" )
	public ModelAndView selectSearchList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String orderList, String condition, String keyword, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = nService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		if(orderList != null) { // 오래된순 조회
			
			ArrayList<NoticeBoard> list = nService.selectSearchAscList(map, pi);
			
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("orderList", orderList)
			.addObject("condition", condition)
			.addObject("keyword", keyword)
			.setViewName("noticeBoard/noticeBoardListView");
			
			return mv;
			
		} else { // 최신순(기본) 조회
			
			ArrayList<NoticeBoard> list = nService.selectSearchList(map, pi);
		
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("condition", condition)
			.addObject("keyword", keyword)
			.setViewName("noticeBoard/noticeBoardListView");
			
			return mv;
			
		}
		
	}
	
	/** 공지사항 게시글 상세 조회 후 공지사항 게시글 상세 페이지 포워딩
	 * @param nbno : 공지사항 게시글 번호
	 * @param mv
	 * @return
	 */
	@RequestMapping("detail.nbo")
	public ModelAndView selectNoticeBoard(int nbno, ModelAndView mv) {
		
		int result = nService.increaseCount(nbno); // 조회수 증가
		
		if(result > 0) { // 유효한 게시글 조회
			
			NoticeBoard nb = nService.selectNoticeBoard(nbno); // 게시글 상세 조회
			
			ArrayList<CommunityFiles> list = nService.selectCommunityFileList(nbno); // 첨부파일 조회
			
			mv.addObject("nb", nb)
			  .addObject("list", list)
			  .setViewName("noticeBoard/noticeBoardDetailView");
			
			return mv;
		
		} else { // 유효하지 않은 게시글 조회
			
			mv.addObject("errorMsg", "유효하지 않은 게시글 입니다")
			  .setViewName("common/errorPage");
			
			return mv;
			
		}
			
	}
	
	/** 공지사항 게시글 작성 페이지 포워딩
	 * @return
	 */
	@RequestMapping("enrollForm.nbo")
	public String noticeBoardEnrollForm() {
		
		return "noticeBoard/noticeBoardEnrollForm";
		
	}
	
	/** 공지사항 게시글 등록 및 첨부파일 등록 후 공지사항 게시글 목록 조회 페이지 url 재요청
	 * @param nb : 사용자가 입력한 공지사항 게시글
	 * @param upfile : 사용자가 등록한 첨부파일 
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("insert.nbo")
	public String insertNoticeBoard(NoticeBoard nb, MultipartFile[] upfile, HttpSession session, Model m) {
					
		ArrayList<CommunityFiles> list = new ArrayList<>();
		
		if(upfile != null) { // 첨부파일이 존재할 경우
			
			String savePath = "resources/community_upfiles/noticeBoard_upfiles/";
			
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
				
		int result = nService.insertNoticeBoard(nb, list);
		
		if(result > 0) { // 등록 성공
			
			session.setAttribute("successMsg", "성공적으로 등록되었습니다");
			return "redirect:list.nbo";
			
		} else { // 등록 실패
			
			if(!list.isEmpty()) { // 첨부파일 있는 경우
				
				for(CommunityFiles file : list) {
					
					new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
					// 삭제 시키고자하는 파일을 찾아서 File 객체에 담아서 삭제		
				
				}
				
			}
			
			m.addAttribute("errorMsg", "공지사항 게시글 등록 실패");
			return "common/errorPage";
			
		}
		
	}
	
	/** 공지사항 게시글 수정 페이지 포워딩
	 * @return
	 */
	@RequestMapping("updateForm.nbo")
	public ModelAndView noticeBoardUpdateForm(int nbno, ModelAndView mv) {
		
		NoticeBoard nb = nService.selectNoticeBoard(nbno);
		ArrayList<CommunityFiles> list = nService.selectCommunityFileList(nbno);
				
		mv.addObject("nb", nb)
		  .addObject("list", list)
		  .setViewName("noticeBoard/noticeBoardUpdateForm");
		
		
		return mv;
		
	}
	
	/** 공지사항 게시글 수정 및 기존 첨부파일 삭제, 새로운 첨부파일 등록 후 공지사항 게시글 목록 페이지 url 재요청
	 * @param deleteNo : 사용자가 삭제한 기존 첨부파일 번호
	 * @param nb : 사용자가 수정한 게시글
	 * @param upfile : 사용자가 등록한 새로운 첨부파일
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("update.nbo")
	public String updateNoticeBoard(String[] deleteNo, NoticeBoard nb, MultipartFile[] upfile, HttpSession session, Model m) {
						
		if(deleteNo != null) { // 삭제할 첨부파일이 있을 경우 
			
			for(String deleteFileNo : deleteNo) {
				
				int cfNo = Integer.parseInt(deleteFileNo);
				
				// 내부 저장경로에서 삭제
				CommunityFiles cf = nService.selectCommunityFile(cfNo);
				new File(session.getServletContext().getRealPath(cf.getCfPath() + cf.getCfChangeName())).delete();
								
				// DB에서 삭제
				nService.deleteCommunityFile(cfNo);
				
			}
			
		}
		
		ArrayList<CommunityFiles> list = new ArrayList<>();
		
		if(upfile != null) { // 첨부파일이 존재할 경우
			
			String savePath = "resources/community_upfiles/noticeBoard_upfiles/";
			
			for(int i=0; i<upfile.length; i++) {
				
				if(!upfile[i].getOriginalFilename().equals("")) {
					
					String changeName = SaveCommunityFiles.saveFile(upfile[i], session, savePath);
					
					CommunityFiles cf = new CommunityFiles();
					cf.setCfRefNo(nb.getNbNo());
					cf.setCfOriginName(upfile[i].getOriginalFilename());
					cf.setCfChangeName(changeName);
					cf.setCfPath(savePath);
					
					list.add(cf);
					
				}
				
			}
			
		}
		
		int result = nService.updateNoticeBoard(nb, list);
		
		if(result > 0) { // 수정 성공
			
			session.setAttribute("successMsg", "성공적으로 수정되었습니다");
			return "redirect:detail.nbo?nbno=" + nb.getNbNo();
			
		} else { // 수정 실패
			
			if(!list.isEmpty()) { // 첨부파일 있는 경우
				
				for(CommunityFiles file : list) {
					
					new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
				
				}
				
			}
			
			m.addAttribute("errorMsg", "공지사항 게시글 수정 실패");
			return "common/errorPage";
			
		}
		
	}
	
	/** 공지사항 게시글 삭제 및 첨부파일 삭제 후 공지사항 게시글 목록 페이지 url 재요청
	 * @param nbno : 사용자가 삭제한 게시글 번호
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("delete.nbo")
	public String deleteNoticeBoard(int nbno, HttpSession session, Model m) {
		
		int result1 = nService.deleteNoticeBoard(nbno);
		
		ArrayList<CommunityFiles> list = new ArrayList<>();
		list = nService.selectCommunityFileList(nbno);
		
		int result2 = 1;
		if(!list.isEmpty()) { // 첨부파일 있을 경우
			
			result2 = nService.deleteCommunityFileList(nbno);
			
			for(CommunityFiles file : list) {
				
				new File(session.getServletContext().getRealPath(file.getCfPath() + file.getCfChangeName())).delete();
			
			}
			
		} 
		
		if(result1 * result2 > 0) { // 삭제 성공
			
			session.setAttribute("successMsg", "성공적으로 삭제되었습니다");
			return "redirect:list.nbo";
			
		} else { // 삭제 실패
			
			m.addAttribute("errorMsg", "공지사항 게시글 삭제 실패");
			return "common/errorPage";
			
		}
		
	}
	
}
