<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"%>
<html><head><title>도서 삭제</title></head>
<body>
<%
	String s_id = (String)session.getAttribute("user");
	int B_num = Integer.parseInt(request.getParameter("b_num"));
%>
<%
	Connection myConn = null; String result = null;
	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user="ST2016112166"; String passwd="ST2016112166";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection (dburl, user, passwd);
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
	CallableStatement cstmt = myConn.prepareCall("{call DeleteBook(?,?)}");
	cstmt.setInt(1,B_num);
	cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
	try {
		cstmt.execute();
		result = cstmt.getString(2);
%>
<script>
	alert("<%= result %>");
	location.href="delete_book.jsp";
</script>
<%
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
	finally {
		if (cstmt != null)
			try { myConn.commit(); cstmt.close(); myConn.close(); }
			catch(SQLException ex) { }
	}
%>
</form></body></html>