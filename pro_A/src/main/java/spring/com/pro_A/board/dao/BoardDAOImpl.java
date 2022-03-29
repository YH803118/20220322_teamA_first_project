package spring.com.pro_A.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spring.com.pro_A.board.dto.Criteria;
import spring.com.pro_A.board.dto.FileDTO;
import spring.com.pro_A.board.dto.NoticeDTO;

@Repository
@Transactional(propagation = Propagation.REQUIRED)
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private  SqlSession sqlsession;
	
	public List<NoticeDTO> selectNoticeListAll(Criteria cri){
		List<NoticeDTO> noticeList = sqlsession.selectList("mapper.board.selectNoticeListAll", cri);
		return noticeList;
	}

	@Override
	public NoticeDTO selectNoticeDetail(int noticeNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.board.selectNoticeDetail", noticeNo);
	}

	@Override
	public void noticeAddHit(int boardNo) {
		int result = sqlsession.update("mapper.board.noticeAddHit", boardNo);
	}

	@Override
	public int getLastNoticeNo() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.board.getLastNoticeNo");
	}

	@Override
	public int addNotice(Map<String, String> noticeMap) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mapper.board.addNotice", noticeMap);
		
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
		return sqlsession.delete("mapper.file.noticeFileDel", noticeNo);
	}

	@Override
	public int noticeDel(int noticeNo) {
		int result = sqlsession.delete("mapper.board.noticeDel", noticeNo);
		System.out.println("게시글 삭제 결과 : " + result);
		return result;
	}

	@Override
	public int getNoticeCountAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.board.getNoticeCountAll");
		
	}

	@Override
	public List<NoticeDTO> selectNoticeListTop() {
		
		return sqlsession.selectList("mapper.board.selectNoticeListTop");
	}
	
	
	
	
	
	
}
