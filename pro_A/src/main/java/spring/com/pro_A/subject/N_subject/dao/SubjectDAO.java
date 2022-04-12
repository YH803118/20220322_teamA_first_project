package spring.com.pro_A.subject.N_subject.dao;

import java.util.List;
import java.util.Map;

import spring.com.pro_A.board.notice.dto.SubjectNoticeDTO;
import spring.com.pro_A.common.dto.Criteria;

public interface SubjectDAO {

	String lectName(int lectNo);

	List<SubjectNoticeDTO> selectNoticeListTop();

	int getNoticeCountAll();

	List<SubjectNoticeDTO> noticeList(Criteria cri);

	void noticeAddHit(int noticeNo);

	SubjectNoticeDTO noticeDetailView(int noticeNo);

	int addNotice(Map<String, String> noticeMap);

	int getLastNoticeNo();

	void noticeDel(int noticeNo);

	

}
