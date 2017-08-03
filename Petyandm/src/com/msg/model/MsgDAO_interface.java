package com.msg.model;

import java.util.List;


	public interface MsgDAO_interface {
		void add(MsgVO dateItem);
		void update(MsgVO dateItem);
		void delete(int dateItemNo);
		MsgVO findByPk(int dateItemNo);
		List<MsgVO> getAll();
	}
	

