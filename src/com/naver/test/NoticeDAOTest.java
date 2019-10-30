package com.naver.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.Test;

import com.naver.notice.NoticeDAO;
import com.naver.notice.NoticeDTO;
import com.naver.util.DBConnector;

public class NoticeDAOTest {
	
	//@Test 
	public void connection() throws Exception {
		Connection con = DBConnector.getConnection();

		assertNotNull(con);
	}

	//@Test
	public void noticeList() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		
		ArrayList<NoticeDTO> ar =  noticeDAO.noticeList(con);
	
		assertNotNull(ar.get(0));
	}
	
	//@Test
	public void noticeSelect() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		
		NoticeDTO noticeDTO =  noticeDAO.noticeSelect(con, 2);
	
		assertEquals(2, noticeDTO.getNum());
	}
	
	//@Test
	public void noticeWrite() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		NoticeDTO noticeDTO = new NoticeDTO();
		Connection con = DBConnector.getConnection();
		
		noticeDTO.setTitle("aaa");
		noticeDTO.setWriter("bbb");
		noticeDTO.setContents("ccc");
		
		int result =  noticeDAO.noticeWrite(con, noticeDTO);
	
		assertEquals(1, result);
	}
	
	//@Test
	public void noticeUpdate() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		NoticeDTO noticeDTO = new NoticeDTO();
		Connection con = DBConnector.getConnection();
		
		noticeDTO.setNum(2);
		noticeDTO.setTitle("111");
		noticeDTO.setContents("333");
		
		int result = noticeDAO.noticeUpdate(con, noticeDTO);
		
		assertEquals(1, result);
	}
	
	@Test
	public void noticeDelete() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		NoticeDTO noticeDTO = new NoticeDTO();
		Connection con = DBConnector.getConnection();
		
		int result = noticeDAO.noticeDelete(con, 2);
		
		assertEquals(1, result);
	}
	
	
	

}
