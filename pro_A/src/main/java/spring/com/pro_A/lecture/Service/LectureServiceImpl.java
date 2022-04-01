package spring.com.pro_A.lecture.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.lecture.dao.LectureDAO;
import spring.com.pro_A.lecture.dto.LectureDTO;

@Service
public class LectureServiceImpl implements LectureService{

	@Autowired
	LectureDAO dao;
	@Override
	public int open(LectureDTO dto) {
		// TODO Auto-generated method stub
		return dao.open(dto);
	}
	@Override
	public List<LectureDTO> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}
	@Override
	public void apply(List<ApplyDTO> li) {
		// TODO Auto-generated method stub
		dao.apply(li);
	}
	
}
