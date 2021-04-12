<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html><head><title>회원 가입 대기</title></head>
<body>
<%@ include file="top.jsp" %>
<% 
	if (session_id==null) response.sendRedirect("login.jsp");
%>
<table width="75%" align="center" border>
<br>
<tr><th>회원 번호</th> <th>이름</th><th>주소</th><th>비밀번호</th><th>전화번호</th><th>승인</th><th>거절</th></tr>
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
	mySQL = "select t_s_id, s_name, s_addr, s_right, s_pwd, s_phone, s_overdue from temp";
	myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet != null) {
	while (myResultSet.next()) {
	String s_id = myResultSet.getString("t_s_id");
	String s_name = myResultSet.getString("s_name");
	String s_addr = myResultSet.getString("s_addr");
	String s_pwd = myResultSet.getString("s_pwd");
	String s_phone = myResultSet.getString("s_phone");
%>
<tr>
<td align="center"><%=s_id%></td> <td align="center"><%=s_name%></td>
<td align="center"><%=s_addr%></td> <td align="center"><%=s_pwd%> </td><td align="center"><%=s_phone%></td>
<td align="center"><a href="accept_verify.jsp?s_id=<%=s_id%>">승인</a></td>
<td align="center"><a href="reject.jsp?s_id=<%=s_id%>">거절</a></td>
</tr>
<%
	}
	}
	stmt.close(); myConn.close();
%>
</table></body></html>