package spring.com.pro_A.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.calendar.dto.CalendarDTO;
import spring.com.pro_A.calendar.service.CalendarService;

@Controller
public class CalendarControllerImpl implements CalendarController{

	@Autowired
	private CalendarService calendarService;
	
	@Override
	@RequestMapping(value="/test/calendar.do")
	public ModelAndView calendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<CalendarDTO> schedule = calendarService.showSchedule();
		mav.addObject("schedule",schedule);
		return mav;
	}
}