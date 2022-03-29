package spring.com.pro_A.lecture.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
