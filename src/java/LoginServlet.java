/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jolo Simeon
 */
public class LoginServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        //get request parameters for userID and password
        String user = request.getParameter("user");
        String pwd = request.getParameter("pw");

        if (user.equals("") || pwd.equals(""))
        {
            RequestDispatcher rd
                    = getServletContext().getRequestDispatcher("/login.jsp");
            PrintWriter out = response.getWriter();
            //out.println("<font color = red>Either username or password is wrong.</font>");
            rd.include(request, response);
        } 
        else
        {
            
            Cookie loginCookie = new Cookie("user", user);
            int orders = 0;
            Cookie orderCookie = new Cookie("totalOrders", String.valueOf(orders));
            //setting cookie to expiry in 30 mins
            loginCookie.setMaxAge(30 * 60);
            orderCookie.setMaxAge(30 * 60);
            response.addCookie(loginCookie);
            response.addCookie(orderCookie);
            response.sendRedirect("home.jsp");

        }
    }
}
