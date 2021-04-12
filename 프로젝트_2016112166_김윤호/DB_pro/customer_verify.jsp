<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"%>
<html><head><title>고객 관리</title></head>
<body>
<%
	String s_id = request.getParameter("s_id");
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
	CallableStatement cstmt = myConn.prepareCall("{call DeleteStaff(?,?)}");
	cstmt.setString(1, s_id);
	cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
	try {
		cstmt.execute();
		result = cstmt.getString(2);
%>
<script>
	alert("<%= result %>");
	location.href="manage_customer.jsp";
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