package com.naver.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	//insert
	public int insert(Connection con, MemberDTO memberDTO) throws Exception {
		int result = 0;
		
		String sql = "insert into join values (?,?,?,?,?,3)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());

		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//delete
	public int memberDelete(Connection con, String id) throws Exception {
		int result = 0;
		
		String sql = "delete join where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		result = st.executeUpdate();
				
		st.close();
		
		return result;
	}
	
	//update
	public int memberUpdate(Connection con, MemberDTO memberDTO) throws Exception {
		int result = 0;
		
		String sql = "update join set pw=?,name=?,email=?,phone=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getName());
		st.setString(3, memberDTO.getEmail());
		st.setString(4, memberDTO.getPhone());
		st.setString(5, memberDTO.getId());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//selectOne
	public MemberDTO selectOne(Connection con, String id) throws Exception {
		MemberDTO memberDTO = null;
		
		String sql = "select * from join where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			memberDTO = new MemberDTO();
			memberDTO.setId(rs.getString(1));
			memberDTO.setPw(rs.getString(2));
			memberDTO.setName(rs.getString(3));
			memberDTO.setEmail(rs.getString(4));
			memberDTO.setPhone(rs.getString(5));
			memberDTO.setGrade(rs.getInt(6));
		}
		
		rs.close();
		st.close();
		
		return memberDTO;
	}
	
	//login
	public MemberDTO memberLogin(Connection con, MemberDTO memberDTO) throws Exception {
		String sql = "select * from join where id=? and pw=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			memberDTO.setName(rs.getString(3));
			memberDTO.setEmail(rs.getString(4));
			memberDTO.setPhone(rs.getString(5));
			memberDTO.setGrade(rs.getInt(6));
		} else {
			memberDTO = null;
		}
		
		rs.close();
		st.close();
		
		return memberDTO;
	}
}
