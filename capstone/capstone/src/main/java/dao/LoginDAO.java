package dao;

import domain.LoginVO;
 
public interface LoginDAO {
 
    public LoginVO login(LoginVO vo) throws Exception;
    public void SignUp(LoginVO vo) throws Exception;
    public void Rent(LoginVO vo) throws Exception;
}