package spring.com.pro_A.subject.H_subject.h_dao;

import java.util.List;
import java.util.Map;

import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.lecture.dto.LectureDTO;
import spring.com.pro_A.member.dto.MemberDTO;
import spring.com.pro_A.subject.H_subject.h_dto.H_FileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubjectHomeworkDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitFileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitInfo;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitList;

public interface H_SubjectDAO {

	String lectName(int lectNo);

	int addHomework(Map<String, String> homeworkMap);

	int getLastHomeworkNo();

	List<SubjectHomeworkDTO> homeworkList(String lectNo);

	H_FileDTO getFileInfo(String homeworkFileName);

	void addHomeworkFile(H_FileDTO fileDTO);

	SubjectHomeworkDTO homeworkDetailView(int homeworkNo);

	List<H_FileDTO> homeworkFiles(int homeworkNo);

	LectureDTO lectInfo(int homeworkNo);

	List<ApplyDTO> studentList(String lectSpl);

	List<MemberDTO> nameList(List<ApplyDTO> studentList);

	int homeworkSubmit(Map<String, String> homeworkMap);

	void addSubmitFile(SubmitFileDTO fileDTO);

//	void listUp(SubmitList submit);

	List<SubmitInfo> submitList(int homeworkNo);

	List<SubmitFileDTO> submitFiles(int homeworkNo);

}
