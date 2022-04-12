package spring.com.pro_A.subject.H_subject.h_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.subject.H_subject.h_service.H_SubjectService;

@Controller
public class H_SubjectControllerImpl implements H_SubjectController{

	@Autowired
	private H_SubjectService subjectService;
	
	@Override
	@RequestMapping(value="/test/subjectHomework.do")
	public ModelAndView subjectForm(@RequestParam(value="subjectNo", required=false) String lectNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		String lectName = subjectService.lectName(Integer.parseInt(lectNo));
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("lectName",lectName);
		mav.addObject("lectNo",lectNo);
		return mav;
	}

}