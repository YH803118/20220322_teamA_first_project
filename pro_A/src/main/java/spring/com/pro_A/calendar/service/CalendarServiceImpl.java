package spring.com.pro_A.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.calendar.dao.CalendarDAO;
import spring.com.pro_A.calendar.dto.CalendarDTO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAO calendarDAO;
	
	@Override
	public List<CalendarDTO> showSchedule() {
		// TODO Auto-generated method stub
		return calendarDAO.showSchedule();
	}

}
