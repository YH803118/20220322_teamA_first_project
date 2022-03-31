package spring.com.pro_A.member.service;

import java.util.List;

import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.member.dto.CalendarDTO;
import spring.com.pro_A.member.dto.MemberDTO;

public interface MemberService {

	MemberDTO login(MemberDTO dto);

	int addMember(MemberDTO member);

	MemberDTO selectId(String id);

	void modMember(MemberDTO member);

	List<CalendarDTO> showSchedule();

	int addSchedule(CalendarDTO calendar);

	List<NoticeDTO> noticeList();

}
