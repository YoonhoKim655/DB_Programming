import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class server extends HttpServlet {
   private String message;
   int count=0;
   public void init() throws ServletException {
        message = "you're completed reservation.";
   }

public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
      
	response.setContentType("text/html");
	request.setCharacterEncoding("utf-8");

	PrintWriter out = response.getWriter();
	
	String name=request.getParameter("name");
	String email = request.getParameter("email");
	String index=request.getParameter("colrow");
	String time=request.getParameter("time");
		String Content=name+","+email+","+index+","+time+"\r\n";
		
		
		File contents = new File("/Tomcat8/webapps/ROOT/reservation.txt");
		FileWriter writer = null;
		
		try{
			FileReader reader = new FileReader(contents);
			count = 0;
			
			BufferedReader BufReader = new BufferedReader(reader);
			while(true){
				String str = BufReader.readLine();
				if(str == null){
								break;
							}
				String[] _str=str.split(",");
				if(_str[0].equals(name) && _str[1].equals(email)){
					count++;
				}
			}
			out.println("<h1><i>" + message + "</i></h1>");
			BufReader.close();
		}catch (FileNotFoundException e) {
           try{
				writer = new FileWriter(contents, true);
				writer.write(Content);
				writer.flush();
				out.println("<h1><i>" + Content + "</i></h1>");
			}catch(IOException x){
			x.printStackTrace();
			}finally{
				try{
					if(writer != null)writer.close();
				}catch(IOException a){
					a.printStackTrace();
				}
			}
        }catch(IOException e){
            out.println(e);
        }
		if(count < 3){
			try{
				writer = new FileWriter(contents, true);
				writer.write(Content);
				writer.flush();
			}catch(IOException e){
			e.printStackTrace();
			}finally{
				try{
					if(writer != null)writer.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
		else{
			out.println("<script>alert('You have exceeded the maximum reservation limit.');</script>");
		}
		out.println("<a href='project.jsp'>"+"return to main page"+"</a>");
   }

   public void destroy() {
   
   }

}
