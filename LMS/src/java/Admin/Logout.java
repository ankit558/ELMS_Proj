package Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

 


@SuppressWarnings("serial")
public class Logout extends HttpServlet{
    public void doGet(HttpServletRequest req,HttpServletResponse res)
            throws ServletException,IOException
    {
        HttpSession hs=req.getSession(false);
        if(hs!=null)
            hs.invalidate();
        req.getRequestDispatcher("admin.html").forward(req,res);
    }

 

}