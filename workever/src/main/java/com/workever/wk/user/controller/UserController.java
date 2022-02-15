package com.workever.wk.user.controller;

import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

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
		
		if(loginUser != null && bcryptPasswordEncoder.matches(u.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			//System.out.println(loginUser);
			return "user/main";
		}else {
			//System.out.println(loginUser);
			//System.out.println(u.getUserPwd());
			model.addAttribute("errorMsg", "로그인 실패");
			return "common/errorPage";
		}
	}
	
	// 로그아웃 서비스
	@RequestMapping("logout.do")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

	// 회원가입 폼 페이지 연결(관리자)
	@RequestMapping("enrollForm.ad")
	public String enrollFormAdmin() {
		return "user/enrollFormCompany";
	}
	
	// 회원가입 폼 페이지 연결(사원)
	@RequestMapping("enrollForm.us")
	public String enrollFormUser() {
		return "user/enrollFormUser";
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
	
	// 회사코드 중복체크(관리자)
	@ResponseBody
	@RequestMapping("companyCodeCheck.ad")
	public String companyCodeCheckAdmin(String companyCode) {
		int count = uService.companyCodeCheckAdmin(companyCode);
		
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	// 회사코드 확인(사원)
	@ResponseBody
	@RequestMapping("companyCodeCheck.us")
	public String companyCodeCheckUser(String companyCode) {
		int count = uService.companyCodeCheckAdmin(companyCode);
		
		return count > 0 ? "NNNNY" : "NNNNN";
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
	
	// 회원가입(관리자) 서비스
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
	
	// 회원가입(사원) 서비스
	@RequestMapping("insert.us")
	public String insertUser(User u, HttpSession session, Model model) {
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		u.setUserPwd(encPwd);
		
		HashMap<String, Object> user = new HashMap<>();
		user.put("userEmail", u.getUserEmail());
		user.put("userName", u.getUserName());
		user.put("userPwd", u.getUserPwd());
		user.put("userPhone", u.getUserPhone());
		user.put("companyCode", u.getCompanyCode());
		
		int result = uService.insertUser(user);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
			return "user/login";
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	
	// 비밀번호 발급 페이지 연결
	@RequestMapping("findPwd.do")
	public String findPwdPage() {
		return "user/findPwd";
	}
	
	// 임시비밀번호 발급용 이메일 확인
	@ResponseBody
	@RequestMapping("pwdEmailCheck.do")
	public String pwdEmailCheck(User u) {
		System.out.println(u);
		int count = uService.pwdEmailCheck(u);
		
		return count > 0 ? "NNNNY" : "NNNNN";
	}
	
	// 임시비밀번호를 생성하는 메소드
	private String getRandomPassword(int size) {
		char[] charSet = new char[] {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
									 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 
									 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
									 'a','b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
									 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
									 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&'};
		
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0;
		int len = charSet.length;
		for(int i=0; i < size; i++) {
			idx = (int) (len * Math.random());
			idx = sr.nextInt(len);
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
	
	// 임시비밀번호 메일 전송
	@RequestMapping("findPwd.us")
	public String findPwd(User u, HttpSession session, Model model) {
		String userEmail = u.getUserEmail();
		String temPwd = getRandomPassword(8);	// 비밀번호 생성
		
		// 메일내용
		String setFrom = "workever0303@gmail.com";
		String toMail = userEmail;
		String title = "Workever - 임시 비밀번호 입니다.";
		String content = "안녕하세요. Workever 입니다." + "<br>" + 
				 		 "본 메일은 Workever 임시 비밀번호 안내 메일입니다." + "<br>" +
				 		 "임시비밀번호는  <strong>" + temPwd + "</strong> 입니다." + "<br>" + 
				 		 "임시 비밀번호로 로그인 후 비밀번호를 변경해주세요";
		
		// 비밀번호 암호화
		String inputPass = temPwd;
		String encPwd = bcryptPasswordEncoder.encode(inputPass);
		u.setUserPwd(encPwd);
		
		// 임시비밀번호 DB업데이트
		int result = uService.updateTemPwd(u);
		
		if(result > 0) {
			// 메일 전송
			emailService.mailSend(setFrom, toMail, title, content);
			
			model.addAttribute("alertMvMsg", "입력하신 이메일로 임시비밀번호가 전송되었습니다.");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "임시비밀번호 발급 실패");
			return "common/errorPage";
		}
		
	}
	
	// 마이페이지 이동
	@RequestMapping("mypage.do")
	public String myPage() {
		return "mypage/mypageProfile";
	}
	
	// 마이페이지 수정페이지 이동
	@RequestMapping("updateForm.us")
	public String updateProfilePage() {
		return "mypage/updateUserProfile";
	}
	
	// 비밀번호 변경페이지 이동
	@RequestMapping("changepwd.do")
	public String changePwdPage() {
		return "mypage/changePwd";
	}
	
	// 이전 비밀번호 확인
	@ResponseBody
	@RequestMapping("checkPwd.do")
	public String checkBeforePwdCheck(User u) {
		String userPwd = u.getUserPwd();
		User checkPwd = uService.checkBeforePwdCheck(u);
		String result = "NNNNN";
		
		if(bcryptPasswordEncoder.matches(userPwd, checkPwd.getUserPwd())) {
			result = "NNNNY";
		}
		return result;
	}
	
	// 사원, 관리자 비밀번호 변경 서비스
	@RequestMapping("changepwd.us")
	public String updatePwd(User u, HttpSession session, Model model) {
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		u.setUserPwd(encPwd);
		
		int result = uService.updatePwd(u);
			
		if(result > 0) {
			session.setAttribute("loginUser", uService.loginUser(u));
			session.setAttribute("alertMsg", "비밀번호를 변경했습니다.");
			return "redirect:changepwd.do";
		}else {
			model.addAttribute("errorMsg", "회원정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 사원 프로필변경 서비스
	@RequestMapping("update.us")
	public String updateUserProfile(User u, MultipartFile upfile, HttpSession session, Model model) {
		
		// 새로운 첨부파일이 있을 경우
		//System.out.println(upfile.toString());
		if(upfile.getSize() != 0) {
			
			// 기존 첨부파일 있을 경우 (프로필이미지) 삭제
			if(u.getUserFilePath() != null) {
				new File(session.getServletContext().getRealPath(u.getUserFilePath())).delete();
			}
			
			// 새로운 첨부파일 서버 업로드
			String changeName = saveFile(upfile, session);
			
			// User 객체에 새로운 첨부파일 정보 담기
			u.setUserFilePath("resources/users_upfiles/" + changeName);
		}
		
		//System.out.println(u);
		int result = uService.updateUserProfile(u);
		
		if(result > 0) {
			session.setAttribute("loginUser", uService.loginUser(u));
			session.setAttribute("alertMsg", "프로필 정보를 수정했습니다.");
			return "mypage/mypageProfile";
		}else {
			model.addAttribute("errorMsg", "회원정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 관리자 프로필 변경 페이지 이동
	@RequestMapping("updateForm.ad")
	public String updateAdminProfilePage(HttpSession session, Model model) {
		//System.out.println(session.getAttribute("loginUser"));
		User loginUser = (User) session.getAttribute("loginUser");
		
		ArrayList<User> deptlist = uService.selectDept(loginUser);
		model.addAttribute("deptlist", deptlist);
		//System.out.println(deptlist);
		return "mypage/updateAdminProfile";
	}
	
	// 관리자 프로필 변경
	@RequestMapping("update.ad")
	public String updateAdminProfile(User u, MultipartFile adUpfile ,HttpSession session, Model model) {
		System.out.println(u);
		System.out.println(adUpfile);
		
		if(!adUpfile.getOriginalFilename().equals("")) {
			// 기존 첨부파일 있을 경우 (프로필이미지) 삭제
			if(u.getUserFilePath() != null) {
				new File(session.getServletContext().getRealPath(u.getUserFilePath())).delete();
			}
			
			// 새로운 첨부파일 서버 업로드
			String changeName = saveFile(adUpfile, session);
			
			// User 객체에 새로운 첨부파일 정보 담기
			u.setUserFilePath("resources/users_upfiles/" + changeName);
		}
		
		int result = uService.updateAdminProfile(u);
		if(result > 0) {
			session.setAttribute("loginUser", uService.loginUser(u));
			session.setAttribute("alertMsg", "프로필 정보를 수정했습니다.");
			return "mypage/mypageProfile";
		}else {
			model.addAttribute("errorMsg", "회원정보 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	// 전달된 프로필 이미지 파일을 서버의 폴더에 저장
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();	// ex)"flower.png"
		
		// 20220118103507(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리의 랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 3개를 연이어서
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/users_upfiles/");
		
		// 업로드
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 사원관리 페이지 연결
	@RequestMapping("usermanage.ad")
	public String adminUserManage() {
		return "mypage/adminUpdateUser";
	}
	
	// 사원승인 페이지 연결
	@RequestMapping("userenable.ad")
	public String adminUserEnable(String cno, HttpSession session, Model model) {
		
		ArrayList<User> disableUser = uService.selectDisableUser(cno);
		
		model.addAttribute("disableUser", disableUser);
		return "mypage/adminEnableUser";
	}
	
	
	
}
