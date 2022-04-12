package spring.com.pro_A.board.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spring.com.pro_A.board.community.dto.CommDTO;
import spring.com.pro_A.board.community.dto.ReplyDTO;
import spring.com.pro_A.common.dto.Criteria;

@Repository
@Transactional(propagation = Propagation.REQUIRED)
public class C_BoardDAOImpl implements C_BoardDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public int getCommuTotCnt() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.boardc.getCommuTotCnt");
	}

	@Override
	public List<CommDTO> getCommuList(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mapper.boardc.getCommuList", cri);
	}

	@Override
	public int addCommu(CommDTO commDTO) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mapper.boardc.addCommu", commDTO);
	}

	@Override
	public CommDTO getCommuDetail(int commuNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.boardc.getCommuDetail", commuNo);
	}

	@Override
	public int addCommuHit(int commuNo) {
		// TODO Auto-generated method stub
		return sqlsession.update("mapper.boardc.addCommuHit",commuNo);
	}

	@Override
	public int updateCommu(CommDTO commDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update("mapper.boardc.updateCommu",commDTO);
	}

	@Override
	public int getCommuSearchCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mapper.boardc.getCommuSearchCnt",cri);
	}

	@Override
	public List<CommDTO> searchCommuList(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mapper.boardc.getSearchCommu",cri);
	}

	@Override
	public int delCommu(int commuNo) {
		// TODO Auto-generated method stub
		return sqlsession.delete("mapper.boardc.delCommu", commuNo);
	}

	@Override
	public int addReply(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return sqlsession.insert("mapper.boardc.addReply", replyDTO);
	}

	@Override
	public List<ReplyDTO> getReplys(int commuNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mapper.boardc.getReplys", commuNo);
	}

	@Override
	public int modReply(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update("mapper.boardc.modReply", replyDTO);
	}

	@Override
	public int delReply(int replyNo) {
		// TODO Auto-generated method stub
		return sqlsession.delete("mapper.boardc.delReply", replyNo);
	}

	@Override
	public int addReplyCnt(int commuNo) {
		// TODO Auto-generated method stub
		return sqlsession.update("mapper.boardc.addReplyCnt", commuNo);
	}

	@Override
	public int delReplyCnt(int commuNo) {
		// TODO Auto-generated method stub
		return sqlsession.update("mapper.boardc.delReplyCnt", commuNo);
	}
	
	
	
	

}
