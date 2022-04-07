package spring.com.pro_A.subject.H_subject.h_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubjectHomeworkDTO;

@Repository
public class H_SubjectDAOImpl implements H_SubjectDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subject.lectName",lectNo);
	}

	@Override
	public int addHomework(Map<String, String> homeworkMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.subjecth.addHomework", homeworkMap);
	}

	@Override
	public int getLastHomeworkNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subjecth.getLastHomeworkNo");
	}

	@Override
	public void addHomeworkFile(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.subjecth.addHomeworkFile", fileDTO);
	}

	@Override
	public List<SubjectHomeworkDTO> homeworkList(String lectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.subjecth.homeworkList", lectNo);
	}

}
