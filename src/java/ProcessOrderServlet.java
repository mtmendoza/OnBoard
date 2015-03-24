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
public class ProcessOrderServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        //get request parameters for userID and password
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String idnum = request.getParameter("idnum");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String quantity = request.getParameter("quantity");

        if (fname.equals("") || lname.equals(""))
        {
            RequestDispatcher rd
                    = getServletContext().getRequestDispatcher("/items.jsp");
            PrintWriter out = response.getWriter();
            //out.println("<font color = red>Either username or password is wrong.</font>");
            rd.include(request, response);
        } 
        else
        {
            Cookie fnameCookie = new Cookie("fname", fname);
            Cookie lnameCookie = new Cookie("lname", lname);
            Cookie idnumCookie = new Cookie("idnum", idnum);
            Cookie contactCookie = new Cookie("contact", contact);
            Cookie emailCookie = new Cookie("email", email);
            Cookie quantityCookie = new Cookie("quantity", quantity);
            //setting cookie to expiry in 30 mins
            response.addCookie(fnameCookie);
            response.addCookie(lnameCookie);
            response.addCookie(idnumCookie);
            response.addCookie(contactCookie);
            response.addCookie(emailCookie);
            response.addCookie(quantityCookie);
            response.sendRedirect("home-orders.jsp");

        }
    }

}
