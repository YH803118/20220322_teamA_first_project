package spring.com.pro_A.subject.H_subject.h_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface H_SubjectController {
	public ModelAndView subjectForm(@RequestParam(value="lectNo", required=false) String lectNo, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView homeworkAddForm(@RequestParam(value="lectNo", required=false) String lectNo, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public void homeworkAdd(MultipartHttpServletRequest multipartReq,@RequestParam(value="lectNo", required=false) String lectNo, HttpServletResponse response)
			throws Exception;
}
