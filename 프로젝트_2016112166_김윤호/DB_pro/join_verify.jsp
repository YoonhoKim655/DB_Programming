<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String t_id = request.getParameter("t_id");
	String t_pwd = request.getParameter("t_pwd");
	String t_name = request.getParameter("t_name");
	String t_phone = request.getParameter("t_phone");
	String t_addr = request.getParameter("t_addr");

	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;
	String result = null;
	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user = "ST2016112166"; // 본인 아이디(ex.STxxxxxxxxxx)
	String passwd = "ST2016112166"; // 본인 패스워드(ex.STxxxxxxxxxx)
	String dbdriver = "oracle.jdbc.OracleDriver";

	try {
		Class.forName(dbdriver);
		myConn =  DriverManager.getConnection (dburl, user, passwd);	
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
	CallableStatement cstmt = myConn.prepareCall("call InsertTemp(?,?,?,?,?,?)");
	cstmt.setString(1,t_id);
	cstmt.setString(2,t_pwd);
	cstmt.setString(3,t_addr);
	cstmt.setString(4,t_name);
	cstmt.setString(5,t_phone);
	cstmt.registerOutParameter(6, java.sql.Types.VARCHAR);

	try{
		cstmt.execute();
		result = cstmt.getString(6);
%>
<script>
	alert("<%= result %>");
	location.href="main.jsp";
</script>
<%
	}catch (SQLException ex){
		System.err.println("SQLException : " + ex.getMessage());
	}finally {
		if(cstmt != null)
			try{
				myConn.commit();
				cstmt.close();
				myConn.close();
			}catch (SQLException ex){
				
			}
	}
%>