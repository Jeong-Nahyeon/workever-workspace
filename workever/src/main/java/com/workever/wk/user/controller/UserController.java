package com.workever.wk.user.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.workever.wk.user.model.service.EmailService;
import com.workever.wk.user.model.service.UserService;
import com.workever.wk.user.model.vo.Company;
import com.workever.wk.user.model.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;

	// 메일관련
	@Autowired
	EmailService emailService;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// 암호화
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 로그인 서비스
	@RequestMapping("login.us")
	public String loginUser(User u, HttpSession session, Model model) {
		User loginUser = uService.loginUser(u);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "user/main";
		}else {
			model.addAttribute("errorMsg", "로그인 실패");
			return "common/errorPage";
		}
	}

	// 회원가입 폼 페이지 연결
	@RequestMapping("enrollForm.ad")
	public String enrollFormAdmin() {
		return "user/enrollFormCompany";
	}
	
	// 로그인 페이지 연결
	@RequestMapping("login.do")
	public String loginPage() {
		return "user/login";
	}
	
	// 이메일 중복체크
	@ResponseBody
	@RequestMapping("emailDoubleCheck.do")
	public String emailDoubleCheckA(String checkEmail) {
		int count = uService.emailDoubleCheck(checkEmail);
		
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	// 회사코드 중복체크
	@ResponseBody
	@RequestMapping("companyCodeCheck.ad")
	public String companyCodeCheckAdmin(String companyCode) {
		int count = uService.companyCodeCheckAdmin(companyCode);
		
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	// 이메일 인증 메일 보내기
	@ResponseBody
	@RequestMapping("sendEmail.do")
	public String sendMail(String email) {
		// 화면단에서 전달되는 데이터 확인
		logger.info("이메일 : " + email);
		
		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 : " + checkNum);
		
		// 이메일 전송
		String setFrom = "workever0303@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "안녕하세요. Workever 입니다." + "<br>" + 
						 "본 메일은 Workever 가입 시 본인 확인을 위해 발송되는 메일입니다." + "<br>" +
						 "인증번호는 " + checkNum + "입니다." + "<br>" + 
						 "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		emailService.mailSend(setFrom, toMail, title, content);
		
		String num = Integer.toString(checkNum);
		return num;
	}
	
	@RequestMapping("insert.ad")
	public String insertCompany(User u, Company c, HttpSession session, Model model) {
		System.out.println(u);
		System.out.println(c);
		
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		u.setUserPwd(encPwd);
		
		// u, c hashMap에 담기
		HashMap<String, Object> admin = new HashMap<>();
		//admin.put("user", u);
		//admin.put("company", c);
		admin.put("comName", c.getComName());
		admin.put("userPhone", u.getUserPhone());
		admin.put("comClass", c.getComClass());
		admin.put("comEncode", c.getComEncode());
		admin.put("userEmail", u.getUserEmail());
		admin.put("comName", c.getComName());
		admin.put("userPwd", u.getUserPwd());
		
		int result = uService.insertCompany(admin);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
			return "user/login";
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
}
