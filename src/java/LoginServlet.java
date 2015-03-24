

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jspBeans.Organization;
import jspBeans.User;

public class LoginServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        //get request parameters for userID and password
        String user = request.getParameter("user");
        String pwd = request.getParameter("pw");
        User account = Model.getUser(user, pwd);
        Organization org = Model.getOrg(user, pwd);
       
        if (user.equals("") || pwd.equals(""))
        {
            
        }
        
        else if (account != null)
        {
            Cookie idCookie = new Cookie("user_id", String.valueOf(account.getUser_id()));
            Cookie nameCookie = new Cookie("user_name", String.valueOf(account.getFullName()));
            //setting cookie to expiry in 30 mins
            idCookie.setMaxAge(30 * 60);
            nameCookie.setMaxAge(30 * 60);
            response.addCookie(idCookie);
            response.addCookie(nameCookie);
            response.sendRedirect("index.jsp");
        }
        
        else if (org != null)
        {
            response.sendRedirect("index.jsp");
        }
        
        else
        {
            RequestDispatcher rd
                    = getServletContext().getRequestDispatcher("/login.jsp");
            PrintWriter out = response.getWriter();
            //out.println("<font color = red>Either username or password is wrong.</font>");
            rd.include(request, response);
            //response.sendRedirect("index.jsp");
            rd.forward(request, response);
        }
    }
}
