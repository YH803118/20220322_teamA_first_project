package spring.com.pro_A.member.service;

import spring.com.pro_A.member.dto.MemberDTO;

public interface MemberService {

	MemberDTO login(MemberDTO dto);

	int addMember(MemberDTO member);

	MemberDTO selectId(String id);

	void modMember(MemberDTO member);

}
