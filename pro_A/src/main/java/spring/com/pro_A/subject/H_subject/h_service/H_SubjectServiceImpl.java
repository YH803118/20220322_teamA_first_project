package spring.com.pro_A.subject.H_subject.h_service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.subject.H_subject.h_dao.H_SubjectDAO;
import spring.com.pro_A.subject.H_subject.h_dto.SubjectHomeworkDTO;

@Service
public class H_SubjectServiceImpl implements H_SubjectService{

	@Autowired
	private H_SubjectDAO subjectDAO;

	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return subjectDAO.lectName(lectNo);
	}

	@Override
	public int addHomework(Map<String, String> homeworkMap) {
		// TODO Auto-generated method stub
		return subjectDAO.addHomework(homeworkMap);
	}

	@Override
	public int getLastHomeworkNo() {
		// TODO Auto-generated method stub
		return subjectDAO.getLastHomeworkNo();
	}

	@Override
	public void addHomeworkFile(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		subjectDAO.addHomeworkFile(fileDTO);
	}

	@Override
	public List<SubjectHomeworkDTO> homeworkList(String lectNo) {
		// TODO Auto-generated method stub
		return subjectDAO.homeworkList(lectNo);
	}
	
}
