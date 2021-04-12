<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>수업 정보</title></head>
<body>

	<%
		String s_id = (String) session.getAttribute("user");
		String c_id = request.getParameter("c_id");
		int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));

		Connection myConn = null;
		String result = null;
		String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
		String user = "ST2016112166"; 
		String passwd = "ST2016112166";
		String dbdriver = "oracle.jdbc.driver.OracleDriver";

		try {
			Class.forName(dbdriver);
			myConn = DriverManager.getConnection(dburl, user, passwd);
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
		}

		CallableStatement cstmt = myConn.prepareCall("{call InformClass(?, ?, ?)}");
		cstmt.setString(1, c_id);
		cstmt.setInt(2, c_id_no);
		cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
		try {
			cstmt.execute();
			result = cstmt.getString(3);
			System.out.println(result);
	%>
	<script>	
	alert("<%=result%>");
		location.href = "insert.jsp";
	</script>
	<%
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
		} finally {
			if (cstmt != null)
				try {
					myConn.commit();
					cstmt.close();
					myConn.close();
				} catch (SQLException ex) {

				}
		}
	%>
</body></html>