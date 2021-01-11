package kas.index.model;

import java.sql.*;

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kas.domain.Exhibition;
import kas.exhibition.model.ExhibitionSQL;

class IndexDAO {
	private DataSource ds; 
	 IndexDAO(){
	      try {
	         Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/myoracle");
	      }catch(NamingException ne) {
	         System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
	      }
	   }
	 ArrayList<Exhibition> getExhibition(){
		 ArrayList<Exhibition> list = new ArrayList<Exhibition>(); 
			Connection con = null;
			String sql= IndexSQL.GETCONTENT;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				con = ds.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
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
					list.add(new Exhibition(code, title, artist, content, poster, s_date, e_date, g_code, likes, director)); 
				}
				return list;
			}catch(SQLException se){
				return null;
			}finally{
				try{
					if(stmt != null) stmt.close();
					if(rs != null) rs.close();
					if(con != null) con.close();
				}catch(SQLException se){}
			}
	} 
	 ArrayList<Exhibition> getKas(){
		 ArrayList<Exhibition> list = new ArrayList<Exhibition>(); 
			Connection con = null;
			String sql= IndexSQL.GETKAS;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				con = ds.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
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
					System.out.println("code: "+code+", director: "+director);
					list.add(new Exhibition(code, title, artist, content, poster, s_date, e_date, g_code, likes, director)); 
				}
				return list;
			}catch(SQLException se){
				System.out.println(se);
				return null;
			}finally{
				try{
					if(stmt != null) stmt.close();
					if(rs != null) rs.close();
					if(con != null) con.close();
				}catch(SQLException se){
					
				}
			}
	} 
}
