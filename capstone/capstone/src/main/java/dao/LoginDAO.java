package dao;

import domain.LoginVO;
 
public interface LoginDAO {
 
    public LoginVO login(LoginVO vo) throws Exception;
}