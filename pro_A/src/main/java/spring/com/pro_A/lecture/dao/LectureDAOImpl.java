package spring.com.pro_A.lecture.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import spring.com.pro_A.lecture.dto.LectureDTO;

public class LectureDAOImpl implements LectureDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int open(LectureDTO dto) {
		int result=sqlSession.insert("mapper.lecture.openLecture");
		return result;
	}

}
