package com.msg.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;


public class MsgService {

	private MsgDAO_interface dao;
	
	public MsgService() {
		dao = new MsgDAO();
	}
	
	public MsgVO addMsg(Integer msgNo, Integer sendNo, Integer recNo, Integer dateItemNo,
			String msgContent, Timestamp msgTime, Integer msgStatus) {
		
		MsgVO msgVO = new MsgVO();
		
		msgVO.setMsgNo(msgNo);
		msgVO.setSendNo(sendNo);
		msgVO.setRecNo(recNo);
		msgVO.setDateItemNo(dateItemNo);
		msgVO.setMsgContent(msgContent);
		msgVO.setMsgTime(msgTime);
		msgVO.setMsgStatus(msgStatus);
		dao.add(msgVO);
		
		return msgVO;
	}
	
	
	public MsgVO updateDateItem(Integer msgNo, Integer sendNo, Integer recNo, Integer dateItemNo,
			String msgContent, Timestamp msgTime, Integer msgStatus){
		
		MsgVO msgVO = new MsgVO();
		
		msgVO.setMsgNo(msgNo);
		msgVO.setSendNo(sendNo);
		msgVO.setRecNo(recNo);
		msgVO.setDateItemNo(dateItemNo);
		msgVO.setMsgContent(msgContent);
		msgVO.setMsgTime(msgTime);
		msgVO.setMsgStatus(msgStatus);
		dao.update(msgVO);
		
		return msgVO;
	}
	
	public void deleteMsg(Integer msgNo) {
		dao.delete(msgNo);
	}

	public MsgVO getOneEmp(Integer msgNo) {
		return dao.findByPk(msgNo);
	}

	public List<MsgVO> getAll() {
		return dao.getAll();
	}
}
