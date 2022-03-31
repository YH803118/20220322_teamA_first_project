package spring.com.pro_A.lecture.Service;

import java.util.List;

import spring.com.pro_A.lecture.dto.LectureDTO;

public interface LectureService {

	public int open(LectureDTO dto);

	public List<LectureDTO> selectList();

}
