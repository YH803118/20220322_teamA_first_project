package spring.com.pro_A.board.dao;

import java.util.List;
import java.util.Map;

import spring.com.pro_A.board.dto.FileDTO;
import spring.com.pro_A.board.dto.NoticeDTO;

public interface BoardDAO {
	
	public List<NoticeDTO> selectNoticeListAll();

	public NoticeDTO selectNoticeDetail(int noticeNo);

	public void noticeAddHit(int boardNo);

	public int getLastNoticeNo();

	public int addNotice(Map<String, String> noticeMap);

	public void addNoticeFile(FileDTO fileDTO);
	
}
