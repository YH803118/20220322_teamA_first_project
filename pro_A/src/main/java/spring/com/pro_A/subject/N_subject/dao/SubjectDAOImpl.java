package spring.com.pro_A.subject.N_subject.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.board.notice.dto.SubjectNoticeDTO;
import spring.com.pro_A.common.dto.Criteria;

@Repository
public class SubjectDAOImpl implements SubjectDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subject.lectName",lectNo);
	}

	@Override
	public List<SubjectNoticeDTO> selectNoticeListTop() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.subject.selectNoticeListTop");
	}

	@Override
	public int getNoticeCountAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subject.getNoticeCountAll");
	}

	@Override
	public List<SubjectNoticeDTO> noticeList(Criteria cri) {
		// TODO Auto-generated method stub
		List<SubjectNoticeDTO> noticeList = sqlSession.selectList("mapper.subject.selectNoticeListAll", cri);
		return noticeList;
	}

	@Override
	public void noticeAddHit(int noticeNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("mapper.subject.noticeAddHit", noticeNo);
	}

	@Override
	public SubjectNoticeDTO noticeDetailView(int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subject.selectNoticeDetail", noticeNo);
	}

	@Override
	public int addNotice(Map<String, String> noticeMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.subject.addNotice", noticeMap);
	}

	@Override
	public int getLastNoticeNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.subject.getLastNoticeNo");
	}

	@Override
	public void noticeDel(int noticeNo) {
		// TODO Auto-generated method stub
		sqlSession.delete("mapper.subject.noticeDel", noticeNo);
		
	}

}
