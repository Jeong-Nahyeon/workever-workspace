package com.workever.wk.commute.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.commute.model.service.CommuteService;
import com.workever.wk.commute.model.vo.Commute;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	
	
	@RequestMapping("commute.cm")
	public String commuteManagement() {
		return "commute/commuteManagement";
	}
	
	/* 첫번째 시도.. 
	@ResponseBody
	@RequestMapping(value="list.cm", produces="application/json; charset=UTF-8")
	public String selectCommuteList(int currentPage , int userNo, HttpServletResponse response ) {
		
		int listCount = cService.cmSelectListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Commute> list = cService.cmSelectList(userNo, pi);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("pi", pi);
		result.put("list", list);
		
		return new Gson().toJson(result);
	}
	*/
	
	/* 두번째 시도...ㅠ
	@ResponseBody
	@RequestMapping(value="list.cm")
	public String selectCommuteList(int currentPage , int userNo, HttpServletResponse response ) throws IOException {
		
		int listCount = cService.cmSelectListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Commute> list = cService.cmSelectList(userNo, pi);
		
		JSONObject jObj = new JSONObject();
		jObj.put("pi", pi);
		jObj.put("list", list);
		
		response.setContentType("application/json; charset=UTF-8");
		return jObj.toJSONString();
	}
	*/
	
	// 세번째 시도..
	@ResponseBody
	@RequestMapping(value="list.cm", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public Map<String,Object> ajaxSelectCommuteList(int currentPage , int userNo, HttpServletResponse response) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int listCount = cService.cmSelectListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Commute> list = cService.cmSelectList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		map.put("listCount", listCount);
		
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="enter.cm", method=RequestMethod.POST)
	public String ajaxInsertEnter(/*int userNo*/ Commute cm) throws ParseException {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		
		Date now = sdf.parse(sdf.format(date));
		Date safe = sdf.parse("09:00:59");
		
		int result = 0;
		if(now.after(safe)) {
			result = cService.cmInertTardiness(cm);			
		} else {
			result = cService.cmInertEnter(cm);
		}
	
		return result > 0 ? "success" : "fail";
	}
	
	
	@ResponseBody
	@RequestMapping(value="leave.cm", method=RequestMethod.POST)
	public String ajaxUpdateLeave(Commute cm) {
		
		int result = cService.cmUpdateLeave(cm);
		return result > 0 ? "success" : "fail";
		
	}
	
	
	
	
	
	@RequestMapping("commute.wh")
	public String workingHours() {
		return "commute/workingHours";
	}
	
	@RequestMapping("commute.do")
	public String dayoffList() {
		return "commute/dayoffList";
	}
	
	@RequestMapping("commute.ot")
	public String overtimeList() {
		return "commute/overtimeList";
	}
}
