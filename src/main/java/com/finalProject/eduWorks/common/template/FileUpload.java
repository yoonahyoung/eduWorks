package com.finalProject.eduWorks.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	
	// 시작하자마자 실행되게끔 static												// 저장폴더 경로
	public static String saveFile(MultipartFile upfile, HttpSession session, String folderPath ) {
		// 파일명 수정 작업 후 서버에 업로드
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자하는 폴더의 물리적인 경로 알아내기				"resources/xxxx/"
		String savePath = session.getServletContext().getRealPath(folderPath);
		
		// io패키지로 import
		try {
			upfile.transferTo(new File(savePath + changeName)); // 중요! 이게 서버에 업로드 시키는 메소드
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		 // "resources/xxxx/"
		return folderPath + changeName;
	}

}
