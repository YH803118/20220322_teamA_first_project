package spring.com.pro_A.board.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.board.community.dao.C_BoardDAO;
import spring.com.pro_A.board.community.dto.CommDTO;
import spring.com.pro_A.common.dto.Criteria;

@Service
public class C_BoardServiceImpl implements C_BoardService {

	@Autowired
	private C_BoardDAO cBoardDAO;

	@Override
	public int getCommuTotCnt() {
		return cBoardDAO.getCommuTotCnt();
	}

	@Override
	public List<CommDTO> getCommuList(Criteria cri) {
		return cBoardDAO.getCommuList(cri);
	}

	@Override
	public int addCommu(CommDTO commDTO) {
		return cBoardDAO.addCommu(commDTO);
	}

	@Override
	public CommDTO getCommuDetail(int commuNo) {
		// TODO Auto-generated method stub
		return cBoardDAO.getCommuDetail(commuNo);
	}

	@Override
	public int addCommuHit(int commuNo) {
		// TODO Auto-generated method stub
		return cBoardDAO.addCommuHit(commuNo);
	}

	@Override
	public int updateCommu(CommDTO commDTO) {
		// TODO Auto-generated method stub
		return cBoardDAO.updateCommu(commDTO);
	}

	
}