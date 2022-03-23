package spring.com.pro_A.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.board.dao.BoardDAO;
import spring.com.pro_A.board.dto.NoticeDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<NoticeDTO> noticeList() {
		// TODO Auto-generated method stub
		return boardDAO.selectNoticeListAll();
	}
	
	

}
