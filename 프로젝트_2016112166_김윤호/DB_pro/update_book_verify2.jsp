<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>도서 정보 수정</title></head>
<body>
<%
	String b_num = request.getParameter("b_num");

	String b_title = new String(request.getParameter("b_title").getBytes("8859_1"),"utf-8");
	String b_writer = new String(request.getParameter("b_writer").getBytes("8859_1"),"utf-8"); 
	int b_quantity = Integer.parseInt(request.getParameter("b_quantity")); 	
	String b_publish = new String(request.getParameter("b_publish").getBytes("8859_1"),"utf-8");	

	Connection myConn = null;  
	Statement stmt = null;  
	String mySQL = "";

	String dburl  = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user="ST2016112166"; // 본인 아이디(ex.ST0000000000)
	String passwd="ST2016112166"; // 본인 패스워드(ex.ST0000000000)
	String dbdriver = "oracle.jdbc.driver.OracleDriver";    

	try {
		Class.forName(dbdriver);
		myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();	
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
    mySQL = "update book ";
	mySQL = mySQL + " set b_title ='" + b_title + "' , " ;
	mySQL = mySQL + " b_quantity =" + b_quantity +" , ";
	mySQL = mySQL + " b_writer ='" + b_writer +"' , ";
	mySQL = mySQL + " b_publish ='" + b_publish + "' where b_num='" + b_num + "' "; 
	try {		
		stmt.executeQuery(mySQL);  
%>

<script>
	alert("도서 정보가 수정되었습니다.");       
	location.href="update_book.jsp";
</script>
<%    
	} catch(SQLException ex) {
		String sMessage;
		if (ex.getErrorCode() == 20007) sMessage="수량은 숫자를 입력하세요";
		else sMessage="잠시 후 다시 시도하십시오";	
%>
<script>
	alert("<%= sMessage %>");    
	location.href = "update_book.jsp";
</script>
<%	
	} finally {
		if (stmt != null)   try { 	stmt.close();  myConn.close(); }
		catch(SQLException ex) { }
	}
%>
</body></html>
