package spring.com.pro_A.subject.H_subject.h_dao;

import java.util.List;
import java.util.Map;

import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubjectHomeworkDTO;

public interface H_SubjectDAO {

	String lectName(int lectNo);

	int addHomework(Map<String, String> homeworkMap);

	int getLastHomeworkNo();

	void addHomeworkFile(FileDTO fileDTO);

	List<SubjectHomeworkDTO> homeworkList(String lectNo);

}
