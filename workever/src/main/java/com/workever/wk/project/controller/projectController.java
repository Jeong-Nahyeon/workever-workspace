package com.workever.wk.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.workever.wk.project.model.service.ProjectService;
import com.workever.wk.project.model.vo.Project;
import com.workever.wk.user.model.vo.User;

@Controller
public class projectController {
	
	
	@Autowired
	private ProjectService pService;
	
	@RequestMapping("list.pro")
	public ModelAndView projectList(ModelAndView mv) {
		
		ArrayList<Project> list = pService.selectList();
		
		mv.addObject("list", list)
		  .setViewName("project/projectListView");
		return mv;
		
	}
	
	
	@RequestMapping("enroll.pro")
	public String enrollProject() {
		return "project/projectEnrollForm";
		
	}
	
	@RequestMapping("insert.pro")
	public String insertProject(HttpSession session, Model model, Project p) {
		
		int result = pService.insertProject(p);
		
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "프로젝트가 성공적으로 생성되었습니다.");
			return "redirect:list.pro";
			
		}else { //실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg","프로젝트가 등록 실패!");
			return "common/errorPage";
		}
	}
	
	//프로젝트생성란에 있는 부서별 회원 목록 조회
	@ResponseBody
	@RequestMapping(value="ajax1.do", produces="application/json; charset=UTF-8")
	public String searchMem(int num) {
		
		ArrayList<Project> list = pService.selectMem(num);
		System.out.println(num);
		return new Gson().toJson(list);
	}
	
	
	
	
	@RequestMapping("detail.pro")
	public String detailProject() {
		return "project/projectDetailView";
		
	}
	
	//업무조회 리스트이동 
	@RequestMapping("list.work")
	public String workList() {
		return "project/workListView";
		
	}
}
