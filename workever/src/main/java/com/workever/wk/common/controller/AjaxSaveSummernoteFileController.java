package com.workever.wk.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
public class AjaxSaveSummernoteFileController {
	
	/** [공지사항 게시판] 섬머노트 기능으로 등록된 이미지 저장 후 내용 영역으로 해당 이미지의 저장된 경로 바로 응답 데이터 전달
	 * @param multipartFile : 섬머노트 기능으로 내용 영역에 등록된 이미지
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="uploadSummernoteImageFile.bo", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		String savePath = "resources/community_upfiles/summernote_upfiles/";
		
		return saveFile(multipartFile, request, savePath);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	/** 섬머노트 기능으로 등록된 이미지 내부 경로에 저장시킨 후 해당 이미지 url 반환
	 * @param multipartFile : 섬머노트 기능으로 내용 영역에 등록된 이미지
	 * @param request
	 * @param filePath : 저장할 내부 경로
	 * @return
	 */
	public String saveFile(MultipartFile multipartFile, HttpServletRequest request, String savePath) {
		
		JsonObject jsonObject = new JsonObject();

		// 내부경로 저장
		String contextRoot = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = contextRoot + savePath;
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //파일 확장자
		String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
			jsonObject.addProperty("url", savePath + savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		String a = jsonObject.toString();
		
		return a;
		
	}
	
}
