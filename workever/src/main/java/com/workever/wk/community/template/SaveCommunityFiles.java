package com.workever.wk.community.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class SaveCommunityFiles {

	public static String saveFile(MultipartFile upfile, HttpSession session, String savePath) {
		
		// 파일명 수정 작업 후 서버에 업로드 과정
		
		// 파일명 수정 작업
		String originName = upfile.getOriginalFilename(); // sample.jpg (원본파일명)
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 20220212222610 (년월일시분초)
		int ranNum = (int)(Math.random() * 90000 + 10000); // 39042 (5자리 랜덤값) 
		String ext = originName.substring(originName.lastIndexOf(".")); // jpg
		
		String changeName = currentTime + ranNum + ext; // 2022021222261039042.jpg (수정파일명)
		
		// 서버에 업로드
		// 서장시킬 경로의 물리적인 경로(절대경로)
		String fileRoot = session.getServletContext().getRealPath("/" + savePath);
		
		try {
			// 업로드
			upfile.transferTo(new File(fileRoot + changeName));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}

}
