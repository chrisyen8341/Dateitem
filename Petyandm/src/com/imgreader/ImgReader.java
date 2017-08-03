package com.imgreader;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dateitem.model.*;

public class ImgReader extends HttpServlet{
	 
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		doPost(req,res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		
		
		req.setCharacterEncoding("BIG5");
		res.setContentType("image/*");
		ServletOutputStream out = res.getOutputStream();
		
		DateItemService dSvc =new DateItemService();
		
		ByteArrayInputStream in =new ByteArrayInputStream(dSvc.getOneDateItem(Integer.valueOf(req.getParameter("dateitemNo"))).getDateItemImg());
		byte[] buf = new byte[8 * 1024];
		int len;
		while((len = in.read(buf))!=-1){
				out.write(buf, 0, len);
				}
	
	

	}
}
