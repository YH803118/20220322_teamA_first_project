package spring.com.pro_A.board.community.dao;

import java.util.List;

import spring.com.pro_A.board.community.dto.CommDTO;
import spring.com.pro_A.common.dto.Criteria;

public interface C_BoardDAO {

	public int getCommuTotCnt();

	public List<CommDTO> getCommuList(Criteria cri);

	public int addCommu(CommDTO commDTO);

	public CommDTO getCommuDetail(int commuNo);

	public int addCommuHit(int commuNo);

	public int updateCommu(CommDTO commDTO);

}
