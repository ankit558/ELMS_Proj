package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
    HttpSession session;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();        
        String email=request.getParameter("username");
        String pass=request.getParameter("password");
        try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elms","root",""); 
         PreparedStatement ps=con.prepareStatement("Select * from admin where UserName='"+email+"' and Password='"+pass+"'");
         ResultSet rs=ps.executeQuery();
         if(rs.next())
         {  
             String ename=rs.getString("UserName");
             session=request.getSession(true);
             session.setAttribute("mailid",email);
             session.setAttribute("uname",ename);
             session.setMaxInactiveInterval(36000);        
             RequestDispatcher rd=getServletContext().getRequestDispatcher("/dashboard.jsp");
             request.setAttribute("passmsg",ename);
             rd.forward(request,response);
         }
         else
         {
             String msg = "Invalid Email or password";
             RequestDispatcher rd=getServletContext().getRequestDispatcher("/admin.html");
             request.setAttribute("passmsg",msg);
             rd.forward(request,response);     
             System.out.print(msg);
         }        
        }catch(Exception e)
        {
            out.println(e);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
