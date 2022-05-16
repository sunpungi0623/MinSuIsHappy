package dao;

import java.util.List;

import domain.LoginVO;
import domain.ObjectVO;

public interface ObjectDAO {

   public void insertObject(ObjectVO vo);
   public void deleteObject(ObjectVO vo);
   public ObjectVO showObject();
   public List<ObjectVO> showObjects();
   public List<ObjectVO> showSamsungs();
   public List<ObjectVO> showLGs();
   public List<ObjectVO> showMSIs();
   public List<ObjectVO> showApples();
   public List<ObjectVO> showMyObjects(LoginVO vo);
   public void updateObject(ObjectVO vo);
}