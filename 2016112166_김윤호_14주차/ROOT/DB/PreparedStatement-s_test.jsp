<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection myConn = null;     
	int result; 
	String sql = "";

	String user="ST2016112166"; // 본인 아이디(ex.ST0000000000)
	String dburl  = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String passwd="ST2016112166"; // 본인 패스워드(ex.ST0000000000)
	String dbdriver = "oracle.jdbc.driver.OracleDriver";    
	
	try {
		Class.forName(dbdriver);
		myConn =  DriverManager.getConnection (dburl, user, passwd);
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
	
	try{
		sql = "Insert into Member(id, name) values ('Hong', '홍길동')";
		Statement stmt = myConn.createStatement();
		
		result = stmt.executeUpdate(sql);
		
		if(result != 0){
			out.println("<h3>레코드를 등록하였습니다.</h3>");
		}
	}catch (Exception ex){
		ex.printStackTrace();
		System.err.println("SQLException : " + ex.getMessage());
	}
%>