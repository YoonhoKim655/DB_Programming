import java.sql.*; 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class emp_db extends HttpServlet { 
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
	response.setContentType("text/html");
	request.setCharacterEncoding("utf-8");
	
	String first="";
	String last="";
	String phone="";
	String birth="";
	String sex="";
	String job="";
	String salary="";
	
	first=request.getParameter("F_name");
	last = request.getParameter("L_name");
	phone = request.getParameter("phone");
	birth = request.getParameter("birth");
	sex = request.getParameter("sex");
	job = request.getParameter("job");
	salary = request.getParameter("salary");

	try{  
			Class.forName("oracle.jdbc.driver.OracleDriver");  
  
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","1234");  
			
			Statement stmt=con.createStatement();  
			String insert = "INSERT INTO emp VALUES("+"'"+first+"',"+"'"+last+"',"+"'"+phone+"',"+"'"+birth+"',"+"'"+sex+"',"+"'"+job+"',"+"'"+salary+"')";
  
			stmt.executeUpdate(insert);
		
		stmt.close();
		con.close();  
		}catch(Exception e){
			System.out.println(e);
			}
			System.out.println("Compelete to insert");
			System.out.println("<a href='employees.jsp'>"+"go back to employees"+"</a>");
	}
}	
