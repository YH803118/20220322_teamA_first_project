package spring.com.pro_A.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.board.dao.BoardDAO;
import spring.com.pro_A.board.dto.Criteria;
import spring.com.pro_A.board.dto.FileDTO;
import spring.com.pro_A.board.dto.NoticeDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<NoticeDTO> noticeList(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.selectNoticeListAll(cri);
	}

	@Override
	public NoticeDTO noticeDetailView(int noticeNo) {
		// TODO Auto-generated method stub
		return boardDAO.selectNoticeDetail(noticeNo);
	}

	@Override
	public void noticeAddHit(int boardNo) {
		boardDAO.noticeAddHit(boardNo);

	}

	@Override
	public int getLastNoticeNo() {
		// TODO Auto-generated method stub
		return boardDAO.getLastNoticeNo();
	}

	@Override
	public int addNotice(Map<String, String> noticeMap) {
		// TODO Auto-generated method stub
		return boardDAO.addNotice(noticeMap);
	}

	@Override
	public void addNoticeFile(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		boardDAO.addNoticeFile(fileDTO);

	}

	@Override
	public List<FileDTO> noticeFiles(int noticeNo) {
		// TODO Auto-generated method stub
		return boardDAO.selectFiles(noticeNo);

	}

	@Override
	public FileDTO getFileInfo(String noticeFileName) {
		// TODO Auto-generated method stub

		return boardDAO.getFileInfo(noticeFileName);
	}


	
	@Override
	public List<FileDTO> getNoticeFileList(int noticeNo) {
		// TODO Auto-generated method stub
		return boardDAO.getNoticeFileList(noticeNo);
	}

	@Override
	public int noticeFileDel(int noticeNo) {
		// 
		return boardDAO.noticeFileDel(noticeNo);
	}

	@Override
	public int noticeDel(int noticeNo) {
		// TODO Auto-generated method stub
		return boardDAO.noticeDel(noticeNo);
	}

	@Override
	public int getNoticeCountAll() {
		// TODO Auto-generated method stub
		return boardDAO.getNoticeCountAll();
	}

	@Override
	public List<NoticeDTO> noticeListTop() {
		// TODO Auto-generated method stub
		return boardDAO.selectNoticeListTop();
	}
	
	

}
