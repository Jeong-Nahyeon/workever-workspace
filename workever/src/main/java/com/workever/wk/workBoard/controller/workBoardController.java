package com.workever.wk.workBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.workever.wk.project.model.service.ProjectService;
import com.workever.wk.workBoard.model.service.workBoardService;
import com.workever.wk.workBoard.model.vo.workBoard;


@Controller
public class workBoardController {
	
	@Autowired
	private workBoardService wbService;
	
	@RequestMapping("insert.work")
	public int insertBoard(workBoard wb, MultipartFile upfile, HttpSession session, Model model) {
		System.out.println(wb);
		
		return 0;
		
	}
	

	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		//파일명 수정작업 후 서버에 업로드시키기("flower.png"=> "년월일시분초+랜덤숫자5개"
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
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
