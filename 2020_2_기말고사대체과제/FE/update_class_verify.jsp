<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>과목정보수정</title>
	</head>
	<body>
	<%	
		request.setCharacterEncoding("utf-8");
		String session_id = request.getParameter("p_id");
		String c_id = request.getParameter("c_id");
		int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
		String t_where = request.getParameter("t_where");
		
		Connection myConn = null;  
		CallableStatement cstmt = null;  
		String sMessage = null;  
		
		String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
		String user = "FE2016112166";	// 본인 아이디(ex.FE0000000000)
		String passwd = "FE2016112166";	// 본인 패스워드(ex.FE0000000000)
		String dbdriver = "oracle.jdbc.driver.OracleDriver";
		
		if (t_where.equals("")){
			%>
			<script>
				alert("입력란을 입력해주세요.");			
				location.href = "update_class.jsp?p_id="+"<%=session_id%>"+"&c_id="+"<%=c_id%>"+"&c_id_no="+"<%=c_id_no%>";
			</script>
			<%
		}else{
			try{								
				int t_time = Integer.parseInt(request.getParameter("t_time"));					
				try {
					Class.forName(dbdriver);
					myConn =  DriverManager.getConnection (dburl, user, passwd);
					cstmt = myConn.prepareCall("{call UPDATECLASS(?,?,?,?,?,?)}");
					cstmt.setInt(1,t_time);
					cstmt.setString(2, t_where);
					cstmt.setString(3, session_id);
					cstmt.setString(4, c_id);
					cstmt.setInt(5,c_id_no);
					cstmt.registerOutParameter(6, java.sql.Types.INTEGER);
					cstmt.execute();
					sMessage = cstmt.getString(6);
				%>
				<script>
					alert("<%=sMessage%>");       
					location.href="insert_teach.jsp";
				</script>
				<%    
					cstmt.close();  
					myConn.close(); 
				} catch(SQLException ex) {
					System.err.println("SQLException: " + ex.getMessage());				
				} 	
			%>
			<%
			} catch (Exception ex) {
				%>
				<script>		
					alert("입력란을 입력해주세요.");			
					location.href = "update_class.jsp?p_id="+"<%=session_id%>"+"&c_id="+"<%=c_id%>"+"&c_id_no="+"<%=c_id_no%>";
				</script>
				<%
			}
		}
			%>
	</body>
</html>

