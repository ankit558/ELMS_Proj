package Employee;

import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.http.*;

public class EchangePassword extends HttpServlet{
    HttpSession session;
    @Override
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
                String oldpass = req.getParameter("op");
		String newpass = req.getParameter("np");
		String cnewpass = req.getParameter("c_np");
                
                session=req.getSession(true);
                String email=(String) session.getAttribute("EmailId");
		try {
			Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elms","root",""); 
                        if(newpass.equals(cnewpass))
                        {
                            String sql = "UPDATE tblemployees SET Password = '"+newpass+"' WHERE EmailId ='"+email+"'";
                            Statement ps = con.createStatement();
                            ps.executeUpdate(sql);
                            pw.print("<br><font color='white'><b><center>Password changed successfully.</center></b></font>");
                            req.getRequestDispatcher("EchangePassword.html").include(req, res);
                        }
                        else
                        {
                            pw.print("<br><font color='white'><b><center>Passwords do not match.</center></b></font>");
                            req.getRequestDispatcher("EchangePassword.html").include(req, res);
                        }
		} catch (Exception e) {pw.println(e);}
	}
}