package com.workever.wk.workBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.workever.wk.project.model.service.ProjectService;
import com.workever.wk.workBoard.model.service.workBoardService;
import com.workever.wk.workBoard.model.vo.Reply;
import com.workever.wk.workBoard.model.vo.workBoard;


@Controller
public class workBoardController {
	
	@Autowired
	private workBoardService wbService;
	@Autowired
	private ProjectService pService;
	
	@RequestMapping("insert.work")
	public String insertBoard(workBoard wb, MultipartFile upfile, HttpSession session, Model model) {

			
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			wb.setAtOriginName(upfile.getOriginalFilename());
			wb.setAtChangeName("resources/workBoard_upfiles/" + changeName);
		}
		
		//System.out.println(wb);
		//System.out.println(upfile);
		
		int result = wbService.insertBoard(wb);
		int result2 = wbService.insertAttachment(wb);
		
		if(result > 0 && result2 > 0) { 
			session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
			return "redirect:detail.pro?proNo="+wb.getProNo();
			
		}else { //실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg","게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	//전체 업무 조회
	@RequestMapping("work.all")
	public ModelAndView allWork(int proNo, ModelAndView mv) {
		
		System.out.println(proNo);
		ArrayList<workBoard> list = pService.selectProject(proNo);
		
		mv.addObject("list", list)
		  .setViewName("project/allWorkList");
		
		return mv;
	}
	
	// 내 업무 조회
	@RequestMapping("work.my")
	public ModelAndView myWork(int proNo, String workManager, ModelAndView mv) {
		System.out.println(proNo);
		System.out.println(workManager);
		
		ArrayList<workBoard> list = wbService.myWork(proNo, workManager);
		
		System.out.println(list);
		mv.addObject("list", list)
		  .setViewName("project/myWorkList");
		
		return mv;
	}


	
	
	
	
	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		
		System.out.println(bno);
		ArrayList<Reply> list = wbService.selectReplyList(bno);
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		System.out.println(r);
		
		int result = wbService.insertReply(r);
		return result>0 ? "success" : "fail";

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		//파일명 수정작업 후 서버에 업로드시키기("flower.png"=> "년월일시분초+랜덤숫자5개"
		String originName = upfile.getOriginalFilename(); 
		
		//"년월일시분초+랜덤숫자5개"
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum= (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));//.앞까지 다 삭제?하는 과정같음(.PNG)
		
		String changeName = currentTime + ranNum + ext;
		
		//업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/workBoard_upfiles/");
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	
	
	
}
