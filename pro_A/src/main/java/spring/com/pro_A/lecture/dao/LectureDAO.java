package spring.com.pro_A.lecture.dao;

import java.util.List;

import spring.com.pro_A.lecture.dto.LectureDTO;

public interface LectureDAO {

	public int open(LectureDTO dto);

	public List<LectureDTO> selectList();

}
