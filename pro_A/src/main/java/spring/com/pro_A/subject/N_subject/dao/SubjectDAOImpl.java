package spring.com.pro_A.subject.N_subject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubjectDAOImpl implements SubjectDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subject.lectName",lectNo);
	}

}
