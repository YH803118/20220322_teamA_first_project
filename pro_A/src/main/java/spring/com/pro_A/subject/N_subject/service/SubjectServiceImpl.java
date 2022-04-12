package spring.com.pro_A.subject.N_subject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.board.notice.dto.SubjectNoticeDTO;
import spring.com.pro_A.common.dto.Criteria;
import spring.com.pro_A.subject.N_subject.dao.SubjectDAO;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDAO subjectDAO;

	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return subjectDAO.lectName(lectNo);
	}

	@Override
	public List<SubjectNoticeDTO> noticeListTop() {
		// TODO Auto-generated method stub
		return subjectDAO.selectNoticeListTop();
	}

	@Override
	public int getNoticeCountAll() {
		// TODO Auto-generated method stub
		return subjectDAO.getNoticeCountAll();
	}

	@Override
	public List<SubjectNoticeDTO> noticeList(Criteria cri) {
		// TODO Auto-generated method stub
		return subjectDAO.noticeList(cri);
	}

	@Override
	public void noticeAddHit(int noticeNo) {
		// TODO Auto-generated method stub
		subjectDAO.noticeAddHit(noticeNo);
	}

	@Override
	public SubjectNoticeDTO noticeDetailView(int noticeNo) {
		// TODO Auto-generated method stub
		return subjectDAO.noticeDetailView(noticeNo);
	}

	@Override
	public int addNotice(Map<String, String> noticeMap) {
		// TODO Auto-generated method stub
		return subjectDAO.addNotice(noticeMap);
	}

	@Override
	public int getLastNoticeNo() {
		// TODO Auto-generated method stub
		return subjectDAO.getLastNoticeNo();
	}

	@Override
	public void noticeDel(int noticeNo) {
		// TODO Auto-generated method stub
	 subjectDAO.noticeDel(noticeNo);
	}
	
}
