package com.workever.wk.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.workever.wk.user.model.vo.User;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		// 로그인 유무에 따라 controller 실행 여부 결정
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			return true;
		}else {
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}

}
