package com.workever.wk.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.workever.wk.user.model.vo.User;

public class LoginAfterInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			request.setAttribute("loginMsg", "로그인 실패");
			modelAndView.setViewName("user/login");
			//modelAndView.setViewName("common/errorPage");
		}else {
			if(loginUser.getUserStatus().equals("대기")) {
				modelAndView.setViewName("user/loginFail");
			}else {
				modelAndView.setViewName("user/main");
			}
		}
		
	}
}
