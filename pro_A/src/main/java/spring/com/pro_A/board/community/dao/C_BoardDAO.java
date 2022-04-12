package spring.com.pro_A.board.community.dao;

import java.util.List;

import spring.com.pro_A.board.community.dto.CommDTO;
import spring.com.pro_A.board.community.dto.ReplyDTO;
import spring.com.pro_A.common.dto.Criteria;

public interface C_BoardDAO {

	public int getCommuTotCnt();

	public List<CommDTO> getCommuList(Criteria cri);

	public int addCommu(CommDTO commDTO);

	public CommDTO getCommuDetail(int commuNo);

	public int addCommuHit(int commuNo);

	public int updateCommu(CommDTO commDTO);

	public int getCommuSearchCnt(Criteria cri);

	public List<CommDTO> searchCommuList(Criteria cri);

	public int delCommu(int commuNo);

	public int addReply(ReplyDTO replyDTO);

	public List<ReplyDTO> getReplys(int commuNo);

	public int modReply(ReplyDTO replyDTO);

	public int delReply(int replyNo);

	public int addReplyCnt(int commuNo);

	public int delReplyCnt(int commuNo);

}
