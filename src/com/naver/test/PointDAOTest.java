package com.naver.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.junit.Test;

import com.naver.point.PointDAO;
import com.naver.point.PointDTO;
import com.naver.util.DBConnector;

public class PointDAOTest {
	
	@Test //annotation 이게 있어야 테스트 진행된다.
	public void test1() throws Exception {
		Connection con = DBConnector.getConnection();
		
		//단정문 : null이 아니면 green, null이면 red
		assertNotNull(con);
	}
	
	@Test //annotation 이게 있어야 테스트 진행된다.
	public void test2() throws Exception {
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();

		int result =  pointDAO.delete(con, 1256);
		
		//단정문 : 앞의 값은 내가 희망하는 값, 뒤의 값은 실제 내가 받은 값 - 둘의 값이 일치하면 green, 둘의 값이 다르면 red
		assertEquals(0, result);
	}
	
	@Test //annotation 이게 있어야 테스트 진행된다.
	public void test3() throws Exception {
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();

		PointDTO pointDTO =  pointDAO.selectOne(con, 23);
		
		assertEquals(23, pointDTO.getNum());
	}
	
	@Test //annotation 이게 있어야 테스트 진행된다.
	public void test4() throws Exception {
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();

		List<PointDTO> ar = pointDAO.selectList(con);
		
		//assertEquals(23, ar.get(3).getNum());
		assertNotEquals(0, ar.size());
	}
	
	@Test
	public void test5() throws Exception {
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		
		for(int i=0;i<10;i++) {
			Random rs = new Random();
			PointDTO pointDTO = new PointDTO();
			pointDTO.setName("name"+i);
			pointDTO.setKor(rs.nextInt(101));
			pointDTO.setEng(rs.nextInt(101));
			pointDTO.setMath(rs.nextInt(101));
			pointDTO.setTotal(pointDTO.getKor() + pointDTO.getEng() + pointDTO.getMath());
			pointDTO.setAvg(pointDTO.getTotal()/3.0);
			
			pointDAO.insert(con, pointDTO);
			
			Thread.sleep(500);
		}
		
		con.close();
	}

}
