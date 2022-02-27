package com.workever.wk.alert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.alert.model.service.AlertService;
import com.workever.wk.alert.model.vo.Alert;

@Controller
public class AlertController {

	@Autowired
	private AlertService alService;
	
	@ResponseBody
	@RequestMapping(value="alertCount.al", produces="application/json; charset=utf-8")
	public String ajaxAlertCount(int loginUserNo) {
		int count = alService.alertCount(loginUserNo);
		
		return new Gson().toJson(count);
	}
	
	@ResponseBody
	@RequestMapping(value="alertSelect.al", produces="application/json; charset=utf-8")
	public String ajaxAlertSelect(int loginUserNo) {
		
		ArrayList<Alert> alertList = alService.alertSelect(loginUserNo);
		
		for(Alert al : alertList) {
			switch(al.getAlertType()) {
			case "abo" : 
				al.setAlertUrl("detail.abo?abno=" + al.getAlertBoardNo());
				al.setAlertType("익명 게시판");break;
			case "dbo" : 
				al.setAlertUrl("detail.dbo?dbno=" + al.getAlertBoardNo());
				al.setAlertType("부서 게시판");break;
			case "pbo" : 
				al.setAlertUrl("detail.pro?proNo=" + al.getAlertBoardNo());
				al.setAlertType("프로젝트 게시판");break;
			case "pnew" : 
				al.setAlertUrl("");
				al.setAlertType("프로젝트 게시판");break;
			case "apvl" : 
				al.setAlertUrl("detail.ap?apvlNo=" + al.getAlertBoardNo());
				al.setAlertType("전자 결재");break;
			}
		}
		return new Gson().toJson(alertList);
	}
	
	@ResponseBody
	@RequestMapping(value="alertCheck.al", produces="application/json; charset=utf-8")
	public String ajaxAlertCheck(int alertNo) {
		int result = alService.alertCheck(alertNo);
		System.out.println(alertNo);
		System.out.println(result);
		return new Gson().toJson(result);
	}
	
}
