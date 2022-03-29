package spring.com.pro_A.lecture.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.lecture.Service.LectureService;
import spring.com.pro_A.lecture.dto.LectureDTO;

public class LectureControllerImpl implements LectureController{
	
	@Autowired
	LectureDTO lectureDTO;
	
	@Autowired
	LectureService lectureService;

	@Override
	@RequestMapping(value="/test/open.do")
	public ModelAndView open(@ModelAttribute("lecture")LectureDTO dto, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ModelAndView mav=new ModelAndView();
		int result=lectureService.open(dto);
		
		return mav;
	}

	
}
