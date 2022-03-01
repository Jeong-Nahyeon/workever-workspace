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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.commute.model.service.CommuteService;
import com.workever.wk.commute.model.vo.Commute;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	
	
	// 출퇴근 관리
	
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
		
		map.put("listCount", listCount);
		map.put("pi", pi);
		map.put("list", list);
		
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
	
	@ResponseBody
	@RequestMapping(value="search.cm", produces="application/json; charset=utf-8")
	public String ajaxSelectSearch(@RequestParam(value="currentPage", defaultValue="1")int currentPage, int userNo, String startday, String endday, int cmStatus) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("startday", startday);
		map.put("endday", endday);
		map.put("cmStatus", cmStatus);
		
		int searchCount = cService.cmSelectSearchCount(map);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		
		ArrayList<Commute> searchList = cService.cmSelectSearchList(map, pi);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("searchCount", searchCount);
		result.put("searchList", searchList);
		result.put("pi", pi);
		
		return new Gson().toJson(result); // {searchCount:8, searchList:[{}, {}], pi:{}}
	}
	
	
	// 근무내역
	
	@RequestMapping("commute.wh")
	public String workingHours() {
		return "commute/workingHours";
	}
	
	@ResponseBody
	@RequestMapping(value="list.wh", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxSelectWorkingHoursList(int userNo, int currentPage) {
		
		int listCount = cService.whSelectListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Commute> list = cService.whSelectList(userNo, pi);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("listCount", listCount);
		result.put("list", list);
		result.put("pi", pi);
		
		return new Gson().toJson(result);
		
	}
	
	@ResponseBody
	@RequestMapping(value="search.wh", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxSelectWorkingHoursSearch(int userNo, String startday, String endday, int currentPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("startday", startday);
		map.put("endday", endday);
		
		int searchCount = cService.whSelectSearchCount(map);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		
		ArrayList<Commute> searchList = cService.whSelectSearchList(map, pi);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("searchCount", searchCount);
		result.put("searchList", searchList);
		result.put("pi", pi);
		
		return new Gson().toJson(result);
	}
	
	
	// 휴가 관리
	
	@RequestMapping("commute.do")
	public String dayoffList() {
		return "commute/dayoffList";
	}
	
	@ResponseBody
	@RequestMapping(value="list.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxSelectDayoffList(int userNo, int currentPage) {
		
		int listCount = cService.doSelectListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Approval> list = cService.doSelectList(userNo, pi);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listCount", listCount);
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="reason.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public Approval ajaxDayoffReasonModal(int apvlNo) {
		
		Approval offReason = cService.doSelectReason(apvlNo);
		
		return offReason;
	}
	
	@ResponseBody
	@RequestMapping(value="return.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public Approval ajaxDayoffReturnModal(int apvlNo) {
		
		Approval offReturn = cService.doSelectReturn(apvlNo);
		
		return offReturn;
	}
	
	@ResponseBody
	@RequestMapping(value="search.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxSelectDayoffSearch(int userNo, String startday, String endday, int offdayKind, String keyword, int currentPage) {
		
		System.out.println("userNo : " + userNo);
		System.out.println("startday : " + startday);
		System.out.println("endday :" + endday);
		System.out.println("offdayKind : " + offdayKind);
		System.out.println("keyword : " + keyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("startday", startday);
		map.put("endday", endday);
		map.put("offdayKind", offdayKind);
		map.put("keyword", keyword);
		
		int searchCount = cService.doSelectSearchCount(map);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		
		System.out.println("Count : " + searchCount);
		
		ArrayList<Approval> searchList = cService.doSelectSearchList(map, pi);
		
		System.out.println("searchList : " + searchList);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("searchCount", searchCount);
		result.put("searchList", searchList);
		result.put("pi", pi);
		
		return new Gson().toJson(result);
	}
	
	
	// 연장근무 관리
	
	@RequestMapping("commute.ot")
	public String overtimeList() {
		return "commute/overtimeList";
	}
	
	@ResponseBody
	@RequestMapping(value="list.ot", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxSelectOvertimeList(int userNo, int currentPage) {
		
		int listcount = cService.otSelectListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listcount, currentPage, 5, 10);
		
		ArrayList<Approval> list = cService.otSelectList(userNo, pi);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listCount", listcount);
		map.put("list", list);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="reason.ot", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public Approval ajaxOvertimeReasonModal(int apvlNo) {
		
		Approval otReason = cService.otSelectReason(apvlNo);
		
		return otReason;
	}
	
	@ResponseBody
	@RequestMapping(value="return.ot", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public Approval ajaxOvertimeReturnModal(int apvlNo) {
		
		Approval otReturn = cService.otSelectReturn(apvlNo);
		
		return otReturn;
	}
	
	
}
