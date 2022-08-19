package dao;

import domain.LoginVO;
 
public interface LoginDAO {
 
    public LoginVO login(LoginVO vo) throws Exception;
    public void SignUp(LoginVO vo) throws Exception;
    public void Rent(LoginVO vo) throws Exception;
    public void returnObj(String uid) throws Exception;
    public int idChk(LoginVO vo) throws Exception;
    public void newsession(LoginVO vo) throws Exception;
    public void updateToken(LoginVO vo) throws  Exception;
}