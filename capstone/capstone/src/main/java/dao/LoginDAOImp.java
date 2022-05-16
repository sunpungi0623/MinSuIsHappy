package dao;
 
 
import java.awt.List;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import domain.LoginVO;
import domain.ObjectVO;

import org.springframework.stereotype.Repository;
 
@Repository
public class LoginDAOImp implements LoginDAO {
    
    @Inject
    private SqlSession sqlSession;
    
    private static String namespace = "mapper.LoginMapper";
 
    
    @Override
    public LoginVO login(LoginVO vo) throws Exception {
		return sqlSession.selectOne(namespace+".login", vo);	
	}


	@Override
	public void SignUp(LoginVO vo) throws Exception {
		sqlSession.insert(namespace+".SignUp", vo);
		return;
	}
    
}