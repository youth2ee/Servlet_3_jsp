package com.naver.point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.PongMessage;

public class PointDAO {
	
	//insert
	public int insert(Connection con, PointDTO pointDTO) throws Exception {
		int result = 0;
		
		String sql = "insert into point values(point_seq.nextval,?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		
		result =  st.executeUpdate();
		
		st.close(); //con의 close는 con을 마지막으로 받는 애(jsp파일)한테서 한다.
		
		return result;
	}

	
	//delete
	public int delete(Connection con, int num) throws Exception {
		int result = 0;
		
		String sql = "delete point where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	
	//update
	public int update(Connection con, PointDTO pointDTO) throws Exception {
		int result = 0;
		
		String sql = "update point set name=?, kor=?, eng=?, math=?, total=?, avg=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		st.setInt(7, pointDTO.getNum());
		
		result = st.executeUpdate();
	
		st.close();
		
		return result;
	}
	
	
	//selectOne
	public PointDTO selectOne(Connection con, int num) throws Exception{
		PointDTO pointDTO = null;
		
		String sql = "select * from point where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			pointDTO = new PointDTO();
			//객체 생성을 여기서 하는 이유 : 
			//객체를 밖에서 생성하면 일단 null이 아니기 때문에 리턴했을 때 판별하기가 힘듬 따라서 if문에 안들어갔으면 null로 만들어서
			//제대로 실행되는지 여부를 잘 판단하기 위해 안에서 객체를 생성한다.
			pointDTO.setNum(rs.getInt(1));
			pointDTO.setName(rs.getString(2));
			pointDTO.setKor(rs.getInt(3));
			pointDTO.setEng(rs.getInt(4));
			pointDTO.setMath(rs.getInt(5));
			pointDTO.setTotal(rs.getInt(6));
			pointDTO.setAvg(rs.getDouble(7));
		}
		
		rs.close();
		st.close();
		//con은 여기서 close안한다.
		
		return pointDTO;
	}
	
	
	//selectList
	public ArrayList<PointDTO> selectList(Connection con) throws Exception{
		PointDTO pointDTO = null;
		ArrayList<PointDTO> ar = new ArrayList<PointDTO>();
		
		String sql = "select * from point order by num desc";
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt(1));
			pointDTO.setName(rs.getString(2));
			pointDTO.setKor(rs.getInt(3));
			pointDTO.setEng(rs.getInt(4));
			pointDTO.setMath(rs.getInt(5));
			pointDTO.setTotal(rs.getInt(6));
			pointDTO.setAvg(rs.getDouble(7));
			
			ar.add(pointDTO);
		}
		
		rs.close();
		st.close();
		
		return ar;
	}

}