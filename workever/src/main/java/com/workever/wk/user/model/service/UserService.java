package com.workever.wk.user.model.service;

import com.workever.wk.user.model.vo.User;

public interface UserService {
	
	User loginUser(User u);
	
	int emailDoubleCheck(String checkEmail);
	
	// 회사코드 중복체크
	int companyCodeCheckAdmin(String companyCode);

}
