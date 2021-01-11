package kas.exhibition.model;



import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import kas.domain.Exhibition;


class ExhibitionDAO {
	private DataSource ds; 
	 ExhibitionDAO(){
	      try {
	         Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/myoracle");
	      }catch(NamingException ne) {
	         System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
	      }
	   }
	ArrayList<Exhibition> getMyList(ArrayList<String> listgot){
		ArrayList<Exhibition> list = new ArrayList<Exhibition>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= ExhibitionSQL.GETCONTENT;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			if(listgot.size()>0) {
				for(String codegot : listgot) {
					int codeInt = Integer.parseInt(codegot);
					pstmt.setInt(1, codeInt);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						int code = rs.getInt(1);
						String title= rs.getString(2);
						String artist= rs.getString(3);
						String content= rs.getString(4);
						String poster= rs.getString(5);
						Date s_date= rs.getDate(6);
						Date e_date= rs.getDate(7);
						int g_code= rs.getInt(8);
						int likes= rs.getInt(9);
						String director2= rs.getString(10);
						list.add(new Exhibition(code, title, artist, content, poster, s_date, e_date, g_code, likes, director2)); 
					}
				}
			}else {
				list.add(new Exhibition()); 
			}
			System.out.println("리턴한리스트사이즈:"+list.size());
			return list;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}

	}
	
	ArrayList<Exhibition> getExhibition(String director){
		ArrayList<Exhibition> list = new ArrayList<Exhibition>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= ExhibitionSQL.LIST;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, director);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int code = rs.getInt(1);
				String title= rs.getString(2);
				String artist= rs.getString(3);
				String content= rs.getString(4);
				String poster= rs.getString(5);
				Date s_date= rs.getDate(6);
				Date e_date= rs.getDate(7);
				int g_code= rs.getInt(8);
				int likes= rs.getInt(9);
				String director2= rs.getString(10);
				list.add(new Exhibition(code, title, artist, content, poster, s_date, e_date, g_code, likes, director)); 
			}
			return list;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}

	}
	
	Exhibition getExhibitionContent(int exhibitCode){
		Exhibition ExContent = new Exhibition(); 
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= ExhibitionSQL.GETCONTENT;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, exhibitCode);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int code = rs.getInt(1);
				String title= rs.getString(2);
				String artist= rs.getString(3);
				String content= rs.getString(4);
				String poster= rs.getString(5);
				Date s_date= rs.getDate(6);
				Date e_date= rs.getDate(7);
				int g_code= rs.getInt(8);
				int likes= rs.getInt(9);
				String director= rs.getString(10);
				ExContent = new Exhibition(code, title, artist, content, 
													poster, s_date, e_date, 
													g_code, likes, director); 
				
			}
			return ExContent;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	ArrayList<Exhibition> search(String searchName){
		ArrayList<Exhibition> searchResult = new ArrayList<Exhibition>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= ExhibitionSQL.SEARCH;
		System.out.println(sql);
		ResultSet rs = null;
		searchName= searchName.toLowerCase();
		String setString = "%"+searchName+"%";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, setString);
			pstmt.setString(2, setString);
			pstmt.setString(3, setString);
			pstmt.setString(4, setString);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int code = rs.getInt(1);
				String title= rs.getString(2);
				String artist= rs.getString(3);
				String content= rs.getString(4);
				String poster= rs.getString(5);
				Date s_date= rs.getDate(6);
				Date e_date= rs.getDate(7);
				int g_code= rs.getInt(8);
				int likes= rs.getInt(9);
				String director= rs.getString(10);
				searchResult.add(new Exhibition(code, title, artist, content, poster, s_date, e_date, g_code, likes, director)); 
			}
			return searchResult;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	   HashMap<String, String> getArtists() {
		      HashMap<String, String> artist_list = new HashMap<String, String>();
		      Connection con = null;
		      Statement stmt = null;
		      ResultSet rs = null;
		      String sql = ExhibitionSQL.ARTIST;
		      
		      try {
		         con = ds.getConnection();
		         stmt = con.createStatement();
		         rs = stmt.executeQuery(sql);
		         while(rs.next()) {
		            String artist = rs.getString("artist");
		            String poster = rs.getString("poster");
		            artist_list.put(artist, poster);
		         }
		         return artist_list;
		      }catch(SQLException se) {
		         se.printStackTrace();
		         return null;
		      }finally {
		         try {
		            if(rs != null) rs.close();
		            if(stmt != null) stmt.close();
		            if(con != null) con.close();
		         }catch(SQLException se) {}
		      }
		   }
	   
	  
		
}
