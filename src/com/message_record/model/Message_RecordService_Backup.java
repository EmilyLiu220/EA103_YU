package com.message_record.model;

import java.util.List;

public class Message_RecordService_Backup {
	
	private Message_RecordDAO_interface dao;

	public Message_RecordService_Backup() {
		dao = new Message_RecordDAO_Backup();
	}
	
	public Message_RecordVO addMsg(String type, String emp_no, String mem_no, String msg_cont, String msg_time, Integer msg_sts, Integer read_sts ) {
		
		Message_RecordVO message_recordVO = new Message_RecordVO(type, mem_no, emp_no, msg_cont, msg_time, msg_sts, read_sts);
		
		message_recordVO.setType(type);
		message_recordVO.setEmp_no(emp_no);
		message_recordVO.setMem_no(mem_no);
		message_recordVO.setMsg_cont(msg_cont);
		message_recordVO.setMsg_time(msg_time);
		message_recordVO.setMsg_sts(msg_sts);
		message_recordVO.setRead_sts(read_sts);
		dao.insert(message_recordVO);

		return message_recordVO;
	}
	
	public List<Message_RecordVO> getMsgByMem(String mem_no) {
		return dao.findByMemNo(mem_no);
	}
	
	public List<Message_RecordVO> getMsgByEmp(String emp_no) {
		return dao.findByEmpNo(emp_no);
	}
	
	public void updateMsgByMem(String mem_no) {
		dao.updateMemReadSts(mem_no);
	}
	
	public void updateMsgByEmp(String emp_no) {
		dao.updateEmpReadSts(emp_no);
	}
	
}
