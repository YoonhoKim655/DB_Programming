<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>Insert title here</title></head>
<body>
<%
	int b_num = Integer.parseInt(request.getParameter("b_num"));

	String b_title = new String(request.getParameter("b_title").getBytes("8859_1"),"utf-8");
	String b_writer = new String(request.getParameter("b_writer").getBytes("8859_1"),"utf-8"); 
	String b_publish = new String(request.getParameter("b_publish").getBytes("8859_1"),"utf-8"); 	
	int b_quantity = Integer.parseInt(request.getParameter("b_quantity"));	

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
    mySQL = "insert into book (b_num, b_title, b_quantity, b_writer, b_publish) values (";
	mySQL = mySQL + b_num + " , '" ;	
	mySQL = mySQL + b_title +"' , ";
	mySQL = mySQL + b_quantity +" , '";
	mySQL = mySQL + b_writer +"' , '";
	mySQL = mySQL + b_publish +"' ) ";
	try {		
		stmt.executeQuery(mySQL);  
%>

<script>
	alert("도서가 추가 되었습니다.");       
	location.href="update.jsp";
</script>
<%    
	} catch(SQLException ex) {
		String sMessage;
		if (ex.getErrorCode() == 20006) sMessage="같은 책의 번호가 이미 사용이 되었습니다.";
		else sMessage="잠시 후 다시 시도하십시오";	
%>
<script>
	alert("<%= sMessage %>");    
	location.href = "insert_book.jsp";
</script>
<%	
	} finally {
		if (stmt != null)   try { 	stmt.close();  myConn.close(); }
		catch(SQLException ex) { }
	}
%>
</body></html>
