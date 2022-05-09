package service;
 
 
import javax.inject.Inject;
 
import dao.LoginDAO;
import domain.LoginVO;
import org.springframework.stereotype.Service;
 
@Service
public class LoginServiceImpl implements LoginService {
 
    @Inject
    private LoginDAO dao;
    
    
    @Override
    public LoginVO login(LoginVO vo) throws Exception {	
		return dao.login(vo);
	}
    
 
   
}