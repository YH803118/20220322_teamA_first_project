package spring.com.pro_A.board.notice.service;

import java.util.List;
import java.util.Map;

import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.common.dto.Criteria;

public interface N_BoardService {
	
	public List<NoticeDTO> noticeList(Criteria cri);

	public NoticeDTO noticeDetailView(int noticeNo);

	public void noticeAddHit(int noticeNo);

	public int getLastNoticeNo();

	public int addNotice(Map<String, String> noticeMap);

	public void addNoticeFile(FileDTO fileDTO);

	public List<FileDTO> noticeFiles(int noticeNo);

	public FileDTO getFileInfo(String noticeFileName);
	
	public int noticeFileDel(int noticeNo);

	public List<FileDTO> getNoticeFileList(int noticeNo);

	public int noticeDel(int noticeNo);

	public int getNoticeCountAll();

	public List<NoticeDTO> noticeListTop();

	public List<NoticeDTO> searchNoticeList(Criteria cri);

	public int getSearchCountAll(Criteria cri);
	
}
