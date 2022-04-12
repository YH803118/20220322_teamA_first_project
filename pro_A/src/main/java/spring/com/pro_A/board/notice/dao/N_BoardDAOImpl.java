package spring.com.pro_A.board.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.common.dto.Criteria;

@Repository
@Transactional(propagation = Propagation.REQUIRED)
public class N_BoardDAOImpl implements N_BoardDAO {
	
	@Autowired
	private  SqlSession sqlsession;
	
	public List<NoticeDTO> selectNoticeListAll(Criteria cri){
		List<NoticeDTO> noticeList = sqlsession.selectList("mapper.boardn.selectNoticeListAll", cri);
		return noticeList;
	}

	@Override
	public NoticeDTO selectNoticeDetail(int noticeNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.boardn.selectNoticeDetail", noticeNo);
	}

	@Override
	public void noticeAddHit(int noticeNo) {
		int result = sqlsession.update("mapper.boardn.noticeAddHit", noticeNo);
	}

	@Override
	public int getLastNoticeNo() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.boardn.getLastNoticeNo");
	}

	@Override
	public int addNotice(Map<String, String> noticeMap) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mapper.boardn.addNotice", noticeMap);
		
	}

	@Override
	public void addNoticeFile(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		int result = sqlsession.insert("mapper.file.addNoticeFile", fileDTO);
	}

	@Override
	public List<FileDTO> selectFiles(int noticeNo) {
		// TODO Auto-generated method stub
		List<FileDTO> files = sqlsession.selectList("mapper.file.selectFiles", noticeNo);
		return files;
	}

	@Override
	public FileDTO getFileInfo(String noticeFileName) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.file.getFileInfo", noticeFileName);
		
	}
	
	
	@Override
	public List<FileDTO> getNoticeFileList(int noticeNo) {
		// TODO Auto-generated method stub
		 List<FileDTO> fileList = sqlsession.selectList("mapper.file.getFileList", noticeNo);
		 
		 return fileList;
	}

	@Override
	public int noticeFileDel(int noticeNo) {
		// TODO Auto-generated method stub
		return sqlsession.delete("mapper.file.noticeFileDelAll", noticeNo);
	}

	@Override
	public int noticeDel(int noticeNo) {
		int result = sqlsession.delete("mapper.boardn.noticeDel", noticeNo);
		return result;
	}

	@Override
	public int getNoticeCountAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.boardn.getNoticeCountAll");
		
	}

	@Override
	public List<NoticeDTO> selectNoticeListTop() {
		
		return sqlsession.selectList("mapper.boardn.selectNoticeListTop");
	}

	@Override
	public List<NoticeDTO> searchNoticeList(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mapper.boardn.selectSearchList",cri);
	}

	@Override
	public int getSearchCountAll(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.boardn.selectSearchCount", cri);
	}

	@Override
	public FileDTO getFileInfo(Map info) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.file.getFileInfo2", info);
	}

	@Override
	public void noticeFileDel(String noticeFileName) {
		// TODO Auto-generated method stub
		sqlsession.delete("mapper.file.noticeFileDel", noticeFileName);
	}

	@Override
	public int modNotice(Map<String, String> noticeMap) {
		// TODO Auto-generated method stub
		return sqlsession.update("mapper.boardn.modNotice",noticeMap);
	}
	
	
	
	
	
}
