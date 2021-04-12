<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html><head><title>도서 대여 </title></head>
<body>
<%@ include file="top.jsp" %>
<% 
	if (session_id==null) response.sendRedirect("login.jsp");
%>
<table width="75%" align="center" border>
<br>
<tr><th>책번호 </th> <th>제목</th><th>작가</th><th>출판사</th><th>대여가능 권수</th><th>대여 </th></tr>
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
	mySQL = "SELECT b_num, b_title, b_quantity, b_writer, b_publish FROM BOOK";
	myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet != null) {
	while (myResultSet.next()) {
	String title = myResultSet.getString("b_title");
	int B_num = myResultSet.getInt("b_num");
	int quantity = myResultSet.getInt("b_quantity");
	String writer = myResultSet.getString("b_writer");
	String publishment = myResultSet.getString("b_publish");
%>
<tr>
<td align="center"><%=B_num%></td> <td align="center"><%=title%></td>
<td align="center"><%=writer%></td><td align="center"><%=publishment%></td>
<td align="center"><%=quantity%></td>
<td align="center"><a href="insert_verify.jsp?b_num=<%=B_num%>">대여</a></td>
</tr>
<%
	}
	}
	stmt.close(); myConn.close();
%>
</table></body></html>