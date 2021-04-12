<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>수강정원변경</title>
	</head>
	<body>
 		<script>
 			var message = "";
		<%
			String p_id = (String)session.getAttribute("user");
			String result = null;		       
			String cid[] = request.getParameterValues("cid");
			String cidno[] = request.getParameterValues("cidno");
			String cunit[] = request.getParameterValues("cunit");
			String tmax[] = request.getParameterValues("tmax");		
			int len = cid.length;
            	   
		   
			Connection myConn = null;     
			CallableStatement cstmt = null;
			String mySQL = "";
		
			String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
			String user = "FE2016112166";	// 본인 아이디(ex.FE0000000000)
			String passwd = "FE2016112166";	// 본인 패스워드(ex.FE0000000000)
			String dbdriver = "oracle.jdbc.driver.OracleDriver";    
			
			try {
				Class.forName(dbdriver);
				myConn = DriverManager.getConnection(dburl, user, passwd);	
				for(int i = 0; i < len; i++)
				{
					int t_max = Integer.parseInt(tmax[i]);
					int t_cidno = Integer.parseInt(cidno[i]);
					cstmt = myConn.prepareCall("{? = call UPDATETEACH(?,?,?,?,?)}");
					cstmt.setInt(1,t_max);
					cstmt.setString(2,p_id);
					cstmt.setString(3, cid[i]);
					cstmt.setInt(4,t_cidno);
					cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
					cstmt.execute();
					result = cstmt.getString(5);
					result = result +"\n";
					
		%>

					
		<%         
				}
				cstmt.close();  
				myConn.close();
			} catch(SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
			} 
		%>
			alert(result);
			location.href = "update_teach.jsp";
		</script> 
	</body>
</html>