package spring.com.pro_A.board.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spring.com.pro_A.board.community.dto.CommDTO;
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
	
	

}
