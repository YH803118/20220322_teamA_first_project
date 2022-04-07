package spring.com.pro_A.member.dao;

import java.util.List;

import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.board.community.dto.CommDTO;
import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.lecture.dto.LectureDTO;
import spring.com.pro_A.member.dto.CalendarDTO;
import spring.com.pro_A.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(MemberDTO dto);


	int addMember(MemberDTO member);


	public MemberDTO selectId(String id);


	public void modMember(MemberDTO member);


	List<CalendarDTO> showSchedule();


	int addSchedule(CalendarDTO calendar);


	List<NoticeDTO> noticeList();


	List<CommDTO> commuList();


	List<ApplyDTO> subjectList(String id);


	List<LectureDTO> professorSubject(String name);


}
