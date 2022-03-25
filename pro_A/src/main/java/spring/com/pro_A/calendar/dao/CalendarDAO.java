package spring.com.pro_A.calendar.dao;

import java.util.List;

import spring.com.pro_A.calendar.dto.CalendarDTO;

public interface CalendarDAO {

	public List<CalendarDTO> showSchedule();

}
