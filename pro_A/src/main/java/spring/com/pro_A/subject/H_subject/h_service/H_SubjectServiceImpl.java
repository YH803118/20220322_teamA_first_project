package spring.com.pro_A.subject.H_subject.h_service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.lecture.dto.LectureDTO;
import spring.com.pro_A.member.dto.MemberDTO;
import spring.com.pro_A.subject.H_subject.h_dao.H_SubjectDAO;
import spring.com.pro_A.subject.H_subject.h_dto.H_FileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubjectHomeworkDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitFileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitInfo;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitList;

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
	public List<SubjectHomeworkDTO> homeworkList(String lectNo) {
		// TODO Auto-generated method stub
		return subjectDAO.homeworkList(lectNo);
	}

	@Override
	public H_FileDTO getFileInfo(String homeworkFileName) {
		// TODO Auto-generated method stub
		return subjectDAO.getFileInfo(homeworkFileName);
	}

	@Override
	public void addHomeworkFile(H_FileDTO fileDTO) {
		// TODO Auto-generated method stub
		subjectDAO.addHomeworkFile(fileDTO);
	}

	@Override
	public SubjectHomeworkDTO homeworkDetailView(int homeworkNo) {
		// TODO Auto-generated method stub
		return subjectDAO.homeworkDetailView(homeworkNo);
	}

	@Override
	public List<H_FileDTO> homeworkFiles(int homeworkNo) {
		// TODO Auto-generated method stub
		return subjectDAO.homeworkFiles(homeworkNo);
	}

	@Override
	public LectureDTO lectInfo(int homeworkNo) {
		// TODO Auto-generated method stub
		return subjectDAO.lectInfo(homeworkNo);
	}

	@Override
	public List<ApplyDTO> studentList(String lectSpl) {
		// TODO Auto-generated method stub
		return subjectDAO.studentList(lectSpl);
	}

	@Override
	public List<MemberDTO> nameList(List<ApplyDTO> studentList) {
		// TODO Auto-generated method stub
		return subjectDAO.nameList(studentList);
	}

	@Override
	public int homeworkSubmit(Map<String, String> homeworkMap) {
		// TODO Auto-generated method stub
		return subjectDAO.homeworkSubmit(homeworkMap);
	}

	@Override
	public void addSubmitFile(SubmitFileDTO fileDTO) {
		// TODO Auto-generated method stub
		subjectDAO.addSubmitFile(fileDTO);
	}

//	@Override
//	public void listUp(SubmitList submit) {
//		// TODO Auto-generated method stub
//		subjectDAO.listUp(submit);
//	}

	@Override
	public List<SubmitInfo> submitList(int homeworkNo) {
		// TODO Auto-generated method stub
		return subjectDAO.submitList(homeworkNo);
	}

	@Override
	public List<SubmitFileDTO> submitFiles(int homeworkNo) {
		// TODO Auto-generated method stub
		return subjectDAO.submitFiles(homeworkNo);
	}
	
}
