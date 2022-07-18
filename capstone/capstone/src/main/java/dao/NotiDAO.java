package dao;

import java.util.List;

import domain.NotiVO;

public interface NotiDAO {

	void insertNoti(NotiVO vo);

	List<NotiVO> showNoti(NotiVO vo);
	
	
}