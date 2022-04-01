package spring.com.pro_A.lecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.lecture.dto.LectureDTO;

@Repository
public class LectureDAOImpl implements LectureDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int open(LectureDTO dto) {
		int result=sqlSession.insert("mapper.lecture.openLecture", dto);
		return result;
	}

	@Override
	public List<LectureDTO> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.lecture.selectList");
	}

	@Override
	public void apply(List<ApplyDTO> li) {
		// TODO Auto-generated method stub
		
		for(ApplyDTO dto : li) {
			sqlSession.insert("mapper.lecture.applyLect",dto);
		}
	}

}
