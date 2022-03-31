package spring.com.pro_A.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.member.dto.CalendarDTO;
import spring.com.pro_A.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO login(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.member.loginCheck", dto);
	}

	@Override


	public int addMember(MemberDTO member) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.member.joinMember", member);

	}

	@Override
	public MemberDTO selectId(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.member.selectId",id);
	}

	@Override
	public void modMember(MemberDTO member) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.member.modMember",member);
	}

	@Override
	public List<CalendarDTO> showSchedule() {
		// TODO Auto-generated method stub
		List<CalendarDTO> schedule = sqlSession.selectList("mapper.calendar.showSchedule"); 
		return schedule;
	}

	@Override
	public int addSchedule(CalendarDTO calendar) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.calendar.addSchedule", calendar);
	}

	@Override
	public List<NoticeDTO> noticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.board.noticeList");
	}

}
