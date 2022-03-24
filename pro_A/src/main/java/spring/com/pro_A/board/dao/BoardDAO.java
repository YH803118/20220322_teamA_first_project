package spring.com.pro_A.board.dao;

import java.util.List;

import spring.com.pro_A.board.dto.NoticeDTO;

public interface BoardDAO {
	
	public List<NoticeDTO> selectNoticeListAll();

	public NoticeDTO selectNoticeDetail(int noticeNo);
	
}
