import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jspBeans.Organization;
import jspBeans.User;

public class LogoutServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        Cookie idCookie = null;
        Cookie nameCookie = null;
        
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
        {
            for (Cookie cookie : cookies)
            {
                if (cookie.getName().equals("user_name"))
                {
                    nameCookie = cookie;
                }
                
                if (cookie.getName().equals("user_id"))
                {
                    idCookie = cookie;
                }
            }
        }

        HttpSession session = request.getSession();
        session.invalidate();
        if (idCookie != null && nameCookie != null)
        {
        idCookie.setMaxAge(0);
        nameCookie.setMaxAge(0);
        response.addCookie(idCookie);
        response.addCookie(nameCookie);
        }
        response.sendRedirect("index.jsp");
    }
}
