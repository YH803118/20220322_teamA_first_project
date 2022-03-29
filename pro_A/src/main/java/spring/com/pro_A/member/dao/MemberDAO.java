package spring.com.pro_A.member.dao;

import java.util.List;

import spring.com.pro_A.member.dto.CalendarDTO;
import spring.com.pro_A.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(MemberDTO dto);


	int addMember(MemberDTO member);


	public MemberDTO selectId(String id);


	public void modMember(MemberDTO member);


	List<CalendarDTO> showSchedule();


}
