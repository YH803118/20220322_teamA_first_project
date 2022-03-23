package spring.com.pro_A.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
