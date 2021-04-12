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
<tr><th>책번호 </th> <th>제목</th><th>작가</th><th>출판사</th><th>대여 가능 권수</th></tr>
<%
	String b_title = request.getParameter("b_title");

	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;

	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user = "ST2016112166"; // 본인 아이디(ex.STxxxxxxxxxx)
	String passwd = "ST2016112166"; // 본인 패스워드(ex.STxxxxxxxxxx)
	String dbdriver = "oracle.jdbc.OracleDriver";

	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();

	mySQL = "select b_num, b_quantity, b_writer, b_publish from book where b_title='" + b_title + "'";

	ResultSet myResultSet = stmt.executeQuery(mySQL);

	myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet != null) {
	while (myResultSet.next()) {
	int B_num = myResultSet.getInt("b_num");
	int quantity = myResultSet.getInt("b_quantity");
	String writer = myResultSet.getString("b_writer");
	String publishment = myResultSet.getString("b_publish");
%>
<tr>
<td align="center"><%=B_num%></td> <td align="center"><%=b_title%></td>
<td align="center"><%=writer%></td><td align="center"><%=publishment%></td>
<td align="center"><%=quantity%></td>
</tr>
<%
	}
	}else {
%>
<script>
	alert("검색하신 책은 없는 책입니다.");
	location.href = "search_book.jsp";
</script>
<%
	}
	stmt.close(); myConn.close();
%>
</table></body></html>