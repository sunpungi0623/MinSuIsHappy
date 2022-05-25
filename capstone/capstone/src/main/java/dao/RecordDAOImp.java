package dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;

import domain.LoginVO;
import domain.RecordVO;
import org.springframework.stereotype.Repository;

@Repository
public class RecordDAOImp implements RecordDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "mapper.RecordMapper";

	@Override
	public void insertRecord(RecordVO vo) {
		sqlSession.insert(namespace + ".insertRecord", vo);

	}


	@Override
	public List<RecordVO> showRecords() {
		List<RecordVO> objs = sqlSession.selectList(namespace + ".showRecords");
		return objs;
	}


	

}