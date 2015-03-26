import Model.Model;
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
       
        Model.registerUser(Integer.valueOf(idnum), fname, lname, email, "Student", 0, pwd);
        response.sendRedirect("index.jsp");
    }

}
