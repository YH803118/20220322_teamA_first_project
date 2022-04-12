package spring.com.pro_A.subject.H_subject.h_dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.lecture.dto.LectureDTO;
import spring.com.pro_A.member.dto.MemberDTO;
import spring.com.pro_A.subject.H_subject.h_dto.H_FileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubjectHomeworkDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitFileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitInfo;
import spring.com.pro_A.subject.H_subject.h_dto.SubmitList;

@Repository
public class H_SubjectDAOImpl implements H_SubjectDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subject.lectName",lectNo);
	}

	@Override
	public int addHomework(Map<String, String> homeworkMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.subjecth.addHomework", homeworkMap);
	}

	@Override
	public int getLastHomeworkNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subjecth.getLastHomeworkNo");
	}

	@Override
	public List<SubjectHomeworkDTO> homeworkList(String lectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.subjecth.homeworkList", lectNo);
	}

	@Override
	public H_FileDTO getFileInfo(String homeworkFileName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subjecth.getFileInfo",homeworkFileName);
	}

	@Override
	public void addHomeworkFile(H_FileDTO fileDTO) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.subjecth.addHomeworkFile", fileDTO);
	}

	@Override
	public SubjectHomeworkDTO homeworkDetailView(int homeworkNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subjecth.homeworkDetailView", homeworkNo);
	}

	@Override
	public List<H_FileDTO> homeworkFiles(int homeworkNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.subjecth.homeworkFiles", homeworkNo);
	}

	@Override
	public LectureDTO lectInfo(int homeworkNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subjecth.lectInfo", homeworkNo);
	}

	@Override
	public List<ApplyDTO> studentList(String lectSpl) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.subjecth.studentList",lectSpl);
	}

	@Override
	public List<MemberDTO> nameList(List<ApplyDTO> studentList) {
		// TODO Auto-generated method stub
		List<MemberDTO> nameList = new ArrayList<MemberDTO>();
		for(ApplyDTO a:studentList) {
			String id = a.getId();
			nameList.add((MemberDTO) sqlSession.selectOne("mapper.subjecth.nameList",id));
		}
		return nameList;
	}

	@Override
	public int homeworkSubmit(Map<String, String> homeworkMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.subjecth.homeworkSubmit", homeworkMap);
	}

	@Override
	public void addSubmitFile(SubmitFileDTO fileDTO) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.subjecth.addSubmitFile", fileDTO);
	}

//	@Override
//	public void listUp(SubmitList submit) {
//		// TODO Auto-generated method stub
//		sqlSession.insert("mapper.subjecth.listUp", submit);
//	}

	@Override
	public List<SubmitInfo> submitList(int homeworkNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.subjecth.submitList", homeworkNo);
	}

	@Override
	public List<SubmitFileDTO> submitFiles(int homeworkNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.subjecth.submitFiles", homeworkNo);
	}

}
