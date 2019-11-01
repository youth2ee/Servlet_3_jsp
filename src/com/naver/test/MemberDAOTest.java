package com.naver.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.naver.member.MemberDAO;
import com.naver.member.MemberDTO;
import com.naver.util.DBConnector;

public class MemberDAOTest {

	//@Test
	public void insert() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setId("c");
		memberDTO.setPw("cc");
		memberDTO.setName("ccc");
		memberDTO.setEmail("cccc");
		memberDTO.setPhone("ccccc");
		
		int result =  memberDAO.insert(con, memberDTO);
	
		assertEquals(1, result);
	}

	//@Test
	public void delete() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();
		
		int result =  memberDAO.memberDelete(con, "a");
	
		assertEquals(1, result);
	}
	
	//@Test
	public void update() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setId("c");
		memberDTO.setPw("ppp");
		memberDTO.setName("pppp");
		memberDTO.setEmail("ppppp");
		memberDTO.setPhone("ppppppp");
		
		int result = memberDAO.memberUpdate(con, memberDTO);
		
		assertEquals(1, result);
	}
	
	//@Test
	public void selectOne() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();
	
		MemberDTO memberDTO =   memberDAO.selectOne(con, "c");
		
		assertNotNull(memberDTO);
	}
	
	@Test
	public void memberLogin() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		Connection con = DBConnector.getConnection();
		
		memberDTO.setId("a");
		memberDTO.setPw("b");
		
		memberDTO = memberDAO.memberLogin(con, memberDTO);
		
		assertEquals("1@1", memberDTO.getEmail());
	}
	
	
}
