package spring.com.pro_A.subject.N_subject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.subject.N_subject.service.SubjectService;

@Controller
public class SubjectControllerImpl implements SubjectController{

	@Autowired
	private SubjectService subjectService;
	
	@Override
	@RequestMapping(value="/test/subjectForm.do")
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
