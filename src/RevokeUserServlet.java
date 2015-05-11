

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBeans.Order;
import jspBeans.Organization;
import jspBeans.User;
import Model.Model;

/**
 * Servlet implementation class RevokeUserServlet
 */
@WebServlet("/revoke")
public class RevokeUserServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("user_id");
		HttpSession session = request.getSession();
		Organization org = (Organization) session.getAttribute("admin");
		User u = (User) Model.getUser(userID);
		Model.revokeAdmin(Integer.parseInt(userID), org.getOrg_id());
		response.sendRedirect("index.jsp");
	}

}
