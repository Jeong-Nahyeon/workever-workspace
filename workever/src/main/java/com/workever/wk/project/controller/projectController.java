package com.workever.wk.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import jdk.nashorn.internal.ir.RuntimeNode.Request;

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
	
	//프로젝트생성란에 있는 부서별 회원 목록 조회
	@ResponseBody
	@RequestMapping(value="ajax1.do", produces="application/json; charset=UTF-8")
	public String searchMem(HttpServletRequest request, HttpServletResponse response) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		ArrayList<Project> list = pService.selectMem(num);
		return new Gson().toJson(list);
	}
	
	
	@RequestMapping("insert.pro")
	public String insertProject(HttpSession session, Model model, Project p) {
		
		int result = pService.insertProject(p);
		int result1 = pService.insertMember(p);
		int result2 = pService.insertDept(p);
		
		if(result > 0 && result1 > 0 && result2 > 0) { 
			session.setAttribute("alertMsg", "프로젝트가 성공적으로 생성되었습니다.");
			return "redirect:list.pro";
			
		}else { //실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg","프로젝트가 등록 실패!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.pro")
	public String deleteProject(int proNo, HttpSession session,Model model) {
		
		int result = pService.deleteProject(proNo);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "프로젝트가 삭제되었습니다.");
			return "redirect:list.pro";
			
		}else { 
			model.addAttribute("errorMsg","게시글 삭제실패");
			return "common/errorPage";
		}
		
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
