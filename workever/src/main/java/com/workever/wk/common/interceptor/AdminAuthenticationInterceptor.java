package com.workever.wk.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.workever.wk.user.model.vo.User;

public class AdminAuthenticationInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		String adminCheck = loginUser.getUserAuth();
		if(adminCheck.equals("A")) {
			return true;
		}else {
			session.setAttribute("errorMsg", "관리자만 접근 가능합니다.");
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/error.do");
			
			return false;
		}
		
	}
}
