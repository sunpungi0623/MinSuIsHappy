package dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import domain.ObjectVO;
import org.springframework.stereotype.Repository;

@Repository
public class ObjectDAOImp implements ObjectDAO {
   
   @Inject 
    private SqlSession sqlSession;

   
   private static final String namespace = "mapper.ObjectMapper";
   
   @Override
   public void insertObject(ObjectVO vo) {
      sqlSession.insert(namespace+".insertObject", vo);
      
   }

   @Override
   public void deleteObject(ObjectVO vo) {
      sqlSession.delete(namespace+".deleteObject", vo);
      
   }

   @Override
   public List<ObjectVO> showObjects() {
      List<ObjectVO> objs = sqlSession.selectList(namespace+".showObjects");
      return objs;
   }

   @Override
   public ObjectVO showObject() {
      ObjectVO obj = sqlSession.selectOne(namespace+".showObject");
      return obj;
   }

   
}