package Employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

 


@SuppressWarnings("serial")
public class ELogout extends HttpServlet{
    public void doGet(HttpServletRequest req,HttpServletResponse res)
            throws ServletException,IOException
    {
        HttpSession hs=req.getSession(false);
        if(hs!=null)
            hs.invalidate();
        req.getRequestDispatcher("employee.html").forward(req,res);
    }

 

}