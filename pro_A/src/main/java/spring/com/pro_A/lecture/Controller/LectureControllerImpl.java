package spring.com.pro_A.lecture.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.lecture.Service.LectureService;
import spring.com.pro_A.lecture.dto.LectureDTO;

@Controller
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
		mav.setViewName("redirect:/test/loginForm.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/test/applyForm.do")
	public ModelAndView applyForm(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<LectureDTO> lectList=lectureService.selectList();
		mav.addObject("lectList",lectList);
		
		return mav;
	}

	@Override
	public ModelAndView apply(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();
		String id= request.getParameter("id");
		String[] lectInfo=request.getParameterValues("lect");
		List<ApplyDTO> li=new ArrayList<ApplyDTO>();
		for(int i=0; i<lectInfo.length; i++)
		{
			ApplyDTO dto= new ApplyDTO();
			dto.setId(id);
			dto.setLectInfo(lectInfo[i]);
			li.add(dto);
		}
		
		return mav;
	}
	
	

	
}
