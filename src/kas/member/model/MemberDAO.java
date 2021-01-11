package kas.member.model;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kas.domain.Member;

class MemberDAO {
	private DataSource ds;
	MemberDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}
	}
	
	Member getMember(String email){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = MemberSQL.CONTENT;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, email);
	    	rs	= pstmt.executeQuery();
	    	if(rs.next()) {
	    		//String email = rs.getString("email");
	    		String name = rs.getString("name");
	    		String pwd = rs.getString("password");
	    		String likeList = rs.getString("likeList");
	    		return new Member(email, name, pwd, likeList);
	    	}else {
	    		return null;
	    	}
	    }catch(SQLException se) {
	    	System.out.println("se: " + se);
	    	return null;
	    }finally {
	    	try {
	    		if(rs != null) rs.close();
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
	
	int signUp(Member m){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    String sql = MemberSQL.SIGN_UP;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);	    	
	    	pstmt.setString(1, m.getEmail());
	    	pstmt.setString(2, m.getName());
	    	pstmt.setString(3, m.getPwd());
	    	
	    	int i = pstmt.executeUpdate();
	    	
	    	if (i==1) {
	    		return MemberSet.SIGN_UP_OK; 
	    	}else {
	    		return MemberSet.SIGN_UP_FAIL;
	    	}
	    } catch (SQLIntegrityConstraintViolationException scve) {
	    	System.out.println("scve: " + scve);
	    	return MemberSet.DUPLICATION;
	    } catch(SQLException se) {
	    	System.out.println("se: " + se);
	    	return MemberSet.SIGN_UP_FAIL;	    	
	    }finally {
	    	try {
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
	
	String likeIt(String likelistTotal, int code, String email){
		String likelistNew ="";
		Connection con = null;
	    PreparedStatement pstmt = null;
	    PreparedStatement pstmt1 = null;
	    ResultSet rs = null;
	    String sql = MemberSQL.LIKE;
	    String codePlus = likelistTotal+code+"#";
	    String sql1 = MemberSQL.LIKELIST;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);	    	
	    	pstmt.setString(1, codePlus);
	    	pstmt.setString(2,email);
	    	int i = pstmt.executeUpdate();
	    	if(i>0) {
	    		pstmt1 = con.prepareStatement(sql1);	    
	    		pstmt1.setString(1, email);
	    		rs	= pstmt1.executeQuery();
	    		while(rs.next()) {
	    			likelistNew = rs.getString("LIKELIST");
	    		}
	    		return likelistNew;
	    	}
	    	return likelistNew;
	    } catch(SQLException se) {	
	    
	    	System.out.println(se);
	    	return likelistNew;
	    }finally {
	    	try {
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}

	void likeOff(String likelistTotal, int code, String email){
		
		String likelistNew ="";
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;  
	    String sql = MemberSQL.LIKE;
    	try {
    		con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);	    	
	    	pstmt.setString(1, likelistTotal);
	    	pstmt.setString(2,email);
	    	pstmt.executeUpdate();
    	}catch(SQLException se) {	
	    }finally {
	    	try {
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
}