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

public class RegisterUserServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        //get request parameters for userID and password
        String fname = request.getParameter("first_name");
        String lname = request.getParameter("last_name");
        String email = request.getParameter("email");
        String idnum = request.getParameter("id_num");
        String pwd = request.getParameter("pwd");
        String confirmpwd = request.getParameter("confirmpwd");

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
