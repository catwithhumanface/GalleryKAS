package kas.review.model;



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
import kas.domain.Review;
import kas.exhibition.model.ExhibitionSQL;


class ReviewDAO {
	private DataSource ds; 
	ReviewDAO(){
	      try {
	         Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/myoracle");
	      }catch(NamingException ne) {
	         System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
	      }
	   }
	
	ArrayList<String> getExTitle(){
		ArrayList<String> list = new ArrayList<String>();
		Connection con = null;
		Statement stmt = null;
		String sql= ReviewSQL.LIST;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String title= rs.getString(1);
				list.add(title); 
			}
			return list;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	String getExPoster(String exTitle) {
		String ExPoster="";
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = ReviewSQL.GETPOSTER;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, exTitle);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String poster = rs.getString(1);
				ExPoster = poster;
			}
			return ExPoster;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	int getExCode(String exTitle) {
		int exCode = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = ReviewSQL.GETCODE;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, exTitle);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int code = rs.getInt(1);
				exCode = code;
			}
			return exCode;
		}catch(SQLException se){
			return 0;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	void writeReview(Review newPost) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= ReviewSQL.WRITE;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, newPost.getCode());
			pstmt.setString(2, newPost.getEmail());
			pstmt.setString(3, newPost.getTitle());
			pstmt.setString(4, newPost.getPoster());
			pstmt.setString(5, newPost.getName());
			pstmt.setString(6, newPost.getContent());
			System.out.println(newPost.getCode()+newPost.getEmail()+newPost.getContent());
			//insert into REVIEW values(REVIEW_IDX.nextval,?,?,?,?,?,?,SYSDATE,0)
			int i = pstmt.executeUpdate();
			System.out.println(i+"행이 갱신되었습니다");
		}catch(SQLException se){
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	Review getReview(int idxGot) {
		Review reviewGot = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = ReviewSQL.GETREVIEW;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idxGot);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int idx = rs.getInt(1);
				int code = rs.getInt(2);
				String email = rs.getString(3);
				String title = rs.getString(4);
				String poster = rs.getString(5);
				String name = rs.getString(6);
				String content = rs.getString(7);
				Date w_date = rs.getDate(8);
				int views= rs.getInt(9);
				reviewGot = new Review(idx, code, email, title, poster, name, content,
						w_date, views);
			}
			return reviewGot;
		}catch(SQLException se){
			return reviewGot;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	ArrayList<Review> getListReview(){
		ArrayList<Review> ListReview = new ArrayList<Review>();
		Connection con = null;
		Statement stmt = null;
		String sql= ReviewSQL.GETLISTREVIEW;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				int idx = rs.getInt(1);
				int code = rs.getInt(2);
				String email = rs.getString(3);
				String title = rs.getString(4);
				String poster = rs.getString(5);
				String name = rs.getString(6);
				String content = rs.getString(7);
				Date w_date = rs.getDate(8);
				int views= rs.getInt(9);
				Review review = new Review(idx, code, email, title, poster, name, content,
						w_date, views);
				ListReview.add(review);
			}
			return ListReview;
		}catch(SQLException se){
			return ListReview;
		}finally{
			try{
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	String getReviewT(int code) {
		String title = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = ReviewSQL.GETTITLE;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String titlegot = rs.getString("TITLE");
				title = titlegot;
			}
			return title;
		}catch(SQLException se){
			System.out.println(se);
			return title;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	void editReview(int code, String title, String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= ReviewSQL.EDIT;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, code);
			int i = pstmt.executeUpdate();
			System.out.println("ediet:"+i+"행이 갱신되었습니다");
		}catch(SQLException se){
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	ArrayList<Review> getListResult(int currentPage, int pageSize) {
		ArrayList<Review> list = new ArrayList<Review>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = ReviewSQL.LIST_PAGE;
		
		int startRow = (currentPage-1)*pageSize;
		int endRow = currentPage*pageSize;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int idx = rs.getInt(2);
				int code = rs.getInt(3);
				String email= rs.getString(4);
				String title = rs.getString(5);
				String poster= rs.getString(6);
				String name= rs.getString(7);
				String content= rs.getString(8);
				Date w_date = rs.getDate(9);
				int views= rs.getInt(10);
				System.out.println("idx: "+idx+", views: "+views);
				Review r = new Review(idx, code, email, title, poster, name, content, w_date, views);
				list.add(r);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	long getTotalCount() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = ReviewSQL.COUNT;
		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				long count = rs.getLong(1);
				return count;
			}else {
				return -1L;
			}
		}catch(SQLException se) {
			return -1L;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	ArrayList<Review> getSearch(String c_code, String searchName){
		ArrayList<Review> review_list = new ArrayList<Review>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		if(c_code.equals("NAME")) {
			sql= ReviewSQL.SEARCHNAME;
		}else if(c_code.equals("TITLE")) {
			sql= ReviewSQL.SEARCHTITLE;
		}
		String searchName2 = "%"+searchName+"%";
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, searchName2);	
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int idx = rs.getInt("idx");
				int code = rs.getInt("code");
				String email= rs.getString("email");
				String title = rs.getString("title");
				String poster= rs.getString("poster");
				String name= rs.getString("name");
				String content= rs.getString("content");
				Date w_date = rs.getDate("w_date");
				int views= rs.getInt("views");
				review_list.add(new Review(idx, code, email, title, poster, name, content, w_date, views)); 
			}
			return review_list;
		}catch(SQLException se){
			System.out.println("se: "+se);
			se.printStackTrace();
			return null;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	void updateView(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= ReviewSQL.VIEW;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			int i = pstmt.executeUpdate();
			System.out.println(i+"행이 갱신되었습니다");
		}catch(SQLException se){
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	void delete(int idx) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      String sql= ReviewSQL.DELETE;
	      try {
	         con = ds.getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, idx);
	         int i = pstmt.executeUpdate();
	         System.out.println(i+"행이 갱신되었습니다");
	      }catch(SQLException se){
	      }finally{
	         try{
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         }catch(SQLException se){}
	      }
	   }
}
