package com.finalProject.eduWorks.approval.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.approval.model.service.ApprovalService;
import com.finalProject.eduWorks.approval.model.vo.Leave;
import com.finalProject.eduWorks.common.template.FileUpload;

@Controller
public class ApprovalController {
 
	  @Autowired public ApprovalService aService;
	 
	/*
	 * @RequestMapping("tree.ap") public ModelAndView tree(ModelAndView mv) {
	 * mv.setViewName("approval/tree"); return mv; }
	 */

	@RequestMapping("enrollFormLeave.ap")
	public String alEnrollForm() {
		return "approval/leaveEnrollForm";
	}

	@RequestMapping("insertLeave.ap")
	public String insertLeave(Leave l, MultipartFile upfile, HttpSession session, Model model) {

		if (!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/approvalFiles/");
//			l.setOriginName(upfile.getOriginalFilename());
			l.getApprovalForm().setOriginName(upfile.getOriginalFilename());
//			l.setChangeName(saveFilePath);
			l.getApprovalForm().setChangeName(saveFilePath);
		} // 전달된 파일있을경우 끝

		// Leave객체에 전달하기
		int result = aService.insertLeave(l);

		if (result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:%%%%%%%%%%%%%%메인페이지%%%%%%%%%%%";

		} else {// 실패
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";

		}
	}

	@RequestMapping("deleteLeave.ap")
	public String deleteLeave(int no, String filePath, Model model, HttpSession session) {

		int result = aService.deleteLeave(no);
		if (result > 0) {

			if (!filePath.equals("")) { // db삭제 (status N으로 변경 성공)
				new File(session.getServletContext().getRealPath(filePath)).delete();
			} // 리스트페이지 재요청
			session.setAttribute("alertTitle", "문서 삭제 완료");
			session.setAttribute("alertMsg", "문서가 성공적으로 삭제되었습니다.");

			return "redirect:%%%%%%%%%";
		} else {
			session.setAttribute("alertTitle", "문서 삭제 실패");
			session.setAttribute("alertMsg", "문서 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping("insertDraft.ap")
	public ModelAndView insertDraft(ModelAndView mv) {
		mv.setViewName("approval/draftEnrollForm");
		return mv;
	}

	@RequestMapping("insertExpenditure.ap")
	public ModelAndView insertExpenditure(ModelAndView mv) {
		mv.setViewName("approval/expenditureEnrollForm");
		return mv;
	}

	@RequestMapping("mainPage.ap")
	public ModelAndView mainPage(ModelAndView mv) {
		mv.setViewName("approval/aprvMainPage");
		return mv;
	}

}
