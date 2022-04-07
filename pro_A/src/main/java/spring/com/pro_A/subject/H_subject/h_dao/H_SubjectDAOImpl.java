package spring.com.pro_A.subject.H_subject.h_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class H_SubjectDAOImpl implements H_SubjectDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subject.lectName",lectNo);
	}

}
