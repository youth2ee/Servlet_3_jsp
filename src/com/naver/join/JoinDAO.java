package com.naver.join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JoinDAO {
	
	//insert
	public int insert(Connection con, JoinDTO joinDTO) throws Exception {
		int result = 0;
		
		String sql = "insert into join values (?,?,?,?,?,3)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, joinDTO.getId());
		st.setString(2, joinDTO.getPw());
		st.setString(3, joinDTO.getName());
		st.setString(4, joinDTO.getEmail());
		st.setString(5, joinDTO.getPhone());

		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//delete
	public int delete(Connection con, String id) throws Exception {
		int result = 0;
		
		String sql = "delete join where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		result = st.executeUpdate();
				
		st.close();
		
		return result;
	}
	
	//update
	public int update(Connection con, JoinDTO joinDTO) throws Exception {
		int result = 0;
		
		String sql = "update join set pw=?,name=?,email=?,phone=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, joinDTO.getPw());
		st.setString(2, joinDTO.getName());
		st.setString(3, joinDTO.getEmail());
		st.setString(4, joinDTO.getPhone());
		st.setString(5, joinDTO.getId());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//selectOne
	public JoinDTO selectOne(Connection con, String id) throws Exception {
		JoinDTO joinDTO = null;
		
		String sql = "select * from join where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			joinDTO = new JoinDTO();
			joinDTO.setId(rs.getString(1));
			joinDTO.setPw(rs.getString(2));
			joinDTO.setName(rs.getString(3));
			joinDTO.setEmail(rs.getString(4));
			joinDTO.setPhone(rs.getString(5));
			joinDTO.setGrade(rs.getInt(6));
			
		}
		
		rs.close();
		st.close();
		
		return joinDTO;
	}
}
