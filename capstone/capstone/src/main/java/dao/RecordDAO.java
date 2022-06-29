package dao;

import java.util.List;

import domain.LoginVO;
import domain.RecordVO;

public interface RecordDAO {

   public void insertRecord(RecordVO vo);

   public List<RecordVO> showRecords();
   public List<RecordVO> showSpecipicRecords(String id);

   
}