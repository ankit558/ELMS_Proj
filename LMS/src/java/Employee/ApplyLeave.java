package Employee;

import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.http.*;

public class ApplyLeave extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html"); 
                
                String ltype = req.getParameter("Leave");
		String fromdate = req.getParameter("fromdate");
		String todate = req.getParameter("todate");
		String description = req.getParameter("description");
		               
		try {
			Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elms","root",""); 
			PreparedStatement ps=con.prepareStatement("insert into apl values(?,?,?,?,?)");
                        
                        ps.setString(1,ltype);
                        ps.setString(2, fromdate);
                        ps.setString(3, todate);			
			ps.setString(4, description);
                        ps.setInt(5,0);
                        
			int k=ps.executeUpdate();
			if(k==1)
			{
			pw.print("<br><font color='white'><b><center>Leave Applied Successfull.</center></b></font>");	
			req.getRequestDispatcher("applyleave.html").include(req, res);
			}
			else
			{
				pw.println("<h2>Some thing is wrong.Try Again</h2>");
				req.getRequestDispatcher("applyleave.html").include(req, res);
			}
		} catch (Exception e) {pw.println(e);}
	}
}