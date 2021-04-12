<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>도서 정보 수정</title></head>
<body>
<%
	int b_num = Integer.parseInt(request.getParameter("b_num"));
	

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

	mySQL = "select b_title, b_writer, b_publish, b_quantity from book where b_num=" + b_num;

	ResultSet myResultSet = stmt.executeQuery(mySQL);

	if (myResultSet.next()) {
		String b_title = myResultSet.getString("b_title");
		String b_writer = myResultSet.getString("b_writer");
		String b_publish = myResultSet.getString("b_publish");
		int b_quantity = myResultSet.getInt("b_quantity");
%>

<form method="post" action="update_book_verify2.jsp">
	<input type="hidden" name="b_num" size="30" value="<%= b_num %>">
  <table width="75%" align="center" border>
	<tr><th>제목</th>
         <td><input type="text" name="b_title" size="50" value="<%= b_title %>"> </td>
     </tr>
	 <tr><th>작가</th>
         <td><input type="text" name="b_writer" size="50" value="<%= b_writer %>"> </td>
     </tr>
	 <tr><th>출판사</th>
         <td><input type="text" name="b_publish" size="20"  value="<%= b_publish %>"></td>
     </tr>
	<tr><th>수량</th>
         <td><input type="text" name="b_quantity" size="50" value="<%= b_quantity %>"> </td>
     </tr>

<%
	} else {
%>

<script>
	alert("없는 책 번호입니다.");
	location.href = "update_book.jsp";
</script>
<%
	}
	stmt.close();
	myConn.close();
%>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="수정">
	</td> 
</tr>
</table></form></body></html>