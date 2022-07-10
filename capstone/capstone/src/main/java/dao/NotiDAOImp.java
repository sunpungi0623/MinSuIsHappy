package dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import domain.NotiVO;
import domain.RecordVO;

@Repository
public class NotiDAOImp implements NotiDAO {
	
    @Inject
    private SqlSession sqlSession;
    
    private static String namespace = "mapper.NotiMapper";
    
    @Override
    public void insertNoti(NotiVO vo) {
		sqlSession.insert(namespace + ".NotiRecord", vo);
    }
    
    @Override
	public List<NotiVO> showNoti(NotiVO vo) {
		List<NotiVO> objs = sqlSession.selectList(namespace + ".showNoti");
		return objs;
	}
 
}