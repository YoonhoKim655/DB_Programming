<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html><head><title>대여 관리 </title></head>
<body>
<table width="75%" align="center" border>
<br>
<tr><th>회원 번호</th> <th>책 번호</th><th>대여 일</th><th>반납 일</th><th>삭제</th></tr>
<%
	Connection myConn = null; Statement stmt = null;
	ResultSet myResultSet = null; String mySQL = "";
	
	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user="ST2016112166"; String passwd="ST2016112166"; 
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}	
	mySQL = "select s_id, b_num, r_start, r_end from rental";
	myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet != null) {
	while (myResultSet.next()) {
	String s_id = myResultSet.getString("s_id");
	int b_num = myResultSet.getInt("b_num");
	String r_start = myResultSet.getString("r_start");
	String r_end = myResultSet.getString("r_end");
%>
<tr>
<td align="center"><%=s_id%></td> <td align="center"><%=b_num%></td>
<td align="center"><%=r_start%></td><td align="center"><%=r_end%></td>
<td align="center"><a href="manage_rental_verify.jsp?s_id=<%=s_id%>&b_num=<%=b_num%>">삭제</a></td>
</tr>
<%
	}
	}
	stmt.close(); myConn.close();
%>
</table></body></html>