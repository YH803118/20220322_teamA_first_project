package spring.com.pro_A.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.com.pro_A.board.dto.NoticeDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private  SqlSession sqlsession;
	
	public List<NoticeDTO> selectNoticeListAll(){
		List<NoticeDTO> noticeList = sqlsession.selectList("mapper.board.selectNoticeListAll");
		return noticeList;
	}
	
}
