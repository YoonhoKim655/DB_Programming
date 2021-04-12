import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*; 

public class HelloWorld extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
      
	response.setContentType("text/html");
	request.setCharacterEncoding("utf-8");
	

	String first=request.getParameter("F_name");
	String last = request.getParameter("L_name");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	String sex = request.getParameter("sex");
	String job = request.getParameter("job");
	String salary = request.getParameter("salary");
	String insert = "insert into emp values("+"'"+first+"',"+"'"+last+"',"+"'"+phone+"',"+"'"+birth+"',"+"'"+sex+"',"+"'"+job+"',"+"'"+salary+"')";
	System.out.println(insert);
	try{  
			Class.forName("oracle.jdbc.driver.OracleDriver");  
  
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","1234");  
			
			Statement stmt=con.createStatement();  
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
