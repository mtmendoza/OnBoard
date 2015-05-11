

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Model;

/**
 * Servlet implementation class RegisterUserServlet
 */
@WebServlet("/register")
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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

        Model.registerUser(Integer.valueOf(idnum), fname, lname, email, "Student", 0, pwd);
        response.sendRedirect("index.jsp");
    }

}
