package com.naver.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.naver.join.JoinDAO;
import com.naver.join.JoinDTO;
import com.naver.util.DBConnector;

public class JoinDAOTest {

	//@Test
	public void insert() throws Exception {
		JoinDAO joinDAO = new JoinDAO();
		Connection con = DBConnector.getConnection();
		JoinDTO joinDTO = new JoinDTO();
		
		joinDTO.setId("c");
		joinDTO.setPw("cc");
		joinDTO.setName("ccc");
		joinDTO.setEmail("cccc");
		joinDTO.setPhone("ccccc");
		
		int result =  joinDAO.insert(con, joinDTO);
	
		assertEquals(1, result);
	}

	//@Test
	public void delete() throws Exception {
		JoinDAO joinDAO = new JoinDAO();
		Connection con = DBConnector.getConnection();
		
		int result =  joinDAO.delete(con, "a");
	
		assertEquals(1, result);
	}
	
	//@Test
	public void update() throws Exception {
		JoinDAO joinDAO = new JoinDAO();
		Connection con = DBConnector.getConnection();
		JoinDTO joinDTO = new JoinDTO();
		
		joinDTO.setId("c");
		joinDTO.setPw("ppp");
		joinDTO.setName("pppp");
		joinDTO.setEmail("ppppp");
		joinDTO.setPhone("ppppppp");
		
		int result = joinDAO.update(con, joinDTO);
		
		assertEquals(1, result);
	}
	
	@Test
	public void selectOne() throws Exception {
		JoinDAO joinDAO = new JoinDAO();
		Connection con = DBConnector.getConnection();
	
		
		JoinDTO joinDTO =   joinDAO.selectOne(con, "c");
		
		assertNotNull(joinDTO);
	
	
	}
	
}
