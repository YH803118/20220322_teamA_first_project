package spring.com.pro_A.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spring.com.pro_A.member.dto.CalendarDTO;
import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.board.community.dto.CommDTO;
import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.lecture.dto.LectureDTO;
import spring.com.pro_A.member.dao.MemberDAO;
import spring.com.pro_A.member.dto.MemberDTO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public MemberDTO login(MemberDTO dto) {
		// TODO Auto-generated method stub
		return memberDAO.login(dto);
	}

	@Override
	public int addMember(MemberDTO member) {
		// TODO Auto-generated method stub


		return memberDAO.addMember(member);

	}

	@Override
	public MemberDTO selectId(String id) {
		// TODO Auto-generated method stub
		return memberDAO.selectId(id);
	}

	@Override
	public void modMember(MemberDTO member) {
		// TODO Auto-generated method stub
		memberDAO.modMember(member);
	}

	@Override
	public List<CalendarDTO> showSchedule() {
		// TODO Auto-generated method stub
		return memberDAO.showSchedule();
	}

	@Override
	public int addSchedule(CalendarDTO calendar) {
		// TODO Auto-generated method stub
		return memberDAO.addSchedule(calendar);
	}

	@Override
	public List<NoticeDTO> noticeList() {
		// TODO Auto-generated method stub
		return memberDAO.noticeList();
	}

	@Override
	public List<CommDTO> commuList() {
		// TODO Auto-generated method stub
		return memberDAO.commuList();
	}

	@Override
	public List<ApplyDTO> subjectList(String id) {
		// TODO Auto-generated method stub
		return memberDAO.subjectList(id);
	}

	@Override
	public List<LectureDTO> professorSubject(String name) {
		// TODO Auto-generated method stub
		return memberDAO.professorSubject(name);
	}

}
