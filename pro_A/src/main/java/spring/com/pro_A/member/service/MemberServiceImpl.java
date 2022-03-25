package spring.com.pro_A.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

}
