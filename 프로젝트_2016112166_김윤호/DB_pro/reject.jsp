<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>Insert title here</title></head>
<body>
<%
	String s_id = request.getParameter("s_id");

	Connection myConn = null;  
	Statement stmt = null;  
	String mySQL = "";

	String dburl  = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user="ST2016112166"; // 본인 아이디(ex.ST0000000000)
	String passwd="ST2016112166"; // 본인 패스워드(ex.ST0000000000)
	String dbdriver = "oracle.jdbc.driver.OracleDriver";    

	try {
		Class.forName(dbdriver);
		myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();	
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
    mySQL = "DELETE FROM TEMP WHERE T_S_ID = '"+s_id+"'";
	try {		
		stmt.executeQuery(mySQL);  
%>

<script>
	alert("가입을 거절했습니다.");       
	location.href="accept.jsp";
</script>
<%    
	} catch(SQLException ex) {
		String sMessage ="잠시 후 다시 시도하십시오";	
%>
<script>
	alert("<%= sMessage %>");    
	location.href="accept.jsp";
</script>
<%	
	} finally {
		if (stmt != null)   try { 	stmt.close();  myConn.close(); }
		catch(SQLException ex) { }
	}
%>
</body></html>
