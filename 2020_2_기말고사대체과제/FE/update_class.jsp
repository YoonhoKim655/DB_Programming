<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
<html>
	<head>
		<title>과목정보수정</title>
	</head>
	<body>
	<%@ include file="top.jsp" %>
	<%
		if (session_id==null) response.sendRedirect("login.jsp");
	
		Connection conn = null;     
		Statement stmt = null;	
		ResultSet myResultSet = null; 
	   	CallableStatement cstmt1 = null;
		CallableStatement cstmt2 = null;
	   	int nYear = 0;
		int nSemester = 0;
		String mySQL = "";
	
		String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
		String user = "FE2016112166";	// 본인 아이디(ex.FE0000000000)
		String passwd = "FE2016112166";	// 본인 패스워드(ex.FE0000000000)
		String dbdriver = "oracle.jdbc.driver.OracleDriver";    
	   
		String cid = request.getParameter("c_id");                                                             
		String cidno = request.getParameter("c_id_no");    
	
		try {
			
			Class.forName(dbdriver);
	    myConn =  DriverManager.getConnection (dburl, user, passwd);
	    stmt = myConn.createStatement();	
			
		} catch(SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
		}                                                      
		mySQL = "select c.c_name cname, p.p_name t.t_where twhere, t.t_time ctime from teach t, course c, professor p where t.c_id='" + cid + "' and c.c_id = t.c_id and t.c_id_no = " + cidno +" and c.c_id_no = t.c_id_no and p.p_id = t.p_id" ;
		myResultSet = stmt.executeQuery(mySQL);
		if (myResultSet.next()) {
			String c_name = myResultSet.getString("cname");
			String c_twhere = myResultSet.getString("twhere");
			String c_time = myResultSet.getString("ctime");
			String p_name = myResultSet.getString("pname");
	%>
		<form name="update_class" method="post" action="update_class_verify.jsp">
			<input type="hidden" name="p_id" size="30" value="<%= session_id %>">
			<table width="75%" align="center" border>
				<tr>
					<th>과목명</th>
					<td><%= c_name %></td>
				</tr>
				<tr>
					<th>분반</th>
					<td><%= cidno %><input type="hidden" name="c_id_no" value="<%=cidno%>"></td>
				</tr>
				<tr>
				 	<th>교수명</th>
					<td><%= p_name %></td>
				</tr>
				<tr>
			    	<th>강의실</th>
					<td>
						<select name="t_where">
							<option value=""></option>
							<option value="인-201">인-201</option>
							<option value="인-202">인-202</option>
							<option value="인-309">인-309</option>
							<option value="인-310">인-310</option>
							<option value="숭-201">숭-201</option>
							<option value="숭-202">숭-202</option>
							<option value="숭-301">숭-301</option>
							<option value="숭-417">숭-417</option>
						</select>
					</td>
				</tr>      
				<tr>
					<th>시간</th>
				<% if (c_time == null) {%>
						<td><input type="text" name="t_time" size="5"  value=""></td>
				<% } else { %>
						<td><input type="text" name="t_time" size="5"  value="<%= c_time %>"></td>
				<% } %>					
				</tr>      
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="c_id" value="<%=cid%>">
						<input type="submit" value="수정">
					</td> 
				</tr>
			</table>
		</form>
		<script>
			document.update_class.t_where.value = "<%=c_twhere%>";
		</script>
	<%
		}	
		cstmt1.close();  
		cstmt2.close();  
		stmt.close();  
		conn.close();
	%>
	</body>
</html> 