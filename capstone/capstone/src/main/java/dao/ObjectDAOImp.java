package dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;

import domain.LoginVO;
import domain.ObjectVO;
import org.springframework.stereotype.Repository;

@Repository
public class ObjectDAOImp implements ObjectDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "mapper.ObjectMapper";

	@Override
	public void insertObject(ObjectVO vo) {
		sqlSession.insert(namespace + ".insertObject", vo);

	}

	@Override
	public void deleteObject(ObjectVO vo) {
		sqlSession.delete(namespace + ".deleteObject", vo);

	}

	@Override
	public List<ObjectVO> showObjects() {
		List<ObjectVO> objs = sqlSession.selectList(namespace + ".showObjects");
		return objs;
	}

	@Override
	public ObjectVO showObject() {
		ObjectVO obj = sqlSession.selectOne(namespace + ".showObject");
		return obj;
	}

	@Override
	public List<ObjectVO> showSamsungs() {
		List<ObjectVO> objs = sqlSession.selectList(namespace + ".showSamsungs");
		return objs;
	}

	@Override
	public List<ObjectVO> showLGs() {
		List<ObjectVO> objs = sqlSession.selectList(namespace + ".showLGs");
		return objs;
	}

	@Override
	public List<ObjectVO> showMSIs() {
		List<ObjectVO> objs = sqlSession.selectList(namespace + ".showMSIs");
		return objs;
	}

	@Override
	public List<ObjectVO> showApples() {
		List<ObjectVO> objs = sqlSession.selectList(namespace + ".showApples");
		return objs;
	}
	
	@Override
	   public List<ObjectVO> showMyObjects(LoginVO vo) {
	      List<ObjectVO> objs = sqlSession.selectList(namespace + ".showMyObjects", vo);
	      return objs;
	   }
	@Override
	public void updateObject(ObjectVO vo) {
		sqlSession.update(namespace + ".updateObject", vo);

	}
	

}