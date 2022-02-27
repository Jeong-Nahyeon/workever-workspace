package com.workever.wk.alert.model.service;

import java.util.ArrayList;

import com.workever.wk.alert.model.vo.Alert;

public interface AlertService {

	
	int insertAlert(Alert alert);
	
	int alertCount(int loginUserNo);
	
	ArrayList<Alert> alertSelect(int loginUserNo);
	
	int alertCheck(int alertNo);
}
