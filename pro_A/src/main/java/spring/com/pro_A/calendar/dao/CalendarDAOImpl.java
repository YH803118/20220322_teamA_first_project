package spring.com.pro_A.calendar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.com.pro_A.calendar.dto.CalendarDTO;

@Repository
public class CalendarDAOImpl implements CalendarDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CalendarDTO> showSchedule() {
		// TODO Auto-generated method stub
		List<CalendarDTO> schedule = sqlSession.selectList("mapper.calendar.showSchedule"); 
		return schedule;
	}

	
}
